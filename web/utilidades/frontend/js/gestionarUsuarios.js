$(document).ready(function(){
   
    
    $("#agregar").click(function(){
         $('#modalInsertar').modal('show');
       //$("#modalRegistrar").modal('show');
    });
    
   
    
    
    $("#btnGuardar").click(function(){
        
        var p1=$("#pass1").val();
        var p2=$("#pass2").val();
        
        if (p1===p2) {
            
            var user = $("#txtUsuario").val();
            var key= "verificarUsuario";
            // enviamos la variable desicion como 1 para indicar que estamos agregando
            // al momento de validar el nombre de usuario
            var desicion=1;
                window.alert(desicion);
                $.ajax({  
                    type:'POST',
                    url:'procesarUsuarios',
                    data:{key,user,desicion},
                    
                    success: function(response)
                    {
                       if (response>0) 
                       {
                            swal({
                            title:"Error!",
                            text: "El usuario no esta disponible, porfavor ingrese uno nuevo",
                            timer: 1800,
                            type: 'error',
                            closeOnConfirm: true,
                            closeOnCancel: true
                            });
                            $("#txtUsuario").val("");
                            $("#txtUsuario").focus();
                       }else
                       {
                        var key='agregar';
                        var nombre =$("#txtNombre").val();
                        var user =$("#txtUsuario").val();
                        var pass =$("#pass2").val();
                        var nivel =$("#txtNivel").val();
                        

                        $.ajax({
                           type:'post',
                           url: "procesarUsuarios",
                           data : {key,nombre,user,pass,nivel},
                           success: function(response)
                           {
                               if (response>0) {
                                 swal({
                                                    title:"Exito!",
                                                    text: "EL usuario ha sido agregado.",
                                                    timer: 1900,
                                                    type: 'success',
                                                    closeOnConfirm: true
                                            });
                                            
                                            location.reload();
                               }
                               else{
                                    
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
                    
                })
            
        }else
        {
            swal({
            title:"Error!",
            text: "Contraseñas deben ser iguales.",
            timer: 1800,
            type: 'error',
            closeOnConfirm: true,
            closeOnCancel: true
            });
            $("#pass1").val("");
            $("#pass2").val("");
            $("#pass1").focus();
        }
        
    });
    
    /*-------------------- ELIMINAR VENDEDORES ----------------------------*/
     $(document).on("click",".eliminar",  function(){   
        
        var idUsuario = $(this).attr('id');
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
                                data: {idUsuario, key},
                                url: "procesarUsuarios",
                                success: function (data)
                                {
                                    if (data>0) 
                                    {
                                        swal({
                                            title:"Exito!",
                                            text: "Usuario eliminado correctamente.",
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
                                            text: "No se pudo eliminar  el usuario.",
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
        $("#cambiarP").prop('checked', false);
        $("#cambiarP").show();
        
        var idUsuario = $(this).attr('id');
        var key='obtenerDataUsuario';
        $.ajax({
                                type: 'POST',
                                data: {idUsuario, key},
                                url: "procesarUsuarios",
                                success: function (data)
                                {   
                                    if (data!==null) 
                                    {  
                                      var datos= JSON.parse(data);
                                      
                                      $("#txtNombreM").val(datos[0].nombre);
                                      $("#txtUsuarioM").val(datos[0].nombreUsuario);
                                      $("#pass1M").val(datos[0].clave);
                                      $("#pass2M").val(datos[0].clave);
                                     
                                      $("#pass1M").hide();
                                      $("#pass2M").hide();
                                      $("#pruebaid").val(datos[0].codigoUsuario);
                                      if (datos[0].codigoRol>0) {
                                            $("txtNivelM").val("Administrador");
                                           
                                         }else
                                         {
                                            $("txtNivelM").val("Vendedor"); 
                                         }
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
    
    $(document).on("click","#cambiarP",function(){
        $("#cambiarP").hide();
        $("#pass1M").val("");
        $("#pass2M").val("");
        $("#pass1M").show();
        $("#pass2M").show();
    });
    
    $(document).on("click","#btnModificarM",  function(){   
        
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
                var p1=$("#pass1M").val();
                var p2=$("#pass2M").val();
                var valPass =0;
                 if ($("#cambiarP").is(':checked')) 
                 {
                     var valPass=1;
                 }else
                 {
                     var valPass =0;
                 }

                if (p1===p2) {

                    var user = $("#txtUsuarioM").val();
                    var key= "verificarUsuario";
                    var codUs=$("#pruebaid").val();
                    // enviamos la variable desicion como 2 para indicar que es modificacion
                    // al momento de validar el nombre de usuario
                    var desicion=2;
                    window.alert(desicion);
                        $.ajax({  
                            type:'POST',
                            url:'procesarUsuarios',
                            data:{key,user,desicion,codUs},
                            success: function(response)
                            {
                               if (response>0) 
                               {
                                    swal({
                                    title:"Error!",
                                    text: "El usuario no esta disponible, porfavor ingrese uno nuevo",
                                    timer: 1800,
                                    type: 'error',
                                    closeOnConfirm: true,
                                    closeOnCancel: true
                                    });
                                    $("#txtUsuarioM").val("");
                                    $("#txtUsuarioM").focus();
                                    
                               }else
                               {
                                
                                key='modificar';
                                var nombre =$("#txtNombreM").val();
                                user =$("#txtUsuarioM").val();
                                var pass =$("#pass2M").val();
                                var nivel =$("#txtNivelM").val();
                                var cod=$("#pruebaid").val();                        
                               
                                   $.ajax({
                                    type: 'POST',
                                    data: {key,nombre,user,pass,nivel,cod,valPass},
                                    url: "procesarUsuarios",
                                    success: function (data)
                                    {
                                        if (data>0) 
                                        {
                                            swal({
                                                title:"Exito!",
                                                text: "Usuario modificado correctamente.",
                                                timer: 1800,
                                                type: 'success',
                                                closeOnConfirm: true,
                                                closeOnCancel: true

                                            });
                                            //location.reload();
                                        }
                                        else
                                        {
                                            swal({
                                                title:"Error!",
                                                text: "No se pudo modificar  el usuario.",
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

                }else
                {
                    swal({
                    title:"Error!",
                    text: "Contraseñas deben ser iguales.",
                    timer: 1800,
                    type: 'error',
                    closeOnConfirm: true,
                    closeOnCancel: true
                    });
                    $("#pass1").val("");
                    $("#pass2").val("");
                    $("#pass1").focus();
                }
              }
            });
                              
    });
      
});





