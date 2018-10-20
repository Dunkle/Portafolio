<%@ Page Title="" Language="C#" MasterPageFile="~/MaAlcalde.Master" AutoEventWireup="true" CodeBehind="EstadoPermisosAlcalde.aspx.cs" Inherits="GestionDePermisos.Views.Alcalde.EstadoPermisosAlcalde" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="col-md-offset-2">
            <div class="col-md-7">
                <div class="input-group">
                    <div class="form-group  has-feedback">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCodSolicitud" placeholder="Ingrese rut a consultar"></asp:TextBox>
                        <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <span class="input-group-btn">
                        <asp:Button runat="server" ID="btnConsulta" Text="Consultar" CssClass="btn btn-success" OnClick="btnConsulta_Click" />
                        <asp:Button runat="server" ID="btnLimpiar" Text="Limpiar" CssClass="btn btn-danger" OnClick="btnLimpiar_Click" />
                    </span>
                </div>
            </div>
        </div>
    </form>
    <br />
    <br />
    <br />
    <div class="alert alert-warning" runat="server" id="error" hidden>
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" id="btnClose">×</span><span class="sr-only">Close</span></button>
        <strong>Ups!</strong> El rut ingresado no tiene solicitudes asociadas.
    </div>
    <div class="container" id="containerTabla" runat="server" hidden>
        <div class="panel">
            <div class="row">
                <div class="col-md-12">
                    <h4>Listado de solicitudes</h4>
                    <br />                    
                    <div class="table-responsive">
                        <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                            <asp:TableRow TableSection="TableHeader">
                                <asp:TableHeaderCell>ID Solicitud</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Codigo Documento</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Descripcion</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Fecha Solicitud</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Fecha Inicio</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Fecha Termino</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Tipo Permiso</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Rut Solicitante</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Rut Autorizador</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Estado</asp:TableHeaderCell>
                                <asp:TableHeaderCell><em class="fa fa-cog"></em></asp:TableHeaderCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
