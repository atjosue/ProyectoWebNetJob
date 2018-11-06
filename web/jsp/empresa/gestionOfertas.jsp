<%-- 
    Document   : gestionOfertas
    Created on : 11-05-2018, 08:07:43 AM
    Author     : josue
--%>

<%@page import="com.modelos.Areas"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DaoAreas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestionar Empresas</title>
    <jsp:include page="../../utilidades/frontend/headerLinks.jsp" />
    <script src="../../js/empresa/gestionOfertas.js" type="text/javascript"></script>
    <script src="../../utilidades/frontend/Ajax_Camvas/underscoreJS.js" type="text/javascript"></script>
    <!--<link href="../../css/empresa/AnimateCss.css" rel="stylesheet" type="text/css"/>-->
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
             <div style="margin-left: 120px;">
                <ul class="nav nav-tabs black-text">
                    <li><a  href="dashBoardEmpresa.jsp">Inicio</a></li>
                    <li class="active"><a href="">Gestion de Ofertas</a></li>
                    <li><a  href="#menu3">Gestion de Solicitudes</a></li>
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
        <div id="ContenedorTotaal">
          <div class="row">
            <div class="col-md-1 col-sm-1 col-xs-1"></div>
            <div class="col-md-10 col-sm-10 col-xs-10 ">
                
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
                                        <div class="waves-effect waves-green btn btn-danger nuevaArea" id="agregarNuevaArea" >
                                            <span class="glyphicon glyphicon-plus"></span>
                                        </div>
                                    </div>
                                    <div class="input-field col s5">
                                        <select id="selectPuesto" name="idPuesto">
                                          
                                        </select>
                                       <label>Seleccionar puesto de la empresa</label>
                                    </div>
                                    <div class="input-field col s1">
                                        <div class="waves-effect waves-green btn btn-danger nuevoPuesto" id="agregarNuevoPuesto" >
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
                                <th></th>
                                <th>Puesto</th>
                                <th>Descripcion</th>
                                <th>Vacantes</th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                        <tfoot>
                            <tr>
                                <th></th>
                                <th>Puesto</th>
                                <th>Descripcion</th>
                                <th>Vacantes</th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th>Acciones</th>
                            </tr>
                        </tfoot>
                    </table> 
                    </div>
                     
                     <!---------------------- FIN TABLA DE OFERTAS ------------------------------>
                 
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1"></div>
          </div>
       </div>
    </body>
