$(document).ready(function () {

    $('#nuevo_Cliente').click(function () {
        $('#modalInsertar').modal('show');
    });


    $(".modificarCliente").on("click", function () {
        $('#modalModificar').modal('show');

    });

    $(".eliminarCliente").on("click", function () {
        var idUsuario = $(this).attr("id");
        var key = 'eliminar';
        swal({
            title: 'Quieres Eliminar este Cliente?',
            text: "No podras recuperar tus datos!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si!'
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    type: 'POST',
                    url: 'procesarCliente',
                    data: {idUsuario,key},

                    success: function (response) {
                        
                        if (response == 1)
                        {
                            swal(
                                    'Eliminado!',
                                    'El Cliente ha sido Eliminado.',
                                    'success',
                                    {
                                        timer: 1500,
                                    }
                            )

                        } else
                        {
                            swal("Oh NO!", "Error al Eliminar el Cliente!", "error",{timer: 1500,});
                        }
                       
                    }

                });

            }
        })
    });


});


