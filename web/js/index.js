

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
            if(response>=1)
            {
               
           
            }
            else if(response==0)
            {
                    
            }
                
            }
            
             
            
            
        });
        
        
        
    });
    
    
    
    
});


