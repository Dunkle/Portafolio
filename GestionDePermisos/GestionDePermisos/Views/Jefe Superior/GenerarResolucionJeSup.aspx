<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeSuperior.Master" AutoEventWireup="true" CodeBehind="GenerarResolucionJeSup.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Superior.GenerarResolucionJeSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Content/estiloValidacionSolicitud.css" />
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
                    pdf.save('Resolucion' + Mes + '_' + Ano + '.pdf');
                }, margins
            );
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="panel-default">
            <div class="row">
                <form runat="server" id="formularioResolucion">
                    <div class="row">
                        <div class="col-md-offset-2">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">Seleccione Unidad Interna</label>
                                    <asp:DropDownList runat="server" ID="cmbUnidad" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-2">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">Seleccione Año</label>
                                    <asp:DropDownList runat="server" ID="cmbAño" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">Seleccione Mes</label>
                                    <asp:DropDownList runat="server" ID="cmbMes" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-offset-2">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Button runat="server" ID="btnGenerar" CssClass="btn btn-primary btn-lg btn-block" Text="Generar" OnClick="btnGenerar_Click" />
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="imprimir">
            <div class="container" id="containerTabla" runat="server" hidden>
                <div class="panel">
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Resolucion</h4>
                            <br />
                            <div class="table-responsive">
                                <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                                    <asp:TableRow TableSection="TableHeader">
                                        <asp:TableHeaderCell> Departamento </asp:TableHeaderCell>
                                        <asp:TableHeaderCell> Rut Funcionario </asp:TableHeaderCell>
                                        <asp:TableHeaderCell> Tipo de Permiso </asp:TableHeaderCell>
                                        <asp:TableHeaderCell> Dias </asp:TableHeaderCell>
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
    </div>
    <%--Modal--%>
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
                    <p style="text-align: center">
                        <asp:Label runat="server" ID="lblError"></asp:Label>
                    </p>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
