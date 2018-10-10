$(document).ready(function () {

    ///////////////////////// LOGIN /////////////////////////////////
    /*
     * Inicia modal de carga.
     */
    $('#btnLogin').on('click', function () {

        var user = $('#txtUsuario').val();
        var pass = $('#txtContraseña').val();

        if (user != "" && pass != "") {

            var $modal = $(this);

            $modal.attr("data-target", "#modalCarga");
        }
    });

    /*
     * Oculta el mensaje de error al presionar el spam
     */
    $('#btnClose').on('click', function () {


        $mensaje = $('#errorSession');

        $mensaje.attr('hidden','true');
    });

    //////////////////////// CONSULTA PERMISO  /////////////////////////

    $('#validarDocumento').on('click', function () {

        var cod = $('#txtCodSolicitud').val();

        if (cod != "") {
            var $modalSolicitud = $(this);

            $modalSolicitud.attr("data-target", "#solicitudPDF");
        }
    });

    //////////////////// ESTADO PERMISO FUNCIONARIO ////////////////////
    /*
     * Oculta el mensaje de error al presionar el spam
     */
    $('#btnClose').on('click', function () {


        $mensaje = $('#error');

        $mensaje.attr('hidden', 'true');
    });

}); 