<%@ Page Title="" Language="C#" MasterPageFile="~/MaAdmin.Master" AutoEventWireup="true" CodeBehind="BuscarDocumentoJefeSup.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Superior.BuscarDocumentoJefeSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../Scripts/operation.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="row">
            <div class="col">
                <div class="input-group">
                    <div class="form-group  has-feedback">
                        <input type="text" class="form-control" runat="server" id="inputSuccess5" placeholder="Ingrese aquí el documento que desea validar">
                        <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <span class="input-group-btn">
                        <asp:Button class="btn btn-success" Text="Buscar" ID="txtRut" runat="server" ClientIDMode="Static" OnClick="btnLogin_Click" Data-toggle="modal" Data-target="modalSolicitud" />

                        <button class="btn btn-danger" type="button" id="limpiar" onclick="document.getElementById('inputSuccess5').value = ''">Limpiar</button>
                    </span>
                </div>
            </div>
        </div>
    </form>


      <div class="modal fade" id="modalCarga" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 25%; overflow-y: visible;">
        <div class="modal-dialog modal-m">
            <div id="loader">
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="lading"></div>
            </div>
        </div>
    </div>
</asp:Content>
