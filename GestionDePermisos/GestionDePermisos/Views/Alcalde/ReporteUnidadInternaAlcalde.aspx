<%@ Page Title="" Language="C#" MasterPageFile="~/MaAlcalde.Master" AutoEventWireup="true" CodeBehind="ReporteUnidadInternaAlcalde.aspx.cs" Inherits="GestionDePermisos.Views.Alcalde.ReporteUnidadInternaAlcalde" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
    <script>
        function pruebaDivAPdf() {
            var pdf = new jsPDF('1', 'pt', 'a4');
            source = $('#imprimir')[0];


            var Ano = ($('[id*=cmbAño]').val());
            var Mes = ($('[id*=cmbMes]').val());

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
                    pdf.save('Resolucion' +Date() + '.pdf');
                }, margins
            );
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="col-md-offset-2">
            <div class="col-md-7">
                <asp:Button runat="server" ID="btnConsulta" Text="Generar" CssClass="btn btn-success" OnClick="btnConsulta_Click" />
            </div>
        </div>
    </form>
    <br />
    <br />
    <br />
    <div id="imprimir">
        <div class="container" id="containerTabla" runat="server" hidden>
            <div class="panel">
                <div class="row">
                    <div class="col-md-12">
                        <h4>Reporte tipo Permiso por unidad</h4>
                        <br />
                        <div class="table-responsive">
                            <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                                <asp:TableRow TableSection="TableHeader">
                                    <asp:TableHeaderCell>Nombre Unidad Interna</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Tipo de Permiso</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Cantidad</asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>
            </div>
            <button style="margin-left: 170px" class="btn btn-success" id="btnDescarga" runat="server" onclick="pruebaDivAPdf()">Descargar Solicitud en PDF</button>
            <button style="margin-left: 170px" class="btn btn-danger" id="btnLimpiar" runat="server" onclick="__doPostBack('limpiar')">Limpiar</button>
        </div>
    </div>
</asp:Content>
