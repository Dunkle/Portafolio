<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeInterno.Master" AutoEventWireup="true" CodeBehind="ConsultarDocumentoJeInt.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Interno.ConsultarDocumentoJeInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript" src="../../Scripts/operation.js"></script>
    <link rel="stylesheet" href="../../Content/Permisos.css" />
    <link rel="stylesheet" href="../../Content/estiloValidacionSolicitud.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
    <script>
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
                    pdf.save($('#<%=nombreSolicitante.ClientID%>').text() +'_' + $('#<%=codSolicitud.ClientID%>').text() + '.pdf');
                }, margins
            );
        }
    </script>
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
                        </asp:Table>
                    </div>
                    <button style="margin-left: 170px" visible="false"  class="btn btn-success" id="btnDescarga" runat="server" onclick="pruebaDivAPdf()">Descargar Solicitud en PDF</button>
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
</asp:Content>
