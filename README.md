# Smart Course Changing Portal
### Complete Installation & Setup Guide

---

## 📋 Requirements

| Item | Minimum Version |
|------|----------------|
| PHP  | 8.0+ |
| MySQL / MariaDB | 8.0+ |
| Web Server | Apache (XAMPP/WAMP/Laragon) |
| Browser | Chrome, Firefox, Edge |

---

## 🚀 Quick Setup (XAMPP – Recommended for Windows)

### Step 1 — Install XAMPP
1. Download XAMPP from https://www.apachefriends.org
2. Install and launch **XAMPP Control Panel**
3. Start **Apache** and **MySQL**

---

### Step 2 — Copy Project Files
1. Copy the entire `smart_course_portal` folder into:
   ```
   C:\xampp\htdocs\smart_course_portal\
   ```
   *(on Linux/Mac: `/opt/lampp/htdocs/smart_course_portal/`)*

---

### Step 3 — Create the Database
1. Open your browser and go to: http://localhost/phpmyadmin
2. Click **New** (left sidebar)
3. Type database name: `smart_course_portal`
4. Click **Create**
5. Click the **SQL** tab (top menu)
6. Open the file `database.sql` (from this project folder) in Notepad
7. **Copy all the contents** and **paste** into the SQL box in phpMyAdmin
8. Click **Go** to run the SQL

   ✅ You should see "1 row(s) affected" messages — the tables and seed data are created.

---

### Step 4 — Configure Database Connection
Open `config/db.php` in a text editor and update if needed:

```php
define('DB_HOST', 'localhost');
define('DB_NAME', 'smart_course_portal');
define('DB_USER', 'root');       // ← your MySQL username (default: root)
define('DB_PASS', '');           // ← your MySQL password (default: empty for XAMPP)
```

> ⚠️ If you set a MySQL password during installation, enter it in `DB_PASS`.

---

### Step 5 — Open the Portal
Go to: **http://localhost/smart_course_portal**

---

## 🔐 Default Login Accounts

| Role | Email | Password |
|------|-------|----------|
| **Admin / Registrar** | admin@portal.ac.tz | password |
| **HOD** | hod@portal.ac.tz | password |
| **Student (Demo)** | gladness@student.ac.tz | password |

> ⚠️ Change these passwords after first login in a production environment!

---

## 📁 Project File Structure

```
smart_course_portal/
│
├── index.php                  ← Login & Registration page
├── logout.php                 ← Logout handler
├── database.sql               ← Full database schema + seed data
│
├── config/
│   └── db.php                 ← Database connection (PDO)
│
├── includes/
│   ├── functions.php          ← Shared helper functions
│   ├── header.php             ← Shared navbar + HTML header
│   └── mark_read.php          ← Mark notifications as read
│
├── student/
│   ├── dashboard.php          ← Student home page
│   ├── request.php            ← Submit new course change request
│   ├── my_requests.php        ← View all my requests
│   └── track.php              ← Track individual request status
│
├── hod/
│   ├── dashboard.php          ← HOD home page + pending count
│   ├── requests.php           ← View all requests with filters
│   └── review.php             ← Review & approve/reject a request
│
├── admin/
│   ├── dashboard.php          ← Registrar/Admin home page
│   ├── requests.php           ← All requests + search + filter
│   ├── review.php             ← Final registrar decision
│   ├── users.php              ← Add/edit/delete users
│   ├── courses.php            ← Add/edit/delete courses
│   ├── semesters.php          ← Manage semesters & windows
│   └── audit.php              ← Full system audit trail
│
└── assets/
    ├── css/style.css          ← All custom styles
    └── js/main.js             ← Confirmations, auto-dismiss alerts
```

---

## 🔄 System Workflow

```
Student submits request
        ↓
HOD reviews (Approve / Reject)
        ↓ (if approved)
Registrar reviews (Approve / Reject)
        ↓ (if approved)
Enrollment automatically updated
        ↓
Student notified at every step
```

---

## 🗄️ Database Tables

| Table | Description |
|-------|-------------|
| `users` | All users (students, HOD, admin) |
| `semesters` | Semester periods and window control |
| `courses` | Available courses |
| `enrollments` | Student-course-semester assignments |
| `requests` | Course change requests with approval chain |
| `notifications` | In-app notification messages |
| `audit_log` | Immutable record of all system actions |

---

## 🔒 Security Features

- Passwords hashed with **bcrypt** (`PASSWORD_BCRYPT`)
- All queries use **PDO prepared statements** (SQL injection safe)
- **CSRF tokens** on every form
- **Session-based** role authentication
- Role guards: `requireRole('student')` / `requireRole('hod')` / `requireRole('admin')`
- `htmlspecialchars()` used on all output (XSS safe)

---

## ❓ Troubleshooting

| Problem | Solution |
|---------|----------|
| White page / PHP errors | Enable error display: add `ini_set('display_errors',1);` at top of index.php |
| "Database connection error" | Check `config/db.php` credentials; ensure MySQL is running |
| "Access denied" on login | Make sure you ran `database.sql` in phpMyAdmin |
| Styles not loading | Ensure the project is accessed via `http://localhost/smart_course_portal` not `file://` |
| Password hash issues | The demo seed uses `password` as the password for all accounts |

---

## 📞 Developer Notes

- Built with: **PHP 8 (PDO, procedural)** + **MySQL 8** + **Bootstrap 5.3** + **Bootstrap Icons**
- No external frameworks or Composer required
- Designed for institutional use only
- For email notifications: integrate PHPMailer in `includes/functions.php` → `addNotification()` function

---

*Smart Course Changing Portal — Final Year Project*
