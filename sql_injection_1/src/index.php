<?php
include 'db.php';

if (isset($_POST['username'])) {
    $username = $_POST['username'];
    $query = "SELECT * FROM users WHERE username = '$username'";

    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        echo "<h2>User Details</h2>";
        while($row = $result->fetch_assoc()) {
            echo "ID: " . $row["id"] . " - Username: " . $row["username"] . "<br>";
        }
    } else {
        echo "0 results";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>SQL Injection Exercise</title>
</head>
<body>
    <h1>Enter Username</h1>
    <form method="POST">
        <input type="text" name="username" placeholder="Enter username">
        <input type="submit" value="Search">
    </form>
</body>
</html>
