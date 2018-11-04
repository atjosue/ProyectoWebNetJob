<%-- 
    Document   : dashBoardEmpresa
    Created on : 10-26-2018, 04:56:06 PM
    Author     : josue
--%>

<%@page import="javax.jms.Session"%>
<%@page import="com.dao.DaoPuestos"%>
<%@page import="com.modelos.Puestos"%>
<%@page import="com.modelos.Areas"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.DaoAreas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenidos.</title>
        <jsp:include page="../../utilidades/frontend/headerLinks.jsp" />
        <script src="../../js/empresa/dashBoardEmpresa.js" type="text/javascript"></script>
        <link href="../../css/empresa/dashBoardEmpresa.css" rel="stylesheet" type="text/css"/>
        <script src="../../utilidades/frontend/Ajax_Camvas/underscoreJS.js" type="text/javascript"></script>
    </head>
    <header>
         <nav class="nav-extended teal">
            <div class="nav-wrapper">
                <a href="#" class="brand-logo">
                    <img src="../../Contenido/Imagenes/Sistema/netjob.png" height="110px" style="margin-left: 20px;"/>
                </a>
              <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
              <ul id="nav-mobile" class="right hide-on-med-and-down">
                  <li><a><span class="glyphicon glyphicon-bell"></span><span class="badge">5</span></a></li>
                <li style="width: 150px;">
                            <a class="dropdown-trigger" href="#!" data-target="dropdown1">
                                <img src="../../Contenido/Imagenes/postulantes/carla.jpg" class="rounded-circle " width="35px" height="35px" style="border-radius: 16px;"> 
                                <%= session.getAttribute("users") %>
                            </a>

                </li>
              </ul>
            </div>
             <div class="nav-content" style="margin-left: 120px;">
                <ul class="nav nav-tabs black-text">
                    <li class="active"><a data-toggle="tab" href="#menu1">Estadisticas</a></li>
                    <li><a data-toggle="tab" href="#menu2">Gestion de Ofertas</a></li>
                    <li><a data-toggle="tab" href="#menu3">Gestion de Solicitudes</a></li>
                </ul>
            </div>
          </nav>

        <!-- Contenedor del submenu de opciones -->
                <ul id="dropdown1" class="dropdown-content" style="width: 150px;">
                      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Perfil</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-unchecked"></span> Seguimiento</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Log-Out</a></li>
                </ul>
    </header>
    <body>  
        <input type="hidden" id="idUsuarioGlobal" value="<%= session.getAttribute("idUsuario")%>">
      <div class="row">
       <!-- margen de la derecha -->
       <div class="col-sm-1 col-md-1 col-xs-1"></div>   
       <!-- Contenedor principal -->
       <div class="col-sm-10 col-md-10 col-xs-10">
           <div class="col-sm-12 col-md-12 col-xs-12" >
               <div class="tab-content">
                 <!-- CONTENEDOR PARA LAS ESTADISTICAS -->
                 <div id="menu1" class="tab-pane fade in active">
                     
                 </div>
                 <!-- FIN CONTENEDOR PARA LAS ESTADISTICAS -->
                 
                 <!-- CONTENEDOR PARA LA GESTION DE OFERTAS -->
                 <div id="menu2" class="tab-pane fade" >
                     <br>
                     <h3> Gestion  de ofertas laborales 
                         <div id="btnNuevaOferta" class="btn btn-danger right" data-toggle="collapse" data-target="#agregarOfertaContainer">
                             <p id="nuevaOfertaTxt">AGREGAR<p></div>
                     </h3>
                     <!-- CONTENEDOR PARA AGREGAR DE OFERTAS -->
                     <div id="agregarOfertaContainer" class="collapse">
                       <div class="col-sm-1 col-md-1 col-sm-1 "></div>
                       <div class="col-sm-8 col-md-8 col-sm-8 ">
                          <form id="formularioAgregarOferta"> 
                                <div class="row">
                                    <br>
                                    <input type="hidden" id="idUsuario" name="idUsuario" value="<%= session.getAttribute("idUsuario")%>">
                                    <div class="input-field col s8">
                                        <input id="txtTituloOferta" name="titulo" type="text" class="validate">
                                      <label for="txtTituloOferta">Titulo de la oferta</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtVacantesOferta" name="vacantes" type="number" class="validate">
                                      <label for="txtVacantesOferta">Vacantes desponibles</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <input id="txtDescripcionOferta" name="descripcion" type="text" class="validate">
                                      <label for="txtDescripcionOferta">Descripcion de la oferta</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtSalarioMinimo" name="salarioMinimo" type="number" step="any" min="0" class="validate">
                                      <label for="txtSalarioMinimo">Salario Minimo</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtSalarioMaximo" name="salarioMaximo" type="number" step="any" min="0" class="validate">
                                      <label for="txtSalarioMinimo">Salario Maximo</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtAnosExperiencia" name="aniosExperiencia" type="number" step="1" min="0" max="50" class="validate">
                                      <label for="txtAnosExperiencia">Años de experiencia</label>
                                    </div>
                                    <div class="input-field col s5">
                                        <select id="selectArea" name="idArea">
                                          
                                        </select>
                                       <label>Seleccionar area de la empresa</label>
                                    </div>
                                    <div class="input-field col s1">
                                        <div class="waves-effect waves-green btn btn-danger" id="agregarNuevaArea" >
                                            <span class="glyphicon glyphicon-plus"></span>
                                        </div>
                                    </div>
                                    <div class="input-field col s5">
                                        <select id="selectPuesto" name="idPuesto">
                                          
                                        </select>
                                       <label>Seleccionar puesto de la empresa</label>
                                    </div>
                                    <div class="input-field col s1">
                                        <div class="waves-effect waves-green btn btn-danger" id="agregarNuevoPuesto" >
                                            <span class="glyphicon glyphicon-plus"></span>
                                        </div>
                                    </div>
                                    <div class="input-field col s8">
                                      <p>
                                      <label for="txtGeneroPreferencia">Genero de preferencia</label><br>
                                      <label>
                                          <input class="with-gap" name="sexo" type="radio" id="txtGeneroPreferencia" value="1" />
                                          <span>Masculino</span>
                                        </label>
                                        <label>
                                            <input class="with-gap" name="sexo" type="radio" id="txtGeneroPreferencia" value="2" />
                                          <span>Femenino</span>
                                        </label>
                                        <label>
                                            <input class="with-gap" name="sexo" type="radio" id="txtGeneroPreferencia" value="3" />
                                          <span>No relevante</span>
                                        </label>
                                      </p>
                                    </div>
                                    <div class="input-field col s4">
                                        <select id="selectGrado" name="idGradoEstudio">
                                          
                                        </select>
                                       <label>Seleccionar grado de Estudio requerido</label>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="input-field col s4">
                                        <input id="txtEdadMinima" name="edadMinima" type="number" min="18" max="65" class="validate">
                                      <label for="txtEdadMinima">Edad minima</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtEdadMaxima" name="edadMaxima" type="number" min="18" max="65" class="validate">
                                      <label for="txtEdadMaxima">Edad maxima</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <center>
                                            <div class="switch">
                                                <label for="txtEstadoOf">Estado de activacion de oferta:</label>
                                                <label>
                                                  desactiva
                                                  <input id="txtEstadoOf" type="checkbox" checked="checked">
                                                  <span class="lever"></span>
                                                  activa
                                                </label>
                                              </div>
                                        </center>
                                    </div>
                                </div>
                                    <input id="txtEstadoDesactivo" name="estadoP" type="hidden" >
                            </form>
                            <!--<br>
                            <h6>Requisitos</h6>
                            <br>
                            <div id="contenedorTablaRequisitos" class="row">
                                <form id="frmRequisitos" class="col-sm-12 col-md-12">
                                    <div id="dynamicDiv">
                                        
                                    </div>
                                </form>
                            <a href="javascript:void(0)" class="waves-effect waves-green btn btn-danger small" id="addInput">
                                   <span class="glyphicon glyphicon-tasks"></span>Agregar
                            </a>
                            </div>-->
                      
			<script>
			/*$(function () {
			    var scntDiv = $('#dynamicDiv');
                            var a=1;
			    
                                    $(document).on('click', '#addInput', function () {
                                    
                                    if (a<=10) {
                                    $( '<h7>'+ 
                                            '<div class="col-sm-3 col-md-3">'+    
                                            '<input id="tituloRequisito'+a+'" name="tituloRequisito[]"  type="text" id="inputeste" placeholder="titulo">'+
                                            '</div>'+
                                            '<div class="col-sm-7 col-md-7" >'+
                                            '<input id="descripcionRequisito'+a+'" name="descripcionRequisito[]" type="text" id="inputeste" placeholder="Descripcion">'+
                                            '</div>'+
                                            '<a class="waves-effect waves-green btn btn-danger col-sm-1 col-md-1" " id="remInput">'+
                                                '<span class="glyphicon glyphicon-trash"></span>'+
                                            '</a>'+
                                            '</h7><div class="clearfix"></div>').appendTo(scntDiv);
                                    a=a+1;
                                    }else
                                    {
                                        swal({
                                                    title:"Error!",
                                                    text: "Solo se pueden agregar 10 requisitos.",
                                                    timer: 1800,
                                                    type: 'error',
                                                    closeOnConfirm: true,
                                                    closeOnCancel: true
                                            });
                                    }
                                    return false;
                                });
                                $(document).on('click', '#remInput', function () {
                                $(this).parents('h7').remove();
                                a=a-1;
                                    return false;
                                });
			});*/
			</script>
		
                      </div>
                       <div class="col-sm-3 col-md-3 col-sm-3 ">
                           <div>
                               <div style="margin-top: 200%; margin-left: 20%; width: 200px;" class="waves-effect waves-green btn btn-danger " id="btnGuardadNuevaOferta" data-toggle="collapse" data-target="#agregarOfertaContainer" >Guardar</div>
                           </div>
                       </div>
                       
                     </div>
                     
                     <!---------------------- FIN CONTENEDOR PARA AGREGAR OFERTAS ------------------------------>
                     <br><br>
                     <!---------------------- TABLA DE OFERTAS ------------------------------>
                     <div id="contenedorTabla">
                        <table id="tableOfertas" class="tab-content highlight responsive-table" style="width:100%">
                        <thead>
                            <tr>
                                <th>Puesto</th>
                                <th>Descripcion</th>
                                <th>Vacantes</th>
                                <th>id</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Puesto</th>
                                <th>Descipcion</th>
                                <th>Vacantes</th>
                                <th>id</th>
                                <th style="width: 250px;">Acciones</th>
                            </tr>
                        </tfoot>
                    </table> 
                    </div>
                     
                     <!---------------------- FIN TABLA DE OFERTAS ------------------------------>
                 </div>
                 <!-- FIN CONTENEDOR PARA LA GESTION DE OFERTAS -->
                 <!-- CONTENEDOR PARA LA GESTION DE SOLICITUDES -->
                 <div id="menu3" class="tab-pane fade" >
                        
                     
                     
                     
                     
                 </div>
                 <!-- FIN CONTENEDOR PARA LA GESTION DE SOLICITUDES -->
                 <!-- CONTENEDOR PARA LA AREAS -->
                 
                 <div id="menu4" class="tab-pane fade">
                        <br>
                     <h3> Gestion  de Areas de la empresa. 
                         <div class="btn btn-danger right" id="nuevaArea">
                             Agregar</div>
                     </h3>
                     <br><br>
                     <table border="1">
                         <thead>
                            <th>Codigo</th>
                            <th>Area</th>
                            <th>Acciones</th>
                         </thead>
                         <tbody>
                            
                         </tbody>
                     </table>
                        
                 </div>
                         
                 <!-- FIN CONTENEDOR PARA LA AREAS -->
                 <!-- CONTENEDOR PARA PUESTOS -->
                 <div id="menu5" class="tab-pane fade">
                        <br>
                     <h3> Gestion  de Puestos de la empresa. 
                         <div class="btn btn-danger right" id="nuevoPuesto">
                             Agregar</div>
                     </h3>
                     <br><br>
                     
                       <br><br><br> 
                 </div>
                 <!-- CONTENEDOR PARA PUESTOS -->      
               </div>
           </div>
       </div> 
       <!-- margen de la izquierda -->
       <div class="col-sm-1 col-md-1 col-xs-1"></div>
       
    </body>
