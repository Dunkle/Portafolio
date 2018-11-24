<%@ Page Title="" Language="C#" MasterPageFile="~/MaAdmin.Master" AutoEventWireup="true" CodeBehind="DescargaXMLAdmin.aspx.cs" Inherits="GestionDePermisos.Views.Administrador.DescargaXMLAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="../../Content/estiloValidacionSolicitud.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <div class="col-md-offset-2">
            <div class="col-md-7">
                <asp:Button runat="server" ID="btnGenerarXML" Text="Generar XML" CssClass="btn btn-success" OnClick="btnGenerarXML_Click" />
            </div>
        </div>
    </form>

    <!-- Modal que entrega la info de descarga -->
    <div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label=""><span>×</span></button>
                </div>
                <div class="modal-body">
                    <div class="thank-you-pop">
                        <div class="swal2-icon swal2-success swal2-animate-success-icon" style="display: flex;">
                            <div class="swal2-success-circular-line-left" style="background-color: rgb(255, 255, 255);"></div>
                            <span class="swal2-success-line-tip"></span>
                            <span class="swal2-success-line-long"></span>
                            <div class="swal2-success-ring"></div>
                            <div class="swal2-success-fix" style="background-color: rgb(255, 255, 255);"></div>
                            <div class="swal2-success-circular-line-right" style="background-color: rgb(255, 255, 255);"></div>
                        </div>
                        <h1 style="text-align: center">Descarga Exitosa</h1>
                        <p style="text-align: center"><asp:Label runat="server" Text="" ID="txtCod"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Errores -->
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
                    <p style="text-align: center"><asp:Label runat="server" ID="lblError"></asp:Label></p>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
