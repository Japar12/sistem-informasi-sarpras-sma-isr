<?php hakAkses(['admin']); $now = date('Y-m-d'); 

$barang = mysqli_fetch_array(mysqli_query($con, "SELECT COUNT(*) AS total FROM tb_barang"));
$barang_elektronik = mysqli_fetch_array(mysqli_query($con, "SELECT COUNT(*) AS total FROM tb_barang_elektronik WHERE status = 'aktif'"));
$barang_nonaktif = mysqli_fetch_array(mysqli_query($con, "SELECT COUNT(*) AS total FROM tb_barang_elektronik WHERE status = 'nonaktif'"));
$barang_masuk = mysqli_fetch_array(mysqli_query($con, "SELECT COUNT(*) AS total FROM tb_transaksi WHERE jenis_transaksi = 'masuk'"));
$barang_keluar = mysqli_fetch_array(mysqli_query($con, "SELECT COUNT(*) AS total FROM tb_transaksi WHERE jenis_transaksi = 'keluar'"));
$barang_pinjam = mysqli_fetch_array(mysqli_query($con, "SELECT COUNT(*) AS total FROM tb_transaksi WHERE jenis_transaksi = 'pinjam'"));
?>
<style>
.card-hover:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease-in-out;
}
</style>

<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <div class="row">

        <!-- Data Barang -->
        <div class="col-sm-6 col-lg-4 mb-4">
            <div class="card h-100 shadow card-hover">
                <div class="card-header bg-primary text-white text-center">
                    <strong>Data Barang</strong>
                </div>
                <div class="card-body text-center">
                    <h3 class="card-title mb-0"><?= $barang['total']; ?></h3>
                </div>
            </div>
        </div>

        <!-- Barang Elektronik -->
        <div class="col-sm-6 col-lg-4 mb-4">
            <div class="card h-100 shadow card-hover">
                <div class="card-header bg-primary text-white text-center">
                    <strong>Barang Elektronik</strong>
                </div>
                <div class="card-body text-center">
                    <h3 class="card-title mb-0"><?= $barang_elektronik['total']; ?></h3>
                </div>
            </div>
        </div>

        <!-- Barang Nonaktif -->
        <div class="col-sm-6 col-lg-4 mb-4">
            <div class="card h-100 shadow card-hover">
                <div class="card-header bg-secondary text-white text-center">
                    <strong>Barang Nonaktif</strong>
                </div>
                <div class="card-body text-center">
                    <h3 class="card-title mb-0"><?= $barang_nonaktif['total']; ?></h3>
                </div>
            </div>
        </div>

        <!-- Barang Masuk -->
        <div class="col-sm-6 col-lg-4 mb-4">
            <div class="card h-100 shadow card-hover">
                <div class="card-header bg-success text-white text-center">
                    <strong>Barang Masuk</strong>
                </div>
                <div class="card-body text-center">
                    <h3 class="card-title mb-0"><?= $barang_masuk['total']; ?></h3>
                </div>
            </div>
        </div>

        <!-- Barang Keluar -->
        <div class="col-sm-6 col-lg-4 mb-4">
            <div class="card h-100 shadow card-hover">
                <div class="card-header bg-danger text-white text-center">
                    <strong>Barang Keluar</strong>
                </div>
                <div class="card-body text-center">
                    <h3 class="card-title mb-0"><?= $barang_keluar['total']; ?></h3>
                </div>
            </div>
        </div>

        <!-- Peminjaman -->
        <div class="col-sm-6 col-lg-4 mb-4">
            <div class="card h-100 shadow card-hover">
                <div class="card-header bg-info text-white text-center">
                    <strong>Peminjaman</strong>
                </div>
                <div class="card-body text-center">
                    <h3 class="card-title mb-0"><?= $barang_pinjam['total']; ?></h3>
                </div>
            </div>
        </div>

    </div>
</div>
