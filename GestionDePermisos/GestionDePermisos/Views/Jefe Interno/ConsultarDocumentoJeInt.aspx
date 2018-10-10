<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeInterno.Master" AutoEventWireup="true" CodeBehind="ConsultarDocumentoJeInt.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Interno.ConsultarDocumentoJeInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../Scripts/operation.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="row">
            <div class="col">
                <div class="input-group">
                    <div class="form-group  has-feedback">
                        <input type="text" class="form-control" id="inputSuccess5" placeholder="Ingrese aquí el documento que desea validar">
                        <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <span class="input-group-btn">
                        <asp:Button class="btn btn-success" Text="Login" ID="btnLogin" runat="server" ClientIDMode="Static" Data-toggle="modal" data-target="modalCarga" />

                        <button class="btn btn-danger" type="button" id="limpiar" onclick="document.getElementById('inputSuccess5').value = ''">Limpiar</button>
                    </span>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
