<?php
session_start();
include 'koneksi.php';
?>
<!DOCTYPE html>
<html> 
    <head>
        <title>Login Pelanggan</title>
        <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
    </head>
<body>


<?php include 'menu.php'; ?>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login pelanggan</h3>
                    </div>
                    <div class="panel-body">
                        <form method="post">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="password">
                            </div>
                            <button class="btn btn-primary" name="login">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php
if (isset($_POST['login']))
{
  $ambil=$koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan='$_POST[email]'
    AND password_pelanggan ='$_POST[password]'");
  $yangcocok=$ambil->num_rows;
  if ($yangcocok==1)

  {
    $_SESSION['pelanggan']=$ambil->fetch_assoc();
    echo "<div class='alert alert-info'>Login sukses</div>";

    // jk sudah belanja
    if(isset($_SESSION["keranjang"]) OR !empty($_SESSION["keranjang"]))
    {
        echo "<meta http-equiv='refresh' content='1;url=checkout.php'>";
    }
    else
    {
        echo "<meta http-equiv='refresh' content='1;url=riwayat.php'>";
    }
  }
  else
  {
  echo "<div class='alert alert-danger'>Login gagal</div>";
  echo "<meta http-equiv='refresh' content='1;url=login.php'>";
  }
}
?>
</body>
</html>