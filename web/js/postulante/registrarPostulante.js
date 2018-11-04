
$(document).ready(function(){
    
  $(".datepicker").datepicker({
    
    format: 'dd/mm/yyyy'
    
});

$('select').formSelect();

    
});


$("#pais").change(function(){
    
        var idPais=$("#pais").value();
        var key="depPais";
        $.ajax({
            
            type: 'POST',
            url:"procesarPostulante",
            data:{idPais, key},
            success:function(response){
                
                var content=JSON.parse(response);
                
                
                
            }
            
            
            
        });
});
