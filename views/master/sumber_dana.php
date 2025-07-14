<?php hakAkses(['admin']) ?>
<script>
function submit(x) {
    if (x == 'add') {
        $('#sumberDanaModal .modal-title').html('Tambah Sumber Dana');
        $('[name="nama_sumber_dana"]').val("").trigger('change');
        $('[name="keterangan"]').val("").trigger('change');
        $('[name="ubah"]').hide();
        $('[name="tambah"]').show();
    } else {
        $('#sumberDanaModal .modal-title').html('Edit Sumber Dana');
        $('[name="nama_sumber_dana"]').val("").trigger('change');
        $('[name="keterangan"]').val("").trigger('change');
        $('[name="tambah"]').hide();
        $('[name="ubah"]').show();

        $.ajax({
            type: "POST",
            data: { id: x },
            url: '<?=base_url();?>process/view_sumber_dana.php',
            dataType: 'json',
            success: function(data) {
                $('[name="id"]').val(data.id_sumber_dana);
                $('[name="nama_sumber_dana"]').val(data.nama_sumber_dana);
                $('[name="keterangan"]').val(data.keterangan);
            }
        });
    }
}
</script>

<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Data Sumber Dana</h1>
    </div>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <a href="#" class="btn btn-primary btn-icon-split btn-sm" data-toggle="modal" data-target="#sumberDanaModal"
                onclick="submit('add')">
                <span class="icon text-white-50">
                    <i class="fas fa-plus"></i>
                </span>
                <span class="text">Tambah</span>
            </a>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th width="20">NO</th>
                            <th>Nama Sumber Dana</th>
                            <th>Keterangan</th>
                            <th width="50">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $n = 1;
                        $query = mysqli_query($con, "SELECT * FROM tb_sumber_dana ORDER BY id_sumber_dana DESC") or die(mysqli_error($con));
                        while($row = mysqli_fetch_array($query)):
                        ?>
                        <tr>
                            <td><?= $n++; ?></td>
                            <td><?= $row['nama_sumber_dana']; ?></td>
                            <td><?= $row['keterangan']; ?></td>
                            <td>
                                <div class="d-inline-flex p-2">
                                    <a href="#sumberDanaModal" data-toggle="modal" onclick="submit(<?=$row['id_sumber_dana'];?>)"
                                        class="btn btn-sm btn-circle btn-info mr-2"><i class="fas fa-edit"></i></a>
                                    <a href="<?=base_url();?>/process/process_sumber_dana.php?act=<?=encrypt('delete');?>&id=<?=encrypt($row['id_sumber_dana']);?>"
                                        class="btn btn-sm btn-circle btn-danger btn-hapus"><i class="fas fa-trash"></i></a>
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

<!-- Modal Tambah Data -->
<div class="modal fade" id="sumberDanaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form action="<?=base_url();?>process/process_sumber_dana.php" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Nama Sumber Dana <span class="text-danger">*</span></label>
                                <input type="hidden" name="id" class="form-control">
                                <input type="text" class="form-control" name="nama_sumber_dana" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Keterangan <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="keterangan" required>
                            </div>
                        </div>
                    </div>
                    <hr class="sidebar-divider">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal"><i class="fas fa-times"></i> Batal</button>
                    <button class="btn btn-primary float-right" type="submit" name="tambah"><i class="fas fa-save"></i> Tambah</button>
                    <button class="btn btn-primary float-right" type="submit" name="ubah"><i class="fas fa-save"></i> Ubah</button>
                </div>
            </form>
        </div>
    </div>
</div>
