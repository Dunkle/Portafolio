<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeInterno.Master" AutoEventWireup="true" CodeBehind="AutorizarSolicitud.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Interno.AutorizarSolicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!--<script src="../../Scripts/operation.js"></script>-->
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
                                <asp:Button runat="server" CssClass="btn btn-success btn-filter" OnClick="btnAprobados_Click" Text="Aprobado" />
                                <asp:Button runat="server" CssClass="btn btn-warning btn-filter" OnClick="btnPendientes_Click" Text="Pendiente" />
                                <asp:Button runat="server" CssClass="btn btn-danger btn-filter" OnClick="btnRechazados_Click" Text="Rechado" />
                                <asp:Button runat="server" CssClass="btn btn-default btn-filter" OnClick="btnTodos_Click" Text="Todos" />
                            </div>
                        </div>
                    </form>
                    <div class="container" id="containerTabla" runat="server">
                        <div class="panel">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                                        <asp:TableRow TableSection="TableHeader">
                                            <asp:TableHeaderCell ID="tituloCodigo">Codigo Documento</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Descripcion</asp:TableHeaderCell>
                                            <asp:TableHeaderCell Visible="false">Nombre Solicitante</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Fecha Solicitud</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Fecha Inicio</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Fecha Termino</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Tipo Permiso</asp:TableHeaderCell>
                                            <asp:TableHeaderCell Visible="false">Rut Solicitante</asp:TableHeaderCell>
                                            <asp:TableHeaderCell Visible="false">rut Autorizante</asp:TableHeaderCell>
                                            <asp:TableHeaderCell>Motivo</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="tituloEstado">Estado</asp:TableHeaderCell>
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
                        <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaConsultaPermisos">
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Cod Solicitud:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" runat="server" ID="codSolicitud"></asp:TableHeaderCell>
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
                            <asp:TableRow TableSection="TableHeader" ID="tdAutorizador">
                                <asp:TableHeaderCell>Rut Autorizante:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="autorizadorSolicitud"></asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Estado:</asp:TableHeaderCell>
                                <asp:TableHeaderCell Text="" ID="estadoSolicitud"></asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <asp:Label ID="btnAutorizar" CssClass="btn btn-success" runat="server" Text="Autorizar" onclick="postbackAprobar()" />
                    <asp:Label ID="btnRechazar" CssClass="btn btn-danger" runat="server" Text="Rechazar" onclick="postbackRechazar()" />                    
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function postbackAprobar() {

            var cod = document.getElementById('<%=codSolicitud.ClientID%>').innerText;
            __doPostBack('aprobar', '' + cod + '');

        }

        function postbackRechazar() {

            var cod = document.getElementById('<%=codSolicitud.ClientID%>').innerText;
            __doPostBack('rechazar', '' + cod + '');

        }
        function modalTabla(id) {
            var fila = document.getElementById(id);

            document.getElementById('<%=codSolicitud.ClientID%>').innerText = fila.children[0].innerHTML;
            document.getElementById('<%=rutSolicitante.ClientID%>').innerText = fila.children[7].innerHTML;
            document.getElementById('<%=nombreSolicitante.ClientID%>').innerText = fila.children[2].innerHTML;
            document.getElementById('<%=fechaSolicitud.ClientID%>').innerText = fila.children[3].innerHTML;
            document.getElementById('<%=tipoSolicitud.ClientID%>').innerText = fila.children[6].innerHTML;
            document.getElementById('<%=motivoSolicitud.ClientID%>').innerText = fila.children[9].innerHTML;
            document.getElementById('<%=autorizadorSolicitud.ClientID%>').innerText = fila.children[8].innerHTML;
            document.getElementById('<%=estadoSolicitud.ClientID%>').innerText = fila.children[10].innerHTML;

            $('#mostrarmodal').modal('show');
        };
    </script>
</asp:Content>
