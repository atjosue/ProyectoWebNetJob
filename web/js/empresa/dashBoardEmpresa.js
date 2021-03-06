$(document).ready(function(){
    var idUsuario=$("#idUsuarioGlobal").val();
   
    
    var primeravex= function() {
        var key="primera";
        $.ajax({
            type:'post',
            data:{idUsuario,key},
            url: '../../procesarEmpresa',
            success: function(data){
                if (data=="null") {
                    window.location.href="gestionPerfil.jsp"; 
                }
            }
        });
    };
    primeravex();
    
     $(".dropdown-trigger").dropdown();
    
     cargarSelectGrado(); 
     cargarAreas();
     
     var idioma={
    "sProcessing":     "Procesando...",
    "sLengthMenu":     "Mostrar _MENU_ registros",
    "sZeroRecords":    "No se encontraron resultados",
    "sEmptyTable":     "Ningún dato disponible en esta tabla",
    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
    "sInfoPostFix":    "",
    "sSearch":         "Buscar:",
    "sUrl":            "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Cargando...",
    "oPaginate": {
        "sFirst":    "Primero",
        "sLast":     "Último",
        "sNext":     "Siguiente",
        "sPrevious": "Anterior"
    },
    "oAria": {
        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
};
     controlBotonesRequisitos(1);
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
        $("#modalAgregarPuesto").hide();
        $("#modalModificarOferta").hide();
        $("#modalGestionRequisitosOferta").hide();
        
        /*PARA CANCELAR Y CERRAR MODALES*/
        $(".cans").on("click", function(){
       
		$("#modalModificarOferta").hide();
                $("#modalModificarPuesto").hide();
                $("#modalModificarOferta").hide();
                $("#modalGestionRequisitosOferta").hide();
        });
        $(".cansInterno").on("click", function(){
                $("#modalGestionRequisitosOferta").hide();
                $("#modalAgregarArea").hide();
                $("#modalAgregarPuesto").hide();
        });
        
        /*BOTONES PARA ABRIR MODALES DE NUEVOS...*/
	$(".nuevaArea").on("click", function(){
       
		$("#modalAgregarArea").show();
	});
        $(".nuevoPuesto").on("click", function(){
       
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
            cargarTable(0);
        });
        
    /* FIN BOTONES AGREGAR OFERTA*/
    
    
    /* MODIFICAR OFERTA*/
        $(document).on("click",".modificarOferta", function(){
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
                                
                                $("#selectAreaM").append('<option value="'+0+'">Seleccionar</option>');
                                for (var a in json) {
                                  $("#selectAreaM").append('<option value='+json[a].idArea+'>'+json[a].nombre+'</option>');
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
                                
                                $("#selectPuestoM").html('<option value="'+0+'">Seleccionar Puesto</option>');
                                for (var a in jsonP) {
                                  $("#selectPuestoM").append('<option value='+jsonP[a].idPuesto+'>'+jsonP[a].nombrePuesto+'</option>');
                                }
                                
                                $('select').formSelect();
                       }

                    });   
            }
        
        
        /*---------------------FIN  PARA CARGAR  SELECT PUESTOS*/
        
        /*JUEGO DE SELECT area y puesto*/
        //agregar
        $(document).on("change","#selectArea",function(){
           var id= $(this).val();
           if (id>0) {
               
               cargarPuestos(id);
           }
        });
        //modificar
        $(document).on("change","#selectAreaM",function(){
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
                                 $("#selectGradoM").append('<option value="'+0+'">Seleccionar</option>');
                                for (var a in json) {
                                  $("#selectGradoM").append('<option value='+json[a].idGradoEstudio+'>'+json[a].grado+'</option>');
                                } 
                                $('select').formSelect();
                       }

                    });   
            }
        
        
        /*---------------------FIN  PARA CARGAR  SELECT Grado de estudio*/
       //agregarrr
       $(document).on('change','#txtEstadoOf',function(e)
       {
        if ($(this).is(':checked')) {
            
            $('#txtEstadoDesactivo').attr('value',1);   
        }else
        {
            
            $('#txtEstadoDesactivo').attr('value',0);
        }
           
       });
       //modificar
       $(document).on('change','#txtEstadoOfM',function(e)
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
    
    
    /*--------------------------------------------- MODIFICAR OFERTAS--------------------*/
     
     $(document).on("click","#btnGuardarModOferta",function(){
        alert("holaMundo");  
     });
     /*--------------------------------------------- FIN MODIFICAR OFERTAS--------------------*/
    
    $(document).on("click","#btnGestionarRequisitos",function(){
        
        cargarTableRequisitos();
        $("#modalGestionRequisitosOferta").show();
        var idOf =$("#idOferta").val(); 
            $("#idOfertaM").val(idOf);
            
    });
    
    /****************   GESTION DE REQUISITOS   *****************/
    //control de botones
    
    
    /**************** FIN GESTION DE REQUISITOS   ***************/
    
    
});
 

