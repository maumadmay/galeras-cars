<?php
    //Local atabase config
    $LOCAL_HOST     = '127.0.0.1'; //localhost
    $LOCAL_DBNAME   = 'app_beta';
    $LOCAL_USERNAME = 'postgres';
    $LOCAL_PASSWORD = 'unicesmag';
    $LOCAL_PORT     = '5432';
    
    //Supabase database config
    $SUPA_HOST      = 'aws-1-us-east-1.pooler.supabase.com';
    $SUPA_DBNAME    = 'postgres';
    $SUPA_USERNAME  = 'postgres.kbjcodjxhlskterfhjnq';
    $SUPA_PASSWORD  = 'hif_567bDhyj_345';
    $SUPA_PORT      = '6543';

    $local_data_connection = "
        host     = $LOCAL_HOST
        dbname   = $LOCAL_DBNAME
        user     = $LOCAL_USERNAME
        password = $LOCAL_PASSWORD
        port     = $LOCAL_PORT
    ";

    $supa_data_connection = "
        host     = $SUPA_HOST
        dbname   = $SUPA_DBNAME
        user     = $SUPA_USERNAME
        password = $SUPA_PASSWORD
        port     = $SUPA_PORT
    ";

    //local coneccion
    $local_conn = pg_connect($local_data_connection);
    if(!$local_conn){
        echo "<br>Error: Unable to connect to local database...";
        exit();
    }else{
        //echo "<br>Local satisfactory connecction...";
    }

    //suppabase connection 
    $supa_conn = pg_connect($supa_data_connection);
    if(!$supa_conn){
        echo "<br>Error: Unable to connect to supa database...";
        exit();
    }else{
        //echo "<br>Supabase satisfactory connecction...";
    }
    /*
    echo "<font size = 40 <b>Hola, bienvenido </b> </font>";
    $num1 = 10;
    $num2 = 20;
    $add = $num1 + $num2;
    echo "<br>";
    echo "<font color = 'RED' <b>The result is = </b> </font>". $add;
    if($num1>$num2){
        echo "<br>You win";
    }else{
        echo "<br>You lose";
    }*/
?>