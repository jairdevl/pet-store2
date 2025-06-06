<?php
// src/backend/list_users.php
header('Content-Type: application/json');
include '../config/database.php';

session_start();
// Solo permitir acceso si hay sesión activa
if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(["error" => "Unauthorized"]);
    exit;
}

$sql = "SELECT firstname, lastname, email, status FROM users ORDER BY id DESC";
$result = pg_query($conn, $sql);
if (!$result) {
    http_response_code(500);
    echo json_encode(["error" => "Error fetching users"]);
    exit;
}
$users = [];
while ($row = pg_fetch_assoc($result)) {
    $row['status'] = $row['status'] ? 'Activo' : 'Inactivo';
    $users[] = $row;
}
echo json_encode($users);
?>
