$(document).ready(function () {
    $('#cliente').DataTable();

    $("#btnGuardar").click(function () {

        var datos = $("#frmCliente").serialize();

        $.ajax({
            type: 'POST',
            url: 'procesarCliente',
            data: datos,

            success: function (response) {

                if (response == 1)
                {
                    swal("Enhorabuena!", "Datos Guardados Correctamente!", "success", {timer: 5500, });


                } else
                {
                    swal("Oh NO!", "Error al Guardar tus Datos!", "error");
                }
                
            }

        });

    });
   
   
   
      $("#btnModificar").click(function(){
       var datos=$("#frmModificar").serialize();
       
       $.ajax({
          type: 'POST',
          url:'procesarCliente',
          data:datos,
          
          success: function(response){
              
              if(response== 1)
              {
                 swal("Enhorabuena!", "Datos Modificados Correctamente!", "success",{timer: 1500,});
                
                
              }
              else
              {
                 swal("Oh NO!", "Error al Modificar tus Datos!", "error"); 
              }

          }
          
       });
   });
   $('#frmCliente')
            .form({
                fields: {
                    txtNombre: {
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Nombre es una campo obligatorio!'
                            }
                        ]
                    },
                    txtApellido: {
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Apellido es una campo obligatorio!'
                            }
                        ]
                    },
                    txtDireccion: {
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Direccion es una campo obligatorio!'
                            }
                        ]
                    }
                }
            }); 
    
});


