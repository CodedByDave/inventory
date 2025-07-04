<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <title>Sign In</title>

<?php include './includes/header.php'; ?>

<div class="row justify-content-center align-items-center min-vh-100">
    <div class="text-center p-5 border rounded shadow" style="max-width: 400px; width: 100%;">
        <h2 class="mb-4">Sign In As</h2>

        <a href="forms/staff_login.php" class="btn btn-outline-primary btn-lg w-100 mb-3">
            <i class="fas fa-user me-2"></i> Login as Staff
        </a>

        <a href="forms/admin_login.php" class="btn btn-outline-dark btn-lg w-100">
            <i class="fas fa-user-shield me-2"></i> Login as Admin
        </a>
    </div>
</div>


<?php include './includes/footer.php'; ?>
