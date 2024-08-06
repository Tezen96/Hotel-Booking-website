<?php

$servername = "db"; // Use the service name defined in docker-compose.yml
$username = "root";
$password = "";
$db_name = "hotel";

$conn = mysqli_connect($servername, $username, $password, $db_name);

if ($conn) {
    // Connection successful
} else {
    echo "Connection failed: " . mysqli_connect_error(); // Added detailed error message
}

?>

