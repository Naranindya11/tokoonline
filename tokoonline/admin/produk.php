<h2>Data Produk</h2>
<div class="col-md-offset-10">
<a href="index.php?halaman=tambahproduk" class="btn btn-primary">Tambah Data</a>
</div>
<br>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>kategori</th>
            <th>Nama</th>
            <th>Harga</th>
            <th>Berat</th>
            <th>Stok</th>
            <th>Foto</th>
            <th>Deskripsi</th>
            <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php $nomor=1; ?>
        <?php $ambil=$koneksi->query("SELECT * FROM produk LEFT JOIN kategori ON produk.id_kategori=kategori.id_kategori"); ?>
        <?php while($pecah = $ambil->fetch_assoc()) { ?>
        <tr>
            <td><?php echo $nomor; ?></td>
            <td><?php echo $pecah['nama_kategori']; ?></td>
            <td><?php echo $pecah['nama_produk']; ?></td>
            <td><?php echo $pecah['harga_produk']; ?></td>
            <td><?php echo $pecah['berat_produk']; ?></td>
            <td><?php echo $pecah['stok_produk']; ?></td>
            <td>
                <img src="../fotoproduk/<?php echo $pecah['foto_produk']; ?>" width="100">
            </td>
            <td><?php echo $pecah['deskripsi_produk']; ?></td>
            <td>
                <a href="index.php?halaman=hapusproduk&id=<?php echo $pecah['id_produk']; ?>"
                 class="btn-danger btn btn-sm">hapus</a> <br>

                <a href="index.php?halaman=ubahproduk&id=<?php echo $pecah['id_produk']; ?>"
                 class="btn btn-warning btn-sm">ubah</a>
            </td>
            
        </tr>
        <?php $nomor++; ?>
        <?php }?>
         
        
    </tbody>
</table>
