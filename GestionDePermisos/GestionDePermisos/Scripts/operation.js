$(document).ready(function () {
    //Iniciar modal siempre y cuando el usuario y la contraseña no esten vacios. 
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