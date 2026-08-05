<?php
require_once __DIR__ . '/config/database.php';

// Redirect if already logged in
if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
    switch($_SESSION['role']) {
        case 'admin': header('Location: admin/dashboard.php'); exit;
        case 'hod': header('Location: hod/dashboard.php'); exit;
        case 'student': header('Location: student/dashboard.php'); exit;
    }
}

$error_message = '';
$success_message = '';

// Handle registration
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['register_btn'])) {
    $pdo = getDBConnection();
    
    $full_name = trim($_POST['full_name']);
    $index_number = trim($_POST['index_number']);
    $email = trim($_POST['email']);
    $department = trim($_POST['department']);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $ip = $_SERVER['REMOTE_ADDR'] ?? '0.0.0.0';
    
    // Validation
    $errors = [];
    
    if (empty($full_name)) {
        $errors[] = "Full name is required";
    }
    
    if (empty($index_number)) {
        $errors[] = "Student ID is required";
    }
    
    // Check if index number already exists
    $stmt = $pdo->prepare("SELECT id FROM users WHERE index_number = ?");
    $stmt->execute([$index_number]);
    if ($stmt->fetch()) {
        $errors[] = "Student ID already exists";
    }
    
    if (empty($email)) {
        $errors[] = "Email is required";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format";
    }
    
    // Check if email already exists
    $stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->execute([$email]);
    if ($stmt->fetch()) {
        $errors[] = "Email already registered";
    }
    
    if (empty($department)) {
        $errors[] = "Please select a department";
    }
    
    if (empty($password)) {
        $errors[] = "Password is required";
    } elseif (strlen($password) < 6) {
        $errors[] = "Password must be at least 6 characters";
    }
    
    if ($password !== $confirm_password) {
        $errors[] = "Passwords do not match";
    }
    
    if (empty($errors)) {
        // Hash password
        $password_hash = password_hash($password, PASSWORD_DEFAULT);
        
        try {
            $stmt = $pdo->prepare("
                INSERT INTO users (full_name, index_number, email, password_hash, role, department, is_active, created_at, updated_at) 
                VALUES (?, ?, ?, ?, 'student', ?, 0, NOW(), NOW())
            ");
            $stmt->execute([$full_name, $index_number, $email, $password_hash, $department]);
            
            $user_id = $pdo->lastInsertId();
            
            // Log registration
            logActivity($user_id, 'registration', "New student registered: $full_name from IP $ip");
            
            $success_message = "Registration successful! Please wait for account activation by admin.";
            
            // Clear form
            $_POST = [];
            
        } catch(PDOException $e) {
            $error_message = "Registration failed: " . $e->getMessage();
        }
    } else {
        $error_message = implode("<br>", $errors);
    }
}

// Department list
$departments = [
    'Computer Science' => 'Computer Science & IT',
    'Engineering' => 'Engineering & Technology',
    'Business' => 'Business Administration',
    'Mathematics' => 'Natural & Applied Sciences',
    'English' => 'Liberal Arts & Social Sciences'
];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration | IAA Portal</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    
    <!-- Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9ff;
        }
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            vertical-align: middle;
        }
        .form-shadow {
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.05);
        }
        .focus-ring:focus {
            outline: none;
            border-color: #11467a;
            box-shadow: 0 0 0 2px rgba(17, 70, 122, 0.15);
        }
        .toast-notify {
            position: fixed;
            bottom: 24px;
            right: 24px;
            z-index: 1000;
            animation: slideUp 0.3s ease;
        }
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        "primary": "#11467a",
                        "brand-sidebar": "#11467a",
                        "brand-red": "#dc3545",
                        "surface": "#f8f9ff",
                        "on-surface": "#0b1c30",
                        "on-surface-variant": "#434655",
                        "outline-variant": "#c4c5d7",
                    },
                    spacing: {
                        "stack-lg": "48px",
                        "stack-md": "24px",
                        "stack-sm": "12px",
                        "margin-mobile": "16px",
                        "margin-desktop": "40px",
                        "gutter": "24px",
                        "base": "8px"
                    },
                    fontSize: {
                        "label-sm": ["12px", { "lineHeight": "16px", "fontWeight": "600" }],
                        "label-md": ["14px", { "lineHeight": "20px", "letterSpacing": "0.01em", "fontWeight": "500" }],
                        "body-md": ["16px", { "lineHeight": "24px", "fontWeight": "400" }],
                        "body-lg": ["18px", { "lineHeight": "28px", "fontWeight": "400" }],
                        "headline-md": ["24px", { "lineHeight": "32px", "fontWeight": "600" }],
                        "headline-lg": ["32px", { "lineHeight": "40px", "letterSpacing": "-0.01em", "fontWeight": "600" }],
                        "display": ["48px", { "lineHeight": "56px", "letterSpacing": "-0.02em", "fontWeight": "700" }]
                    }
                }
            }
        }
    </script>
</head>
<body class="min-h-screen flex items-center justify-center overflow-x-hidden">

