<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeSuperior.Master" AutoEventWireup="true" CodeBehind="GenerarResolucionJeSup.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Superior.GenerarResolucionJeSup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="col-md-offset-2">
            <div class="col-md-7">
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="control-label">Seleccione Unidad</label>
                        <asp:DropDownList runat="server" ID="cmbUnidad" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="control-label">Seleccione fecha inicio</label>
                        <asp:Calendar ID="fechaInicio" runat="server"></asp:Calendar>
                        <asp:TextBox runat="server" ID="txtFechaInicio" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="control-label">Seleccione fecha termino</label>
                        <asp:Calendar ID="fechaTermino" runat="server"></asp:Calendar>
                        <asp:TextBox runat="server" ID="txtFechaTermino" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <asp:Button runat="server" ID="btnGenerar" CssClass="btn btn-primary btn-lg" Text="Generar"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
