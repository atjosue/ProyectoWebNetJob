<%-- 
    Document   : dashBoardAdmin
    Created on : 10-26-2018, 04:54:46 PM
    Author     : josue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administracion NetJob</title>
        <jsp:include page="../../utilidades/frontend/headerLinks.jsp" />
        <script src="../../js/admin/dashBoardAdmin.js" type="text/javascript"></script>
    </head>
    
    <!-- Menu superior es ubicado en el header-->
    <header>
        <nav class="teal lighten-2">
            <div class="nav-wrapper teal lighten-2">
                
                <ul id="nav-mobile" class="left hide-on-med-and-down" style="margin-left: 5%;">
                    <li>
                        <img src="../../Contenido/Imagenes/Sistema/netjob.png" height="50px" width="50px" class="d-inline-block align-top" >
                        &nbsp;&nbsp;&nbsp;
                    </li>
                    
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Empresas</a></li>
                    <li><a href="#">Nuestro equipo</a></li>
                    <li><a href="#">¿Quines Somos?</a></li>
                </ul>
                
                <ul id="nav-mobile" class="right hide-on-med-and-down" style="margin-right:5%; width: 150px; ">
                    
                    <li style="width: 150px;">
                        <a class="dropdown-trigger" href="#!" data-target="dropdown1">
                            <img src="../../Contenido/Imagenes/postulantes/carla.jpg" class="rounded-circle " width="35px" height="35px" style="border-radius: 16px;"> Carlos
                        </a>
                        
                    </li>
                    
                    
                </ul>
                <!-- Contenedor del submenu de opciones -->
                <ul id="dropdown1" class="dropdown-content" style="width: 150px;">
                      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Perfil</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-unchecked"></span> Seguimiento</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-education"></span> Ayuda</a></li>
                      <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Log-Out</a></li>
                </ul>
                
            </div>
         </nav>
    </header>
    <body>
       <br><br>
        <div class="row">
        
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
        <div class="col-md-10 col-sm-10 col-xs-10">
            
            <!-- Contenedor de targetas del dashboard-->
                <div class=" col-md-12 col-xs-12 col-sm-12  contenedorTargetas">

                 <div class="row">
                     
                <!-- inicio de tarjeta-->
                
                    <div class="col-md-4 col-xs-4 col-sm-4">
                        <div class="card">
                          <div class="card-image">
                              <img src="../../Contenido/Imagenes/empresas/logoEmpresa1.png" width="20px" height="250px"/>
                            
                            <span class="card-title black-text">Gestion empresas</span>
                          </div>
                          <div class="card-content">
                            <p>Opcion para gestionar las distintas configuraciones de las empresas asi como
                          la informacion de estas</p>
                          </div>
                          <div class="card-action teal lighten-3">
                            <a href="#">Gestionar</a>
                          </div>
                        
                        </div>
                    </div>
                 
                <!-- inicio de tarjeta-->
                    <div class="col-md-4 col-xs-4 col-sm-4">
                        <div class="card">
                          <div class="card-image" width="20px" height="250px">
                              
                              <img src="../../Contenido/Imagenes/postulantes/logoUsuarios1.png" width="20px" height="250px" />
                              <span class="card-title black-text">Gestion Usuarios</span>
                          </div>
                          <div class="card-content">
                              <p>
                                  Acceder a una gestion de los usuarios de NetJob entre los cuales estan
                              los datos de la cuenta e informacion personal.
                              </p>
                          </div>
                          <div class="card-action teal lighten-3">
                            <a href="#">Gestionar</a>
                          </div>
                        
                        </div>
                    </div>
                
                <!-- inicio de tarjeta-->
                    <div class="col-md-4 col-xs-4 col-sm-4">
                        <div class="card">
                          <div class="card-image">
                              <img src="../../Contenido/Imagenes/Sistema/logoAdmin1.png" width="250px" height="250px"/>
                            
                            <span class="card-title black-text">Gestion Administradores</span>
                          </div>
                          <div class="card-content">
                              <p>
                                  en esta opcion puedes acceder a la gestion de los administradores de la aplicacion web de NETJOB
                              </p>
                          </div>
                          <div class="card-action teal lighten-3 black-text">
                            <a href="#">Gestionar</a>
                          </div>
                        
                        </div>
                    </div>
                
                  </div>

            </div>
        </div>
        
        <!-- Contenedor margen derecho-->
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
   
    </body>
</html>
