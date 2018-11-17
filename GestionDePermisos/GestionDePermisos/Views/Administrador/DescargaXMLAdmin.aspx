<%@ Page Title="" Language="C#" MasterPageFile="~/MaAdmin.Master" AutoEventWireup="true" CodeBehind="DescargaXMLAdmin.aspx.cs" Inherits="GestionDePermisos.Views.Administrador.DescargaXMLAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function pruebaDivAPdf() {

            var xml = new XMLDocument('1', 'pt', 'a4');
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
                    xml.save('.xml');
                }, margins
            );
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <div class="col-md-offset-2">
            <div class="col-md-7">
                <asp:Button runat="server" ID="btnGenerarXML" Text="Generar XML" CssClass="btn btn-success" OnClick="btnGenerarXML_Click" />
            </div>
        </div>
    </form>
    <div id="imprimir" hidden="hidden">
        <div class="container" id="containerTabla" runat="server" hidden>
            <div class="panel">
                <div class="row">
                    <div class="col-md-12">
                        <h4>Reporte tipo Permiso por unidad</h4>
                        <br />
                        <div class="table-responsive">
                            <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                                <asp:TableRow TableSection="TableHeader">
                                    <asp:TableHeaderCell>Tipo de Permiso</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Cantidad</asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    
</asp:Content>
