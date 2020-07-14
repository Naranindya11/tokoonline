<?php
session_start();
//mendapatkan id_produk dri url
$id_produk=$_GET['id'];

//jika sudah ada produk di dlm keranjang maka produk itu jmlhnya akan bertambah 1
if(isset($_SESSION['keranjang'][$id_produk]))
{
    $_SESSION['keranjang'][$id_produk]+=1;
}
//jka belum ada produk didlm keranjang maka produk akan di anggap beli 1
else
{
    $_SESSION['keranjang'][$id_produk]=1;
}


//echo "<pre>";
//print_r($_SESSION);
//echo "</pre>";

//masuk ke halaman keranjang
echo "<script>alert('produk telah masuk ke keranjang ');</script>";
echo "<script>location='keranjang.php';</script>";
?>
