

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
    
    
    
    
});


