<?php
require_once __DIR__ . '/config/database.php';

// Log logout activity
if (isset($_SESSION['user_id'])) {
    logActivity($_SESSION['user_id'], 'logout', 'User logged out');
}

// Destroy session
session_destroy();

// Redirect to login
header('Location: index.php');
exit;
?>