</html>
  <!-- Modal modifiacar oferta -->
  <div id="modalModificarOferta" class="modal modal-fixed-footer" role="dialog">
    <div class="modal-content">
        <div class="row">
            <div class="col-md-4 col-xs-4 col-sm-4 " style="background-color: #e0f2f1; height:320px;">
                <br><br><br>
                <center><img src="../../Contenido/Imagenes/Sistema/agregar.png" width="250px" height="250px"/></center>
            </div>
            <div class="col-md-8 col-xs-8 col-sm-8">
                            <form id="formularioModificarOferta"> 
                                <div class="row">
                                    <br>
                                    <div class="input-field col s8">
                                        <input id="txtTituloOfertaM" type="text" class="validate">
                                      <label for="txtTituloOfertaM">Titulo</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtVacantesOfertaM" type="number" class="validate">
                                      <label for="txtVacantesOfertaM">Vacantes</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <input id="txtDescripcionOfertaM" type="text" class="validate">
                                      <label for="txtDescripcionOfertaM">Descripcion</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtSalarioMinimoM" type="text" class="validate">
                                      <label for="txtSalarioMinimoM">Salario Minimo</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtSalarioMaximoM" type="text" class="validate">
                                      <label for="txtSalarioMinimoM">Salario Maximo</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtAnosExperienciaM" type="text" class="validate">
                                      <label for="txtAnosExperienciaM">Años de experiencia</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="txtAreaM" type="text" class="validate">
                                      <label for="txtAreaM">Seleccionar area de la empresa</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="txtPuestoM" type="text" class="validate">
                                      <label for="txtPuestoM">Seleccionar puesto de la empresa</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="txtGeneroPreferenciaM" type="text" class="validate">
                                      <label for="txtGeneroPreferenciaM">Genero de preferencia</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="txtGradoEstudioM" type="text" class="validate">
                                      <label for="txtGradoEstudioM">Grado de estudio requerido</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtEdadMinimaM" type="number" min="18" max="65" class="validate">
                                      <label for="txtEdadMinimaM">Edad minima</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtEdadMaximaM" type="number" min="18" max="65" class="validate">
                                      <label for="txtEdadMaximaM">Edad maxima</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <center>
                                            <div class="switch">
                                                <label>
                                                  activa
                                                  <input id="txtEstadoM" type="checkbox">
                                                  <span class="lever"></span>
                                                  desactiva
                                                </label>
                                              </div>
                                        </center>
                                    </div>
                                </div>
                            </form>
            </div>
        </div>
    </div>
    <div class="modal-footer">
      
        <div class="waves-effect waves-green btn btn-danger" id="btnGuardarModOferta">Guardar</div>
        <div class="waves-effect waves-green btn btn-danger cans" >Cancelar</div>
    </div>
  </div> 
  <!-- fin modal modificacion oferta -->
  
  <!-- Modal agregar area-->
  <div id="modalAgregarArea" class="modal modal-fixed-footer" role="dialog">
    <div class="modal-content">
        <div class="row">
            <div class="col-md-4 col-xs-4 col-sm-4 " style="background-color: #e0f2f1; height:320px;">
                <br><br><br>
                <center><img src="../../Contenido/Imagenes/Sistema/agregar.png" width="250px" height="250px"/></center>
            </div>
            <div class="col-md-8 col-xs-8 col-sm-8">
                <form id="formularioAgregarArea"> 
                    <div class="row">
                        <br><br><br>
                        <div class="input-field col s12">
                            <input id="nombreAreaA" type="text" class="validate">
                          <label for="nombreAreaA">Asigna un nombre a la nueva area..</label>
                          <input id="keyAreaA" type="hidden" name="key">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
      
      
    <div class="modal-footer">
      
        <div class="waves-effect waves-green btn btn-danger submit button" id="btnAgregarArea" name="btnAgregarArea">Guardar</div>
        <div class="waves-effect waves-green btn btn-danger cans" >Cancelar</div>
    </div>
  </div> 
  <!--fin del modal agregar area -->
  
