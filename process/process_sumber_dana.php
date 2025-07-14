<?php
session_start();
include ('../config/conn.php');
include ('../config/function.php');

// Proses tambah
if(isset($_POST['tambah'])){
    $nama_sumber_dana = $_POST['nama_sumber_dana'];
    $keterangan = $_POST['keterangan'];

    $insert = mysqli_query($con,"INSERT INTO tb_sumber_dana (nama_sumber_dana, keterangan) VALUES ('$nama_sumber_dana','$keterangan')") or die (mysqli_error($con));
    if($insert){
        $success = 'Berhasil menambahkan data sumber dana';
    }else{
        $error = 'Gagal menambahkan data sumber dana';
    }
    $_SESSION['success'] = $success;
    $_SESSION['error'] = $error;
    header('Location:../?sumber_dana');
}

// Proses ubah
if(isset($_POST['ubah'])){
    $id = $_POST['id'];
    $nama_sumber_dana = $_POST['nama_sumber_dana'];
    $keterangan = $_POST['keterangan'];

    $update = mysqli_query($con,"UPDATE tb_sumber_dana SET nama_sumber_dana='$nama_sumber_dana', keterangan='$keterangan' WHERE id_sumber_dana='$id'") or die (mysqli_error($con));
    
    if($update){
        $success = 'Berhasil mengubah data sumber dana';
    }else{
        $error = 'Gagal mengubah data sumber dana';
    }
    $_SESSION['success'] = $success;
    $_SESSION['error'] = $error;
    header('Location:../?sumber_dana');
}

// Proses hapus
if(decrypt($_GET['act'])=='delete' && isset($_GET['id'])!=""){
    $id = decrypt($_GET['id']);
    $query = mysqli_query($con, "DELETE FROM tb_sumber_dana WHERE id_sumber_dana='$id'") or die(mysqli_error($con));
    if($query){
        $success = 'Berhasil menghapus data sumber dana';
    }else{
        $error = 'Gagal menghapus data sumber dana';
    }
    $_SESSION['success'] = $success;
    $_SESSION['error'] = $error;
    header('Location:../?sumber_dana');
}
?>
