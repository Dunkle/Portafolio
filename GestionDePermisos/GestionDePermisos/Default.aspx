﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestionDePermisos.Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Login</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="Scripts/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Content/animate.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Content/hamburgers.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Content/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Content/util.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Content/main.css" />
    <!--===============================================================================================-->
        <style>
        .container-login100
        {
            background-image:url("Scripts/images/login_portafolio.jpg");
        }
           
    </style>
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
                    <div class="wrap-input100 validate-input" data-validate="El usuario es requerido: ex@abc.xyz">
                        <asp:TextBox runat="server" class="input100" type="text" name="email" placeholder="Ingrese Usuario" ID="txtUsuario" ClientIDMode="Static"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="La contraseña es requerida">
                        <asp:TextBox runat="server" class="input100" type="password" name="pass" ID="txtContraseña" placeholder="Contraseña"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>


                    <div class="container-login100-form-btn">
                        <asp:Button class="login100-form-btn" Text="Login" ID="btnLogin" runat="server" ClientIDMode="Static" OnClick="btnLogin_Click" />
                    </div>
                    <br />
                    <%--<div class="alert alert-danger" role="alert" id="alertError" hidden><asp:Label id="lblError" runat="server" ClientIDMode="Static"></asp:Label></div>--%>
                </form>
                
            </div>
        </div>
    </div>
    <!--===============================================================================================-->
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="Scripts/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="Scripts/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="Scripts/tilt.jquery.min.js"></script>
    <!--===============================================================================================-->
    <script src="Scripts/main.js"></script>
    <%--<script type="text/javascript">
        $(document).ready(function () {
            var lbl = $('#lblError');
            var mensaje = $('#alertError');
            if (lbl.text == 'Ingrese credenciales correctas') {
                mensaje.show;
            }
        });
    </script>--%>
</body>
</html>
