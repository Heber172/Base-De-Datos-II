<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de envio 01</title>
</head>
<body>
    <form  name="formulario1" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        <fieldset>
            <legend>Informacion personal:</legend>
            Nombre: <br>
            <input type="text" name="nombre" placeholder="Ingrese su nombre" required>
    
            <br> apellido: <br>
            <input type="text" name="apellido" placeholder="Ingrese su apellido" required>
            <br>
            <br> CI: <br>
            <input type="text" name="ci" placeholder="Ingrese su apellido" required>
            <br>
            Email: <br>
            <input type="email" name="mail">
            <br>Clave: <br>
            <input type="password" name="clave" placeholder="Ingrese su ci"  required>

            <br>Seleccine sus sistema operativo
            <select name="os">
                <option value="Linux">Linux</option>
                <option value="Windows">Windows</option>
                <option value="Android">Android</option>
            </select> <br>

            Seleccione sus genero <br>
            <input type="radio" name="genero" value="Masculino" checked> Masculino <br>
            <input type="radio" name="genero" value="Femenino" > Femenino <br>
            <input type="hidden" name="codigo" value="C0001"><br>
            
            Seleccione sus fecha de nacimiento <br>
            <input type="date" name="fechan"><br><br>


            <input type="submit" value="Enviar datos" name="enviar" >
            <input type="reset" name="Limpiar todo" ><br>
        </fieldset>
    </form>
    <?php
        if(isset($_POST['enviar'])){
            $nombre=$_POST['nombre']; 
            $apellido=$_POST['apellido'];
            $ci=$_POST['ci'];
            $email=$_POST['mail'];
            $clave=$_POST['clave'];
            $so=$_REQUEST['os'];
            $genero=$_POST['genero'];

            if($nombre="Heber" and $clave="hola123"){
                echo <br>Bienvenido <strong> $nombre  </strong> <br>";
                echo "Su bnombre es <strong> $nombre  </strong> <br>";
                echo"Su apellido es <strong> $apellido <br>";
                echo"Su email es <strong> $mail <br>";
                echo"Su clave es <strong> $clave <br>";
                echo"Su sistema operativo es <strong> $so <br>";
                echo "Fin del procesamiento";
            }else{
                echo"Usuario no registrado";
            }
        }

    ?>
</body>
</html>