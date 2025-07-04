<?php
require_once 'config.php';

try {
    $conn = dbConfig::getConnection();
    echo "✅ Database connection successful!";
    
    // Optional: Show database version
    $version = $conn->query('SELECT version()')->fetchColumn();
    echo "<br>Database version: " . $version;
} catch (PDOException $e) {
    echo "❌ Connection failed: " . $e->getMessage();
}