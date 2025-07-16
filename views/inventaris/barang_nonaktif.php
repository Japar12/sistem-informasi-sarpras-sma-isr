<?php 
include_once "config/function.php"; 

hakAkses(['admin']); 
?>



<script>
function submit(id) {
    if (id === 'add') {
        $('#barangModal .modal-title').text('Tambah barang');
        $('#barangModal form')[0].reset();
        $('[name="id"]').val('');
        $('.select2').val(null).trigger('change');
        $('[name="tanggal"]').val("<?= date('Y-m-d'); ?>").trigger('change');
        $('[name="tambah"]').show();
        $('[name="ubah"]').hide();
    } else {
        $('#barangModal .modal-title').text('Edit barang');
        $('[name="tambah"]').hide();
        $('[name="ubah"]').show();

        $.ajax({
            type: "POST",
            url: "<?= base_url(); ?>process/view_barang_elektronik.php",
            data: { id: id },
            dataType: "json",
            success: function(data) {
                $('[name="id"]').val(data.id_barang_elektronik);
                $('[name="nama_barang"]').val(data.nama_barang).trigger('change');
                $('[name="id_merek"]').val(data.id_merek).trigger('change');
                $('[name="id_kategori"]').val(data.id_kategori).trigger('change');
                $('[name="id_ruangan"]').val(data.id_ruangan).trigger('change');
                $('[name="id_kondisi"]').val(data.id_kondisi).trigger('change');
                $('[name="serial_number"]').val(data.serial_number);
                $('[name="tahun_pengadaan"]').val(data.tahun_pengadaan);
                $('[name="tanggal"]').val(data.tanggal_masuk).trigger('change');
                $('[name="sumber_dana"]').val(data.sumber_dana);
                $('[name="keterangan_barang"]').val(data.alasan_nonaktif ? data.alasan_nonaktif : data.keterangan_barang);
            },
            error: function() {
                alert('Gagal mengambil data barang.');
            }
        });
    }
}
</script>

<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Barang Nonaktif</h1>
    </div>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
           
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th width="20">NO</th>
                            <th>NAMA</th>
                            <th>MEREK</th>
                            <th>KATEGORI</th>
                            <th>RUANGAN</th>
                            <th>SERIAL NUMBER</th>
                            <th>TAHUN PENGADAAN</th>
                            <th>TGL MASUK</th>
                            <th>TGL KELUAR</th>
                            <th>KONDISI</th>
                            <th>SUMBER DANA</th>
                            <th>KET</th>
                            <th width="50">AKSI</th>
                        </tr>
                        <tr id="filter">
                            <th></th>
                            <th><input type="text" placeholder="Filter Nama" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Merek" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Kategori" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Ruangan" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Serial" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Tahun" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Tanggal Masuk" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Tanggal Keluar" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Kondisi" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Sumber Dana" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Keterangan" class="form-control form-control-sm"></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $n = 1;
                        $query = mysqli_query($con, "
                            SELECT tb_barang_elektronik.*, 
                                tb_merek.nama_merek, 
                                tb_kategori.nama_kategori, 
                                tb_kondisi.nama_kondisi, 
                                tb_ruangan.nama_ruangan,
                                tb_sumber_dana.nama_sumber_dana 
                            FROM tb_barang_elektronik 
                            LEFT JOIN tb_merek ON tb_merek.id_merek = tb_barang_elektronik.id_merek 
                            LEFT JOIN tb_kategori ON tb_kategori.id_kategori = tb_barang_elektronik.id_kategori 
                            LEFT JOIN tb_ruangan ON tb_ruangan.id_ruangan = tb_barang_elektronik.id_ruangan 
                            LEFT JOIN tb_kondisi ON tb_kondisi.id_kondisi = tb_barang_elektronik.id_kondisi 
                            LEFT JOIN tb_sumber_dana ON tb_sumber_dana.id_sumber_dana = tb_barang_elektronik.id_sumber_dana 

                            WHERE tb_barang_elektronik.status = 'nonaktif'
                            ORDER BY tb_barang_elektronik.id_barang_elektronik DESC
                        ") or die(mysqli_error($con));

                        while ($row = mysqli_fetch_assoc($query)) : ?>
                            <tr>
                                <td><?= $n++; ?></td>
                                <td><?= !empty($row['nama_barang']) ? htmlspecialchars($row['nama_barang']) : '-'; ?></td>
                                <td><?= !empty($row['nama_merek']) ? htmlspecialchars($row['nama_merek']) : '-'; ?></td>
                                <td><?= !empty($row['nama_kategori']) ? htmlspecialchars($row['nama_kategori']) : '-'; ?></td>
                                <td><?= !empty($row['nama_ruangan']) ? htmlspecialchars($row['nama_ruangan']) : '-'; ?></td>
                                <td><?= !empty($row['serial_number']) ? htmlspecialchars($row['serial_number']) : '-'; ?></td>
                                <td><?= !empty($row['tahun_pengadaan']) ? htmlspecialchars($row['tahun_pengadaan']) : '-'; ?></td>
                                <td><?= !empty($row['tanggal_masuk']) ? htmlspecialchars($row['tanggal_masuk']) : '-'; ?></td>
                                <td><?= !empty($row['tanggal_nonaktif']) ? htmlspecialchars($row['tanggal_nonaktif']) : '-'; ?></td>
                                <td><?= !empty($row['nama_kondisi']) ? htmlspecialchars($row['nama_kondisi']) : '-'; ?></td>
                                <td><?= !empty($row['nama_sumber_dana']) ? htmlspecialchars($row['nama_sumber_dana']) : '-'; ?></td>
                                <td><?= !empty($row['keterangan_barang']) ? htmlspecialchars($row['keterangan_barang']) : '-'; ?></td>

                                <td>
                                    <div class="d-inline-flex p-2">
                                        <a href="<?= base_url(); ?>/process/process_barang_elektronik.php?act=<?= encrypt('aktif'); ?>&id=<?= encrypt($row['id_barang_elektronik']); ?>" class="btn btn-sm btn-circle btn-success btn-aktif" title="Aktifkan">
                                            <i class="fas fa-check"></i>
                                        </a>
                                        <a href="<?= base_url(); ?>/process/process_barang_elektronik.php?act=<?= encrypt('delete'); ?>&id=<?= encrypt($row['id_barang_elektronik']); ?>" class="btn btn-sm btn-circle btn-danger btn-hapus" title="Hapus">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>








<script>
$(document).ready(function() {
    // Inisialisasi Select2
    $('.select2').select2({
        theme: 'bootstrap4',
        width: 'resolve'
    });

    // Inisialisasi DataTables
    var table = $('#dataTable').DataTable({
        orderCellsTop: true,
        fixedHeader: true,
        initComplete: function () {
            this.api().columns().every(function (index) {
                if (index === 0 || index >= 10) return;
                var that = this;
                $('input', $('#dataTable thead tr:eq(1) th').eq(index)).on('keyup change', function () {
                    if (that.search() !== this.value) {
                        that.search(this.value).draw();
                    }
                });
            });
        }
    });

    // Handler konfirmasi hapus
    $(document).on('click', '.btn-hapus', function(e) {
        if (!confirm('Yakin ingin menghapus data ini?')) {
            e.preventDefault();
        }
    });

    // Handler modal nonaktifkan
    $(document).on('click', '.btn-nonaktif', function() {
         if (!confirm('Yakin ingin menghapus data ini?')) {
            e.preventDefault();
        }
    });
});



// Preview gambar sebelum upload
function previewGambar(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#preview').attr('src', e.target.result).show();
        }
        reader.readAsDataURL(input.files[0]);
    }
}


</script>