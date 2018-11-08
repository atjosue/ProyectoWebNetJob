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
        <jsp:include page="../../utilidades/frontend/assets/headerEstadistica.jsp"/>
        <script src="../../js/empresa/dashBoardEmpresa.js" type="text/javascript"></script>
        <link href="../../css/empresa/dashBoardEmpresa.css" rel="stylesheet" type="text/css"/>
        <script src="../../utilidades/frontend/Ajax_Canvas/underscoreJS.js" type="text/javascript"></script>
        <link href="../../css/empresa/AnimateCss.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/empresa/EstadisticaEmpresa.js" type="text/javascript"></script>
        <script src="../../js/empresa/GraficoEmpresa.js" type="text/javascript"></script>
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
                    <li class="active"><a  href="#menu1">Estadisticas</a></li>
                    <li><a  href="gestionOfertas.jsp">Gestion de Ofertas</a></li>
                    <li><a href="#menu3">Gestion de Solicitudes</a></li>
                </ul>
            </div>
          </nav>

        <!-- Contenedor del submenu de opciones -->
                <ul id="dropdown1" class="dropdown-content" style="width: 150px;">
                      <li><a href="gestionPerfil.jsp"><span class="glyphicon glyphicon-user"></span> Perfil</a></li>
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
                   
                     <div class="pcoded-content">
                                <div class="pcoded-inner-content">

                                    <div class="main-body">
                                        <div class="page-wrapper">
                                            <div class="page-header">
                                                <div class="page-header-title">
                                                    <h4>Dashboard</h4>
                                                </div>
                                                <div class="page-header-breadcrumb">
                                                    <ul class="breadcrumb-title">
                                                        <li class="breadcrumb-item">
                                                            <a href="#!">
                                                                <i class="icofont icofont-home"></i>
                                                            </a>
                                                        </li>
                                                        <li class="breadcrumb-item"><a href="#!">Dashboard</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="page-body">
                                                <div class="row">
                                                    <div class="col-md-7 col-xl-2">
                                                        <!-- table card start -->
                                                        <div class="card table-card">
                                                            <div class="">
                                                                <div class="row-table">
                                                                    <div class="col-sm-6 card-block-big br">
                                                                        <div class="row">
                                                                            <div class="col-sm-4">
                                                                                <i class="icofont icofont-eye-alt text-success"></i>
                                                                            </div>
                                                                            <div class="col-sm-8 text-center">
                                                                                <h5><div id="idUsuariosA"></div></h5>
                                                                                <span>Usuarios Activos</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6 card-block-big">
                                                                        <div class="row">
                                                                            <div class="col-sm-4">
                                                                                <i class="icofont icofont-ui-music text-danger"></i>
                                                                            </div>
                                                                            <div class="col-sm-8 text-center">
                                                                                <h5><div id="idEmpresasA"></div></h5>
                                                                                <span>Empresas Activas</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="">
                                                                <div class="row-table">
                                                                    <div class="col-sm-6 card-block-big br">
                                                                        <div class="row">
                                                                            <div class="col-sm-4">
                                                                                <i class="icofont icofont-files text-info"></i>
                                                                            </div>
                                                                            <div class="col-sm-8 text-center">
                                                                                <h5><div id="idOfertasEs"></div></h5>
                                                                                <span>ofertas</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6 card-block-big">
                                                                        <div class="row">
                                                                            <div class="col-sm-4">
                                                                                <i class="icofont icofont-envelope-open text-warning"></i>
                                                                            </div>
                                                                            <div class="col-sm-8 text-center">
                                                                                <h5><div id="idPost"></div></h5>
                                                                                <span>Post</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- table card end -->
                                                    </div>
                                                    
                                                    <div class="col-md-5 col-xl-4">
                                                        <!-- widget primary card start -->
                                                        <div class="card table-card widget-primary-card">
                                                            <div class="">
                                                                <div class="row-table">
                                                                    <div class="col-sm-3 card-block-big">
                                                                        <i class="icofont icofont-star"></i>
                                                                    </div>
                                                                    <div class="col-sm-9">
                                                                        <h4><div id="idSeguidores"></div></h4>
                                                                        <h6>Seguidores</h6>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- widget primary card end -->
                                                        <!-- widget-success-card start -->
                                                        <div class="card table-card widget-success-card">
                                                            <div class="">
                                                                <div class="row-table">
                                                                    <div class="col-sm-3 card-block-big">
                                                                        <i class="icofont icofont-trophy-alt"></i>
                                                                    </div>
                                                                    <div class="col-sm-9">
                                                                        <h4><div id="idSeguidos"></div></h4>
                                                                        <h6>Siguiendo</h6>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- widget-success-card end -->
                                                    </div>
                                                    <div class="col-md-12">

                                                        <div class="col-md-7 col-xl-4">
                                                            <div class="card">




                                                                <div id="chartContainer" style="height: 300px; width: 100%;">


                                                                </div>




                                                            </div>
                                                        </div>
                                                        <div class="col-md-5 col-xl-4">
                                                            <div class="card">


                                                            </div>
                                                        </div>
                                                    </div>



                                                </div>
                                            </div>
                                        </div>
                                    </div>
                     
                     
                     
                     
                     
                     
                 </div>
                 <!-- FIN CONTENEDOR PARA LAS ESTADISTICAS -->
                 
               
               
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


