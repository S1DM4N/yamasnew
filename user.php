<?php
    //Подключение файла с конфигурацией
    require "sys.php";
    require "classes/Database.php";
    $Database = new Database();
    $qry = "SELECT * FROM news ORDER BY news_datetime DESC";
    $news = $Database->getAll($qry);
    if(!isset($_SESSION["id"])){
        saveAuth(4);
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>News</title>
</head>
<body>  
    <header>
        <div class="menu_up">
            <a href="index.php" class="mpt_logo">
                <img src="img/logo.png" alt="logo">
                <div>
                    <h1>Moscow instrument-making</br>technical College</h1>
                    <h2>News blog</h2>
                </div>
            </a>
            <div class="user">
                <?php if(checkRule() <= 5): ?>
                <a class="login" type="link" href="auth.php">LOGIN</a>
                <?php endif; ?>
                <a type="link" href="user.php"><h3><?php if(checkRule()>5){echo $_SESSION["username"].",";} ?>
                <?php echo $_SESSION["privilege"]; ?></h3></a>
                <?php if(checkRule() > 5): ?>
                <a class="out" href="log_out.php">LOGOUT</a>  
                <?php endif; ?>
            </div>
        </div>
        <hr>
            <ul class="menu_down">
                <li><a href="search.php">Search</a></li>
                <li class="news"><a href="index.php">News</a></li>
                <li><a href="Support.php">Support</a></li>
            </ul>
        <hr>
    </header>
    <main class="user_desc">
        <?php if(checkRule() >= 60): ?>
            <div class="journal">
                <img src="img/journal.png" alt="journal">
            <a type="link" href="journal.php">Journal</a>
            <div class="users">
                <img src="img/user.png" alt="user">
            <a type="link" href="us.php">Users</a>
        <?php endif; ?>
            </div>
                <div class="table">
                    <table cellspacing="5">
                            <tr>
                                <td><h4>Name:</h4></td>
                                <td><h4><?php echo $_SESSION["username"]; ?></h4></td>
                            </tr>
                            <tr>
                                <td><h4>Login:</h4></td>
                                <td><h4><?php echo $_SESSION["login"]; ?></h4></td>
                            </tr>
                            <tr>
                                <td><h4>Rule:</h4></td>
                                <td><h4><?php echo $_SESSION["privilege"]; ?></h4></td>
                            </tr>
                    </table>
                </div>
    </main>
    <footer>
        <hr>
        <p>Copyright © 1997–2022 Lomonosov Moscow State University</p>
        <a type="link" href="rss/rss.php">RSS-лента</a>
    </footer>
</body>
</html>