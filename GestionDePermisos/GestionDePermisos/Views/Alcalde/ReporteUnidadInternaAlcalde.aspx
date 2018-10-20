<%@ Page Title="" Language="C#" MasterPageFile="~/MaAlcalde.Master" AutoEventWireup="true" CodeBehind="ReporteUnidadInternaAlcalde.aspx.cs" Inherits="GestionDePermisos.Views.Alcalde.ReporteUnidadInternaAlcalde" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

    <div class="container" id="containerTabla" runat="server" hidden>
        <div class="panel">
            <div class="row">
                <div class="col-md-12">
                    <h4>Reporte tipo Permiso por unidad</h4>
                    <br />
                    <div class="table-responsive">
                        <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>Nombre Unidad</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Tipo de Permiso</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Cantidad</asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
