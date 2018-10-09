$(document).ready(function () {

    ///////////////////////// LOGIN /////////////////////////////////7
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
});  