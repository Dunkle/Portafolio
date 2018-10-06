<%@ Page Title="" Language="C#" MasterPageFile="~/MaJefeInterno.Master" AutoEventWireup="true" CodeBehind="ConsultarPermisosJeInt.aspx.cs" Inherits="GestionDePermisos.Views.Jefe_Interno.ConsultarPermisosJeInt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
            <div class="col">
                <div class="input-group">
                    <div class="form-group  has-feedback">
                        <input type="text" class="form-control" id="rutSolicitud"  placeholder="Ingrese aquí el rut de la persona a buscar">
                        <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <span class="input-group-btn">
                        <button class="btn btn-success" type="button">Consultar</button>
                        <button class="btn btn-danger" type="button" id="limpiar" onclick="document.getElementById('rutSolicitud').value = ''">Limpiar</button>
                    </span>
                </div>
            </div>
        </div>
</asp:Content>