<div id="toastContainer" class="toast-notify hidden"></div>

<main class="flex min-h-screen w-full">
    <!-- Left Side: Registration Form -->
    <section class="w-full lg:w-1/2 flex flex-col justify-center items-center p-4 md:p-10 bg-surface z-10">
        <div class="w-full max-w-[480px]">
            
            <!-- Brand Logo -->
            <header class="mb-8 flex flex-col items-center text-center">
                <div class="flex items-center justify-center gap-3 mb-4">
                    <img alt="IAA Logo" class="h-16 object-contain" 
                         src="assets/img/logo iaa.png"
                         onerror="this.src='https://via.placeholder.com/200x80/11467a/white?text=IAA'">
                </div>
                <h2 class="text-2xl font-bold text-primary mb-2">Create Student Account</h2>
                <p class="text-gray-500 text-sm">Access your personalized dashboard and register for courses</p>
            </header>
            
            <!-- Error Message -->
            <?php if($error_message): ?>
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg mb-6 flex items-start gap-2">
                    <i class="fas fa-exclamation-circle mt-0.5"></i>
                    <div class="text-sm"><?php echo $error_message; ?></div>
                </div>
            <?php endif; ?>
            
            <!-- Success Message -->
            <?php if($success_message): ?>
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded-lg mb-6 flex items-start gap-2">
                    <i class="fas fa-check-circle mt-0.5"></i>
                    <div class="text-sm"><?php echo $success_message; ?></div>
                </div>
            <?php endif; ?>
            
            <!-- Registration Form -->
            <form method="POST" action="" class="space-y-5" id="registrationForm">
                <!-- Full Name -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                    <div class="relative">
                        <i class="fas fa-user absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm"></i>
                        <input type="text" name="full_name" required
                               class="w-full pl-10 pr-4 py-3 bg-white border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-primary transition-all"
                               placeholder="Enter your full name"
                               value="<?php echo htmlspecialchars($_POST['full_name'] ?? ''); ?>">
                    </div>
                </div>
                
                <!-- Student ID -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Student ID</label>
                    <div class="relative">
                        <i class="fas fa-id-card absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm"></i>
                        <input type="text" name="index_number" required
                               class="w-full pl-10 pr-4 py-3 bg-white border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-primary transition-all"
                               placeholder="S.0001/0001/2023"
                               value="<?php echo htmlspecialchars($_POST['index_number'] ?? ''); ?>">
                    </div>
                    <p class="text-xs text-gray-400 mt-1">Format: S.XXXX/XXXX/YYYY</p>
                </div>
                
                <!-- Email -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Academic Email</label>
                    <div class="relative">
                        <i class="fas fa-envelope absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm"></i>
                        <input type="email" name="email" required
                               class="w-full pl-10 pr-4 py-3 bg-white border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-primary transition-all"
                               placeholder="student@portal.ac.tz"
                               value="<?php echo htmlspecialchars($_POST['email'] ?? ''); ?>">
                    </div>
                </div>
                
                <!-- Department -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Department</label>
                    <div class="relative">
                        <i class="fas fa-building absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm"></i>
                        <select name="department" required
                                class="w-full pl-10 pr-10 py-3 bg-white border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-primary appearance-none">
                            <option value="" disabled <?php echo empty($_POST['department']) ? 'selected' : ''; ?>>Select your department</option>
                            <?php foreach($departments as $value => $label): ?>
                                <option value="<?php echo $value; ?>" <?php echo (isset($_POST['department']) && $_POST['department'] == $value) ? 'selected' : ''; ?>>
                                    <?php echo $label; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                        <i class="fas fa-chevron-down absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm pointer-events-none"></i>
                    </div>
                </div>
                
                <!-- Password -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <div class="relative">
                        <i class="fas fa-lock absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm"></i>
                        <input type="password" name="password" id="password" required
                               class="w-full pl-10 pr-12 py-3 bg-white border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-primary transition-all"
                               placeholder="••••••••">
                        <button type="button" id="togglePassword" class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-primary">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <p class="text-xs text-gray-400 mt-1">Minimum 6 characters</p>
                </div>
                
                <!-- Confirm Password -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Confirm Password</label>
                    <div class="relative">
                        <i class="fas fa-lock absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-sm"></i>
                        <input type="password" name="confirm_password" id="confirmPassword" required
                               class="w-full pl-10 pr-12 py-3 bg-white border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-primary transition-all"
                               placeholder="••••••••">
                        <button type="button" id="toggleConfirmPassword" class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-primary">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
                
                <!-- Submit Button -->
                <button type="submit" name="register_btn" id="submitBtn"
                        class="w-full bg-primary hover:bg-opacity-90 text-white font-semibold py-3.5 rounded-lg transition-all duration-200 shadow-md flex items-center justify-center gap-2 mt-6">
                    <i class="fas fa-user-plus"></i> Create Account
                </button>
                
                <!-- Login Link -->
                <div class="text-center mt-4">
                    <p class="text-sm text-gray-500">
                        Already have an account? 
                        <a href="index.php" class="text-primary font-semibold hover:underline">Log in</a>
                    </p>
                </div>
            </form>
            
            <!-- Footer -->
            <footer class="mt-8 pt-6 border-t border-gray-200 flex justify-between items-center">
                <p class="text-xs text-gray-400">© <?php echo date('Y'); ?> Institute of Accountancy Arusha</p>
                <div class="flex gap-4 text-xs">
                    <a href="#" class="text-gray-400 hover:text-primary transition-colors">Privacy</a>
                    <a href="#" class="text-gray-400 hover:text-primary transition-colors">Support</a>
                </div>
            </footer>
        </div>
    </section>
    
    <!-- Right Side: Image & Atmosphere -->
    <aside class="hidden lg:block w-1/2 relative overflow-hidden bg-primary">
        <!-- Background Image (same as login) -->
        <img class="absolute inset-0 w-full h-full object-cover opacity-80" 
             src="assets/img/right.jpg"
             onerror="this.src='https://via.placeholder.com/800x1200/11467a/white?text=IAA+Campus'">
        
        <!-- Overlay -->
        <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/30 to-transparent"></div>
        
        <!-- Content Overlay -->
        <div class="absolute inset-0 flex flex-col justify-end p-10 text-white">
            <div class="max-w-md space-y-4">
                <div class="inline-flex items-center px-3 py-1 rounded-full bg-white/20 backdrop-blur-md">
                    <i class="fas fa-check-circle text-sm mr-2"></i>
                    <span class="text-xs uppercase tracking-wider">Accredited Academic Institution</span>
                </div>
                <h3 class="text-4xl font-bold leading-tight">Shape Your Future with Excellence.</h3>
                <p class="text-white/80">The IAA Smart Portal provides seamless access to advanced academic resources, course management, and professional growth tracking.</p>
            </div>
            
            <!-- Stats -->
            <div class="grid grid-cols-3 gap-6 mt-8 border-t border-white/20 pt-6">
                <div>
                    <p class="text-2xl font-bold">12k+</p>
                    <p class="text-xs text-white/60">Active Students</p>
                </div>
                <div>
                    <p class="text-2xl font-bold">450+</p>
                    <p class="text-xs text-white/60">Core Courses</p>
                </div>
                <div>
                    <p class="text-2xl font-bold">98%</p>
                    <p class="text-xs text-white/60">Success Rate</p>
                </div>
            </div>
        </div>
        
        <!-- Decorative Elements -->
        <div class="absolute top-10 right-10 w-32 h-32 bg-white/10 rounded-full blur-3xl"></div>
        <div class="absolute bottom-20 left-10 w-48 h-48 bg-white/5 rounded-full blur-3xl"></div>
    </aside>
