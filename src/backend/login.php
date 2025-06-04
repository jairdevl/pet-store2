<?php

// Include database configuration
include "../config/database.php";
session_start();

// Redirect if a session is already active
if (isset($_SESSION['user_id'])) {
    header('Location: ../');
    exit;
}

// Only allow POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../login.html');
    exit;
}

// Check that form data was received and not empty
if (empty($_POST['email']) || empty($_POST['password'])) {
    header('Location: ../login.html');
    exit;
}

$email = $_POST['email'];
$password = $_POST['password'];

// Prepared statement to prevent SQL injection
$sql = "SELECT id, firstname, lastname, email, password FROM users WHERE email = $1 AND status = true";
$result = pg_query_params($conn, $sql, [$email]);

if ($result && $row = pg_fetch_assoc($result)) {
    // Comparar directamente la contraseña (NO SEGURO)
    if ($password === $row['password']) {
        session_regenerate_id(true); // Security: prevent fixation
        $_SESSION['user_id'] = $row['id'];
        $_SESSION['firstname'] = $row['firstname'];
        $_SESSION['lastname'] = $row['lastname'];
        $_SESSION['email'] = $row['email'];
        header('Location: ../');
        exit;
    }
}

// Si llega aquí, las credenciales son inválidas
echo "<script>alert('Invalid email or password');</script>";
header("Refresh: 0; url=../login.html");
exit;

?>