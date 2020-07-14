<h2>Data Pelanggan</h2>
<table class="table table_boardered">
    <thead>
        <tr>
            <th>no</th>
            <th>nama</th>
            <th>email</th>
            <th>no telepon</th>
            <th>aksi</th>
        </tr>
    </thead>
    <tbody>
        <?php $nommor=1; ?>
        <?php $ambil=$koneksi->query("SELECT * FROM pelanggan"); ?>
        <?php while($pecah=$ambil->fetch_assoc()) { ?>
        <tr>
            <td> <?php echo $nommor; ?></td>
            <td><?php echo $pecah['nama_pelanggan']; ?></td>
            <td><?php echo $pecah['email_pelanggan'] ?></td>
            <td><?php echo $pecah['no_telp_pelanggan'] ?></td>
            <td>
                <a href=""class="btn btn-danger">hapus</a>
            </td>
        </tr>
        <?php $nommor++?>
        <?php }?>
    </tbody>
</table>