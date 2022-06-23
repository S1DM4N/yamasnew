<?php
require_once 'core.php';
$Database = new Database();
$feedbacks = $Database->getAll('SELECT * FROM feedback f INNER JOIN user_yamas u ON f.id_user = u.id_user ORDER BY f.feedback_date DESC');
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Отзывы</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <div class="wrapper">
        <?php require "header.php";?>
        <main class="main gg">
            <a href="form_feedback.php" class="add">
                <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="7.19922" width="3" height="18" rx="1" fill="#DB3172"/><rect x="18" y="7.79999" width="3" height="18" rx="1" transform="rotate(90 18 7.79999)" fill="#DB3172"/></svg>
                <h1>Добавить отзыв</h1>
            </a>
            <?php foreach ($feedbacks as $feedback): ?>
                <div class="block">
                    <p><?php echo $feedback['review_text'] ?></p>
                    <div class="nn">
                        <h1><?php echo $feedback['user_name'] . " " . $feedback['user_surname'] ?></h1>
                        <h1><?php echo date('Y-m-d', strtotime($feedback['feedback_date'])) ?></h1>
                    </div>
                </div>
            <?php endforeach;?>
        </main>
        <?php require "footer.php"?>
    </div>
</body>
</html>