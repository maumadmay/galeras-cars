<?php
    session_start();

    if(isset($_SESSION ['idUser'])){
        header('refresh:0;url=index.php');
    }

    //database connection
    require('config/database.php');

    //get data from sign in
    $mail  = $_POST['email'];
    $psswd = md5($_POST['pswd']); 
    //$enc_pass  = md5($passwd);

    //preparar query sql
    $sql_login = "SELECT u.id, 
                         u.email, 
                         u.firstname || ' ' || u.lastname as fullname 
                  FROM users u 
                  WHERE u.email = '$mail' AND 
                        u.password = '$psswd'";

    //ejecutar
    $res = pg_query($sql_login);

    if ($res){
        $nreg = pg_num_rows($res);
        $row = pg_fetch_assoc($res);
        if($nreg > 0){
            $_SESSION ['idUser'] = $row ['id'];
            $_SESSION ['emailUser'] = $row ['email'];
            $_SESSION ['fnUser'] = $row ['fullname'];
            header('refresh:0;url = index.php');
        }else{
            echo "<script>alert('Email or password not found, sending to log in yo ass 🤣🤣')</script>";
            header('refresh:0;url = login.html');
        }  
    }else{
        echo "Query error!! 😭😭😭";
    }
?>