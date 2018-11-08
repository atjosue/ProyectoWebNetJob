$(document).ready(function (){
   
   $(".dropdown-trigger").dropdown();
   
   
   $(".verPerfil").click(function() {
       
       var key="verPerfil";
       var idPostulante=$(this).attr("id");
       
        $.ajax({
            type:'post',
            url:'../../procesarPostulante',
            data: {key,idPostulante},
            
            success:function (response){
                
                window.location.href="perfilPersona.jsp";
                
            }
    });
    
    
    });
    
     $(".seguir").click(function() {
       
       var key="seguir";
       var idSeguido=$(this).attr("id");
       var idSeguidor=$("#idPostulante").val();
       console.log(idSeguidor);
       
        $.ajax({
            type:'post',
            url:'../../procesarPostulante',
            data: {key,idSeguido,idSeguidor},
            
            success:function (response){
                
                //window.location.href="perfilPersona.jsp";
                
            }
    });
    
    
    });

   
   
   
   
    
});
