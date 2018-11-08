$(document).ready(function(){
    $('#contInfoEmpresa').hide();
    $('#contPrincipal').hide();
    var primeravex= function() {
        var key="primera";
        var idUsuario=$("#idUsuario").val();
        $.ajax({
            type:'post',
            data:{idUsuario,key},
            url: '../../procesarEmpresa',
            success: function(data){
                if (data=="null") {
                    swal({
                    title: 'GENIAL!',
                    text: 'Bienvenido a la mejor empresa para postular tus ofertas laborales! , estamos seguros que te gustara.',
                    imageUrl: '../../Contenido/Imagenes/Sistema/netjob.png',
                    imageWidth: 100,
                    imageHeight: 100,
                    imageAlt: 'Custom image',
                    animation: false
                  }).then((result) => {
                        if (result.value) {
                          swal({
                            title: 'ATENCION',
                            text:"Para una mejore experiencia: Porfavor completa TODOS tus datos.",
                            animation: false,
                            type: 'info',
                            customClass: 'animated tada'
                          });
                        }
                        $('#contInfoEmpresa').show();
                        $('#contPrincipal').hide();
                      });
                  
                }
                $('#contPrincipal').show();
            }
        });
    };
    primeravex();
   $('#contInfoEmpresa').hide();
    //inicializacion de variables y componentes
    var idUsuario=$("#idUsuario").val();
    $('select').formSelect();
   
    $('input#txtDescripcion1').characterCounter();
    
    $('#btnActivarMod').click(function(){
        $('#contPrincipal').hide();
        let timerInterval
            swal({
              title: 'CARGANDO',
              html: 'espera mientras cargamos tu informacion..',
              timer: 2000,
              onOpen: () => {
                swal.showLoading()
                timerInterval = setInterval(() => {
                  swal.getContent().querySelector('strong')
                    .textContent = swal.getTimerLeft()
                }, 100)
              },
              onClose: () => {
                clearInterval(timerInterval)
              }
            }).then((result) => {
              if (
               
                result.dismiss === swal.DismissReason.timer
              ) {
                $('#contInfoEmpresa').show();
                
              }
            })
        
    });
    
    //verificacion de informacion de la empresa
    
    var key='getDataEmpresa';
    
    $(document).on("change","#selectDepa",function(){
       var idDep =$(this).val();
       
       $("#selectProv").empty();
        obtenerCombosProvincia(idDep);
    });
    
    $("#cancelarCambio").click(function(){
       location.reload() 
    });
    
    
     $.ajax({
            type:'post',
            data:{idUsuario,key},
            url: '../../procesarEmpresa',
            success: function(data){
                
            if (data!==null) {
            var datos= JSON.parse(data);
                obtenerCombosDepartamento(datos[0].idPais);
             if (datos[0].idDepartamento>0) {
                   $("#selectDepa").val(datos[0].idDepartamento).attr('selected','selected');
                }
            
                if (datos[0].idProvincia>0) {
                    obtenerCombosProvincia(datos[0].idDepartamento);
                     $("#selectProv").val(datos[0].idProvincia).attr('selected','selected');
                }
            
            $("#lblNombre").text(datos[0].nombre);   
            $("#lblDes").text(datos[0].descripcion1);
            $("#lblMision").text(datos[0].mision);
            $("#lblVision").text(datos[0].vision);
            
            $("#txtNombre").val(datos[0].nombre);
            $("#txtDescripcion1").val(datos[0].descripcion1);
            $("#txtDescripcion2").val(datos[0].descripcion2);
            $("#txtMision").val(datos[0].mision);
            $("#txtVision").val(datos[0].vision);
            $("#txtTelefono").val(datos[0].telefono);
            $("#txtDireccion").val(datos[0].direccion);
            $("#txtCorreo").val(datos[0].correo);
            $("#txtPagina").val(datos[0].paginaWeb);
            $("#txtFace").val(datos[0].facebook);
            $("#txtInsta").val(datos[0].instagram);
            $("#txtIdEmpresa").val(datos[0].idEmpresa);
            
            
            if (datos[0].imagen!==null){
               $("#imagenOculta1").val(datos[0].imagen);
            }
            if (datos[0].imagen2!==null){
               $("#imagenOculta2").val(datos[0].imagen2);
            }
            
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
    //verificar la primera vez
    
    var obtenerCombosDepartamento = function(cod)
    {
        var pais=cod;
        var key = 'obtenerCombosDepartamento'
        $.ajax({
            type:'post',
            url:'../../procesarEmpresa',
            data:{key,pais},
            success: function(data){
                if (data!==null) {
                    var jsonP=JSON.parse(data);
                                 
                                for (var a in jsonP) {
                                  $("#selectDepa").append('<option value="'+jsonP[a].idDepartamento+'">'+jsonP[a].departamento+'</option>');
                                }
                                
                    $('select').formSelect();
                    
                }else
                {
                    swal({
                        title:"Error!",
                        text: "No se pudo cargar combo departamento.",
                        timer: 1800,
                        type: 'error',
                        closeOnConfirm: true,
                        closeOnCancel: true
                      });
                    
                }
            }
        });
    };
    
    var obtenerCombosProvincia = function(cod)
    {
        var dep=cod;
        var key = 'obtenerCombosProvincia'
        $.ajax({
            type:'post',
            url:'../../procesarEmpresa',
            data:{key,dep},
            success: function(data){
                if (data!==null) {
                    var jsonR=JSON.parse(data); 
                        for (var a in jsonR) {
                        $("#selectProv").append('<option value="'+jsonR[a].idProvincia+'">'+jsonR[a].provincia+'</option>');
                   }
                                
                    $('select').formSelect();
                    
                }else
                {
                    swal({
                        title:"Error!",
                        text: "No se pudo cargar combo departamento.",
                        timer: 1800,
                        type: 'error',
                        closeOnConfirm: true,
                        closeOnCancel: true
                      });
                    
                }
            }
        });
    };
    //prueba de agregado de informacion de la empresa
    /*$(document).on("click","#guardarCambios",function (){
       alert("se viene");
       var nombre=$("#txtNombre").val();
       var descripcion1=$("#txtDescripcion1").val();
       var descripcion2=$("#txtDescripcion2").val();
       var mision =$("#txtMision").val();
       var vision= $("#txtVision").val();
       var telefono= $("#txtTelefono").val();
       var direccion= $("#txtDireccion").val();
       var correo= $("#txtCorreo").val();
       var rubro =$("#selectRubro").val();
       var departamento=$("#selectDepa").val();
       var provincia =$("#selectProv").val();
       var paginaWeb = $("#txtPagina").val();
       var facebook=$("#txtFace").val();
       var intagram=$("#txtInsta").val();
       var idEmpresa=$("#txtIdEmpresa").val(); 
       var data1 = document.getElementById("img1");
       var imagen1 = new FormData(data1);
       var data2 = document.getElementById("img2");
        
       
    });
    */
    
    
    
});


