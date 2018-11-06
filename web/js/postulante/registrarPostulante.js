
$(document).ready(function(){
    
  $(".datepicker").datepicker({
    
    format: 'yyyy/mm/dd'
    
});

$('select').formSelect();

$("#pais").change(function(){
    
  
        
        //limpiando los select 
        
    
       var idPais=$("#pais").val();
        var key="depPais";
        $.ajax({
            
            type: 'POST',
            url:'../../procesarPostulante',
            data:{idPais, key},
            success:function(response){
                
                var content=JSON.parse(response);
                
                console.log(content);
                $("#departamento").empty();
               $("#departamento").append('<option value="'+0+'">Seleccionar</option>');
                                for (var a in content) {
                                  $("#departamento").append('<option value='+content[a].idDepartamento+'>'+content[a].departamento+'</option>');
                                }  
                                $('select').formSelect();
            }
            
            
            
        });
        
        
       
});

//  LLENANDO EL COMBO DE MUNICPIO


$("#departamento").change(function(){
    
  
        
        //limpiando los select 
        
    
       var idPais=$("#departamento").val();
        var key="munDep";
        $.ajax({
            
            type: 'POST',
            url:'../../procesarPostulante',
            data:{idPais, key},
            success:function(response){
                
                var content=JSON.parse(response);
                
                console.log(content);
                $("#municipio").empty();
               $("#municipio").append('<option value="'+0+'">Seleccionar</option>');
                                for (var a in content) {
                                  $("#municipio").append('<option value='+content[a].idProvincia+'>'+content[a].provincia+'</option>');
                                }  
                                $('select').formSelect();
            }
            
            
            
        });
        
        
       
});


//REGISTRO DE INFORMACION DE PERFIL DE POSTULANTES

/*$("#registrarPostulante").click(function(){
    
  var datos=$("#frmPostulante").serialize();
  
  
    
   $.ajax({
            
            type: 'POST',
            url:'../../procesarPostulante',
            data:datos,
            success:function(response){
                
                
                
               }
            
            
            
        });
    
});*/
    




});



