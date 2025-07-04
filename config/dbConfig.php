<?php
// /sia/config/dbConfig.php

class dbConfig {
    // Database configuration - consider moving to environment variables
    private const DB_HOST = 'localhost';
    private const DB_USER = 'root';
    private const DB_PASS = '';
    private const DB_NAME = 'sia_lab';
    private const DB_CHARSET = 'utf8mb4';

    // PDO options with enhanced security settings
    private const PDO_OPTIONS = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
        PDO::ATTR_PERSISTENT         => false,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci",
        PDO::MYSQL_ATTR_SSL_VERIFY_SERVER_CERT => false // Enable for production with SSL
    ];

    private static $instance = null;

    // Private constructor to prevent direct instantiation
    private function __construct() {}

    // Singleton pattern to ensure single connection
    public static function getConnection(): PDO {
        if (self::$instance === null) {
            $dsn = sprintf(
                'mysql:host=%s;dbname=%s;charset=%s',
                self::DB_HOST,
                self::DB_NAME,
                self::DB_CHARSET
            );

            try {
                self::$instance = new PDO(
                    $dsn,
                    self::DB_USER,
                    self::DB_PASS,
                    self::PDO_OPTIONS
                );

                // Additional runtime configurations
                self::$instance->exec("SET SESSION sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'");
                self::$instance->exec("SET time_zone = '+00:00'");

            } catch (PDOException $e) {
                self::logError($e);
                throw new RuntimeException("Database connection failed. Please try again later.");
            }
        }
        return self::$instance;
    }

    /**
     * Prepares a statement with bound parameters
     */
    public static function prepare(string $sql, array $params = []): PDOStatement {
        try {
            $pdo = self::getConnection();
            $stmt = $pdo->prepare($sql);
            
            foreach ($params as $key => $value) {
                $paramType = self::determineParamType($value);
                $bindKey = is_int($key) ? $key + 1 : $key;
                $stmt->bindValue($bindKey, $value, $paramType);
            }
            
            return $stmt;
        } catch (PDOException $e) {
            self::logError($e);
            throw new RuntimeException("Database query preparation failed.");
        }
    }

    /**
     * Executes a query and returns the statement
     */
    public static function execute(string $sql, array $params = []): PDOStatement {
        try {
            $stmt = self::prepare($sql, $params);
            $stmt->execute();
            return $stmt;
        } catch (PDOException $e) {
            self::logError($e, $sql, $params);
            throw new RuntimeException("Database query execution failed.");
        }
    }

    /**
     * Executes a query and returns affected row count
     */
    public static function executeUpdate(string $sql, array $params = []): int {
        $stmt = self::execute($sql, $params);
        return $stmt->rowCount();
    }

    /**
     * Executes a query and returns first result
     */
    public static function fetchOne(string $sql, array $params = []): ?array {
        $stmt = self::execute($sql, $params);
        return $stmt->fetch() ?: null;
    }

    /**
     * Executes a query and returns all results
     */
    public static function fetchAll(string $sql, array $params = []): array {
        $stmt = self::execute($sql, $params);
        return $stmt->fetchAll();
    }

    /**
     * Begins a transaction
     */
    public static function beginTransaction(): bool {
        return self::getConnection()->beginTransaction();
    }

    /**
     * Commits a transaction
     */
    public static function commit(): bool {
        return self::getConnection()->commit();
    }

    /**
     * Rolls back a transaction
     */
    public static function rollBack(): bool {
        return self::getConnection()->rollBack();
    }

    /**
     * Determines PDO parameter type based on value
     */
    private static function determineParamType($value): int {
        if (is_int($value)) return PDO::PARAM_INT;
        if (is_bool($value)) return PDO::PARAM_BOOL;
        if (is_null($value)) return PDO::PARAM_NULL;
        return PDO::PARAM_STR;
    }

    /**
     * Logs database errors securely
     */
    private static function logError(PDOException $e, string $sql = null, array $params = null): void {
        $message = "Database Error: " . $e->getMessage();
        
        if ($sql) {
            $message .= " | SQL: " . $sql;
        }
        
        if ($params) {
            $message .= " | Params: " . json_encode($params);
        }
        
        error_log($message);
    }

    // Prevent cloning and unserialization
    private function __clone() {}
    public function __wakeup() {
        throw new RuntimeException("Cannot unserialize database connection");
    }
}

class StaffModel {
    public static function getStaffCount(): int {
        $result = dbConfig::fetchOne("SELECT COUNT(*) AS count FROM tbl_staff");
        return $result['count'] ?? 0;
    }
}
