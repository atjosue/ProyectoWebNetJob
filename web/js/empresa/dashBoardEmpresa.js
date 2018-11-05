$(document).ready(function(){
     $(".dropdown-trigger").dropdown();
    
     cargarSelectGrado(); 
     cargarAreas();
     
     $('#txtEstadoDesactivo').val(1);
     
           
     /*----------    PARA DATATABLE OFERTAS -------------------------------------*/
       
             var key='getOfertas';
            var id=$("#idUsuario").val();
          var tableOfertas= $('#tableOfertas').DataTable( {
                           
                                    ajax:{
                                        method: "post",
                                        "data": {key,id},
                                        "url": "../../procesarOfertas",
                                        "dataSrc": "oferta",
                                        
                                    },
                                    "columns": [
                                            {"data": "titulo"},
                                            {"data": "descripcion"},
                                            {"data": "vacantes"},
                                            {"data": "idOferta"},
                                            {"defaultContent":"<div class='waves-effect waves-green btn btn-danger submit button modificarOferta' id='descripcion' name='btnAgregarPuesto'>Modificar</div> <div id='descripcion' class='waves-effect waves-red btn btn-danger cans' >Eliminar</div>"},
                                    ],
                                    "columnDefs": [
                                    {
                                        "targets": [ 3 ],
                                        "visible": false,
                                        "searchable": true
                                    }]
                        });
             
             
      
               
         
       /*---------- FIN  PARA DATATABLE OFERTAS -------------------------------------*/
       
       
     
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
                $("#contenedorTabla").hide();
            }else if (t==="CANCELAR") {
                $("#nuevaOfertaTxt").text("AGREGAR");
                $("#contenedorTabla").show();
            }
            
        });
        $(document).on("click","#btnGuardadNuevaOferta",function(){
            var t=  $("#nuevaOfertaTxt").text();
            if (t==="AGREGAR") {
                $("#nuevaOfertaTxt").text("CANCELAR");
            }else if (t==="CANCELAR") {
                $("#nuevaOfertaTxt").text("AGREGAR");
            }
            $("#contenedorTabla").show();
        });
        
    /* FIN BOTONES AGREGAR OFERTA*/
    
    
    /* MODIFICAR OFERTA*/
        $(document).on("click",".modificarOferta", function(){
           alert("a");
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
        
        /*---------------------PARA CARGAR SELECT AREAS*/
            
            function cargarAreas()
            {
                var key="mostrarAreas";
                    $.ajax({
                       type:'post',
                       data:{key},
                       url: '../../procesarArea',
                       success: function(data){
                           var json=JSON.parse(data);
                            
                                 $("#selectArea").append('<option value="'+0+'">Seleccionar</option>');
                                for (var a in json) {
                                  $("#selectArea").append('<option value='+json[a].idArea+'>'+json[a].nombre+'</option>');
                                }  
                                $('select').formSelect();
                       }

                    });   
                    
            }
        
        
        /*---------------------FIN  PARA CARGAR  SELECT AREAS*/
        
        /*---------------------PARA CARGAR SELECT PUESTOS*/
            
            
            function cargarPuestos(cod)
            {
                var codEmpresaSelect=cod;
                var key="mostrarPuestos";
                    $.ajax({
                       type:'post',
                       data:{key,codEmpresaSelect},
                       url: '../../procesarPuestos',
                       success: function(data){
                           var jsonP=JSON.parse(data);
                                 $("#selectPuesto").html('<option value="'+0+'">Seleccionar Puesto</option>');
                                for (var a in jsonP) {
                                  $("#selectPuesto").append('<option value='+jsonP[a].idPuesto+'>'+jsonP[a].nombrePuesto+'</option>');
                                }  
                                $('select').formSelect();
                       }

                    });   
            }
        
        
        /*---------------------FIN  PARA CARGAR  SELECT PUESTOS*/
        
        /*JUEGO DE SELECT area y puesto*/
        $(document).on("change","#selectArea",function(){
           var id= $(this).val();
           if (id>0) {
               
               cargarPuestos(id);
           }
        });
        /* FIN JUEGO DE SELECT area y puesto*/
        
        /*---------------------PARA CARGAR SELECT Grado de estudio*/
            
            
            function cargarSelectGrado()
            {
                var key="obtenerGrados";
                    $.ajax({
                       type:'post',
                       data:{key},
                       url: '../../procesarOfertas',
                       success: function(data){
                           var json=JSON.parse(data);
                            
                                 $("#selectGrado").append('<option value="'+0+'">Seleccionar</option>');
                                for (var a in json) {
                                  $("#selectGrado").append('<option value='+json[a].idGradoEstudio+'>'+json[a].grado+'</option>');
                                }  
                                $('select').formSelect();
                       }

                    });   
            }
        
        
        /*---------------------FIN  PARA CARGAR  SELECT Grado de estudio*/
       $(document).on('change','#txtEstadoOf',function(e)
       {
        if ($(this).is(':checked')) {
            
            $('#txtEstadoDesactivo').attr('value',1);   
        }else
        {
            
            $('#txtEstadoDesactivo').attr('value',0);
        }
           
       });
       
       
    /*---------------------------------------------- PARA AGREGAR OFERTAS--------------------*/
    
        $(document).one("click","#btnGuardadNuevaOferta", function(){
           /* var formdata = $("#frmRequisitos").serializeArray();
                                        var info = {};
                                        _.each(formdata, function(element){
                                        // Return all of the values of the object's properties.
                                          var value = _.values(element);
                                        // name : value 
                                          info[value[0]] = value[1];
                                        });

                                       var json=JSON.stringify(info);
                                       console.log(json.length);*/
                                       
           var titulo =$("#txtTituloOferta").val();
           var descripcion =$("#txtDescripcionOferta").val();
           var vacantes=$("#txtVacantesOferta").val();
           var salarioMinimo=$("#txtSalarioMinimo").val();
           var salarioMaximo=$("#txtSalarioMaximo").val();
           var idEmpresa=$("#idUsuario").val();
           var aniosExperiencia=$("#txtAnosExperiencia").val();
           var edadMinima=$("#txtEdadMinima").val();
           var edadMaxima=$("#txtEdadMaxima").val();
           var idArea=$("#selectArea").val();
           var idPuesto=$("#selectPuesto").val();
           var fechaPublicacion= new Date();
           var idGradoEstudio=$("#selectGrado").val();
           var sexo=$("#txtGeneroPreferencia").val();
           var estadoP=$("#txtEstadoDesactivo").val();
           var key='agregarOferta';
           $.ajax({
                            type:'post',
                            data:{key,titulo,descripcion,vacantes,salarioMinimo,
                                 salarioMaximo,idEmpresa,aniosExperiencia,edadMinima,
                                 edadMaxima,idArea,idPuesto,fechaPublicacion,
                                 idGradoEstudio,sexo,estadoP},
                            url: '../../procesarOfertas',
                            success: function(data){
                                if (data[1]>0) {
                                    
                                            swal({
                                                title:"EXITO!",
                                                text: "Oferta agregada con exito",
                                                timer: 1800,
                                                type: 'success',
                                                closeOnConfirm: true,
                                                closeOnCancel: true

                                                });
                                                
                                                 tableOfertas.ajax.reload();
                                            
                                }else
                                {
                                    swal({
                                            title:"Error!",
                                            text: "No se pudo guardar la oferta.",
                                            timer: 1800,
                                            type: 'error',
                                            closeOnConfirm: true,
                                            closeOnCancel: true
                                    });
                                }
                                
                            }

                  });
           
           
        });
          
    /*--------------------------------------------- FIN AGREGAR OFERTAS--------------------*/
      
});


