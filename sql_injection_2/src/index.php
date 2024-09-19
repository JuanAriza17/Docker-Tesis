<?php
include 'db.php';

$flag = getenv('FLAG') ?: 'Valor por defecto';

if (isset($_POST['username'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $query = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";

    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        echo "<h2>Login Successful!</h2>";
        echo "<img src='./thumb.jpg'>";
        echo "<h2> FLAG: $flag</h2>"
    } else {
        echo "0 results";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>SQL Injection Login Exercise</title>
</head>
<body>
    <h1>Login Page</h1>
    <form method="POST">
    <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
