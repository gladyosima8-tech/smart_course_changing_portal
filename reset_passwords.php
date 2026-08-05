<?php
// Create file: reset_passwords.php
require_once 'config/database.php';

$pdo = getDBConnection();

// Reset admin password
$admin_password = password_hash('admin123', PASSWORD_DEFAULT);
$stmt = $pdo->prepare("UPDATE users SET password_hash = ? WHERE id = 1");
$stmt->execute([$admin_password]);

// Reset HOD password  
$hod_password = password_hash('hod123', PASSWORD_DEFAULT);
$stmt = $pdo->prepare("UPDATE users SET password_hash = ? WHERE id = 2");
$stmt->execute([$hod_password]);

// Reset student password
$student_password = password_hash('student123', PASSWORD_DEFAULT);
$stmt = $pdo->prepare("UPDATE users SET password_hash = ? WHERE id = 3");
$stmt->execute([$student_password]);

echo "Passwords reset successfully!<br>";
echo "Admin: admin@portal.ac.tz / admin123<br>";
echo "HOD: gladysimon@gmail.com / hod123<br>";
echo "Student: gladness@student.ac.tz / student123<br>";

// Delete this file after use!
?>