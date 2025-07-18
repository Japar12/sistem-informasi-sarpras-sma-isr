<?php
// session_start();
include ('../config/conn.php');
include ('../config/function.php');
?>
<html>

<head>
    <style>
    h2 {
        padding: 0px;
        margin: 0px;
        font-size: 14pt;
    }

    h4 {
        font-size: 12pt;
    }

    text {
        padding: 0px;
    }

    table {
        border-collapse: collapse;
        border: 1px solid #000;
        font-size: 11pt;
    }

    th,
    td {
        border: 1px solid #000;
        padding: 5px;
    }

    table.tab {
        table-layout: auto;
        width: 100%;
    }
    </style>
    <title>Cetak Laporan</title>
</head>

<body>
    <?php
    $now = date('Y-m-d');
    $jenis_transaksi = 'pinjam';
    $query = mysqli_query($con,"SELECT * FROM tb_transaksi LEFT JOIN tb_barang ON tb_transaksi.id_barang = tb_barang.id_barang LEFT JOIN tb_merek ON tb_merek.id_merek = tb_barang.id_merek LEFT JOIN tb_kategori ON tb_kategori.id_kategori = tb_barang.id_kategori LEFT JOIN tb_ruangan ON tb_ruangan.id_ruangan = tb_barang.id_ruangan LEFT JOIN tb_kondisi ON tb_kondisi.id_kondisi = tb_barang.id_kondisi WHERE jenis_transaksi = '$jenis_transaksi'  AND tb_transaksi.tanggal='$now' ORDER BY tb_transaksi.tanggal ASC")or die(mysqli_error($con));
    
    ?>
    <div style="page-break-after:always;text-align:center;margin-top:5%;">
        <div style="line-height:5px;">
        <h2>LAPORAN PEMINJAMAN SMA IGNATIUS SLAMET RIYADI</h2>
        <h4>HARI INI <?= date('d-m-Y',strtotime($now)); ?> </h4>
        </div>
        <hr style="border-color:black;">
        <table class="tab">
            <tr>
                <th width="20">NO</th>
                <th>TGL</th>
                <th>NAMA</th>
                <th>MEREK</th>
                <th>KATEGORI</th>
                <th>RUANGAN</th>
                <th>KONDISI</th>
                <th>KET</th>
                <th>JUMLAH</th>
            </tr>
            <?php $n=1; $total=0; while($row = mysqli_fetch_array($query)): ?>
            <tr>
                <td align="center"><?= $n++.'.'; ?></td>
                <td><?= date('d-m-Y',strtotime($row['tanggal'])); ?></td>
                <td><?= $row['nama_barang']; ?></td>
                <td><?= $row['nama_merek']; ?></td>
                <td><?= $row['nama_kategori']; ?></td>
                <td><?= $row['nama_ruangan']; ?></td>
                <td><?= $row['nama_kondisi']; ?></td>
                <td><?= $row['keterangan_transaksi']; ?></td>
                <td><?= $row['jumlah']; ?></td>
            </tr>
            <?php 
                    $total += $row['jumlah']; 
                    endwhile; ?>
            <tr>
                <td colspan="8" align="center"><b>TOTAL SEMUA BARANG DIPINJAM</b></td>
                <td><?= $total; ?></td>
            </tr>
        </table>
    </div>
</body>

</html>

<script>
window.print();
</script>