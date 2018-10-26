<%@ Page Title="" Language="C#" MasterPageFile="~/MaAlcalde.Master" AutoEventWireup="true" CodeBehind="ValidarDocumentoAlcalde.aspx.cs" Inherits="GestionDePermisos.Views.Alcalde.ValidarDocumentoAlcalde" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../Scripts/operation.js"></script>
    <link rel="stylesheet" href="../../Content/Permisos.css" />
    <link rel="stylesheet" href="../../Content/estiloValidacionSolicitud.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form runat="server">
        <div class="row">
            <div class="col-md-offset-2">
                <div class="col-md-7">
                    <div class="input-group">
                        <div class="form-group  has-feedback">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtCodigoDocumento" placeholder="Ingrese aquí el documento que desea validar"></asp:TextBox>
                        </div>
                        <span class="input-group-btn">
                            <asp:Button CssClass="btn btn-success" Text="Buscar" ID="btnBuscar" runat="server" ClientIDMode="Static" Data-toggle="modal" data-target="modalCarga" OnClick="btnBuscar_Click" />
                            <asp:Button CssClass="btn btn-danger" Text="Limpiar" ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" />
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Modal Documento -->
    <div class="modal fade screen" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label=""><span>×</span></button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive printable">
                        <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaConsultaPermisos">
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Cod Solicitud:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="codSolicitud"></asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Rut:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="rutSolicitante"></asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Nombre:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="nombreSolicitante"></asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Fecha Solicitud:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="fechaSolicitud"></asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Tipo de Permiso:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="tipoSolicitud"></asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Motivo:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="motivoSolicitud"></asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow TableSection="TableHeader" ID="tdAutorizador" Visible="false">
                                <asp:TableHeaderCell>Rut Autorizante:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="autorizadorSolicitud"></asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Estado:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="estadoSolicitud"></asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableFooterRow>
                                <asp:TableHeaderCell>
                                <button type="button" class="btn btn-default prev-step btn-lg" id="btnImprimir">Descargar</button>
                                </asp:TableHeaderCell>
                            </asp:TableFooterRow>
                        </asp:Table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal De Error -->
    <div class="modal fade screen" id="modalerror" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label=""><span>×</span></button>
                </div>
                <div class="modal-body">

                    <div class="swal2-icon swal2-error swal2-animate-error-icon" style="display: flex;">
                        <span class="swal2-x-mark">
                            <span class="swal2-x-mark-line-left"></span>
                            <span class="swal2-x-mark-line-right"></span>
                        </span>
                    </div>
                     <h1 style="text-align: center">Ups!</h1>
                     <p style="text-align: center">No se ha encontrado este documento</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
