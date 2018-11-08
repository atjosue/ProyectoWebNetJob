


$(document).ready(function(){
    
  var tabla = $('#tableHabilidad').DataTable({
       
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    }); // Termina Configuración de DataTable

    // función para ocultar columna de ids
    

    // Función para centrar acciones de las filas
   

    $(document).on('click', '.page-link', function() {
        $('tr td:last-child').css('display', 'flex');
        $('tr td:last-child').css('justify-content', 'space-around');
        $('tr td:last-child').css('align-items', 'center');
    });
    
    
    
    $("#InsertarExperiencia").click(function(){
    
    $("#ModalAgregar").show();
    
});
    
    
     $("#cancelar").click(function(){
    
    $("#ModalAgregar").hide();
      
});

$(".guardar").click(function(){
        
        var id=$(this).attr("id");
        var key= "addHabilidad";
        var idPostulante=$("#idPostulante").val();
        console.log(id);
        console.log(idPostulante);
        
        $.ajax({
            type:'post',
            url:'../../procesarPostulante',
            data: {key,id,idPostulante},
            
            success:function (response){
                
                if(response===1)
                {
                    swal({
                                    title:"Exito",
                                    text: "Has agregado con exito tu Habilidad ",
                                    timer: 1800,
                                    type: 'success',
                                    closeOnConfirm: true
                                    

                            });
              location.reload();
                    
            }
            else
            {
                swal({
                                    title:"Error",
                                    text: response,
                                    timer: 1800,
                                    type: 'error',
                                    closeOnConfirm: true
                                    

                            });
                
                
            }
        }
     
        });
        
        
    });
    
    
    
    var tabla = $('#tableHab').DataTable({
       
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    }); 




});



