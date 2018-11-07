<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeInterno.Master" AutoEventWireup="true" CodeBehind="AutorizarSolicitud.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Interno.AutorizarSolicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {

            $('.star').on('click', function () {
                $(this).toggleClass('star-checked');
            });

            $('.ckbox label').on('click', function () {
                $(this).parents('tr').toggleClass('selected');
            });

            //$('.btn-filter').on('click', function () {
            //    var $target = $(this).data('target');
            //    if ($target != 'all') {
            //        $('.table tr').css('display', 'none');
            //        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
            //    } else {
            //        $('.table tr').css('display', 'none').fadeIn('slow');
            //    }
            //});

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-body">
                    <form runat="server">
                        <div class="pull-right">
                            <div class="btn-group">
                                <asp:Button runat="server" CssClass="btn btn-success btn-filter" OnClick="btnAprobados_Click" Text="Aprobado"/>
                                <asp:Button runat="server" CssClass="btn btn-warning btn-filter" OnClick="btnPendientes_Click" Text="Pendiente"/>
                                <asp:Button runat="server" CssClass="btn btn-danger btn-filter"  OnClick="btnRechazados_Click" Text="Rechado"/>
                                <asp:Button runat="server" CssClass="btn btn-default btn-filter" OnClick="btnTodos_Click" Text="Todos"/>
                            </div>
                        </div>
                    </form>
                    <div class="container" id="containerTabla" runat="server" hidden>
                        <div class="panel">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                                        <asp:TableRow TableSection="TableHeader">
                                            <asp:TableHeaderCell>Codigo Documento</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Descripcion</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Fecha Solicitud</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Fecha Inicio</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Fecha Termino</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Tipo Permiso</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Rut Solicitante</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Motivo</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Estado</asp:TableHeaderCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
