<%@ Page Title="" Language="C#" MasterPageFile="~/MaFuncionario.Master" AutoEventWireup="true" CodeBehind="Solicitud de Permiso.aspx.cs" Inherits="GestionDePermisos.Views.Funcionario.Solicitud_de_Permiso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Content/Permisos.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
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
                                            <asp:ListItem> -Seleccione- </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="control-label">Motivos </label>
                                        <asp:DropDownList runat="server" ID="cmbMotivo" CssClass="form-control">
                                            <asp:ListItem> -Seleccione- </asp:ListItem>
                                        </asp:DropDownList>
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
                                <h3>Step two</h3>
                                <p>Second step</p>
                                <ul class="list-inline pull-right">
                                    <li>
                                        <button type="button" class="btn btn-default prev-step">Previous</button></li>
                                    <li>
                                        <button type="button" class="btn btn-primary next-step">next</button></li>
                                </ul>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="complete">
                                <h3>Complete steps</h3>
                                <p>You have successfully completed every steps.</p>
                                <ul class="list-inline pull-right">
                                    <li>
                                        <button type="button" class="btn btn-default prev-step">Previous</button></li>
                                    <li>
                                        <button type="button" class="btn btn-primary btn-info-full next-step">Submit</button></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
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
</asp:Content>
