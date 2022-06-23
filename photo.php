<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Фото</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="dist/css/lightbox.css">
</head>
<body>
    <div class="wrapper">
        <?php require "header.php";?>
        <main class="main photo">
            <div class="m_top">
                <a href="img/pic4_1.png" data-lightbox="test">
                    <img src="img/pic4_1.png" class="minimized" alt="pic1"/>
                </a>
                <a href="img/pic4_2.png" data-lightbox="test">
                    <img src="img/pic4_2.png" class="minimized" alt="pic2"/>
                </a>
                <a href="img/pic4_3.png" data-lightbox="test">
                    <img src="img/pic4_3.png" class="minimized" alt="pic3"/>
                </a>
            </div>
            <div class="m_bottom">
                <a href="img/pic4_4.png" data-lightbox="test">
                    <img src="img/pic4_4.png" alt="pic4">
                </a>
                <a href="img/pic4_5.png" data-lightbox="test">
                    <img src="img/pic4_5.png" alt="pic5">
                </a>
                <a href="img/pic4_6.png" data-lightbox="test">
                    <img src="img/pic4_6.png" alt="pic6">
                </a>
            </div>
        </main>
        <?php require "footer.php"?>
    </div>
<script src="dist/js/lightbox-plus-jquery.js"></script> 
</body>
</html>