<!-- MODAL PARA MODIFICAR AREAS-->  
<div id="modalModificarArea" class="modal modal-fixed-footer" role="dialog">
    <div class="row">
            <div class="col-md-4 col-xs-4 col-sm-4 " style="background-color: #e0f2f1; height:320px;">
                <br><br><br>
                <center><img src="../../Contenido/Imagenes/Sistema/agregar.png" width="250px" height="250px"/></center>
            </div>
            <div class="col-md-8 col-xs-8 col-sm-8">
                <form id="formularioAgregarArea"> 
                    <div class="row">
                        <br><br><br>
                        <div class="input-field col s12">
                            <input id="nombreAreaM" placeholder="" type="text" class="validate">
                            <label for="nombreAreaM">Modifica el nombre del area..</label>
                          <input id="codModificarArea" type="hidden" name="key">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <div class="modal-footer">
      
            <div class="waves-effect waves-green btn btn-danger" id="btnModificarArea">Guardar</div>
            <div class="waves-effect waves-green btn btn-danger cans" >Cancelar</div>
    </div>
  </div> 
<!--Fin del modal para modificar areas-->    

  <!-- Modal agregar puesto-->
  <div id="modalAgregarPuesto" class="modal modal-fixed-footer" role="dialog">
    <div class="modal-content">
        <div class="row">
            <div class="col-md-4 col-xs-4 col-sm-4 " style="background-color: #e0f2f1; height:320px;">
                <br><br><br>
                <center><img src="../../Contenido/Imagenes/Sistema/modificar.png" width="250px" height="250px"/></center>
            </div>
            <div class="col-md-8 col-xs-8 col-sm-8">
                <form id="formularioAgregarArea"> 
                    <div class="row">
                        <br>
                        <div class="input-field col s6">
                            <input id="nombrePuestoA" type="text" class="validate">
                          <label for="nombreAreaA">Puesto</label>
                          
                        </div>
                        
                        <div class="input-field col s6">
                                <% 
                                    DaoAreas d = new DaoAreas();
                                    List<Areas> comboArea = d.mostrarAreas();
                                    
                                %>
                                <select id="selectArea">
                                    <% 
                                        for (int i = 0; i < comboArea.size(); i++) {
                                        Areas areaCombo = (Areas)comboArea.get(i);
                                    %>
                                    <option value="<%= areaCombo.getIdArea()%>" id="<%= areaCombo.getIdArea()%>"><%= areaCombo.getNombre()%></option>
                                  
                                  <% } %>
                                </select>
                                <label>Seleccionar Area de la empresa</label>
                        </div>
                        
                        <div class="input-field col s12">
                            <input id="descripcionPuestoA" type="text" class="validate">
                          <label for="nombreAreaA">Asigna una descripcion al puesto..</label>
                          <input id="keyAreaA" type="hidden" name="key">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
      
      
    <div class="modal-footer">
      
        <div class="waves-effect waves-green btn btn-danger submit button" id="btnAgregarPuesto" name="btnAgregarPuesto">Guardar</div>
        <div class="waves-effect waves-red btn btn-danger cans" >Cancelar</div>
    </div>
  </div> 
  <!--fin del modal agregar area -->
  
