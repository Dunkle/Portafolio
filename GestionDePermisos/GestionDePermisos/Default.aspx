<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestionDePermisos.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" />
<link rel="stylesheet" href="Content/bulma.css" />
<body>
    <div class="section is-large">
        <div class="container">
            <div class="columns">
                <div class="column is-4 is-offset-one-quarter">
                    <form id="login" runat="server">
                        <div class="field">
                            <p class="control has-icons-left has-icons-right">
                                <input class="input" type="text" placeholder="Usuario" />
                                <span class="icon is-small is-left">
                                    <i class="fas fa-user"></i>
                                </span>
                            </p>
                        </div>
                        <div class="field">
                            <p class="control has-icons-left">
                                <input class="input" type="password" placeholder="Contraseña" />
                                <span class="icon is-small is-left">
                                    <i class="fas fa-lock"></i>
                                </span>
                            </p>
                        </div>

                        <div class="field">
                            <p class="control">
                                <button class="button is-success">
                                    Login
                                </button>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
