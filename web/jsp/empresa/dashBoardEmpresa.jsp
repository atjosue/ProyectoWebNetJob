<%-- 
    Document   : dashBoardEmpresa
    Created on : 10-26-2018, 04:56:06 PM
    Author     : josue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenidos.</title>
        <jsp:include page="../../utilidades/frontend/headerLinks.jsp" />
        <script src="../../js/empresa/dashBoardEmpresa.js" type="text/javascript"></script>
        <link href="../../css/empresa/dashBoardEmpresa.css" rel="stylesheet" type="text/css"/>
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
                                <img src="../../Contenido/Imagenes/postulantes/carla.jpg" class="rounded-circle " width="35px" height="35px" style="border-radius: 16px;"> Empresa
                            </a>

                </li>
              </ul>
            </div>
             <div class="nav-content" style="margin-left: 120px;">
                <ul class="nav nav-tabs black-text">
                    <li class="active"><a data-toggle="tab" href="#menu1">Estadisticas</a></li>
                    <li><a data-toggle="tab" href="#menu2">Gestion de Ofertas</a></li>
                    <li><a data-toggle="tab" href="#menu3">Gestion de Solicitudes</a></li>
                    <li>
                        <a data-toggle="tab" class="dropdown-trigger" data-target="dropdown2"> Gestionar Recursos</a>
                    </li>
                </ul>
            </div>
          </nav>

        <!-- Contenedor del submenu de opciones -->
                <ul id="dropdown1" class="dropdown-content" style="width: 150px;">
                      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Perfil</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-unchecked"></span> Seguimiento</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-adjust"></span> Recursos</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Log-Out</a></li>
                </ul>
                <ul id="dropdown2" class="dropdown-content" style="width: 150px;">
                      <li><a data-toggle="tab" href="#menu4"><span class="glyphicon glyphicon-text-background"></span> Areas</a></li>
                      <li><a data-toggle="tab" href="#menu5"><span class="glyphicon glyphicon-briefcase"></span> Puestos</a></li>
                </ul>
    </header>
    <body>  
      <div class="row">
           <!-- margen de la derecha -->
          <div class="col-sm-1 col-md-1 col-xs-1"></div>
          
           <!-- Contenedor -->
          <div class="col-sm-10 col-md-10 col-xs-10">
              <div class="col-sm-12 col-md-12 col-xs-12" >
             <div class="tab-content">
                
                 <!-- CONTENEDOR PARA LAS ESTADISTICAS -->
                 <div id="menu1" class="tab-pane fade in active">
                     
                 </div>
                 
                 <!-- CONTENEDOR PARA LA GESTION DE OFERTAS -->
                 <div id="menu2" class="tab-pane fade" >
                     <br>
                     <h3> Gestion  de ofertas laborales 
                         <div class="btn btn-danger right" data-toggle="collapse" data-target="#agregarOfertaContainer">
                             Agregar</div>
                     </h3>
                     <!-- CONTENEDOR PARA AGREGAR DE OFERTAS -->
                     <div id="agregarOfertaContainer" class="collapse">

                                <div class="row">
                                        <form class="col s8">
                                          <div class="row">
                                            <div class="input-field col s6">
                                              <input placeholder="Placeholder" id="first_name" type="text" class="validate">
                                              <label for="first_name">First Name</label>
                                            </div>
                                            <div class="input-field col s6">
                                              <input id="last_name" type="text" class="validate">
                                              <label for="last_name">Last Name</label>
                                            </div>
                                          </div>
                                          <div class="row">
                                            <div class="input-field col s12">
                                              <input disabled value="I am not editable" id="disabled" type="text" class="validate">
                                              <label for="disabled">Disabled</label>
                                            </div>
                                          </div>
                                          <div class="row">
                                            <div class="input-field col s12">
                                              <input id="password" type="password" class="validate">
                                              <label for="password">Password</label>
                                            </div>
                                          </div>
                                          <div class="row">
                                            <div class="input-field col s12">
                                              <input id="email" type="email" class="validate">
                                              <label for="email">Email</label>
                                            </div>
                                          </div>
                                          <div class="row">
                                            <div class="col s12">
                                              This is an inline input field:
                                              <div class="input-field inline">
                                                <input id="email_inline" type="email" class="validate">
                                                <label for="email_inline">Email</label>
                                                <span class="helper-text" data-error="wrong" data-success="right">Helper text</span>
                                              </div>
                                            </div>
                                          </div>
                                        </form>
                                </div>
                           </div>
                     
                     <!-- CONTENEDOR PARA AGREGAR OFERTAS -->
                     <br><br>
                     
                     <table class="tab-content highlight responsive-table" cellspacing="1" width="100%">
                         <thead>
                            <th>Puesto</th>
                            <th>Descripcion</th>
                            <th>Vacantes</th>
                            <th>Acciones</th>
                         </thead>
                         <tbody>
                        <!--  INICIO DE LA FILA -->
                             <tr>
                                 <td>Programador en Java</td>
                                 <td style="width: 550px;">
                                     Programador que sea capas de realizar distiantas  aplicaciones en android java
                                     y en unity y que sea tambien ingenirto en fisica nuclea y que sepa cocinar ok?
                                 </td>
                                 <td><center>1</center></td>
                                 <td>
                                     <div class="waves-effect waves-light btn modal-trigger" id="prueba">Editar</div>
                                     
                                     <div class="btn btn-danger small">Eliminar</div>
                                 </td>                                 
                             </tr>
                            
                        <!--  FIN DE LA FILA -->
                        
                         </tbody>
                     </table>
                     
                 </div>
                 
                 
                 <!-- CONTENEDOR PARA LA GESTION DE SOLICITUDES -->
                 <div id="menu3" class="tab-pane fade" >
                        
                     <div class="row">
                         <ul class="collapsible">
                          <li>
                            <div class="collapsible-header">
                              <i class="material-icons">filter_drama</i>
                              First
                              <span class="new badge">4</span></div>
                            <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                          </li>
                          <li>
                            <div class="collapsible-header">
                              <i class="material-icons">place</i>
                              Second
                              <span class="badge">1</span></div>
                            <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                          </li>
                        </ul>
                     </div>
                 </div>
                 
                 
                 <!-- CONTENEDOR PARA LA AREAS -->
                 <div id="menu4" class="tab-pane fade">
                        buscar areas
                        
                 </div>
                 <!-- CONTENEDOR PARA RECURSOS -->
                 <div id="menu5" class="tab-pane fade">
                        buscar puestos
                        
                 </div>
                 
            </div> 
            </div>
              
          </div>
           
           <!-- margen de la izquierda -->
          <div class="col-sm-1 col-md-1 col-xs-1"></div>
          
      </div>      
    </body>
     <!-- Modal Trigger -->
 
  <!-- Modal Structure-->
  <div id="modalModificar" class="modal modal-fixed-footer" role="dialog">
    <div class="modal-content">
      <h4>Aca se modifica perro</h4>
      
    </div>
      
      
    <div class="modal-footer">
      
            <div class="waves-effect waves-green btn btn-danger">Guardar</div>
            <div class="waves-effect waves-green btn btn-danger cans" >Cancelar</div>
    </div>
  </div> 
  <!-- modal modificacion restaurante 
