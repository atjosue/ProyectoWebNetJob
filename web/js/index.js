

$(document).ready(function(){
   
    $("#login").click(function(){
        
        var key="log";
        var user=$("#user").val();
        var pass=$("#pass").val();
         $.ajax({
            type:'post',
            url:'procesarUsuario',
            data: {key,user,pass},
            
            success:function (response){
                if(response==="1")
                {
                    window.location.href="jsp/admin/dashBoardAdmin.jsp";
                    
                }
                else if(response==="4")
                {
                   
                    
                    window.location.href="jsp/empresa/dashBoardEmpresa.jsp";
                }
                
                else if(response==="3")
                {
                   
                    
                    window.location.href="jsp/postulante/dashBoardPostulante.jsp";
                }
                else
                {
                    swal({
                                    title:"Error!",
                                    text: response,
                                    timer: 1800,
                                    type: 'error',
                                    closeOnConfirm: true,
                                    

                            });
                    
                }
            }
     
        });
        
        
        
    });
    
    //agregando Postulante
    $("#add").click(function(){
        
        var data=$("#registroUsuario").serialize();
        $.ajax({
            type:'post',
            url:'procesarUsuario',
            data: data,
            
            success:function (response){
                
                if(response===1)
                {
                    swal({
                                    title:"Exito",
                                    text: "Te has registrado Correctamente! ",
                                    timer: 1800,
                                    type: 'success',
                                    closeOnConfirm: true,
                                    

                            });
              // window.location.href="login.jsp";
                    
            }
        }
     
        });
        
        
    });
    
    
    
    
});


