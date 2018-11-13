<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeInterno.Master" AutoEventWireup="true" CodeBehind="ConsultarPermisosJeInt.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Interno.ConsultarPermisosJeInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--===============================================================================================-->
    <script type="text/javascript" src="Scripts/operation.js"></script>
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
    </form>
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
                    <div class="table-responsive">
                        <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Codigo Documento</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Descripcion</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Fecha Solicitud</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Fecha Inicio</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Fecha Termino</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Tipo Permiso</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Motivo</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Rut Solicitante</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Rut Autorizador</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Estado</asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade screen" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label=""><span>×</span></button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive printable">
                        <table class="table table-bordred table-striped">
                            <tr>
                                <td>Cod Solicitud:</td>
                                <td id="codSolicitud"></td>
                            </tr>
                            <tr>
                                <td>Rut Solicitante:</td>
                                <td id="rutSolicitante"></td>
                            </tr>
                            <tr>
                                <td>Nombre Solicitante:</td>
                                <td id="nombreSolicitante"></td>
                            </tr>
                            <tr>
                                <td>Fecha Solicitud:</td>
                                <td id="fechaSolicitud"></td>
                            </tr>
                            <tr>
                                <td>Tipo Solicitud:</td>
                                <td id="tipoSolicitud"></td>
                            </tr>
                            <tr>
                                <td>Motivo Solicitud</td>
                                <td id="motivoSolicitud"></td>
                            </tr>
                            <tr>
                                <td>Autorizador Solicitud</td>
                                <td id="autorizadorSolicitud"></td>
                            </tr>
                            <tr>
                                <td>Estado Solicitud</td>
                                <td id="estadoSolicitud"></td>
                            </tr>
                        </table>
                        <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaConsultaPermisos">
                        </asp:Table>
                    </div>
                    <%--<a style="margin-left: 170px" href="javascript:pruebaDivAPdf()" class="button">Descargar Solicitud en PDF</a>--%>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function modalTabla(id) {
            var fila = document.getElementById(id);
            document.getElementById("codSolicitud").innerText = fila.children[0].innerHTML;
            document.getElementById("rutSolicitante").innerText = fila.children[7].innerHTML;
            document.getElementById("nombreSolicitante").innerText = fila.children[10].innerHTML;
            document.getElementById("fechaSolicitud").innerText = fila.children[2].innerHTML;
            document.getElementById("tipoSolicitud").innerText = fila.children[5].innerHTML;
            document.getElementById("motivoSolicitud").innerText = fila.children[6].innerHTML;
            document.getElementById("autorizadorSolicitud").innerText = fila.children[8].innerHTML;
            document.getElementById("estadoSolicitud").innerText = fila.children[9].innerHTML;
            $('#mostrarmodal').modal('show');
        };
    </script>

</asp:Content>
