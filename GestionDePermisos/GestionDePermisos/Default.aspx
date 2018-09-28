<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestionDePermisos.Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Login</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="Scripts/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Scripts/usuario/bootstrap/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Scripts/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Scripts/usuario/animate/animate.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Scripts/usuario/css-hamburgers/hamburgers.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Scripts/usuario/select2/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Content/util.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Content/main.css" />
    <!--===============================================================================================-->
</head>
<body>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt="" style="will-change: transform; transform: perspective(300px) rotateX(0deg) rotateY(0deg);">
                    <img src="Scripts/images/img-01.png" alt="IMG">
                </div>

                <form class="login100-form validate-form" id="login" runat="server">
                    <span class="login100-form-title">Member Login
                    </span>
                    <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                        <asp:TextBox runat="server" class="input100" type="text" name="email" placeholder="Ingrese Usuario" ID="txtUsuario" ClientIDMode="Static"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <asp:TextBox runat="server" class="input100" type="password" name="pass" ID="txtContraseña" placeholder="Contraseña"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>


                    <div class="container-login100-form-btn">
                        <asp:Button class="login100-form-btn" Text="Login" ID="btnLogin" runat="server" ClientIDMode="Static" OnClick="btnLogin_Click" />
                    </div>

                    <!--<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>
                    -->
                </form>
            </div>
        </div>
    </div>
   
    <!--===============================================================================================-->
    <script src="Scripts/usuario/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="Scripts/usuario/bootstrap/js/popper.js"></script>
    <script src="Scripts/usuario/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="Scripts/usuario/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="Scripts/usuario/tilt/tilt.jquery.min.js"></script>
    <!--===============================================================================================-->
    <script src="Scripts/main.js"></script>
</body>
</html>
