<?php 
$datakategori = array();
$ambil=$koneksi->query("SELECT * FROM kategori") ;
while($tiap = $ambil->fetch_assoc())
{
    $datakategori[]= $tiap;
}
// echo "<pre>";
// print_r($datakategori);
// echo "</pre>";
?>
<h2>Tambah Produk</h2>
<form method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label>Kategori</label>
        <select class="form-control" name="id_kategori">
            <option value="">pilih kategori</option>
            <?php foreach ($datakategori as $key => $value):  ?>
            <option value="<?php echo $value['id_kategori'] ?>"><?php echo $value['nama_kategori']; ?></option>
            <?php endforeach ?>
        </select>
    </div>
    <div class="form-group">
        <label>nama</label>
        <input type="text" class="form-control" name="nama">
    </div>
    <div class="form-group">
        <label>Harga (Rp)</label>
        <input type="number" class="form-control" name="harga">
    </div>
    <div class="form-group">
        <label>Berat (gr)</label>
        <input type="text" class="form-control" name="berat">
    </div>
    <div class="form-group">
        <label>Deskripsi</label>
        <textarea class="form-control" name="deskripsi" id="" cols="30" rows="10"></textarea>
    </div>
    <div class="form-group">
        <label>Foto</label>
        <div class="letak-input" style="margin-bottom: 10 px">
            <input type="file" class="form-control" name="foto">
        <!-- </div> -->
        <!-- <div class="btn btn-primary btn-tambah"> -->

        <!-- </div>  -->
            <!-- <i class="fa fa-plus"></i> -->
    </div>
    <div class="form-group">
        <label>Stok</label>
        <input type="number" class="form-control" name="stok">
    </div>
    <button type="submit" class="btn btn-primary" name="save">Simpan</button>
</form>
<?php
if (isset($_POST['save']))
{
    $stok = $_POST['stok'];
    $nama =$_FILES['foto']['name'];
    $lokasi =$_FILES['foto']['tmp_name'];
    move_uploaded_file($lokasi, "../fotoproduk/".$nama);
    $koneksi->query("INSERT INTO produk
        (nama_produk, harga_produk, berat_produk, foto_produk, deskripsi_produk, stok_produk, id_kategori)
        VALUES('$_POST[nama]', '$_POST[harga]', '$_POST[berat]', '$nama', '$_POST[deskripsi]', '$stok', '$_POST[id_kategori]')");
    echo "<div class='alert alert-info'>Data tersimpan</div>";
    echo "<meta http-equiv='refresh' content='1;url=index.php?halaman=produk'>";
} 
?>

<!-- <script>
    $(document).ready(function(){
        $(".btn-tambah").on("click",function(){
            $(".letak-input").append("<input type='file' class='form-control' name='foto'>")
        })
    })
</script> -->