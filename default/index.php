<?php
// Obtener el valor de la variable de entorno FLAG
$flag = getenv('FLAG') ?: 'Valor por defecto';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Página HTML</title>
</head>
<body>
    <h1>¡Hola, Docker!</h1>
    <img src="./yoshi.png">
    <h1><?php echo htmlspecialchars($flag); ?></h1>
</body>
</html>

