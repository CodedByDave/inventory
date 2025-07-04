<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once $_SERVER['DOCUMENT_ROOT'] . '/sia_lab1/config/dbConfig.php';

$userid_value = '';
$error_message = '';
$login_success = false;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $userid = trim($_POST['userid'] ?? '');
    $password = trim($_POST['password'] ?? '');
    
    $userid_value = htmlspecialchars($userid);

    if (empty($userid)) {
        $error_message = 'Please enter your user ID';
    } elseif (empty($password)) {
        $error_message = 'Please enter your password';
    } else {
        try {
            $pdo = dbConfig::getConnection();
            
            $sql = "SELECT * FROM tbl_staff WHERE staff_id = :staff_id";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':staff_id', $userid, PDO::PARAM_STR);
            $stmt->execute();

            if ($stmt->rowCount() == 1) {
                $user = $stmt->fetch(PDO::FETCH_ASSOC);

                if (password_verify($password, $user['password'])) {
                    $_SESSION['id'] = $user['staff_id'];
                    $_SESSION['username'] = $user['first_name'];  // Or full name, depends on your setup
                    $_SESSION['role'] = 'staff'; // If you have roles, otherwise set statically
                    $_SESSION['logged_in'] = true;

                    $login_success = true;
                    $redirect = '/sia_lab1/admin/pages/staff/staff_dashboard.php';
                } else {
                    $error_message = 'Invalid user ID or password';
                }
            } else {
                $error_message = 'Invalid user ID or password';
            }

        } catch (Exception $e) {
            error_log("Login error: " . $e->getMessage());
            $error_message = 'System error occurred. Please try again.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <title>Staff | Login</title>
    
    <?php 
        include $_SERVER['DOCUMENT_ROOT'] . '/sia_lab1/includes/header.php';
    ?>
</head>
<body>

<div class="row justify-content-center align-items-center min-vh-100">
    <div class="col-md-5 col-lg-3">
        <div class="card shadow-sm">
            <div class="card-body p-4">
                <div class="text-center mb-4">
                    <h2 class="h4 fw-bolder">Staff Login</h2>
                </div>
                <form id="loginForm" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST">
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-user"></i>
                            </span>
                            <input type="text" class="form-control" id="staffID" name="userid" 
                                   placeholder="Staff ID" required autofocus>
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="fas fa-lock"></i>
                            </span>
                            <input type="password" class="form-control" id="staffPassword" name="password" 
                                placeholder="Password" required>
                            <button class="btn btn-outline-secondary toggle-password" type="button" data-target="#staffPassword">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                    </div>

                    <div class="d-grid mb-3">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-sign-in-alt me-2"></i> Login
                        </button>
                    </div>

                    <div class="d-grid mb-3">
                        <button type="button" class="btn btn-success" onclick="window.location.href='/sia/index.php'">
                            <i class="fas fa-arrow-left me-2"></i> Back
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="/sia_lab1/assets/js/components/password_toggle.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    <?php if ($login_success): ?>
        Swal.fire({
            title: 'Login Successful!',
            text: 'Welcome back, <?php echo $_SESSION['username']; ?>!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        }).then(() => {
            window.location.href = '<?php echo $redirect; ?>';
        });
    <?php elseif (!empty($error_message)): ?>
        Swal.fire({
            title: 'Login Failed',
            text: '<?php echo $error_message; ?>',
            icon: 'error',
            confirmButtonText: 'Try Again'
        });
    <?php endif; ?>
});
</script>

<?php
    include $_SERVER['DOCUMENT_ROOT'] . '/sia_lab1/includes/footer.php';
?>
