
$(document).ready(function(){

    $('#producto').DataTable();
    
   $("#btnGuardar").click(function(){
       var datos=$("#frmProducto").serialize();
       
       $.ajax({
          type: 'POST',
          url:'procesarProducto',
          data:datos,
          
          success: function(response){
              
              if(response== 1)
              {
                 swal("Enhorabuena!", "Datos Guardados Correctamente!", "success");
              }
              else
              {
                 swal("Oh NO!", "Error al Guardar tus Datos!", "error"); 
              }
              
          }
          
       });
   });
   
   
   
      $("#btnModificar").click(function(){
       var datos=$("#frmModificar").serialize();
       
       var int=self.setInterval("refresh()",7000);
        function refresh()
        {
                location.reload(true);
        }
       
       swal({
            title: 'Quieres Modificar este Producto?',
            text: "No podras recuperar los antiguos datos!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si!'
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    type: 'POST',
                    url: 'procesarProducto',
                    data: datos,

                    success: function (response) {
                        
                        if (response == 1)
                        {
                            swal(
                                    'Eliminado!',
                                    'El Producto ha sido Modificado.',
                                    'success',
                                    
                                    {
                                        timer: 1500,
                                    }
                            )
                            refresh()
                        } 
                        else
                        {
                            swal("Oh NO!", "Error al Modificar el Producto!", "error",{timer: 1500,});
                        }
                       
                    }

                });

            }
        })
   });
   
   
   //bla bla 
   
   $("#nuevo_Producto").click(function(){
       
       $("#modalInsertar").modal("show");
       
   });
   
   
   $(".modificarCliente").click(function(){
       
       
       
       
       $("#modalModificar").modal("show");
       
   });
   
   //Eliminar
   $(document).on("click",".eliminarProducto",function(){
      
        var idProducto = $(this).attr("id");
        var key = 'eliminar';
        
        var int=self.setInterval("refresh()",6000);
        function refresh()
        {
                location.reload(true);
        }
        
        
        swal({
            title: 'Quieres Eliminar este Producto?',
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
                    url: 'procesarProducto',
                    data: {idProducto,key},

                    success: function (response) {
                        
                        if (response == 1)
                        {
                            swal(
                                    'Eliminado!',
                                    'El Producto ha sido Eliminado.',
                                    'success',
                                    
                                    {
                                        timer: 1500,
                                    }
                            )
                            refresh()
                        } 
                        else
                        {
                            swal("Oh NO!", "Error al Eliminar el Producto!", "error",{timer: 1500,});
                        }
                       
                    }

                });

            }
        })
       
   });
   
   
});




