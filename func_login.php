<?php
// Подключение БД
require "core.php";

// Проверка на наличие объекта
if(!isset($Database)){
    $Database = new Database();
}
if (isset($_POST['login_submit'])) {
    $errors = [];
    $parm = [
        'login' => trim($_POST['login']),
        'password' => trim($_POST['password']),
        'phone' => trim($_POST['phone'])
    ];

    // Проверка на существующий аккаунт по логину
    $qry = "SELECT * FROM user_yamas WHERE user_login = :login";
    $login = array("login" => $parm['login']);
    $check_login = $Database->getRow($qry, $login);


    // Проверка на существующий аккаунт по номеру телефона
    $qry = "SELECT * FROM user_yamas WHERE user_phone = :phone";
    $phone = array("phone" => $parm['phone']);
    $check_phone = $Database->getRow($qry, $phone);


    if (empty($check_login) && empty($_POST['phone'])){
        $errors['login_error'] = "Аккаунт с данным логином не существует.";
    }
    if (empty($check_phone) && empty($_POST['login'])){
        $errors['login_error'] = "Аккаунт с данным номером телефона не существует.";
    }

    if (empty($check_login) && empty($check_phone)) {
        $errors['login_error'] = "Аккаунт с данным логином или номером телефона не существует";
    }


    //Проверка на совпадение телефона и логина
    if ($check_phone != $check_login && empty($errors) && !empty($check_phone) && !empty($check_login)) {
        $errors['login_error'] = 'Логин и номер телефона не сопадают';
    }

    //Шифрование пароля
    $parm['password'] = md5($parm['password'] . "fidbuaoiu53iu2iqfabi1u2iuasbf");

    //Проверка пароля
    if ($parm['password'] != $check_login['user_password'] && empty($errors)) {
        $errors['password_error'] = "Неправильный пароль.";
    }

    if (empty($errors)) {
        // Запись данных в БД
        $_SESSION = [];
        $_SESSION['id_user'] = $check_login['id_user'];
        $_SESSION['user_name'] = $check_login['user_name'];
        $_SESSION['user_surname'] = $check_login['user_surname'];
        $_SESSION['user_middle_name'] = $check_login['user_middle_name'];
        $_SESSION['user_login'] = $check_login['user_login'];
        $_SESSION['id_section'] = $check_login['id_section'];
        $_SESSION['user_phone'] = $check_login['user_phone'];
        header('Location: ' . URLROOT . 'account.php');
    } else {
        $_SESSION['errors'] = $errors;
        header('Location: ' . URLROOT . 'login.php');
    }
} else {
    header('Location: ' . URLROOT . 'login.php');
}
