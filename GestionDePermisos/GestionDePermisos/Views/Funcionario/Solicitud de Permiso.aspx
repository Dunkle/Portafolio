<%@ Page Title="" Language="C#" MasterPageFile="~/MaFuncionario.Master" AutoEventWireup="true" CodeBehind="Solicitud de Permiso.aspx.cs" Inherits="GestionDePermisos.Views.Funcionario.Solicitud_de_Permiso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Content/Permisos.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="https://resources/demos/style.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="panel">
                <section>
                    <div class="wizard">
                        <h1>Solicitar Permiso</h1>
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">

                                <li role="presentation" class="active">
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-pencil"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-ok"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <form role="form" runat="server">
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="step1">
                                    <h3>Selecciona tu permiso deseado</h3>
                                    <br />
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Tipo Permiso </label>
                                            <asp:DropDownList runat="server" ID="cmbTipoPermiso" CssClass="form-control">
                                                <asp:ListItem Value="0"> -Seleccione- </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Motivos </label>
                                            <asp:DropDownList runat="server" ID="cmbMotivo" CssClass="form-control" OnSelectedIndexChanged="cmbMotivo_SelectedIndexChanged">
                                                <asp:ListItem Value="0"> -Seleccione- </asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Ingrese comentarios de la solicitud </label>
                                            <asp:TextBox runat="server" ID="txtDetalleSolicitud" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <ul class="list-inline pull-right">
                                            <li>
                                                <button type="button" class="btn btn-primary next-step btn-lg">Siguiente</button></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="step2">
                                    <h3>Selecciona la fecha de tu permiso</h3>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="control-label">Fecha Inicio</label>
                                            <asp:TextBox runat="server" ID="txtDate1" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                     <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="control-label">Fecha Termino</label>
                                            <asp:TextBox runat="server" ID="txtDate2" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <ul class="list-inline pull-right">
                                            <li>
                                                <button type="button" class="btn btn-default prev-step btn-lg">Anterior</button></li>
                                            <li>
                                                <button type="button" class="btn btn-primary next-step btn-lg">Siguiente</button></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="complete">
                                    <h3>Casi hemos terminado</h3>
                                    <p>Click en finalizar para procesar tu permiso.</p>
                                    <ul class="list-inline pull-right">
                                        <li>
                                            <button type="button" class="btn btn-default prev-step btn-lg">Anterior</button></li>
                                        <li>
                                            <asp:Button runat="server" ID="btnFinalizarPermiso" CssClass="btn btn-primary btn-lg" Text="Finalizar" OnClick="btnFinalizarPermiso_Click"/></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#' + '<%= txtDate1.ClientID %>').datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    inline: true
                }
            );
            $('#' + '<%= txtDate2.ClientID %>').datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    inline: true
                }
            );
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            //Initialize tooltips
            $('.nav-tabs > li a[title]').tooltip();

            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                var $target = $(e.target);

                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);

            });
            $(".prev-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);

            });
        });

        function nextTab(elem) {
            $(elem).next().find('a[data-toggle="tab"]').click();
        }
        function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }
    </script>
    <script type="text/javascript">

    </script>
</asp:Content>
