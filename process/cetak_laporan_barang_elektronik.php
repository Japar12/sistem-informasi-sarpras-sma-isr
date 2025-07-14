<?php
// session_start();
include('../config/conn.php');
include('../config/function.php');
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
    
    $now           = date('Y-m-d');
    $id_ruangan      = $_POST['id_ruangan'] ?? null;
    $id_barang       = $_POST['id_barang_elektronik'] ?? null;
    $id_kondisi      = $_POST['id_kondisi'] ?? null;
    $id_sumber_dana = $_POST['id_sumber_dana'] ?? null;
    $tanggal_awal    = $_POST['tanggal_awal'] ?? date('Y-m-01');
    $tanggal_akhir   = $_POST['tanggal_akhir'] ?? date('Y-m-d');

    if (!isset($id_ruangan)) {
        return header("Location:" . $base_url);
    }
    

$query = "SELECT be.*, m.nama_merek, k.nama_kategori, r.nama_ruangan, ko.nama_kondisi, sd.nama_sumber_dana
          FROM tb_barang_elektronik be
          LEFT JOIN tb_merek m ON m.id_merek = be.id_merek
          LEFT JOIN tb_kategori k ON k.id_kategori = be.id_kategori
          LEFT JOIN tb_ruangan r ON r.id_ruangan = be.id_ruangan
          LEFT JOIN tb_kondisi ko ON ko.id_kondisi = be.id_kondisi
          LEFT JOIN tb_sumber_dana sd ON sd.id_sumber_dana = be.id_sumber_dana
          WHERE be.tanggal_masuk BETWEEN '$tanggal_awal' AND '$tanggal_akhir'
                AND status='aktif'";

if ($id_ruangan) {
    $query .= " AND be.id_ruangan='$id_ruangan'";
}

if ($id_barang && $id_ruangan) {
    $query .= " AND be.id_barang_elektronik='$id_barang'";
} else if ($id_barang) {
    $query .= " AND LOWER(TRIM(be.nama_barang)) = '$id_barang'";
    
}



if ($id_kondisi) {
    $query .= " AND be.id_kondisi='$id_kondisi'";
}

if ($id_sumber_dana) {
    $query .= " AND be.id_sumber_dana='$id_sumber_dana'";
}

$query .= " GROUP BY be.id_barang_elektronik ORDER BY be.id_barang_elektronik DESC";


    $query = mysqli_query($con, $query) or die(mysqli_error($con));
    
    ?>
    <div style="page-break-after:always;text-align:center;margin-top:5%;">
        <div style="line-height:5px;">
            <h2>LAPORAN BARANG ELEKTRONIK SMA IGNATIUS SLAMET RIYADI</h2>
           <h4>
                <?= date('d-m-Y', strtotime($tanggal_awal)); ?> s.d <?= date('d-m-Y', strtotime($tanggal_akhir)); ?>
            </h4>
        </div>
        <hr style="border-color:black;">
        <table class="tab">
            <tr>
                <th width="20">NO</th>
                <th>NAMA</th>
                <th>KATEGORI</th>
                <th>MEREK</th>
                <th>RUANGAN</th>
                <th>SERIAL NUMBER</th>
                <th>TAHUN PEPENGADAAN</th>
                <th>TANGGAL MASUK</th>
                <th>KONDISI</th>
                <th>SUMBER DANA</th>
                <th>KETERANGAN</th>
                <th>GAMBAR</th>
                <th>QR CODE</th>
                <th>JUMLAH</th>
            </tr>
            <?php $n     = 1;
            $total = 0;
            while ($row = mysqli_fetch_array($query)): ?>
                <tr>
                    <td align="center">
                        <?= $n++ . '.'; ?>
                    </td>
                   <td><?= !empty($row['nama_barang']) ? htmlspecialchars($row['nama_barang']) : '-'; ?></td>
                                <td><?= !empty($row['nama_merek']) ? htmlspecialchars($row['nama_merek']) : '-'; ?></td>
                                <td><?= !empty($row['nama_kategori']) ? htmlspecialchars($row['nama_kategori']) : '-'; ?></td>
                                <td><?= !empty($row['nama_ruangan']) ? htmlspecialchars($row['nama_ruangan']) : '-'; ?></td>
                                <td><?= !empty($row['serial_number']) ? htmlspecialchars($row['serial_number']) : '-'; ?></td>
                                <td><?= !empty($row['tahun_pengadaan']) ? htmlspecialchars($row['tahun_pengadaan']) : '-'; ?></td>
                                <td><?= !empty($row['tanggal_masuk']) ? htmlspecialchars($row['tanggal_masuk']) : '-'; ?></td>
                                <td><?= !empty($row['nama_kondisi']) ? htmlspecialchars($row['nama_kondisi']) : '-'; ?></td>
                                <td><?= !empty($row['nama_sumber_dana']) ? htmlspecialchars($row['nama_sumber_dana']) : '-'; ?></td>
                                <td><?= !empty($row['keterangan_barang']) ? htmlspecialchars($row['keterangan_barang']) : '-'; ?></td>
                   <td>
                        <?php if (!empty($row['gambar'])): ?>
                            <img src="<?= base_url(); ?>assets/uploads/img/<?= $row['gambar']; ?>" width="50">
                        <?php else: ?>
                            -
                        <?php endif; ?>
                    </td>
                    <td>
                        <?php if (!empty($row['qr_code'])): ?>
                            <img src="<?= base_url(); ?>assets/uploads/qr/<?= $row['qr_code']; ?>" width="50">
                        <?php else: ?>
                            -
                        <?php endif; ?>
                    </td>

                    <td>
                        1
                    </td>
                </tr>
                 <?php $total += 1; ?>

           <?php endwhile; ?>
            <tr>
                <td colspan="13" align="center"><b>TOTAL BARANG</b></td>
                <td>
                       <?= $total; ?>
                </td>
            </tr>
        </table>
    </div>
</body>

</html>

<script>
    window.print();
</script>