<?php
// Cargar la flag desde la variable de entorno
$flag = getenv('FLAG');

if (isset($_GET['user_input'])) {
    $input = $_GET['user_input'];
    echo "<h2>Output: " . $input . "</h2>";

    // Verificar si se realizó un XSS exitoso
    if (strpos($input, "<script>") !== false) {
        echo "<h3>Congratulations! Here is your flag: " . htmlspecialchars($flag) . "</h3>";
    }
}
?>
