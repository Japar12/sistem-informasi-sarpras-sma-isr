<?php

session_start();
include('../config/conn.php');
include('../config/function.php');
require_once('../assets/lib/phpqrcode/qrlib.php'); // QR Code library

$upload_dir_img = '../assets/uploads/img/';
$upload_dir_qr = '../assets/uploads/qr/';

// tambah
// tambah
if (isset($_POST['tambah'])) {
    $nama_barang       = mysqli_real_escape_string($con, $_POST['nama_barang']);
    $id_merek          = $_POST['id_merek'];
    $id_kategori       = $_POST['id_kategori'];
    $id_ruangan        = $_POST['id_ruangan'];
    $id_kondisi        = $_POST['id_kondisi'];
    $id_sumber_dana       = mysqli_real_escape_string($con, $_POST['id_sumber_dana']);
    $serial_number     = mysqli_real_escape_string($con, $_POST['serial_number']);
    $tahun_pengadaan   = $_POST['tahun_pengadaan'];
    $tanggal           = $_POST['tanggal'];
    $keterangan_barang = mysqli_real_escape_string($con, $_POST['keterangan_barang']);

    // Validasi serial number
    if (empty($serial_number)) {
        $_SESSION['error'] = 'Serial number harus diisi.';
        header('Location:../?barang_elektronik');
        exit;
    }

    // Cek duplikat serial number
    $cek_serial = mysqli_query($con, "SELECT 1 FROM tb_barang_elektronik WHERE serial_number = '$serial_number'");
    if (mysqli_num_rows($cek_serial) > 0) {
        $_SESSION['error'] = 'Serial number sudah digunakan.';
        header('Location:../?barang_elektronik');
        exit;
    }

    // Upload gambar jika ada
    $gambar_name = '';
    if (!empty($_FILES['gambar']['name'])) {
        $gambar_name = time() . '_' . basename($_FILES['gambar']['name']);
        move_uploaded_file($_FILES['gambar']['tmp_name'], $upload_dir_img . $gambar_name);
    }

    // Insert data (tanpa QR dulu)
    $insert = mysqli_query($con, "INSERT INTO tb_barang_elektronik 
        (nama_barang, id_merek, id_kategori, id_ruangan, id_kondisi, id_sumber_dana, serial_number, tahun_pengadaan, tanggal_masuk, keterangan_barang, gambar, status) 
        VALUES 
        ('$nama_barang','$id_merek','$id_kategori','$id_ruangan','$id_kondisi','$id_sumber_dana','$serial_number','$tahun_pengadaan','$tanggal','$keterangan_barang','$gambar_name','aktif')") 
        or die(mysqli_error($con));

    // Ambil ID terakhir
    $last_id = mysqli_insert_id($con);

    // Buat QR code berdasarkan link ke detail_barang.php
    $link = base_url() . 'views/detail_barang.php?id=' . urlencode(encrypt($last_id));
    $qr_code_name = $last_id . '_' . time() . '.png';
    $qr_code_path = $upload_dir_qr . $qr_code_name;

    QRcode::png($link, $qr_code_path, QR_ECLEVEL_H, 5); // Buat QR

    // Simpan nama file QR ke database
    mysqli_query($con, "UPDATE tb_barang_elektronik SET qr_code = '$qr_code_name' WHERE id_barang_elektronik = '$last_id'");

    $_SESSION['success'] = 'Berhasil menambahkan barang dengan QR Code.';
    header('Location:../?barang_elektronik');
    exit;
}


// Ubah data
if (isset($_POST['ubah'])) {
    $id = $_POST['id'];
    $nama_barang = $_POST['nama_barang'];
    $id_merek = $_POST['id_merek'];
    $id_kategori = $_POST['id_kategori'];
    $id_ruangan = $_POST['id_ruangan'];
    $id_kondisi = $_POST['id_kondisi'];
    $id_sumber_dana = isset($_POST['id_sumber_dana']) ? mysqli_real_escape_string($con, $_POST['id_sumber_dana']) : null;
    $serial_number = $_POST['serial_number'];
    $tahun_pengadaan = $_POST['tahun_pengadaan'];
    $tanggal = $_POST['tanggal'];
    $keterangan_barang = $_POST['keterangan_barang'];

    if (empty($serial_number)) {
        $_SESSION['error'] = 'Serial number harus diisi.';
        header('Location:../?barang_elektronik');
        exit;
    }

    $cek_serial = mysqli_query($con, "SELECT * FROM tb_barang_elektronik WHERE serial_number = '$serial_number' AND id_barang_elektronik != '$id'");
    if (mysqli_num_rows($cek_serial) > 0) {
        $_SESSION['error'] = 'Serial number sudah digunakan.';
        header('Location:../?barang_elektronik');
        exit;
    }

    $get_old = mysqli_fetch_assoc(mysqli_query($con, "SELECT gambar, qr_code FROM tb_barang_elektronik WHERE id_barang_elektronik = '$id'"));

    $gambar_name = $get_old['gambar'];
    if (!empty($_FILES['gambar']['name'])) {
        if ($gambar_name && file_exists($upload_dir_img . $gambar_name)) {
            unlink($upload_dir_img . $gambar_name);
        }
        $gambar_name = time() . '_' . basename($_FILES['gambar']['name']);
        move_uploaded_file($_FILES['gambar']['tmp_name'], $upload_dir_img . $gambar_name);
    }

    // Buat QR Code baru
    $url = base_url() . "views/detail_barang.php?id=" . urlencode(encrypt($id));
    $qr_filename = $id . "_" . time() . ".png";
    $qr_path = $upload_dir_qr . $qr_filename;

    if (!empty($get_old['qr_code']) && file_exists($upload_dir_qr . $get_old['qr_code'])) {
        unlink($upload_dir_qr . $get_old['qr_code']);
    }

    QRcode::png($url, $qr_path, QR_ECLEVEL_L, 4);

    $update = mysqli_query($con, "UPDATE tb_barang_elektronik SET 
        nama_barang = '$nama_barang',
        id_merek = '$id_merek',
        id_kategori = '$id_kategori',
        id_ruangan = '$id_ruangan',
        id_kondisi = '$id_kondisi',
        id_sumber_dana = '$id_sumber_dana',
        serial_number = '$serial_number',
        tahun_pengadaan = '$tahun_pengadaan',
        tanggal_masuk = '$tanggal',
        keterangan_barang = '$keterangan_barang',
        gambar = '$gambar_name',
        qr_code = '$qr_filename'
        WHERE id_barang_elektronik = '$id'") 
        or die(mysqli_error($con));

    $_SESSION[$update ? 'success' : 'error'] = $update 
        ? 'Berhasil mengubah data barang elektronik' 
        : 'Gagal mengubah data barang elektronik';

    header('Location:../?barang_elektronik');
    exit;
}

// Hapus data
if (decrypt($_GET['act']) == 'delete' && !empty($_GET['id'])) {
    $id = decrypt($_GET['id']);
    $data = mysqli_fetch_assoc(mysqli_query($con, "SELECT gambar, qr_code FROM tb_barang_elektronik WHERE id_barang_elektronik = '$id'"));

    if (!empty($data['gambar']) && file_exists($upload_dir_img . $data['gambar'])) {
        unlink($upload_dir_img . $data['gambar']);
    }
    if (!empty($data['qr_code']) && file_exists($upload_dir_qr . $data['qr_code'])) {
        unlink($upload_dir_qr . $data['qr_code']);
    }

    $delete = mysqli_query($con, "DELETE FROM tb_barang_elektronik WHERE id_barang_elektronik = '$id'")
        or die(mysqli_error($con));

    $_SESSION[$delete ? 'success' : 'error'] = $delete 
        ? 'Berhasil menghapus data barang elektronik' 
        : 'Gagal menghapus data barang elektronik';

    header('Location:../?barang_elektronik');
    exit;
}

// Nonaktifkan data
if (decrypt($_GET['act'] ?? '') == 'nonaktif' && !empty($_GET['id'])) {
    $id = decrypt($_GET['id']);
    $today = date('Y-m-d');

    $nonaktif = mysqli_query($con, "UPDATE tb_barang_elektronik SET status = 'nonaktif', tanggal_nonaktif = '$today' WHERE id_barang_elektronik = '$id'")
        or die(mysqli_error($con));

    $_SESSION[$nonaktif ? 'success' : 'error'] = $nonaktif 
        ? 'Barang berhasil dinonaktifkan.' 
        : 'Gagal menonaktifkan barang.';

    header('Location:../?barang_elektronik');
    exit;
}

// Aktifkan kembali
if (decrypt($_GET['act'] ?? '') == 'aktif' && !empty($_GET['id'])) {
    $id = decrypt($_GET['id']);

    $aktif = mysqli_query($con, "UPDATE tb_barang_elektronik SET status = 'aktif', tanggal_nonaktif = NULL WHERE id_barang_elektronik = '$id'")
        or die(mysqli_error($con));

    $_SESSION[$aktif ? 'success' : 'error'] = $aktif 
        ? 'Barang berhasil diaktifkan kembali.' 
        : 'Gagal mengaktifkan barang.';

    header('Location:../?barang_nonaktif');
    exit;
}

?>
