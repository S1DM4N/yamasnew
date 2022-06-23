<?php
// Подключение БД
require "core.php";

// Проверка на наличие объекта
if(!isset($Database)){
    $Database = new Database();
}
if (isset($_POST['reg_submit'])) {
    $errors = [];
    $parm = [
        'login' => trim($_POST['login']),
        'surname' => trim($_POST['surname']),
        'name' => trim($_POST['name']),
        'middle_name' => trim($_POST['middle_name']),
        'phone' => trim($_POST['phone']),
        'password' => trim($_POST['password']),
        'id_coach' => 5,
        'id_section' => 3,
        'id_sport' => 5
    ];

    // Проверка на существующий аккаунт по логину
    $qry = "SELECT * FROM user_yamas WHERE user_login = :login";
    $login= array("login" => $parm['login']);
    $check_login = $Database->getRow($qry, $login);
    if (!empty($check_login) > 0){
        $errors['login_error'] = "Аккаунт с данным логином существует";
    }

    // Проверка на существующий аккаунт по телефону
    $qry = "SELECT * FROM user_yamas WHERE user_phone = :phone";
    $phone = array("phone" => $parm['phone']);
    $check_login = $Database->getRow($qry, $phone);
    if (!empty($check_login) > 0){
        $errors['phone_error'] = "Аккаунт с данным телефон уже зарегестрирован.";
    }
    $letter = "/([a-zA-Z])/";
    $digit = "/(?=.*\d)/";

    //Проверка пароля
    if ($parm['password'] < 8) {
        $errors['password_error'] = 'Пароль должен содержать минимум 8 символов.';
    }
    if (!preg_match($letter, $parm['password'])) {
        $errors['password_error'] = 'Пароль должен содержать минимум 1 букву латинского алфавита.';
    }
    if (!preg_match($digit, $parm['password'])) {
        $errors['password_error'] = 'Пароль должен содержать минимум 1 цифру.';
    }


    // Шифрование пароля
    $parm['password'] = md5($parm['password'] . "fidbuaoiu53iu2iqfabi1u2iuasbf");
    if (empty($errors)) {
        // Запись данных в БД

        $qry = "INSERT INTO user_yamas (user_login, user_surname, user_name, user_middle_name, user_phone, user_password, id_coach, id_section, id_sport) VALUES (:login, :surname, :name, :middle_name, :phone, :password, :id_coach, :id_section, :id_sport)";
        $Database->insert($qry, $parm);
        header('Location: ' . URLROOT . 'account.php');

        $qry = "SELECT * FROM user_yamas WHERE user_phone = :phone";
        $parm = array("phone" => $parm['phone']);
        $check_login = $Database->getRow($qry, $parm);

        if (!empty($check_login)) {
            $parm = ['id_user' => $check_login['id_user'], 'transaction_number' => crc32(microtime() . rand(0, 9999)), 'price' => '20000.00', 'status' => 1];
            $Database->insert("INSERT INTO transaction (transaction_number, price, id_user, `id_transaction_status`) VALUES (:transaction_number, :price, :id_user, :status)", $parm);
            $_SESSION = [];
            $_SESSION['id_user'] = $check_login['id_user'];
            $_SESSION['user_name'] = $check_login['user_name'];
            $_SESSION['user_surname'] = $check_login['user_surname'];
            $_SESSION['user_middle_name'] = $check_login['user_middle_name'];
            $_SESSION['user_login'] = $check_login['user_login'];
            $_SESSION['id_section'] = $check_login['id_section'];
            $_SESSION['user_phone'] = $check_login['user_phone'];
        }
    } else {
        $_SESSION['errors'] = $errors;
        header('Location: ' . URLROOT . 'registration.php');
    }
} else {
    header('Location: ' . URLROOT . 'registration.php');
}
