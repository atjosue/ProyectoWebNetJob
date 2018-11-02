$(document).ready(function(){
     $(".dropdown-trigger").dropdown();
     $('select').formSelect();
     
	$("#modalModificarOferta").hide();
        $("#modalAgregarArea").hide();
        $("#modalModificarArea").hide();
        $("#modalAgregarPuesto").hide();
        $("#modalModificarPuesto").hide();
        $("#modalModificarOferta").hide();
        
        
        /*PARA CANCELAR Y CERRAR MODALES*/
        $(".cans").on("click", function(){
       
		$("#modalModificarOferta").hide();
                $("#modalAgregarArea").hide();
                $("#modalModificarArea").hide();
                $("#modalAgregarPuesto").hide();
                $("#modalModificarPuesto").hide();
                $("#modalModificarOferta").hide();
        });
        
        /*BOTONES PARA ABRIR MODALES DE NUEVOS...*/
	$("#nuevaArea").on("click", function(){
       
		$("#modalAgregarArea").show();
	});
        $("#nuevoPuesto").on("click", function(){
       
		$("#modalAgregarPuesto").show();
	});
        /*FIN BOTONES PARA ABRIR MODALES DE NUEVOS*/
        
    /*BOTONES AGREGAR OFERTA*/
        
        $(document).on("click","#btnNuevaOferta",function(){
            var t=  $("#nuevaOfertaTxt").text();
            if (t==="AGREGAR") {
                $("#nuevaOfertaTxt").text("CANCELAR");
            }else if (t==="CANCELAR") {
                $("#nuevaOfertaTxt").text("AGREGAR");
            }
            
        });
        
    /* FIN BOTONES AGREGAR OFERTA*/
    
    /*  AGREGAR OFERTA*/
    
    /*  FIN AGREGAR OFERTA*/
    
    
    /* MODIFICAR OFERTA*/
        $(document).on("click",".modificarOferta", function(){
           alert("mierda");
           $("#modalModificarOferta").show();
        });
   /* FIN MODIFICAR OFERTA*/
   
   /*AGREGAR AREAS*/
            $("#btnAgregarArea").on("click", function (){
                
                    var data=$("#nombreAreaA").val();
                    var key="agregar";
                    
                    $.ajax({
                            type:'post',
                            data:{data,key},
                            url: '../../procesarArea',
                            success: function(response){
                                if (response>0) {

                                            swal({
                                                    title:"EXITO!",
                                                    text: "Area agregada con exito",
                                                    timer: 1800,
                                                    type: 'success',
                                                    closeOnConfirm: true,
                                                    closeOnCancel: true

                                            });
                                            $("#modalAgregarArea").hide();
                                            location.reload();
                                }else
                                {
                                    swal({
                                            title:"Error!",
                                            text: "No se pudo agregar el area.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true
                                    });
                                }
                            }

                        });
            });
        
        /*FIN DE AGREGAR AREAS*/
        
        /*OBTENER LAS AREAS*/
        $(document).on("click",".modificarArea",function (){
           var id = $(this).attr("id");
           var key="getInfoArea";
           $.ajax({
                            type:'post',
                            data:{id,key},
                            url: '../../procesarArea',
                            success: function(data){
                                if (data!==null) {
                                    var datos= JSON.parse(data);
                                       $("#nombreAreaM").val(datos[0].nombre);
                                      $("#codModificarArea").val(datos[0].idArea);
                                      $('#modalModificarArea').show();
                                }else
                                {
                                    swal({
                                            title:"Error!",
                                            text: "No se pudo cargar el area.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true
                                    });
                                }
                            }

                  });
        });
        /*FIN DE OBTENER AREA*/
        
        /*MODIFICARLAS AREAS*/
        
        $(document).on("click","#btnModificarArea",  function(){   
        
        var nombre=$("#nombreAreaM").val();
        var codigo=$("#codModificarArea").val();
        var key='modificar';
 
        swal({
              title: "Advertencia!",
              text: "¿Estas seguro de modificar este registro?",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'SI',
              
            }).then((result) => {
              if (result.value) {
                $.ajax({
                                type: 'POST',
                                data: {key,nombre,codigo},
                                url: "../../procesarArea",
                                success: function (data)
                                {
                                    if (data>0) 
                                    {
                                        swal({
                                            title:"Exito!",
                                            text: "Vendedor modificado correctamente.",
                                            timer: 1800,
                                            type: 'success',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                        });
                                        location.reload();
                                    }
                                    else
                                    {
                                        swal({
                                            title:"Error!",
                                            text: "No se pudo modificar  el vendedor.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                        });
                                    }
                                }
                            });
              }
            })
                              
    });
    /*-------------------- ELIMINAR AREAS ----------------------------*/
     $(document).on("click",".eliminarArea",  function(){   
        
         var id = $(this).attr('id');
        var key='eliminar';
        
    
            swal({
              title: "Advertencia!",
              text: "¿Estas seguro de eliminar este registro? Si aceptas removerlo, no habra forma de recuperar los datos posteriormente?",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'SI',
              
            }).then((result) => {
              if (result.value) {
                $.ajax({
                                type: 'POST',
                                data: {id, key},
                                url: "../../procesarArea",
                                success: function (data)
                                {
                                    if (data>0) 
                                    {
                                        swal({
                                            title:"Exito!",
                                            text: "Vendedor eliminado correctamente.",
                                            timer: 1800,
                                            type: 'success',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                        });
                                        location.reload();
                                    }
                                    else
                                    {
                                        swal({
                                            title:"Error!",
                                            text: "No se pudo eliminar  el vendedor.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true

                                        });
                                    }
                                }
                            });
              }
            })
                              
    });
    /*FIN DE ELIMINAR AREAS*/
    
     /*------------------------------------AGREGAR Puestp--------------------------------------*/
            $("#btnAgregarPuesto").on("click", function (){
                
                    var nombre = $("#nombrePuestoA").val();
                    var idArea = $("#selectArea").val();
                    var descripcion = $("#descripcionPuestoA").val();
                    var key="agregar";
                    
                    $.ajax({
                            type:'post',
                            data:{nombre,idArea,descripcion,key},
                            url: '../../procesarPuestos',
                            success: function(response){
                                if (response>0) {

                                            swal({
                                                    title:"EXITO!",
                                                    text: "Puesto agregado con exito",
                                                    timer: 1800,
                                                    type: 'success',
                                                    closeOnConfirm: true,
                                                    closeOnCancel: true

                                            });
                                            $("#modalAgregarArea").hide();
                                            location.reload();
                                }else
                                {
                                    swal({
                                            title:"Error!",
                                            text: "No se pudo agregar el puesto.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true
                                    });
                                }
                            }

                        });
            });
        
        /*FIN DE AGREGAR PUESTOS*/
        
        /*OBTENER Puesto ------------ INTENTO CARGAR SELECT------------------------
        $(document).on("click",".modificarPuesto",function (){
           var id = $(this).attr("id");
           var key="getInfoPuesto";
           var areaID="";
           $.ajax({
                   type:'post',
                   data:{id,key},
                   url: '../../procesarPuestos',
                   success: function(data){
                          if (data!==null) {
                            var datos= JSON.parse(data);
                            $("#nombrePuestoM").val(datos[0].nombrePuesto);
                            $("#descripcionPuestoM").val(datos[0].descripcion);
                            $("#codModificarPuesto").val(datos[0].idPuesto);
                            areaID = (datos[0].idArea);
                            key ="buscarArea"
                                  $.ajax({
                                         type:'post',
                                         data:{areaID,key},
                                         url: '../../procesarPuestos',
                                         success: function(datas){
                                                if (datas!==null) {
                                                    $("#selectAreaM").val(datas);
                                                }else
                                                    {
                                                        swal({
                                                                title:"Error!",
                                                                text: "No se pudo cargar el area.",
                                                                timer: 1800,
                                                                type: 'error',
                                                                closeOnConfirm: true,
                                                                closeOnCancel: true
                                                        });
                                                    }
                                                }
                                       });     
                                      
                                }else
                                {
                                    swal({
                                            title:"Error!",
                                            text: "No se pudo cargar el Puesto.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true
                                    });
                                }
                            }

                  });
                  $('#modalModificarPuesto').show();
        });
        FIN DE OBTENER Puestos INTENTO*/
    
        /*OBTENER Puesto*/
        
        $(document).on("click",".modificarPuestoM",function (){
           var id = $(this).attr("id");
           var key="getInfoPuesto";
           $.ajax({
                            type:'post',
                            data:{id,key},
                            url: '../../procesarPuestos',
                            success: function(data){
                                if (data!==null) {
                                    var datos= JSON.parse(data);
                                       $("#nombrePuestoM").val(datos[0].nombrePuesto);
                                       $("#descripcionPuestoM").val(datos[0].descripcion);
                                      $('#modalModificarPuesto').show();
                                }else
                                {
                                    swal({
                                            title:"Error!",
                                            text: "No se pudo cargar el area.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true
                                    });
                                }
                            }

                  });
        });
        
        /*FIN DE OBTENER Puestos*/
});


