$(document).ready(function(){
    
    $('#tableV').DataTable();
   
    //$("#modalRegistrar").hide();
    
    $("#abrirAgregar").click(function(){
         $('#modalRegistrar').modal('show');
       //$("#modalRegistrar").modal('show');
    });
    
   
    
    
    $("#btnAgregar").click(function(){
        
        var c= $("#txtDui").val();
        var key='verificarDui';
        
        $.ajax({
           type:'post',
           url: "procesarVendedor",
           data : {c,key},
           success: function(response)
           {
               if (response>0) {
                 swal({
                                    title:"Error!",
                                    text: "EL DUI ya ha sido ocupado antes.",
                                    timer: 1800,
                                    type: 'error',
                                    closeOnConfirm: true,
                                    

                            });
               }
               else{
                   
                    $("#key").val("agregar");    
                    var data= $('#formularioIngresarVendedores').serialize();
                    
                        $.ajax({
                            type:'post',
                            data:data,
                            url: "procesarVendedor",

                            success: function(response){
                                if (response>0) {

                                            swal({
                                                    title:"EXITO!",
                                                    text: "Vendedor agregado con exito",
                                                    timer: 1800,
                                                    type: 'success',
                                                    closeOnConfirm: true,
                                                    closeOnCancel: true

                                            });
                                            $("#modalRegistrar").hide();
                                            location.reload();
                                            

                                }else
                                {
                                    swal({
                                            title:"Error!",
                                            text: "No se pudo agregar  usuario.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                    });
                                }
                            }

                        });        
               }
           }
        });
    });
    
    /*-------------------- ELIMINAR VENDEDORES ----------------------------*/
     $(document).on("click",".eliminar",  function(){   
        
         var idVendedor = $(this).attr('id');
        var key='eliminar';
        
    
            swal({
              title: "Advertencia!",
              text: "¿Estas seguro de eliminar este registro? Si aceptas removerlo, no habra forma de recuperar los datos posteriormente?",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'SI',
              
            }).then((result) => {
              if (result.value) {
                $.ajax({
                                type: 'POST',
                                data: {idVendedor, key},
                                url: "procesarVendedor",
                                success: function (data)
                                {
                                    if (data>0) 
                                    {
                                        swal({
                                            title:"Exito!",
                                            text: "Vendedor eliminado correctamente.",
                                            timer: 1800,
                                            type: 'success',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                        });
                                        location.reload();
                                    }
                                    else
                                    {
                                        swal({
                                            title:"Error!",
                                            text: "No se pudo eliminar  el vendedor.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                        });
                                    }
                                }
                            });
              }
            })
                              
    });
    
    /*-------------------------  MODIFICAAR USUARIOS---------------------------------------------*/
    
    $(document).on("click",".modificar",function(){
        
        var idVendedorM = $(this).attr('id');
        var key='obtenerDataVendedor';
        $.ajax({
                                type: 'POST',
                                data: {idVendedorM, key},
                                url: "procesarVendedor",
                                success: function (data)
                                {   
                                    if (data!=null) 
                                    {  
                                      
                                      var datos= JSON.parse(data);
                                       $("#txtApellidoMod").val(datos[0].apellidos);
                                      $("#txtDuiM").val(datos[0].dui);
                                      $("#txtNombreM").val(datos[0].nombre);
                                     
                                      $("#txtDireccionM").val(datos[0].direccion);
                                      $("#txtTelOficinaM").val(datos[0].telefonoOficina);
                                      $("#txtTelefonoMovilM").val(datos[0].telefonoMovil);
                                      $("#pruebaid").val(datos[0].codigoVendedor);
                                      $('#modalModificar').modal('show');
                                      
                                    }
                                    else
                                    {
                                        swal({
                                            title:"Error!",
                                            text: "No se pudo obtener informacion del vendedor.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                        });
                                    }
                                }
                            });
        
    });
    
    $(document).on("click","#btnModificarM",  function(){   
        
        var dui=$("#txtDuiM").val();
        var nombres=$("#txtNombreM").val();
        var apellidos =$("#txtApellidoMod").val();
        var direccion = $("#txtDireccionM").val();
        var oficina =$("#txtTelOficinaM").val();
        var movil= $("#txtTelefonoMovilM").val();
        var codigo=$("#pruebaid").val();
        var a=codigo;
        
        var key='modificar';
 
        swal({
              title: "Advertencia!",
              text: "¿Estas seguro de modificar este registro?",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'SI',
              
            }).then((result) => {
              if (result.value) {
                $.ajax({
                                type: 'POST',
                                data: {key,dui,nombres,apellidos,direccion,oficina,movil,a},
                                url: "procesarVendedor",
                                success: function (data)
                                {
                                    if (data>0) 
                                    {
                                        swal({
                                            title:"Exito!",
                                            text: "Vendedor modificado correctamente.",
                                            timer: 1800,
                                            type: 'success',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                        });
                                        location.reload();
                                    }
                                    else
                                    {
                                        swal({
                                            title:"Error!",
                                            text: "No se pudo modificar  el vendedor.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                        });
                                    }
                                }
                            });
              }
            })
                              
    });
      
});


