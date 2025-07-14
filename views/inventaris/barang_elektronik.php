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
                $('[name="id_sumber_dana"]').val(data.id_sumber_dana).trigger('change');
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
        <h1 class="h3 mb-0 text-gray-800">Barang Elektronik</h1>
    </div>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <button class="btn btn-primary btn-icon-split btn-sm" data-toggle="modal" data-target="#barangModal" onclick="submit('add')">
                <span class="icon text-white-50"><i class="fas fa-plus"></i></span>
                <span class="text">Tambah</span>
            </button>
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
                            <th>KONDISI</th>
                            <th>SUMBER DANA</th>
                            <th>KET</th>
                            <th>GAMBAR</th>
                            <th>QR CODE</th>
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
                            <th><input type="text" placeholder="Filter Tanggal" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Kondisi" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Sumber Dana" class="form-control form-control-sm"></th>
                            <th><input type="text" placeholder="Filter Keterangan" class="form-control form-control-sm"></th>
                            <th></th>
                            <th></th>
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
                            WHERE tb_barang_elektronik.status = 'aktif'
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
                                <td><?= !empty($row['nama_kondisi']) ? htmlspecialchars($row['nama_kondisi']) : '-'; ?></td>
                                <td><?= !empty($row['nama_sumber_dana']) ? htmlspecialchars($row['nama_sumber_dana']) : '-'; ?></td>
                                <td><?= !empty($row['keterangan_barang']) ? htmlspecialchars($row['keterangan_barang']) : '-'; ?></td>
                               <td>
                                    <?php if (!empty($row['gambar'])) : ?>
                                       <img src="<?= base_url(); ?>assets/uploads/img/<?= rawurlencode($row['gambar']); ?>" 
                                        alt="Gambar" 
                                       style="max-width:100px;">

                                    <?php else : ?>
                                        -
                                    <?php endif; ?>
                                </td>

                                    <td>
                                        <?php if (!empty($row['qr_code'])) : ?>
                                            <a href="<?= base_url(); ?>assets/uploads/qr/<?= rawurlencode($row['qr_code']); ?>" download="<?= 'qr_'.$row['id_barang_elektronik'].'.png' ?>" title="Klik untuk download QR Code">
                                                <img src="<?= base_url(); ?>assets/uploads/qr/<?= rawurlencode($row['qr_code']); ?>" alt="QR Code" style="max-width:100px; cursor:pointer;">
                                            </a>
                                        <?php else : ?>
                                            -
                                        <?php endif; ?>
                                    </td>

                                <td>
                                    <div class="d-inline-flex p-2">
                                        <a href="#barangModal" data-toggle="modal" onclick="submit(<?= $row['id_barang_elektronik']; ?>)" class="btn btn-sm btn-circle btn-info mr-2" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="<?= base_url(); ?>/process/process_barang_elektronik.php?act=<?= encrypt('delete'); ?>&id=<?= encrypt($row['id_barang_elektronik']); ?>" class="btn btn-sm btn-circle btn-danger btn-hapus" title="Hapus">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                         <a href="<?= base_url(); ?>/process/process_barang_elektronik.php?act=<?= encrypt('nonaktif'); ?>&id=<?= encrypt($row['id_barang_elektronik']); ?>" class="btn btn-sm btn-circle btn-warning btn-nonaktif" title="Nonaktif">
                                            
                                             <i class="fas fa-ban"></i>
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

<!-- Modal Tambah/Edit Barang -->
<div class="modal fade" id="barangModal" tabindex="-1" role="dialog" aria-labelledby="barangModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <form action="<?= base_url(); ?>process/process_barang_elektronik.php" method="post" enctype="multipart/form-data" id="formBarang">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="barangModalLabel"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="id" value="">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="tanggal">Tanggal Masuk <span class="text-danger">*</span></label>
                                <input type="date" class="form-control" id="tanggal" name="tanggal" required value="<?= date('Y-m-d'); ?>">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="tahun_pengadaan">Tahun Pengadaan <span class="text-danger">*</span></label>
                                <input type="number" name="tahun_pengadaan" class="form-control" min="2000" max="<?= date('Y'); ?>" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="nama_barang">Nama Barang <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="nama_barang" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="id_merek">Merek</label>
                                <select name="id_merek" id="id_merek" class="form-control select2" style="width: 100%;" required>
                                    <option value="">-- Pilih merek --</option>
                                    <?= list_merek(); ?>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="id_kategori">Kategori</label>
                                <select name="id_kategori" id="id_kategori" class="form-control select2" style="width: 100%;" required>
                                    <option value="">-- Pilih kategori --</option>
                                    <?= list_kategori(); ?>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="id_ruangan">Ruangan</label>
                                <select name="id_ruangan" id="id_ruangan" class="form-control select2" style="width: 100%;" required>
                                    <option value="">-- Pilih ruangan --</option>
                                    <?= list_ruangan(); ?>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="id_kondisi">Kondisi</label>
                                <select name="id_kondisi" id="id_kondisi" class="form-control select2" style="width: 100%;" required>
                                    <option value="">-- Pilih kondisi --</option>
                                    <?= list_kondisi(); ?>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="serial_number">Serial Number</label>
                                <input type="text" name="serial_number" class="form-control" required>
                            </div>
                        </div>

                         <div class="col-md-6">
                            <div class="form-group">
                                <label for="id_sumber_dana">Sumber Dana</label>
                                <select name="id_sumber_dana" id="id_sumber_dana" class="form-control select2" style="width: 100%;" required>
                                    <option value="">-- Pilih Sumber Dana --</option>
                                    <?= list_sumber_dana(); ?>
                                </select>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="gambar">Gambar</label>
                                <input type="file" name="gambar" class="form-control-file" onchange="previewGambar(this)"> <br>
                                <img id="preview" src="#" alt="Preview" style="display:none; max-width: 150px;" />
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="keterangan_barang">Keterangan</label>
                                <textarea name="keterangan_barang" id="keterangan_barang" class="form-control" rows="4"></textarea>
                            </div>
                        </div>

                    </div>

                    <hr class="sidebar-divider">
                         <button class="btn btn-secondary" type="button" data-dismiss="modal"><i class="fas fa-times"></i>
                             Batal</button>
                         <button class="btn btn-primary float-right" type="submit" name="tambah"><i class="fas fa-save"></i>
                             Tambah</button>
                         <button class="btn btn-primary float-right" type="submit" name="ubah"><i class="fas fa-save"></i>
                             Ubah</button>
                 </div>
                </div>
            </form>






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
        console.log('Klik nonaktif:', id, nama);
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