</main>

<script>
    // Toggle password visibility
    const togglePassword = document.getElementById('togglePassword');
    const password = document.getElementById('password');
    
    togglePassword?.addEventListener('click', function() {
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        this.querySelector('i').classList.toggle('fa-eye-slash');
    });
    
    const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
    const confirmPassword = document.getElementById('confirmPassword');
    
    toggleConfirmPassword?.addEventListener('click', function() {
        const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
        confirmPassword.setAttribute('type', type);
        this.querySelector('i').classList.toggle('fa-eye-slash');
    });
    
    // Form validation
    const form = document.getElementById('registrationForm');
    const submitBtn = document.getElementById('submitBtn');
    
    form.addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        
        if (password !== confirmPassword) {
            e.preventDefault();
            showToast('Passwords do not match!', 'error');
            return false;
        }
        
        if (password.length < 6) {
            e.preventDefault();
            showToast('Password must be at least 6 characters!', 'error');
            return false;
        }
        
        // Show loading state
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Creating account...';
    });
    
    function showToast(message, type = 'error') {
        const container = document.getElementById('toastContainer');
        const icon = type === 'success' ? 'fa-check-circle' : 'fa-exclamation-triangle';
        const bgColor = type === 'success' ? 'bg-green-600' : 'bg-red-600';
        container.innerHTML = `
            <div class="${bgColor} text-white px-5 py-3 rounded-lg shadow-lg flex items-center gap-3">
                <i class="fas ${icon}"></i>
                <span class="text-sm font-medium">${message}</span>
            </div>
        `;
        container.classList.remove('hidden');
        setTimeout(() => { container.classList.add('hidden'); }, 4000);
    }
    
    // Auto-format index number
    const indexInput = document.querySelector('input[name="index_number"]');
    if(indexInput) {
        indexInput.addEventListener('input', function(e) {
            let val = e.target.value.toUpperCase();
            // Auto-format S.XXXX/XXXX/XXXX
            val = val.replace(/[^A-Z0-9/.]/g, '');
            if (val.length > 2 && val.indexOf('.') === -1 && val.indexOf('/') === -1) {
                if (val.length === 2) val = val[0] + '.' + val[1];
            }
            e.target.value = val;
        });
    }
</script>

</body>
</html>