/*FIN DEL DOCUMENT READY*/


/*----------    PARA GESTION DE OFERTAS OFERTAS -------------------------------------*/
         function cargarTable(){
         var tableOfertas;
         
             var key='getOfertas';
            var id=$("#idUsuario").val();
           tableOfertas= $('#tableOfertas').DataTable( {
                                    "destroy":true,
                                    ajax:{
                                        method: "post",
                                        "data": {key,id},
                                        "url": "../../procesarOfertas",
                                        "dataSrc": "oferta",
                                        
                                    },
                                    "columns": [
                                            {"data": "idOferta"},
                                            {"data": "titulo"},
                                            {"data": "descripcion"},
                                            {"data": "vacantes"},
                                            {"data": "salarioMinimo"},
                                            {"data": "salarioMaximo"},
                                            {"data": "idEmpresa"},
                                            {"data": "aniosExperiencia"},
                                            {"data": "edadMinima"},
                                            {"data": "edadMaxima"},
                                            {"data": "idArea"},
                                            {"data": "idPuesto"},
                                            {"data": "idGradoEstudio"},
                                            {"data": "sexo"},
                                            {"data": "estadoP"},
                                            {"defaultContent":"<div class='waves-effect waves-green btn btn-danger submit button modificarOferta' id='descripcion' name='btnAgregarPuesto'>Modificar</div> <div id='descripcion' class='waves-effect waves-red btn btn-danger BtnEliminatOferta' >Eliminar</div>"},
                                    ],
                                    "columnDefs": [
                                    {
                                        "targets": [0,4,5,6,7,8,9,10,11,12,13,14 ],
                                        "visible": false,
                                        "searchable": true
                                    }],
                                
                        });
             
             obtenerDataEditar("#tableOfertas tbody",tableOfertas);
             obtenerDataEliminar("#tableOfertas tbody",tableOfertas);
             
         }
       
    var obtenerDataEditar = function(tbody, table)
    {
        $(tbody).on("click","div.modificarOferta",function(){
           var fila= table.row( $(this).parents("tr")).data();
            $("#idUsuarioM").val(fila.idEmpresa);
            $("#txtTituloOfertaM").val(fila.titulo);
            $("#txtVacantesOfertaM").val(fila.vacantes);
            $("#txtDescripcionOfertaM").val(fila.descripcion);
            $("#txtSalarioMinimoM").val(fila.salarioMinimo);
            $("#txtSalarioMaximoM").val(fila.salarioMaximo);
            $("#txtAnosExperienciaM").val(fila.aniosExperiencia);
            $("#txtEdadMinimaM").val(fila.edadMinima);
            $("#txtEdadMaximaM").val(fila.edadMaxima);
            $("#selectAreaM").val(fila.idArea);
            $("#selectPuestoM").val(fila.idPuesto);
            $("#idOferta").val(fila.idOferta);
            
            
        });
    };
    var obtenerDataEliminar = function(tbody, table)
    {
        $(tbody).on("click","div.BtnEliminatOferta",function(){
           var fila= table.row( $(this).parents("tr")).data();
           var idof=(fila.idOferta);
           
           const swalWithBootstrapButtons = swal.mixin({
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
              })

              swalWithBootstrapButtons({
                title: 'Eliminar Oferta',
                text: "Esta seguro de eliminar la oferta?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Si, Borrar',
                cancelButtonText: 'No, Cancelar',
                reverseButtons: true
              }).then((result) => {
                if (result.value) {
                  swalWithBootstrapButtons(
                    'Eliminado!',
                    'Se ha eliminado el registro correctamente..',
                    'success'
                  );
                } else if (
                  // Read more about handling dismissals
                  result.dismiss === swal.DismissReason.cancel
                ) {
                  swalWithBootstrapButtons(
                    'Cancelado',
                    'Se ha cancelado la eliminacion de la oferta',
                    'error'
                  );
                }
              });
            
        });
        
    };
/*----------------------------FIN DE GESTION DE OFERTAS------------------------*/

/********************************************************************************/

