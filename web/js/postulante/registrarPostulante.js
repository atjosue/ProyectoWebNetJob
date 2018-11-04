
$(document).ready(function(){
    
  $(".datepicker").datepicker({
    
    format: 'dd/mm/yyyy'
    
});

$('select').formSelect();

$("#pais").change(function(){
    
    alert("hola mundo");
    
       var idPais=$("#pais").value();
        var key="depPais";
        $.ajax({
            
            type: 'POST',
            url:"procesarPostulante",
            data:{idPais, key},
            success:function(response){
                
                var content=JSON.parse(response);
                
                $.each(response,function(key, value) {
            $('#departamento').append('<option value="'+key+'">'+value+'</option>');
                }); 
                
            }
            
            
            
        });
        
        
       
});
    




});



