<?php
session_start();
include ('../config/conn.php');

if (isset($_POST['id'])) {
    $id = $_POST['id'];
    
    $query = mysqli_query($con, "
        SELECT * FROM tb_barang_elektronik 
        LEFT JOIN tb_merek ON tb_merek.id_merek = tb_barang_elektronik.id_merek 
        LEFT JOIN tb_kategori ON tb_kategori.id_kategori = tb_barang_elektronik.id_kategori 
        LEFT JOIN tb_ruangan ON tb_ruangan.id_ruangan = tb_barang_elektronik.id_ruangan 
        LEFT JOIN tb_kondisi ON tb_kondisi.id_kondisi = tb_barang_elektronik.id_kondisi 
        LEFT JOIN tb_sumber_dana ON tb_sumber_dana.id_sumber_dana = tb_barang_elektronik.id_sumber_dana 
        WHERE id_barang_elektronik = '$id'
    ") or die(mysqli_error($con));
    
    $data = mysqli_fetch_array($query);
    echo json_encode($data);
}


?>