<div class="modal " id="modalModificar" role="dialog" data-backdrop="static" data-keyboard="false" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header " Style="height:45px;">
                    <span class="robo" style="font-size: 20px;">Modificar Restaurante</span>
                </div>
                <div class="modal-body" >
                  
                      <div class="row" id="infoModificarRestaurante">
                          <div class="form-column col-md-6 col-sm-4 col-xs-6">
                                 <div class="form-group required">
                                  <label for="nombre" class="control-label">Nombre</label>
                                 <input type="text" class="form-control"  
                                    placeholder="" name="usuario" id="modificarUsuario"  required="true">
                                 </div>
                          </div>
                           
                          <div class="form-column col-md-6 col-sm-6 col-xs-6">
                            <div class="form-group required">
                              <label for="precio" class="control-label">Contraseña</label>            
                              <input type="password"  name="pass" class="form-control" id="modificarPass" required>
                            </div>
                          </div>
                          <div class="clearfix"></div>
                          <div class="form-column col-md-7 col-sm-7 col-xs-7">
                            <div class="form-group required">
                              <label for="descripcion" class="control-label">Confirmar Contraseña</label>            
                              <input type="password"  name="repass" class="form-control" id="modificarRepass" required >
                            </div>
                          <input type="hidden" name="idUsuarioModi" id="idUsuarioModi">

                          </div>
                            
                          <div class="clearfix"></div>  
                          <div class="clearfix"></div>

                    </div>
                    <div>
                    <button class="btn btn-primary  btn-sm " id="modificarRestaurante" >Guardar</button>
                    <button class="btn btn-primary  btn-sm " id="cerrarModalModi" >Cancelar</button>
                    

                  </div>

              </div>         
               <div class="modal-footer" id="modalFooter" >
                  
               </div>
            </div>
        </div> 
</div>
  -->
    
</html>
