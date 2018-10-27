$(document).ready(function(){
 
    $("#respuesta").hide();
    $("#btnStart").click(function(){
        
        $("#key").val("log");
       var data=$("#frmLogin").serialize();
       
        $.ajax({
            type:'post',
            url:'procesarUsuario',
            data:data,
            
            success:function (response){
            if(response>=1)
            {
                window.location.href = "dashboard.jsp";
           
            }
            else if(response==0)
            {
                    $("#respuesta").show();
                    $("#respuesta").html('<p>Usuario y/o Contraseña incorrectos</p>');
            }
                
            }
            
             
            
            
        });
        
        
        
        
        
    });
    
    
    
    
    
    
    
    
    
});


