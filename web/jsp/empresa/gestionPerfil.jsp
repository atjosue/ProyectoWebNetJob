<%-- 
    Document   : gestionPerfil
    Created on : 11-07-2018, 08:17:55 AM
    Author     : josue
--%>

<%@page import="com.modelos.Rubro"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DaoEmpresa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil de la empresa</title>
        <jsp:include page="../../utilidades/frontend/headerLinks.jsp"/>
        <script src="../../js/empresa/gestionPerfil.js" type="text/javascript"></script>
        <link href="../../css/empresa/AnimateCss.css" rel="stylesheet" type="text/css"/>
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
                                <%= session.getAttribute("user") %>
                            </a>

                </li>
              </ul>
            </div>
             <div style="margin-left: 120px;">
                <ul class="nav nav-tabs black-text">
                    <li><a  href="dashBoardEmpresa.jsp">Inicio</a></li>
                    <li ><a href="">Gestion de Ofertas</a></li>
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
        <form id="formInfoEmpresa" action="../../procesarEmpresa" enctype="multipart/form-data">
        <input type="hidden" id="idUsuario" name="idUsuario" value="<%= session.getAttribute("idUsuario")%>">
        <input type="hidden" name="key" value="actualizarEmpresa">   
        <div class="row" id="contInfoEmpresa">
            <div class="col s2"></div>
            <div class="col s8">
                <div class="col-sm-12 col-md-12 col-xs-12">
                    <br><h4>Perfil de la Empresa</h4><br>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-6 col-md-6 col-xs-6">
                    <div class="input-field">
                        <input id="txtNombre" name="txtNombre" placeholder="" type="text" class="validate">
                        <label for="txtNombre">Nombre de la empresa</label>
                    </div>
                </div>
                
                <div class="clearfix"></div>
                <br>
                <div class="col-sm-3 col-md-3 col-xs-3">
                    <label for="txtDescripcion1">Descripcion para vista cuandro pequeño</label>
                </div>
                <div class="col-sm-8 col-md-8 col-xs-8">
                     <input id="txtDescripcion1" name="txtDescripcion1" placeholder="" type="text" class="validate" data-length="120">
                </div>
                <div class="clearfix"></div>
                <br>
                <div class="col-sm-3 col-md-3 col-xs-3">
                    <label for="txtDescripcion2">Descripcion para el perfil al publico</label>
                </div>
                <div class="col-sm-8 col-md-8 col-xs-8 input-field">
                        <textarea id="txtDescripcion2"  name="txtDescripcion2" class="materialize-textarea"></textarea>
                </div>
                
                
                <div class="clearfix"></div><br>
                <div class="col-sm-6 col-md-6 col-xs-6">
                    <div class="input-field">
                        <textarea id="txtMision" name="txtMision" class="materialize-textarea"></textarea>
                        <label for="txtMision">Mision de la Empresa</label>
                    </div>
                </div>  
                <div class="col-sm-6 col-md-6 col-xs-6">
                    <div class="input-field">
                        <textarea id="txtVision" name="txtVision" class="materialize-textarea"></textarea>
                        <label for="txtVision">Vision de la Empresa</label>
                    </div>
                </div>
                <div class="clearfix"></div><br>
                
                <div class="col-sm-3 col-md-3 col-xs-3">
                    <div class="input-field">
                        <input id="txtTelefono" name="txtTelefono" placeholder="" type="text" class="validate">
                        <label for="txtTelefono">Telfono Principal de la empresa</label>
                    </div>
                </div>
                <div class="col-sm-9 col-md-9 col-xs-9">
                    <div class="input-field">
                        <input id="txtDireccion" name="txtDireccion" placeholder="" type="text" class="validate">
                        <label for="txtDireccion">Direccion de la emmpresa</label>
                    </div>
                </div>
                
                
                <div class="clearfix"></div><br>
                 <div class="col-sm-8 col-md-8 col-xs-8">
                    <div class="input-field">
                        <input id="txtCorreo" name="txtCorreo" placeholder="" type="text" class="validate">
                        <label for="txtCorreo">Correo Electronico</label>
                    </div>
                </div>
                <div class="col-sm-4 col-md-4 col-xs-4">
                       <select class="search selection" id="selectRubro" name="selectRubro">
                            <%
                              DaoEmpresa daop= new DaoEmpresa();
                              List<Rubro> lstP=daop.listarRubros();
                              for(Rubro c:lstP){
                            %>
                                <option value="<%=c.getIdRubro()%>"><%=c.getNombre()%></option>

                            <%
                               }
                            %>
                        </select>
                       <label for="selectRubro">Rubro principal de la emmpresa</label>
                    
                </div>    
                
                <div class="clearfix"></div><br>
                <div class="col-sm-2 col-md-2 col-xs-2"></div>
                <div class="col-sm-4 col-md-4 col-xs-4">
                    <select class="search selection" id="selectDepa" name="selectDepa">
                                
                    </select>
                    <label for="selectDepa">Departamento</label>
                </div>
                <div class="col-sm-4 col-md-4 col-xs-4">
                    <select class="search selection" id="selectProv" name="selectProv">
                                
                    </select>
                    <label for="selectProv">Provincia</label>
                </div>
                
                
                <div class="clearfix"></div><br><br>
                <div class="col-sm-10 col-md-10 col-xs-10">
                    <div class="col-sm-5 col-md-5 col-xs-5">
                        <label class="label-control">
                            Imagen para las vistas en miniatura<br>
                            se recominenda que esta sea de tamañ 250px x 250px.
                        </label>
                    </div>
                    
                    <input type="hidden" id="imagenOculta1">
                    <input type="hidden" id="imagenOculta2">
                    
                    <div class="col-sm-7 col-md-7 col-xs-7">
                        <div class="file-field input-field">
                            <div class="btn">
                              <span>Seleccionar</span>
                              <input type="file" id="img1" name="img1" >
                            </div>
                            <div class="file-path-wrapper">
                              <input class="file-path validate" type="text">
                            </div>
                          </div>
                    </div>
                    
                </div>
                <div class="clearfix"></div>
                <br><br>
                <div class="col-sm-10 col-md-10 col-xs-10">
                    <div class="col-sm-5 col-md-5 col-xs-5">
                        <label class="label-control">
                            Imagen para la vista del perfil se<br>
                            recominenda que esta sea de tamaño 1100px x 375px.
                        </label>
                    </div>
                    <div class="col-sm-7 col-md-7 col-xs-7">
                        <div class="file-field input-field">
                            <div class="btn">
                              <span>Seleccionar</span>
                              <input type="file" id="img2" name="img2">
                            </div>
                            <div class="file-path-wrapper">
                              <input class="file-path validate" type="text">
                            </div>
                          </div>
                    </div>
                </div><br>
                <div class="clearfix"></div>
                <br><br>
                <div class="col-sm-4 col-md-4 col-xs-4">
                        <label class="label-control">
                            Para que logres tener un mejor impacto llena<br>
                            los siguientes campos con los links.
                        </label>
                    </div>
                    <div class="col-sm-8 col-md-8 col-xs-8">
                        <div class="col-sm-2 col-md-2 col-xs-2">Pagina Web</div>
                        <div class="col-sm-10 col-md-10 col-xs-10">
                            <input id="txtPagina" name="txtPagina" placeholder="" type="text" class="validate">
                        </div>
                        <div class="col-sm-2 col-md-2 col-xs-2">Facebook</div>
                        <div class="col-sm-10 col-md-10 col-xs-10">
                            <input id="txtFace" name="txtFace" placeholder="" type="text" class="validate">
                        </div>
                        <div class="col-sm-2 col-md-2 col-xs-2">Instagram</div>
                        <div class="col-sm-10 col-md-10 col-xs-10">
                            <input id="txtInsta" name="txtInsta" placeholder="" type="text" class="validate">
                        </div>
                    </div> 
                <input id="txtIdEmpresa"   type="hidden" class="validate">
                <div class="clearfix"></div><br><br>
                <div class="col-md-6 col-sm-6 col-xs-6"></div>
                <div class="col-md-2 col-sm-2 col-xs-2 btn" id="cancelarCambio">
                    CANCELAR
                </div>
                <input type="submit" class="col-md-4 col-sm-4 col-xs-4 btn" >
              </form>
            </div>
            <div class="col s1"></div>
        </div>
