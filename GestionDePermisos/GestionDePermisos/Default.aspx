<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestionDePermisos.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" />
<link rel="stylesheet" href="Content/bulma.css" />
<script src="Scripts/jquery-1.10.2.js"></script>
<script src="Scripts/bulma.sass"></script>
<body>
    <div class="section is-medium">
        <div class="container">
            <div class="column is-5 is-offset-one-quarter" style="text-align: center">
                <h1 class="title is-1">Gestion de Permisos</h1>
            </div>
            <div class="column is-4 is-offset-one-quarter">
            </div>
            <div class="columns">
                <div class="column is-5 is-offset-one-quarter">
                    <h2 class="subtitle">Favor ingrese sus credenciales</h2>
                    <form id="login" runat="server">
                        <div class="field">
                            <p class="control has-icons-left has-icons-right">
                                <asp:TextBox runat="server" ID="txtUsuario" CssClass="input" placeholder="Usuario" ClientIDMode="Static"></asp:TextBox>
                                <span class="icon is-small is-left">
                                    <i class="fas fa-user"></i>
                                </span>
                            </p>
                        </div>
                        <div class="field">
                            <p class="control has-icons-left">
                                <asp:TextBox runat="server" ID="txtContraseña" TextMode="Password" placeholder="Contraseña" ClientIDMode="Static" CssClass="input"></asp:TextBox>
                                <span class="icon is-small is-left">
                                    <i class="fas fa-lock"></i>
                                </span>
                            </p>
                        </div>
                        <div class="field">
                            <p class="control">
                                <asp:Button Text="Login" ID="btnLogin" runat="server" ClientIDMode="Static" CssClass="button is-success" OnClick="btnLogin_Click" />
                            </p>
                            <asp:Label ID="lblError" runat="server"></asp:Label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
