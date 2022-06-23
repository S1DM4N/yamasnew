<?php
require_once 'core.php';
$Database = new Database();
$parm = ['id_user' => $_SESSION['id_user']];
$trans = $Database->getRow('SELECT t.id_transaction, t.transaction_number, t.price, ts.transaction_status_name, t.id_transaction_status FROM user_yamas u INNER JOIN transaction t on u.id_user = t.id_user INNER JOIN transaction_status ts on t.id_transaction_status = ts.id_stransaction_status WHERE u.id_user = :id_user', $parm);
?>
<title>Оплата</title>
<link rel="stylesheet" href="css/style.css">
<body>
    <div class="wrapper">
        <main class="reg p">
            <div class="enter payy">
                <h1><?php echo $trans['transaction_status_name'] ?></h1>
                <h1 class="num">№<?php echo $trans['transaction_number'] ?></h1>
                <br><br>
                <h1 class="num">Сумма:</h1>
                <p class="num"><?php echo $trans['price'] ?> рублей</p>
                <?php if ($trans['id_transaction_status'] == 1): ?>
                    <form action="func_account.php" method="post">
                        <button type="submit" name="trans_submit">Онлайн оплата</button>
                    </form>
                <?php endif; ?>
            </div>
            <a class="back" href="account.php">Назад</a>
        </main>
    </div>
</body>
