<!DOCTYPE html>
<html lang="en" >
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Sample Web Application</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="Styles/style.css">
  <link rel="icon" href="Images/logo.jfif" type="image/x-icon">
</head>
<body>
<!-- partial:index.partial.html -->
<div id="login-form-wrap">
  <h2>Login</h2>
  <font color="red">${errorMsg}</font>
  <form id="login-form" action="login" method="post">
    <p>
    <input type="text" id="username" name="uname" required><i class="validation"><span></span><span></span></i>
    </p>
    <p>
    <input type="password" id="email" name="pass" required><i class="validation"><span></span><span></span></i>
    </p>
    <p>
    <input type="submit" id="login" value="Login">
    </p>
  </form>
  <div id="create-account-wrap">
    <p>Not a member? <form action="createUser" method="GET"><button type="submit">Create Account</button></form></a><p>
  </div><!--create-account-wrap-->
</div><!--login-form-wrap-->
<!-- partial -->
  
</body>
</html>
