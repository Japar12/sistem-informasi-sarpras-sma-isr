<?php
include_once('../config/conn.php');
include_once('../config/function.php');

if (!isset($_GET['id'])) {
    echo "ID tidak diberikan.";
    exit;
}

$id_encrypted = $_GET['id'];

function is_base64($s) {
    if (preg_match('/^[a-zA-Z0-9\/\r\n+]*={0,2}$/', $s)) {
        $decoded = base64_decode($s, true);
        if ($decoded !== false) {
            return base64_encode($decoded) === str_replace(["\r", "\n"], '', $s);
        }
    }
    return false;
}

$id = is_base64($id_encrypted) ? decrypt($id_encrypted) : $id_encrypted;

if (!ctype_digit($id)) {
    echo "Data tidak ditemukan.";
    exit;
}

$query = mysqli_query($con, "
    SELECT 
        tb_barang_elektronik.*, 
        tb_merek.nama_merek, 
        tb_ruangan.nama_ruangan
    FROM tb_barang_elektronik
    LEFT JOIN tb_merek ON tb_barang_elektronik.id_merek = tb_merek.id_merek
    LEFT JOIN tb_ruangan ON tb_barang_elektronik.id_ruangan = tb_ruangan.id_ruangan
    WHERE tb_barang_elektronik.id_barang_elektronik = '$id'
    LIMIT 1
");



if (!$query) {
    echo "Query error: " . mysqli_error($con);
    exit;
}

$data = mysqli_fetch_assoc($query);

if (!$data) {
    echo "Data tidak ditemukan";
    exit;
}

?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Detail Barang Elektronik</title>
    <link rel="icon" href="<?= base_url('assets/img/sma.png') ?>" type="image/png">


    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #212529;
            padding-bottom: 40px;
        }
        .detail-card {
            max-width: 900px;
            margin: 40px auto;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            background: #ffffff;
            padding: 30px 40px;
        }
        .detail-card h3 {
            font-weight: 700;
            color: #0d6efd;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
        }
        .label {
            font-weight: 600;
            color: #495057;
            font-size: 1rem;
        }
        .value {
            color: #212529;
            font-size: 1rem;
            word-wrap: break-word;
        }
        .row.mb-3 {
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }
        .item-image, .qr-image {
            max-width: 320px;
            width: 100%;
            border-radius: 8px;
            border: 1px solid #dee2e6;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            transition: transform 0.3s ease;
        }
        .item-image:hover, .qr-image:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }
        .img-container {
            text-align: center;
            margin-bottom: 30px;
        }
        footer {
            margin-top: 60px;
            font-size: 0.9rem;
            color: #6c757d;
        }

        @media (max-width: 576px) {
            .detail-card {
                padding: 20px 20px;
            }
            .item-image, .qr-image {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card detail-card shadow-sm">
        <h3 class="text-center">Detail Barang Elektronik</h3>

        <?php
        // Base URL manual untuk detail.php
        $base_url_manual = "http://sarpras.wuaze.com/";

        // Kemudian di bagian HTML, ganti pemanggilan base_url() jadi pakai $base_url_manual:

        if (!empty($data['gambar'])): ?>
            <div class="img-container">
                <img src="<?= $base_url_manual . 'assets/uploads/img/' . rawurlencode($data['gambar']) ?>" 
                    alt="Gambar Barang" 
                    class="item-image" />
            </div>
        <?php endif; ?>



        <div class="row mb-3">
            <div class="col-md-4 label">Nama Barang</div>
            <div class="col-md-8 value"><?= htmlspecialchars($data['nama_barang']) ?></div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4 label">Merek</div>
            <div class="col-md-8 value"><?= htmlspecialchars($data['nama_merek']) ?></div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4 label">Ruang / Lokasi</div>
            <div class="col-md-8 value"><?= htmlspecialchars($data['nama_ruangan']) ?></div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4 label">Tahun Pengadaan</div>
            <div class="col-md-8 value"><?= htmlspecialchars($data['tahun_pengadaan']) ?></div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4 label">Tanggal Masuk</div>
            <div class="col-md-8 value"><?= htmlspecialchars($data['tanggal_masuk']) ?></div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4 label">Serial Number</div>
            <div class="col-md-8 value"><?= htmlspecialchars($data['serial_number']) ?></div>
        </div>


        <div class="row mb-3">
            <div class="col-md-4 label">Sumber Dana</div>
            <div class="col-md-8 value"><?= nl2br(htmlspecialchars($data['sumber_dana'])) ?></div>
        </div>

    </div>

    <footer class="text-center">
        Copyright © SARPRAS SEKOLAH 2025
    </footer>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
