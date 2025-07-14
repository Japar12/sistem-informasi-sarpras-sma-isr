<?php
session_start();
include ('../config/conn.php');

if (isset($_POST['id'])) {
    $id = mysqli_real_escape_string($con, $_POST['id']); // Hindari SQL Injection
    $query = mysqli_query($con, "SELECT * FROM tb_sumber_dana WHERE id_sumber_dana='$id'") or die(mysqli_error($con));
    
    if (mysqli_num_rows($query) > 0) {
        $data = mysqli_fetch_array($query);
        echo json_encode($data);
    } else {
        echo json_encode(['error' => 'Data tidak ditemukan']);
    }
}
?>
