<h2>Data pembayaran</h2>

<?php
$koneksi = new mysqli("localhost", "root", "", "tokoonline");
//mendapatkan id pembelian dri url
// $id_pembelian = $_GET['id'];

//mengambil data pembayaran berdasarkan id pembelian

$ambil=$koneksi->query("SELECT*FROM pembayaran WHERE id_pembelian='$_GET[id]'"); 
$pecah = $ambil->fetch_assoc();

// echo "<pre>";
// print_r($pecah);
// echo "</pre>";
?>

<div class="row">
    <div class="col-md-4">
        <table class="table">
            <tr>
                <th>Nama</th>
                <td><?php echo $pecah['nama'] ?></td>
            </tr>
            <tr>
                <th>Bank</th>
                <td><?php echo $pecah['bank'] ?></td>
            </tr>
            <tr>
                <th>Jumlah</th>
                <td>Rp. <?php echo number_format($pecah['jumlah']) ?></td>
            </tr>
            <tr>
                <th>Tanggal</th>
                <td><?php echo $pecah['tanggal'] ?></td>
            </tr>
        </table>
    </div>
    <div class="col-md-2">
        <img src="../bukti_pembayaran/<?php echo $pecah['bukti'] ?>" alt="" class="img-responsive">
    </div>
</div>

<form method="post">
    <div class="form-group">
        <label>No. Resi pengiriman</label>
        <input type="text" class="form-control" name="resi">
    </div>
    <div class="form-group">
        <label>Status</label>
        <select class="form-control" name="status">
            <option value="pilih status"></option>
            <option value="lunas">Lunas</option>
            <option value="barang dikirim">Barang dikirim</option>
            <option value="batal">Batal</option>
        </select>
    </div>
    <button class="btn btn-primary" name="proses">proses</button>
</form>
<?php
if(isset($_POST["proses"]))
{
    $resi = $_POST["resi"];
    $status = $_POST["status"];
    $id_pembelian = $_GET['id'];
    $koneksi->query("UPDATE pembelian SET resi_pengiriman='$resi', status_pembelian='$status' 
    WHERE id_pembelian='$id_pembelian'");
    

    echo "<script>alert('data pembelian terupdate');</script>";
    echo "<script>location='index.php?halaman=pembelian';</script>";
}
?>