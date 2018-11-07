<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeSuperior.Master" AutoEventWireup="true" CodeBehind="ConsultaResolucionJeSup.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Superior.ConsultaResolucionJeSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="panel">
            <div class="row">
                <div class="col-md-12">
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
                                        <label class="control-label">Seleccione fecha termino</label>
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
    

    <div class="container" id="containerTabla" runat="server" hidden>
        <div class="panel">
            <div class="row">
                <div class="col-md-12">
                    <h4>Resolucion</h4>
                    <br />
                    <div class="table-responsive">
                        <asp:Table runat="server" CssClass="table table-bordred table-striped" ID="tablaEstadoPermisos">
                            <asp:TableRow TableSection="TableHeader">
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
            </div>
        </div>
</asp:Content>
