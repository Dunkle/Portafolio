<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeInterno.Master" AutoEventWireup="true" CodeBehind="AutorizarSolicitud.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Interno.AutorizarSolicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
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
                            <div class="table-container">
                                <table class="table table-filter">
                                    <tbody>
                                        <tr data-status="pagado">
                                            <td>
                                                <div class="media">
                                                    <div class="media-body">
                                                        <span class="media-meta pull-right" id="fechaSolicitud">Febrero 13, 2016</span>
                                                        <h4 class="title" id="NombreFuncionario">Leonardo Godoy
														<span class="pull-right pagado" id="EstadoSolicitud">(Pagado)</span>
                                                        </h4>
                                                        <p class="summary" id="Motivo">Permiso por 7 dias legales</p>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
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
