<?php
session_start();
include 'koneksi.php'; 
?>
<!DOCTYPE html>
<html> 
    <head>
        <title>Nota pembelian</title>
        <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
    </head>
    <body>
    <?php include 'menu.php'; ?>

    <section class="konten">
        <div class="container">
            

        <!-- NOTA DI SINI COPAS DRI NOTA  YG ADA DI ADMIN -->
        <h2>Detail Pembelian</h2>
        <?php
        $ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan
        ON pembelian.id_pelanggan=pelanggan.id_pelanggan
        WHERE pembelian.id_pembelian='$_GET[id]'");
        $detail = $ambil->fetch_assoc();
        ?>

        <?php
        //id pelanggan yg beli
        $idpelangganygbeli = $detail["id_pelanggan"];
        
        //id pelanggan yg login tapi tidak beli
        $idpelangganyglogin = $_SESSION["pelanggan"]["id_pelanggan"];
        if ($idpelangganygbeli !==$idpelangganyglogin)
        {
            echo "<script>alert('jangan nakal');</script>";
            echo "<script>location='riwayat.php';</script>";
            exit(); 
        }
        ?>

        <div class="row">
            <div class="col-md-4">
                <h3>Pembelian</h3>
                <strong>No. Pembelian: <?php echo $detail['id_pembelian'] ?></strong><br>
                Tanggal: <?php echo $detail['tanggal_pembelian']; ?> <br>
                Total: Rp. <?php echo number_format($detail['total_pembelian']); ?>
            </div>
            <div class="col-md-4">
                <h3>Pelanggan</h3>
                <strong>Nama Customor :<?php echo $detail['nama_pelanggan']; ?></strong> <br>
                <p>
                    No telepon :<?php echo $detail['no_telp_pelanggan']; ?> <br>
                    Email    :<?php echo $detail['email_pelanggan']; ?>
                </p>
            </div>
            <div class="col-md-4">
                <h3>Pengiriman</h3>
                <strong>Kota: <?php echo $detail['nama_kota'] ?></strong> <br>
                Ongkos kirim: Rp. <?php echo number_format($detail['tarif']); ?>  <br>
                Alamat: <?php echo $detail['alamat_pengiriman'] ?>
            </div>
        </div>
        <table class="table table-boardered">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Produk</th>
                    <th>Harga</th>
                    <th>Berat</th>
                    <th>Jumlah</th>
                    <th>subberat</th>
                    <th>Subharga</th>
                </tr>
            </thead>
            <tbody>
                <?php $nomor=1; ?>
                <?php $ambil=$koneksi->query("SELECT * FROM pembelian_produk WHERE id_pembelian='$_GET[id]'"); ?>
                <?php while($pecah=$ambil->fetch_assoc()){ ?>
                <tr>
                    <td><?php echo $nomor; ?></td>
                    <td><?php echo $pecah['nama']; ?></td>
                    <td>Rp. <?php echo number_format($pecah['harga']); ?></td>
                    <td><?php echo $pecah['berat']; ?>gr</td>
                    <td><?php echo $pecah['jumlah']; ?></td>
                    <td><?php echo $pecah['subberat']; ?>gr</td>
                    <td>Rp. <?php echo number_format($pecah['subharga']); ?></td>
                </tr>
                <?php $nomor++; ?>
                <?php } ?>
            </tbody>
        </table>

        <div class="row">
            <div class="col-md-7">
                <div class="alert alert-info">
                    <p>
                        Silahkan melakukan pmbayaran Rp. <?php echo number_format($detail
                        ['total_pembelian']); ?> ke <br>
                        <strong>BANK MANDIRI 137-001088-327 AN. Nara Anindya </strong>
                    </p>
                </div>
            </div>
        </div>


        </div>
    </section>
    </body>
</html>