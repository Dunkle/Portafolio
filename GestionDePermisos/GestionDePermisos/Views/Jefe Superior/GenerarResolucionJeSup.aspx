<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeSuperior.Master" AutoEventWireup="true" CodeBehind="GenerarResolucionJeSup.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Superior.GenerarResolucionJeSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
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
                        <label class="control-label">Seleccione fecha inicio</label>
                        <asp:Calendar ID="fechaInicio" runat="server" ></asp:Calendar>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="control-label">Seleccione fecha termino</label>
                        <asp:Calendar ID="fechaTermino" runat="server"></asp:Calendar>
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
</asp:Content>
