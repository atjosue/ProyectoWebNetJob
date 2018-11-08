$(document).ready(function () {
    var idUsuario=$("#idUsuarioGlobal").val();
        $.ajax({
            data: {idUsuario},
            url: '../../procesarEstadisticaEmpresa',
            success: function (data) {
                var content = JSON.parse(data);
                $('#idUsuariosA').append(content[0]);
                $('#idEmpresasA').append(content[1]);
                $('#idOfertaxE').append(content[2]);
                $('#idOfertasEs').append(content[3]);
                $('#idSeguidores').append(content[4]);
                $('#idSeguidos').append(content[5]);
                $('#idPost').append(content[6]);
                

            }
        });           
});