<?php
session_start();

function setSessionData($statement, $user_id, $user_name, $role) {
    $_SESSION['id_user'] = $user_id;
    $_SESSION['user'] = $user_name;
    $_SESSION['role'] = $role;
    header('Location: ../index.php');
    exit;
}


if (isset($_SESSION['user'])) {
    header('Location: ../projects.php');
    die();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_form = filter_var(htmlspecialchars($_POST['user']), FILTER_SANITIZE_STRING);
    $password_form = filter_var(htmlspecialchars($_POST['password']), FILTER_SANITIZE_STRING);
    
    include 'C:/ospanel/domains/experiment/db/functions.php';  // Обновите путь к вашим функциям базы данных если нужно
    //include 'db/functions.php';  // Обновите путь к вашим функциям базы данных если нужно
    $database = new Database();
    $connection = $database->connection();
    
    // Администратор или пользователь
    $roles = ['admin', 'user'];
    $errors = '<li>The username or password is incorrect</li>';

    foreach ($roles as $role) {
        $statement = $connection->prepare('SELECT * FROM users WHERE user = ? AND role = ? LIMIT 1');
        $statement->execute([$user_form, $role]);
        $user = $statement->fetch();

        if ($user && password_verify($password_form, $user['password'])) {
            // Установка данных сессии и переадресация
            setSessionData($statement, $user['id_user'], $user_form, $role); // Убедитесь, что функция setSessionData корректно работает
            header('Location: ../index.php');
            exit;
        }
    }
    echo $errors; // Показываем ошибку если ни один из вариантов не подошел
}

//require 'views/login.view.php'; // Обновите путь к вашему файлу представления если нужно

require '../views/login.view.php'; // Обновите путь к вашему файлу представления если нужно
?>
