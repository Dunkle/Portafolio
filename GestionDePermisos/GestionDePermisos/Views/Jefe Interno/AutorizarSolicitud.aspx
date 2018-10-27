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

            $('.btn-filter').on('click', function () {
                var $target = $(this).data('target');
                if ($target != 'all') {
                    $('.table tr').css('display', 'none');
                    $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
                } else {
                    $('.table tr').css('display', 'none').fadeIn('slow');
                }
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-success btn-filter" data-target="pagado">Pagado</button>
                            <button type="button" class="btn btn-warning btn-filter" data-target="pendiente">Pendiente</button>
                            <button type="button" class="btn btn-danger btn-filter" data-target="cancelado">Cancelado</button>
                            <button type="button" class="btn btn-default btn-filter" data-target="all">Todos</button>
                        </div>
                    </div>
                    <div class="container" id="containerTabla" runat="server" hidden>
                        <div class="panel">
                            <div class="row">
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
        </div>
    </section>



    <script>
        $(document).ready(function () {

            $('.btn-filter').on('click', function () {
                var $target = $(this).data('target');
                if ($target != 'all') {
                    $('.table tr').css('display', 'none');
                    $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
                } else {
                    $('.table tr').css('display', 'none').fadeIn('slow');
                }
            });
        });
    </script>
</asp:Content>
