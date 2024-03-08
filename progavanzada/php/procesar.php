<?php 
    $nombre=$_POST['nombre']; 
    $apellido=$_POST['apellido'];
    $email=$_POST['mail'];
    $clave=$_POST['clave'];
    $so=$_REQUEST['os']
    echo "Su bnombre es <strong> $nombre  <br>";
    echo"Su apellido es <strong> $apellido <br>";
    echo"Su email es <strong> $mail <br>";
    echo"Su clave es <strong> $clave <br>";
    echo"Su sistema operativo es <strong> $so <br>";
    echo "Fin del procesamiento";
?>