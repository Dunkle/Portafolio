$(document).ready(function () {
    $('#btnLogin').on('click', function () {

        var user = $('#txtUsuario').val();
        var pass = $('#txtContraseña').val();

        if (user != "" && pass != "") {
            $('#modalCarga').show();

            var $modal = $(this);

            $modal.attr("data-target", "#modalCarga");
        }
    });
});  