/*----------------------------PARA GESTION DE REQUISITOS----------------------*/

   function cargarTableRequisitos(){
            
            var tableRequisitos;
            var key='getRequisitoOferta';
            var id=$("#idOferta").val();

           tableRequisitos= $('#tableRequerimientos').DataTable( {
                                    "destroy":true,
                                    ajax:{
                                        method: "post",
                                        "data": {key,id},
                                        "url": "../../procesarRequisitos",
                                        "dataSrc": "requisitos",
                                        
                                    },
                                    "columns": [
                                            {"data": "idRequisito"},
                                            {"data": "requisito"},
                                            {"data": "descripcion"},
                                            {"data": "idOferta"},
                                            {"defaultContent":"<input type='button' value='cargar' class='waves-effect waves-green btn btn-danger cargarDataRequisito'>"},
                                    ],
                                    "columnDefs": [
                                    {
                                        "targets": [0,3],
                                        "visible": false,
                                        "searchable": true
                                    }],
                                
                        });
             
             obtenerDataRequisito("#tableRequerimientos tbody",tableRequisitos);
             //obtenerDataEliminarRequisito("#tableOfertas tbody",tableRequisitos);
             
             
         }
    
    var obtenerDataRequisito = function(tbody, table)
    {
        var filaR="";
        $(tbody).on("click","input.cargarDataRequisito",function(){
           filaR= table.row( $(this).parents("tr")).data();
            $("#idRequisito").val(filaR.idRequisito);
            $("#tituloRequisito").val(filaR.requisito);
            $("#descripcionRequisito").val(filaR.descripcion);
            
            console.log(filaR);
            controlBotonesRequisitos(0);
            
            $('.resetBotones').click(function(){
                controlBotonesRequisitos(1);
                limpiarFrmRe();
            });
            
        });
    };
    
    var limpiarFrmRe= function()
    {
        $("#tituloRequisito").text("");
        $("#descripcionRequisito").text("");
        $("#idRequisito").text("");
    };

    var controlBotonesRequisitos = function(a)
    {
        
        if (a===1)
        { 
            $("#btnModificarRequisito").attr('disabled','disabled');
            $("#btnAgregarRequisito").removeAttr('disabled');
            $("#btnEliminarRequisito").attr('disabled','disabled');
            
        }else if(a===0)
        {
            $("#btnAgregarRequisito").attr('disabled','disabled');
            $("#btnModificarRequisito").removeAttr('disabled');
            $("#btnEliminarRequisito").removeAttr('disabled');
            
        }
    }
    //----------------GUARDAR
        $(document).on("click","#btnAgregarRequisito",function(){
            
          var titulo=$("#tituloRequisito").val();
          var descripcion=$("#descripcionRequisito").val();
          var idOferta=$("#idOfertaM").val();
          var key="agregarRequisito";
          if (titulo==="" || descripcion==="") 
          {
              swal({
                title: 'COMPLETA TODOS LOS CAMPOS!!',
                animation: false,
                customClass: 'animated tada'
               }); 
          }else
          {
            $.ajax({
                type:'post',
                data:{titulo,key,descripcion,idOferta},
                url: '../../procesarRequisitos',
                success: function(response){
                if (response>0){                    
                       swal({
                              title:"EXITO!",
                              text: "Requisito agregado con exito",
                              timer: 1800,
                              type: 'success',
                              closeOnConfirm: true,
                              closeOnCancel: true
                            });
                                            $("#modalAgregarArea").hide();
                                            limpiarFrmRe();
                                            $("#tableRequerimientos").DataTable().Destroy();
                                            cargarTableRequisitos();
                }else{
                       swal({
                              title:"Error!",
                              text: "No se pudo agregar el requisito.",
                              timer: 1800,
                              type: 'error',
                              closeOnConfirm: true,
                              closeOnCancel: true
                      });
                   }
                 }
              });
                         
          }
          
        });
    
    //----------------MODIFICAR 
         $(document).on("click","#btnModificarRequisito",function(){
          var idRequisito=$("#idRequisito").val();  
          var titulo=$("#tituloRequisito").val();
          var descripcion=$("#descripcionRequisito").val();
          var idOferta=$("#idOfertaM").val();
          var key="modificarRequisito";
          
          console.log(titulo);
          console.log(descripcion);
          
          if (titulo==="" || descripcion==="") 
          {
              swal({
                title: 'COMPLETA TODOS LOS CAMPOS!!',
                animation: false,
                customClass: 'animated tada'
               }); 
          }else
          {
            $.ajax({
                type:'post',
                data:{titulo,key,descripcion,idOferta,idRequisito},
                url: '../../procesarRequisitos',
                success: function(response){
                if (response>0){                    
                       swal({
                              title:"EXITO!",
                              text: "requisito modificado con exito",
                              timer: 1800,
                              type: 'success',
                              closeOnConfirm: true,
                              closeOnCancel: true
                            });
                                            $("#modalAgregarArea").hide();
                                            limpiarFrmRe();
                                            $("#tableRequerimientos").DataTable().Destroy();
                                            cargarTableRequisitos();
                }else{
                       swal({
                              title:"Error!",
                              text: "No se pudo modificar el area.",
                              timer: 1800,
                              type: 'error',
                              closeOnConfirm: true,
                              closeOnCancel: true
                      });
                   }
                 }
              });
                         
          }
          
        });
    //----------------ELIMINAR
    
/*----------------------------FIN GESTION DE REQUISITOS------------------------*/

 
