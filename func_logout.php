<?php
require_once 'core.php';
    $_SESSION = [];
    $_SESSION['id_user'] = 0;
    header('Location: ' . URLROOT . 'index.php');
