<%@ Page Title="" Language="C#" MasterPageFile="~/MaFuncionario.Master" AutoEventWireup="true" CodeBehind="Solicitud de Permiso.aspx.cs" Inherits="GestionDePermisos.Views.Funcionario.Solicitud_de_Permiso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Content/Permisos.css" />
    <link rel="stylesheet" href="../../Content/estiloValidacionSolicitud.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            //alert('Selected Value is : ' + $('[id*=cmbTipoPermiso]').val());

            //alert('Selected Value is : ' + $('[id*=cmbTipoPermiso] option:selected').text());

            var $val1;
            var diasDisponibles = 15;

            $('#<%=txtDetalleSolicitud.ClientID%>').keyup(function () {



                $val1 = $(this).val();
                if ($val1.length > 3 && $('[id*=cmbTipoPermiso]').val() > 0) {
                    $('#paso1').removeAttr("disabled");
                }
                if ($val1.length < 3 && $('[id*=cmbTipoPermiso]').val() > 0) {
                    $('#paso1').attr("disabled", "disabled");
                }

            });

            $('#<%=txtDate1.ClientID%>').change(function () {

                var date1 = $(this).val();
                var date2 = $('#<%=txtDate2.ClientID%>').val();
                var parts = date1.split("/");

                var $day = parseInt(parts[2], 10);
                var $month = parseInt(parts[1], 10);
                var $year = parseInt(parts[0], 10);

                $('#<%= txtDate2.ClientID %>').datepicker("option", "minDate", new Date('' + $year + '-' + $month + '-' + $day));

                var diasDis = parseInt($('[id*=cantDias]').text());
                var fecha = new Date(date1.toString());
                fecha.setDate(fecha.getDate() + diasDis);
                
                $('#<%= txtDate2.ClientID %>').datepicker("option", "maxDate", fecha);

                if (date1.length > 8 && date2.length > 8) {
                    $('#paso2').removeAttr("disabled");
                }
                else {
                    $('#paso2').attr("disabled", "disabled");
                }
            });

            $('#<%=txtDate2.ClientID%>').change(function () {

                var date1 = $(this).val();
                var date2 = $('#<%=txtDate1.ClientID%>').val();
                var parts = date1.split("/");

                var day = parseInt(parts[0], 10);
                var month = parseInt(parts[1], 10);
                var year = parseInt(parts[2], 10);

                if (date1.length > 8 && date2.length > 8) {
                    $('#paso2').removeAttr("disabled");
                }
                else {
                    $('#paso2').attr("disabled", "disabled");
                }
            });



        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
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

                        <form role="form" runat="server" id="formSolicitud">
                            <label id="cantDias" runat="server" hidden="hidden"></label>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="step1">
                                    <h3>Selecciona tu permiso deseado</h3>
                                    <br />
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Tipo Permiso </label>
                                            <asp:DropDownList runat="server" ID="cmbTipoPermiso" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="cmbTipoPermiso_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Motivos </label>
                                            <asp:DropDownList runat="server" ID="cmbMotivo" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label" id="comentario">Ingrese comentarios de la solicitud </label>
                                            <asp:TextBox runat="server" ID="txtDetalleSolicitud" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <ul class="list-inline pull-right">
                                            <li>
                                                <button type="button" class="btn btn-primary next-step btn-lg" id="paso1" disabled="disabled">Siguiente</button>
                                            </li>
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
                                                <button type="button" class="btn btn-primary next-step btn-lg" id="paso2" disabled="disabled">Siguiente</button></li>
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
                                            <asp:Button runat="server" ID="btnFinalizarPermiso" CssClass="btn btn-primary btn-lg" Text="Finalizar" OnClick="btnFinalizarPermiso_Click" /></li>
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
                        <h1 style="text-align: center">Gracias!</h1>
                        <p style="text-align: center">Su solicitud ha sido enviada</p>
                        <h3 class="cupon-pop" style="text-align: center">Su codigo es:
                            <asp:Label runat="server" Text="null" ID="txtCod"></asp:Label></h3>

                    </div>

                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            $('#' + '<%= txtDate1.ClientID %>').datepicker(
                {
                    minDate: 0,
                    changeMonth: true,
                    changeYear: true,
                    inline: true,
                    beforeShowDay: $.datepicker.noWeekends
                }

            );
            $('#' + '<%= txtDate2.ClientID %>').datepicker(
                {
                    minDate: 0,
                    changeMonth: true,
                    changeYear: true,
                    inline: true,
                    //beforeShowDay: $.datepicker.noWeekends 
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