</html>
  <!-- Modal modifiacar oferta -->
  <div id="modalModificarOferta" class="modal modal-fixed-footer" role="dialog">
    <div class="modal-content">
        <div class="row">
            <div class="col-md-4 col-xs-4 col-sm-4 " style="background-color: #e0f2f1; height:320px;">
                <br><br><br>
                <center><img src="../../Contenido/Imagenes/Sistema/agregar.png" width="250px" height="250px"/></center>
                <br><br><br>
                <div class="waves-effect waves-green btn large "  id="btnGestionarRequisitos">GESTIONAR REQUISITOS</div>
            </div>
            <div class="col-md-8 col-xs-8 col-sm-8">
                            <form id="formularioModificarOferta"> 
                                <div class="row">
                                    <br>
                                    <input type="hidden" id="idUsuarioM" name="idUsuarioM" >
                                    <input type="hidden" id="idOfertaM" name="idOferta" >
                                    <div class="input-field col s8">
                                        <input id="txtTituloOfertaM" placeholder="" name="tituloM" type="text" class="validate">
                                      <label for="txtTituloOfertaM">Titulo de la oferta</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtVacantesOfertaM" placeholder="" name="vacantesM" type="number" class="validate">
                                      <label for="txtVacantesOfertaM">Vacantes desponibles</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <input id="txtDescripcionOfertaM" placeholder="" name="descripcionM" type="text" class="validate">
                                      <label for="txtDescripcionOfertaM">Descripcion de la oferta</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtSalarioMinimoM" placeholder="" name="salarioMinimoM" type="number" step="any" min="0" class="validate">
                                      <label for="txtSalarioMinimoM">Salario Minimo</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtSalarioMaximoM" placeholder="" name="salarioMaximoM" type="number" step="any" min="0" class="validate">
                                      <label for="txtSalarioMaximoM">Salario Maximo</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtAnosExperienciaM" placeholder="" name="aniosExperienciaM" type="number" step="1" min="0" max="50" class="validate">
                                      <label for="txtAnosExperienciaM">Años de experiencia</label>
                                    </div>
                                    <div class="input-field col s5">
                                        <select id="selectAreaM" name="idAreaM">
                                          
                                        </select>
                                       <label>Seleccionar area de la empresa</label>
                                    </div>
                                    <div class="input-field col s1">
                                        <div class="waves-effect waves-green nuevaArea" id="guardarAreaModificada" >
                                            <span class="glyphicon glyphicon-plus"></span>
                                        </div>
                                    </div>
                                    <div class="input-field col s5">
                                        <select id="selectPuestoM" name="idPuestoM">
                                          
                                        </select>
                                       <label>Seleccionar puesto de la empresa</label>
                                    </div>
                                    <div class="input-field col s1">
                                        <div class="waves-effect waves-green nuevoPuesto "  >
                                            <span class="glyphicon glyphicon-plus"></span>
                                        </div>
                                    </div>
                                    <div class="input-field col s8">
                                      <p>
                                      <label for="txtGeneroPreferenciaM">Genero de preferencia</label><br>
                                      <label>
                                          <input class="with-gap" name="sexoM" type="radio" id="txtGeneroPreferenciaM" value="1"/>
                                          <span>Masculino</span>
                                        </label>
                                        <label>
                                            <input class="with-gap" name="sexoM" type="radio" id="txtGeneroPreferenciaM" value="2"/>
                                          <span>Femenino</span>
                                        </label>
                                        <label>
                                            <input class="with-gap" name="sexoM" type="radio" id="txtGeneroPreferenciaM" value="3"/>
                                          <span>No relevante</span>
                                        </label>
                                      </p>
                                    </div>
                                    <div class="input-field col s4">
                                        <select id="selectGradoM" name="idGradoEstudioM">
                                          
                                        </select>
                                       <label>Seleccionar grado de Estudio requerido</label>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="input-field col s4">
                                        <input id="txtEdadMinimaM" placeholder="" name="edadMinimaM" type="number" min="18" max="65" class="validate">
                                      <label for="txtEdadMinimaM">Edad minima</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <input id="txtEdadMaximaM" placeholder="" name="edadMaximaM" type="number" min="18" max="65" class="validate">
                                      <label for="txtEdadMaximaM">Edad maxima</label>
                                    </div>
                                    <div class="input-field col s4">
                                        <center>
                                            <div class="switch">
                                                <label for="txtEstadoOfM">Estado de activacion de oferta:</label>
                                                <label>
                                                  desactiva
                                                  <input id="txtEstadoOfM" type="checkbox" checked="checked">
                                                  <span class="lever"></span>
                                                  activa
                                                </label>
                                              </div>
                                        </center>
                                    </div>
                                </div>
                                    <input id="txtEstadoDesactivoM" name="estadoP" type="hidden" >
                            </form>
            </div>
        </div>
    </div>
    <div class="modal-footer">
      
        <div class="waves-effect waves-green btn btn-danger " id="btnGuardarModOferta">Guardar</div>
        <div class="waves-effect waves-green btn btn-danger cans recargarPagina" >Cancelar</div>
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
        <div class="waves-effect waves-green btn btn-danger cansInterno" >Cancelar</div>
    </div>
  </div> 
  <!--fin del modal agregar area -->

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
        <div class="waves-effect waves-red btn btn-danger cansInterno" >Cancelar</div>
    </div>
  </div> 
  <!--fin del modal agregar area -->
 
   <!-- Modal GESTIONAR REQUISITOS DE OFERTA-->
  <div id="modalGestionRequisitosOferta" class="modal modal-fixed-footer" role="dialog">
    <div class="modal-content">
        <div class="row">
            <div class="col-md-1 col-xs-1 col-sm-1 " style="background-color: #e0f2f1; height:320px; margin-bottom: 0px;">
            
            </div>
            <div class="col-md-11 col-xs-11 col-sm-11">
                <form id="formularioGestionRequisitosOferta"> 
                    <div class="row">
                        <br>
                        <h6>Gestionar requisitos</h6>
                        <br>
                        <input id="idRequisito" type="hidden">
                        <div class="input-field col s3">
                            <input id="tituloRequisito" placeholder="" type="text" class="validate">
                          <label for="tituloRequisito">Titulo</label>  
                        </div>
                        
                        <div class="input-field col s8">    
                            <input id="descripcionRequisito" placeholder="" type="text" class="validate">
                          <label for="descripcionRequisito">Descripcion</label>  
                        </div>
                        <div class="input-field col s12">
                            <div class="waves-effect waves-green btn btn-danger submit button col s3 resetBotones" id="btnAgregarRequisito">Guardar</div>
                            <div class="waves-effect waves-green btn btn-danger submit button col s3 resetBotones"  id="btnModificarRequisito">Modificar</div>
                            <div class="waves-effect waves-green btn btn-danger submit button col s3 resetBotones"  id="btnEliminarRequisito">Eliminar</div>
                            <div class="waves-effect waves-green btn btn-danger submit button col s3 resetBotones"  id="btnLimpiarRequisito">Limpiar</div>
                        </div>
                        <input id="idOfertaMR" type="hidden">
                </form>
                        <!---------------------- TABLA DE Requerimientps ------------------------------>
                     <div id="contenedorTablaR">
                        <table id="tableRequerimientos" class="tab-content highlight responsive-table" style="width:100%">
                        <thead>
                            <tr>
                                <th>idRequisito</th>
                                <th>Titulo</th>
                                <th>Descripcion</th>
                                <th>idOferta</th>
                                <th style="width: 50px;">Acciones</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>idRequisito</th>
                                <th>Titulo</th>
                                <th>Descripcion</th>
                                <th>idOferta</th>
                                <th style="width: 50px;">Acciones</th>
                            </tr>
                        </tfoot>
                    </table> 
                    </div>
                     <!---------------------- FIN TABLA DE Requerimientos ------------------------------>
                    </div>
                
            </div>
        </div>
    </div>
      
    <div class="modal-footer">
        <div class="waves-effect waves-red btn btn-danger cansInterno cargarRequisitos" id="salirTablaRequisitos">SALIR</div>
    </div>
  </div> 
  <!--fin del modal GESTIONAR REQUISITOS DE OFERTA-->
