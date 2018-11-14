<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeSuperior.Master" AutoEventWireup="true" CodeBehind="GenerarResolucionJeSup.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Superior.GenerarResolucionJeSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Content/estiloValidacionSolicitud.css" />
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
                                    <label class="control-label">Seleccione Unidad</label>
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
                                        <asp:ListItem Value="0" Text="- Seleccione -"></asp:ListItem>
                                        <asp:ListItem Value="1" Text=" Enero "></asp:ListItem>
                                        <asp:ListItem Value="2" Text=" Febrero "></asp:ListItem>
                                        <asp:ListItem Value="3" Text=" Marzo "></asp:ListItem>
                                        <asp:ListItem Value="4" Text=" Abril "></asp:ListItem>
                                        <asp:ListItem Value="5" Text=" Mayo "></asp:ListItem>
                                        <asp:ListItem Value="6" Text=" Junio "></asp:ListItem>
                                        <asp:ListItem Value="7" Text=" Julio "></asp:ListItem>
                                        <asp:ListItem Value="8" Text=" Agosto "></asp:ListItem>
                                        <asp:ListItem Value="9" Text=" Septiembre "></asp:ListItem>
                                        <asp:ListItem Value="10" Text=" Octubre "></asp:ListItem>
                                        <asp:ListItem Value="11" Text=" Noviembre "></asp:ListItem>
                                        <asp:ListItem Value="12" Text=" Diciembre "></asp:ListItem>
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