<!-- MODAL PARA MODIFICAR AREAS-->  
<div id="modalModificarPuesto" class="modal modal-fixed-footer" role="dialog">
    <div class="modal-content">
        <div class="row">
            <div class="col-md-4 col-xs-4 col-sm-4 " style="background-color: #e0f2f1; height:320px;">
                <br><br><br>
                <center><img src="../../Contenido/Imagenes/Sistema/modificar.png" width="250px" height="250px"/></center>
            </div>
            <div class="col-md-8 col-xs-8 col-sm-8">
                <form id="formularioModificarArea"> 
                    <div class="row">
                        <br>
                        <div class="input-field col s6">
                            <input id="nombrePuestoM" type="text" class="validate">
                          <label for="nombrePuestoM">Puesto</label>
                          
                        </div>
                        
                        <div class="input-field col s6">
                                <% 
                                    List<Areas> comboAreas = d.mostrarAreas();
                                    
                                %>
                                <select id="selectAreaM">
                                    <% 
                                        for (int i = 0; i < comboAreas.size(); i++) {
                                        Areas areaCombo = (Areas)comboAreas.get(i);
                                    %>
                                    <option value="<%= areaCombo.getIdArea()%>" id="<%= areaCombo.getIdArea()%>"><%= areaCombo.getNombre()%></option>
                                  
                                  <% } %>
                                </select>
                                <label>Seleccionar Area de la empresa</label>
                        </div>
                        
                        <div class="input-field col s12">
                            <input id="descripcionPuestoM" placeholder="" type="text" class="validate">
                          <label for="descripcionPuestoM">Editar descripcion al puesto..</label>
                          <input id="codModificarPuesto" type="hidden" name="key">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
      
    <div class="modal-footer">
      
        <div class="waves-effect waves-green btn btn-danger" id="btnModificarPuesto">Guardar</div>
            <div class="waves-effect waves-green btn btn-danger cans" >Cancelar</div>
    </div>
  </div> 
<!--Fin del modal para modificar areas--> 
