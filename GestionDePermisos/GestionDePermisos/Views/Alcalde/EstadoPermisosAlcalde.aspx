<%@ Page Title="" Language="C#" MasterPageFile="~/MaAlcalde.Master" AutoEventWireup="true" CodeBehind="EstadoPermisosAlcalde.aspx.cs" Inherits="GestionDePermisos.Views.Alcalde.EstadoPermisosAlcalde" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="col-md-offset-2">
            <div class="col-md-7">
                <div class="input-group">
                    <div class="form-group  has-feedback">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCodSolicitud" placeholder="Ingrese rut a consultar"></asp:TextBox>
                        <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <span class="input-group-btn">
                        <asp:Button runat="server" ID="btnConsulta" Text="Consultar" CssClass="btn btn-success" OnClick="btnConsulta_Click" />
                        <asp:Button runat="server" ID="btnLimpiar" Text="Limpiar" CssClass="btn btn-danger" OnClick="btnLimpiar_Click" />
                    </span>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="alert alert-warning" runat="server" id="error" hidden>
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" id="btnClose">×</span><span class="sr-only">Close</span></button>
            <strong>Ups!</strong> El rut ingresado no tiene solicitudes asociadas.
        </div>
        <div class="container" id="containerTabla" runat="server" hidden>
            <div class="panel">
                <div class="row">
                    <div class="col-md-12">
                        <h4>Listado de solicitudes</h4>
                        <br />
                        <div class="table-responsive">
                            <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                                <asp:TableRow TableSection="TableHeader">
                                    <asp:TableHeaderCell>ID Solicitud</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Codigo Documento</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Descripcion</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Fecha Solicitud</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Fecha Inicio</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Fecha Termino</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Tipo Permiso</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Rut Solicitante</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Rut Autorizador</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Estado</asp:TableHeaderCell>
                                    <asp:TableHeaderCell><em class="fa fa-cog"></em></asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
    <script type="text/javascript">
        function TableClick() {
        }
    </script>
</asp:Content>
