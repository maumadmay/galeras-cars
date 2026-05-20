<?php
    //database connection
    require('config/database.php');

    //get data from sign in
    $mail      = $_POST['email'];
    $psswd     = md5($_POST['pswd']); 
    $enc_pass  = md5($passwd);

    //preparar query sql
    $sql_login = "SELECT * FROM users u WHERE u.email = '$mail' AND u.pasword = '$psswd'";

    //ejecutar
    $res = pg_query($sql_login);

    if ($res){
        $nreg = pg_num_rows($res);
        if($nreg > 0){
            header('refresh:0;url = index.html');
        }else{
            echo "<script>alert('Email or password not found, sending to sing yo ass up 🤣🤣')</script>";
            header('refresh:0;url = register.html');
        }  
    }else{
        echo "Query error!! 😭😭😭";
    }

?>