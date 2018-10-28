$(document).ready(function(){
     $(".dropdown-trigger").dropdown();
     
	$("#modalModificar").hide();

	$("#prueba").on("click", function(){
       
		$("#modalModificar").show();
	});
        
        $(".cans").on("click", function(){
       
		$("#modalModificar").hide();
	});
});


