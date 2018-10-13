<%@ Page Title="" Language="C#" MasterPageFile="~/MaFuncionario.Master" AutoEventWireup="true" CodeBehind="BuscarDocumentoFuncionario.aspx.cs" Inherits="GestionDePermisos.Views.Funcionario.BuscarDocumentoFuncionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../Scripts/operation.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="row">
            <div class="col-md-offset-2">
                <div class="col-md-7">
                    <div class="input-group">
                        <div class="form-group  has-feedback">
                            <input type="text" class="form-control" id="inputSuccess5" placeholder="Ingrese aquí el documento que desea validar">
                            <asp:TextBox CssClass="form-control" ID="txtCodigoDocumento" Text ="Ingrese aquí el documento que desea validar" runat="server"></asp:TextBox>                            
                        </div>
                        <span class="input-group-btn">
                            <asp:Button CssClass="btn btn-success" Text="Buscar" ID="btnLogin" runat="server" ClientIDMode="Static" Data-toggle="modal" data-target="modalCarga" OnClick="btnLogin_Click" />
                            <asp:Button CssClass="btn btn-danger" Text="Limpiar" ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" />                            
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