<div class="clearfix"></div>
        
        <div class="row" id="contPrincipal"><br>
            <div class="col s2"></div>
            <div class="col s8">
                <div class="col-md-12 col-md-12 col-xs-12 jumbotron ">
                    
                    
                        <div class="col-md-3 col-sm-3 col-xs-3"></div>
                        <div class="col-md-7 col-sm-7 col-xs-7">
                            <p id="lblNombre" style="font-size: 30px;"></p>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-1 col-sm-1 col-xs-1"></div>
                        <div class="col-md-10 col-sm-10 col-xs-10">
                            <h6><label class="label-control">
                                    <p id="lblDes"></p>
                                </label>
                            </h6>
                        </div>
                </div>
                <div class="clearfix"></div>
                
                <div class="col-md-12 col-sm-12 col-xs-12">
                    
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <div  class="card grey lighten-5" style="margin-bottom:0px; margin-top: 0px;">
                            <div class="card-content ">
                              <p id="lblMision"></p>
                            </div>
                            <div class="card-action teal lighten-1 white-text">
                              <a class="white-text">MISION</a>  
                            </div>
                          </div>
                    </div>
                    <div class="col-md-5 col-sm-5 col-xs-5">
                        <div class="card grey lighten-5" style="margin-bottom:0px; margin-top: 0px;">
                            <div class="card-content">
                              <span class="card-title "></span>
                              <p id="lblVision"></p>
                            </div>
                            <div class="card-action  teal lighten-1">
                                <a class="white-text">Vision</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-2" id="btnActivarMod">
                        <div class="card">
                        <div class="card-content">
                            <img src="../../Contenido/Imagenes/empresas/ajustes.png" height="80px" width="80px" />
                        </div>
                      </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-2"></div>
            </div>
            <div class="col s8"></div>
        </div>                

        
    </body>
</html>
