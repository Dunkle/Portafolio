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
</asp:Content>
