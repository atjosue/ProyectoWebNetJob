$(document).ready(function(){
    
   $('select').formSelect();
   
   $(document).on("click","#btnRegistrar", function(){
       var us=$("#txtUsuario").val();
       var pass=$("#txtPass").val();
       var repass=$("#txtRePass").val();
       var nombre=$("#txtNombre").val();
       var tel=$("#txtTelefono").val();
       var pais=$("#selectPais").val();
       var correo=$("#txtCorreo").val();
       var key ='agregarEmpresa';
           if (pass!==repass) {
                         swal({
                            title:"Error!",
                            text: "Las Contraseñas deben ser iguales.",
                            timer: 1800,
                            type: 'warning',
                            closeOnConfirm: true,
                            closeOnCancel: true
                        })
                    }else{
                        $.ajax({
                           type:'post',
                           data:{us,repass,key,nombre,tel,pais,correo},
                           url: '../../procesarUsuario',
                           success: function(data){
                           if (data<1){
                                swal({
                                title:"Error!",
                                text: "El nombre de usuario ya ha sido ocupado:C",
                                timer: 1800,
                                type: 'error',
                                closeOnConfirm: true,
                                closeOnCancel: true
                                });
                                }else{
                                        $.ajax({
                                            type:'post',
                                            data:{key,nombre,tel,pais,correo,data},
                                            url: '../../procesarEmpresa',
                                            success: function(data){
                                                if (data<1){
                                                 swal({
                                                     title:"Error!",
                                                     text: "Ocurrio un problema al agregar la empresa!",
                                                     timer: 1800,
                                                     type: 'error',
                                                     closeOnConfirm: true,
                                                      closeOnCancel: true
                                                      });
                                                }else{
                                                      swal({
                                                       title:"EXITO!",
                                                       text: "Empresa agregada con exito",
                                                       timer: 1800,
                                                       type: 'success',
                                                       closeOnConfirm: true,
                                                       closeOnCancel: true
                                                       }).then((result) => {
                                                               swal({
                                                               title: 'En unos momentos nos comunicaremos con tigo!!',
                                                               animation: false,
                                                               customClass: 'animated tada'
                                                               }).then((resulta) => {
                                                                            window.location.href="../../index.jsp";
                                                                        });
                                                       }); 
                                                   } 
                                                }
                                             });
                    
                                        } 
                                     }
                                });
                            }
});
});
