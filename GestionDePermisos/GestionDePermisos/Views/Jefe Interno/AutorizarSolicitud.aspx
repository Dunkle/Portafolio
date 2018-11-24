<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeInterno.Master" AutoEventWireup="true" CodeBehind="AutorizarSolicitud.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Interno.AutorizarSolicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
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
        function pruebaDivAPdf() {

            var pdf = new jsPDF('1', 'pt', 'a4');
            source = $('#imprimir')[0];

            specialElementHandlers = {
                '#bypassme': function (element, renderer) {
                    return true
                }
            };
            margins = {
                top: 80,
                bottom: 60,
                left: 40,
                width: 500
            };
            var img = new Image();
            img.addEventListener('load', function () {
                var doc = new jsPDF();
                doc.addImage(img, 'png', 10, 50);
            });
            pdf.fromHTML(
                source,
                margins.left, // x coord
                margins.top, { // y coord
                    'width': margins.width,
                    'elementHandlers': specialElementHandlers
                },

                function (dispose) {
                    pdf.save($('#<%=nombreSolicitante.ClientID%>').text() + '_' + $('#<%=codSolicitud.ClientID%>').text() + '.pdf');
                }, margins
            );
        }
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
                                <asp:Button runat="server" CssClass="btn btn-success btn-filter" OnClick="btnAprobados_Click" Text="Autorizado" />
                                <asp:Button runat="server" CssClass="btn btn-warning btn-filter" OnClick="btnPendientes_Click" Text="Pendiente" />
                                <asp:Button runat="server" CssClass="btn btn-danger btn-filter" OnClick="btnRechazados_Click" Text="Rechazado" />
                                <asp:Button runat="server" CssClass="btn btn-default btn-filter" OnClick="btnTodos_Click" Text="Todos" />
                            </div>
                        </div>
                    </form>
                    <div class="container-fluid" id="containerTabla" runat="server">                        
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
                    <button id="btnAutorizar" visible="true" class="btn btn-success" runat="server" onclick="postbackAprobar()">Autorizar</button>
                    <button id="btnRechazar" visible="true" class="btn btn-danger" runat="server" onclick="postbackRechazar()">Rechazar</button>
                    <button style="margin-left: 170px" visible="true" class="btn btn-success" id="btnDescarga" runat="server" onclick="pruebaDivAPdf()">Descargar Solicitud en PDF</button>
                </div>
            </div>
        </div>
    </div>

    <div id="imprimir" hidden="hidden">
        <div style="text-align: right">
            <!--<asp:Image ID="Image2" runat="server" Height="40px" ImageUrl="~/Scripts/images/Escudo_de_Vista_Hermosa.png" Width="40px" AlternateText="Imagen no disponible" />-->
        </div>

        <header style="text-align: left">
            <strong style="text-align: center">CERTIFICADO DE SOLICITUD
            </strong>
        </header>
        <div>
            <div style="text-align: left">
            </div>
            <div>
                <h1 style="text-align: right">Certificado de Solicitud</h1>
            </div>
            <br>
            <br>
            <div>


                <asp:Label runat="server" Text="Se hace entrega del siguiente certificado a don "></asp:Label><asp:Label runat="server" ID="certSolicitante" Text=""></asp:Label><asp:Label runat="server" Text=", que con fecha de inicio "></asp:Label><asp:Label runat="server" ID="cetInicio" Text=""></asp:Label>
                <asp:Label runat="server" Text=" y con fecha de termino "></asp:Label><asp:Label runat="server" ID="certFin" Text=""></asp:Label><asp:Label runat="server" Text=", se le ha otorgado segun su solicitud, "></asp:Label>
                <asp:Label runat="server" Text="el permiso: "></asp:Label><asp:Label runat="server" Text="" ID="cetPermiso"></asp:Label><asp:Label runat="server" Text=" con motivo de "></asp:Label>
                <asp:Label runat="server" ID="certMotivo" Text=""></asp:Label><asp:Label runat="server" Text=" durante "></asp:Label><asp:Label runat="server" Text="" ID="certDias"></asp:Label><asp:Label runat="server" Text=" dias."></asp:Label>


            </div>
            <div>
                <asp:Image ID="Image1" runat="server" Height="300px" mageAlign="right" ImageUrl="~/Scripts/images/certificado.jpg" Width="300px" AlternateText="Imagen no disponible" ImageAlign="TextTop" />
            </div>
            <footer>
                <div style="top: 300px">
                    <p>
                        <asp:Label runat="server" Text="Autoriza el siguiente documento el Sr.|Sra. "></asp:Label><asp:Label runat="server" ID="certAutorizador" Text="Jefe Interno"></asp:Label><asp:Label runat="server" Text=" de la Iluste Municipalidad de Vista Hermosa"></asp:Label>
                    </p>
                </div>
            </footer>
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

            //llenado del certificado
            var estado = fila.children[10].innerHTML;
            var nombre = fila.children[2].innerHTML;
            var inicio = fila.children[4].innerHTML;
            var fin = fila.children[5].innerHTML;
            var permiso = fila.children[6].innerHTML;
            var motivo = fila.children[9].innerHTML;
            var dias = (parseInt(fin) - parseInt(inicio));

            console.log(dias);

            document.getElementById('<%=certSolicitante.ClientID%>').innerText = nombre;
            document.getElementById('<%=cetInicio.ClientID%>').innerText = inicio;
            document.getElementById('<%=certFin.ClientID%>').innerText = fin;
            document.getElementById('<%=cetPermiso.ClientID%>').innerText = permiso;
            document.getElementById('<%=certMotivo.ClientID%>').innerText = motivo;
            document.getElementById('<%=certDias.ClientID%>').innerText = dias;


            if (estado == 'En proceso') {
                document.getElementById('<%=btnAutorizar.ClientID%>').style.display = 'unset';
                document.getElementById('<%=btnRechazar.ClientID%>').style.display = 'unset';
                document.getElementById('<%=btnDescarga.ClientID%>').style.display = 'none';
            }
            else if (estado == 'Autorizado') {
                document.getElementById('<%=btnAutorizar.ClientID%>').style.display = 'none';
                document.getElementById('<%=btnRechazar.ClientID%>').style.display = 'none';
                document.getElementById('<%=btnDescarga.ClientID%>').style.display = 'unset';

            }
            else {
                document.getElementById('<%=btnAutorizar.ClientID%>').style.display = 'none';
                document.getElementById('<%=btnRechazar.ClientID%>').style.display = 'none';
                document.getElementById('<%=btnDescarga.ClientID%>').style.display = 'none';
            }

            $('#mostrarmodal').modal('show');
        };
    </script>
</asp:Content>
