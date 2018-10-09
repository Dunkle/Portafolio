$(document).ready(function () {
    //Iniciar modal siempre y cuando el usuario y la contraseña no esten vacios. 
    $('#btnLogin').on('click', function () {

        var user = $('#txtUsuario').val();
        var pass = $('#txtContraseña').val();

        if (user != "" && pass != "") {

            var $modal = $(this);

            $modal.attr("data-target", "#modalCarga");
        }
    });

    $('#btnClose').on('click', function () {


        $mensaje = $('#errorSession');

        $mensaje.attr('hidden','true');
    });
});  