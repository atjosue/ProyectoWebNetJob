<%-- 
    Document   : index
    Created on : 10-26-2018, 04:00:07 PM
    Author     : josue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NetJob</title>
        <jsp:include page="utilidades/frontend/headerLinks.jsp" />
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
    </head>
    <header>
        <nav class="teal lighten-2">
            <div class="nav-wrapper teal lighten-2">
                
                <ul id="nav-mobile" class="left hide-on-med-and-down" style="margin-left: 2%;">
                    <li>
                        <img src="Contenido/Imagenes/Sistema/netjob.png" height="50px" width="50px" class="d-inline-block align-top" >
                        &nbsp;&nbsp;&nbsp;
                    </li>
                    
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Empresas</a></li>
                    <li><a href="#equipo">Nuestro equipo</a></li>
                    <li><a href="#aboutUs">¿Quines Somos?</a></li>
                </ul>
                
                <ul id="nav-mobile" class="right hide-on-med-and-down" style="margin-right:5%;">
                    <form class="navbar-form navbar-left" action="/action_page.php" style="margin-top: 2px;">
                        <div class="form-group">
                          <input type="text" class="form-control teal lighten-2" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default lighten-3">Submit</button>
                    </form>
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Login</a></li>
                </ul>
            </div>
         </nav>
    </header>
    <body>
            <!-- PRUEBAAAA -->
            
            <div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 600px;">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox" style="height: 600px;">
              <div class="item active" style="height: 600px;">
                <img class="sombraIMG" src="Contenido/Imagenes/Sistema/carousel4.jpg" width="100%" height="600px"/>
                <div class="carousel-caption">
                  <h3>Porque el Futuro es Hoy y este, en tus propias manos.</h3>
                  <p>NETJOB</p>
                </div> 
              </div>

              <div class="item" style="height: 600px;">
                <img class="sombraIMG" src="Contenido/Imagenes/Sistema/carousel1.jpg" width="100%" height="600px"/>
                <div class="carousel-caption">
                  <h3>"Cuando todo estaba hecho...decidimos mejorarlo. NetJob, la Red social de empleos."</h3>
                  <p>Josue Amaya, CEO de NETJOB</p>
                </div> 
              </div>

              <div class="item" style="height: 600px;">
                <img class="sombraIMG" src="Contenido/Imagenes/Sistema/carousel5.jpg" width="100%" height="500px"/>
                <div class="carousel-caption">
                  <h3>NETJOB es la solucion a el problema  mas grande de muchas empresas</h3>
                  <p>¿Que esperas se parte de esto?</p>
                </div> 
              </div>
              <div class="item" style="height: 600px;">
                  <img class="sombraIMG" src="Contenido/Imagenes/Sistema/carousel6.jpg" width="100%" height="500px"/>
                <div class="carousel-caption">
                  <h3>Mas que una pagina... un mundo de posibilidades.</h3>
                  <p>NETJOB</p>
                </div> 
              </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
            
            
            <!-- FIN PRUEBAAAA -->
        
        <div class="clearfix"></div>
        <div class="row">
            <div class="s1 m1"></div>
            <div class="s10 m10">
                
                <div class="col-sm-12 col-md-12 col-xs-12">
                    
                     <!-- PARTE DE ACERCA DE NOSOTROS -->
                     <br>
                     <div class="container">
                        <div class="jumbotron">
                          <h1>NetJob</h1> 
                          <p>
                              La aplicacion de busquedas de empleo que llego para quedarse.
                              Nada mejor que encontrar un empleo desde tu casa ¿no?
                              con NetJob todo es asi de facil!!.
                          </p> 
                        </div> 
                     </div>
                     <br>
                     
                     <!-- PARTE DE Empleos rapidos -->
                     
                     <div class="panel panel-default">
                         
                         <div class="panel-body">
                             <div class="row">
                                 
                                 <div class="col l3 m6 s12">
                                      <div class="card">
                                        <div class="card-image waves-effect waves-block waves-light">
                                          <img class="activator" src="images/office.jpg">
                                        </div>
                                        <div class="card-content">
                                          <span class="card-title activator grey-text text-darken-4">Administrador de Base de datos<i class="material-icons right">more_vert</i></span>
                                          <p><a href="login.jsp">Ver mas...</a></p>
                                        </div>
                                        <div class="card-reveal">
                                          <span class="card-title grey-text text-darken-4">Admin de Base de datos<i class="material-icons right">close</i></span>
                                          <p>Para conocer mas acerca de esta oferta laboral porfavor inicia sesion</p>
                                        </div>
                                      </div>
                                 </div>
                                 <div class="col l3 m6 s12">
                                      <div class="card">
                                        <div class="card-image waves-effect waves-block waves-light">
                                          <img class="activator" src="images/office.jpg">
                                        </div>
                                        <div class="card-content">
                                          <span class="card-title activator grey-text text-darken-4">Administrador de Base de datos<i class="material-icons right">more_vert</i></span>
                                          <p><a href="login.jsp">Ver mas...</a></p>
                                        </div>
                                        <div class="card-reveal">
                                          <span class="card-title grey-text text-darken-4">Admin de Base de datos<i class="material-icons right">close</i></span>
                                          <p>Para conocer mas acerca de esta oferta laboral porfavor inicia sesion</p>
                                        </div>
                                      </div>
                                 </div>
                                 <div class="col l3 m6 s12">
                                      <div class="card">
                                        <div class="card-image waves-effect waves-block waves-light">
                                          <img class="activator" src="images/office.jpg">
                                        </div>
                                        <div class="card-content">
                                          <span class="card-title activator grey-text text-darken-4">Administrador de Base de datos<i class="material-icons right">more_vert</i></span>
                                          <p><a href="login.jsp">Ver mas...</a></p>
                                        </div>
                                        <div class="card-reveal">
                                          <span class="card-title grey-text text-darken-4">Admin de Base de datos<i class="material-icons right">close</i></span>
                                          <p>Para conocer mas acerca de esta oferta laboral porfavor inicia sesion</p>
                                        </div>
                                      </div>
                                 </div>
                                 <div class="col l3 m6 s12">
                                      <div class="card">
                                        <div class="card-image waves-effect waves-block waves-light">
                                          <img class="activator" src="images/office.jpg">
                                        </div>
                                        <div class="card-content">
                                          <span class="card-title activator grey-text text-darken-4">Administrador de Base de datos<i class="material-icons right">more_vert</i></span>
                                          <p><a href="login.jsp">Ver mas...</a></p>
                                        </div>
                                        <div class="card-reveal">
                                          <span class="card-title grey-text text-darken-4">Admin de Base de datos<i class="material-icons right">close</i></span>
                                          <p>Para conocer mas acerca de esta oferta laboral porfavor inicia sesion</p>
                                        </div>
                                      </div>
                                 </div>
                                 <div class="col l3 m6 s12">
                                      <div class="card">
                                        <div class="card-image waves-effect waves-block waves-light">
                                          <img class="activator" src="images/office.jpg">
                                        </div>
                                        <div class="card-content">
                                          <span class="card-title activator grey-text text-darken-4">Administrador de Base de datos<i class="material-icons right">more_vert</i></span>
                                          <p><a href="login.jsp">Ver mas...</a></p>
                                        </div>
                                        <div class="card-reveal">
                                          <span class="card-title grey-text text-darken-4">Admin de Base de datos<i class="material-icons right">close</i></span>
                                          <p>Para conocer mas acerca de esta oferta laboral porfavor inicia sesion</p>
                                        </div>
                                      </div>
                                 </div>
                                 <div class="col l3 m6 s12">
                                      <div class="card">
                                        <div class="card-image waves-effect waves-block waves-light">
                                          <img class="activator" src="images/office.jpg">
                                        </div>
                                        <div class="card-content">
                                          <span class="card-title activator grey-text text-darken-4">Administrador de Base de datos<i class="material-icons right">more_vert</i></span>
                                          <p><a href="login.jsp">Ver mas...</a></p>
                                        </div>
                                        <div class="card-reveal">
                                          <span class="card-title grey-text text-darken-4">Admin de Base de datos<i class="material-icons right">close</i></span>
                                          <p>Para conocer mas acerca de esta oferta laboral porfavor inicia sesion</p>
                                        </div>
                                      </div>
                                 </div>
                                 <div class="col l3 m6 s12">
                                      <div class="card">
                                        <div class="card-image waves-effect waves-block waves-light">
                                          <img class="activator" src="images/office.jpg">
                                        </div>
                                        <div class="card-content">
                                          <span class="card-title activator grey-text text-darken-4">Administrador de Base de datos<i class="material-icons right">more_vert</i></span>
                                          <p><a href="login.jsp">Ver mas...</a></p>
                                        </div>
                                        <div class="card-reveal">
                                          <span class="card-title grey-text text-darken-4">Admin de Base de datos<i class="material-icons right">close</i></span>
                                          <p>Para conocer mas acerca de esta oferta laboral porfavor inicia sesion</p>
                                        </div>
                                      </div>
                                 </div>
                                 <div class="col l3 m6 s12">
                                      <div class="card">
                                        <div class="card-image waves-effect waves-block waves-light">
                                          <img class="activator" src="utilidades/frontend/img/add_user.png" alt=""/>
                                        </div>
                                        <div class="card-content">
                                          <span class="card-title activator grey-text text-darken-4">Administrador de Base de datos<i class="material-icons right">more_vert</i></span>
                                          <p><a href="login.jsp">Ver mas...</a></p>
                                        </div>
                                        <div class="card-reveal">
                                          <span class="card-title grey-text text-darken-4">Admin de Base de datos<i class="material-icons right">close</i></span>
                                          <p>Para conocer mas acerca de esta oferta laboral porfavor inicia sesion</p>
                                        </div>
                                      </div>
                                 </div>
                                 
                                 
                                 
                             </div>
                         </div>
                     </div>
                      
                     <!-- PARTE DE ACERCA DE NOSOTROS -->
                     
                    <div class="row">
                        <div class="container-fluid bg-grey" id="aboutUs">
                        <div class="row">
                          <div class="col-sm-4"><br><br>
                              <center><img src="Contenido/Imagenes/Sistema/netjob.png"/></center>
                          </div>
                          <div class="col-sm-8"><br>
                            <h2>Nuestros Valores</h2><br><br>
                            <h4><strong>MISSION:</strong></h4>
                            <h6><br>
                                Ser la aplicacion web que ofresca mejores convenios para las empresas que necesitan evolucionar
                                la manera de presentar sus ofertas laborales asi como tambien esforzarnos por ofrecer a 
                                nuestros usuario el mejor servicio en cuanto a experiencia de busqueda de trabajo se refiere.
                            </h6><br><br>
                            <h4><strong>VISION:</strong></h4><br>
                            <h6>
                                Ser la la aplicacion web mas utilizada a nivel mundial en tanto experiencia y uso del sistema
                                se refiere. Ser la opcion mas efectiva para encontrar un empleo.
                            </h6><br><br><br>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                     <!-- PARTE DE NUESTRO EQUIPO -->
                        <br><br>
                        <div class="container-fluid text-center" id="equipo">
                        <h4>Mas que un equipo..una familia</h4>
                        <div class="row text-center">
                          <div class="col-sm-3">
                            <div class="thumbnail">
                              <img src="paris.jpg">
                              <p><strong>Josue Alexander Amaya</strong></p>
                              <p>CEO</p>
                            </div>
                          </div>
                          <div class="col-sm-3">
                            <div class="thumbnail">
                              <img src="newyork.jpg" >
                              <p><strong>Carlos Eduando Campos Ramos</strong></p>
                              <p>Palabrero</p>
                            </div>
                          </div>
                          <div class="col-sm-3">
                            <div class="thumbnail">
                              <img src="sanfran.jpg">
                              <p><strong>Luis Fernando Flamenco Galdamex </strong></p>
                              <p>Ejecutivo de Limpieza</p>
                            </div>
                          </div>
                          <div class="col-sm-3">
                            <div class="thumbnail">
                              <img src="sanfran.jpg" >
                              <p><strong>Kevin Luis Montiel de Pimentel</strong></p>
                              <p>Promotor Vocacional</p>
                            </div>
                          </div>
                      </div>
                    </div>
                    
                     
                    <!-- Parte de el mapa Google Maps -->
                    <br>
                    <div id="googleMap" style="height:400px;width:100%;">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d24567.825384544038!2d-89.27733162806386!3d13.674009237694076!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2ssv!4v1540687252239" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
                        
                    </div>
                
                    <!-- PARTE DE Contactanos -->
                    <br><br>
                    <div class="container-fluid bg-grey"><br>
                        <h2 class="text-center">Commentarios</h2><br><br>
                        <div class="row">
                          <div class="col-sm-5">
                            <p>Tus comentarios son Mas importantes de lo que crees. Ponte en contacto con nosotros</p>
                            <p><span class="glyphicon glyphicon-map-marker"></span> Santa Tecla, La Libertad</p>
                            <p><span class="glyphicon glyphicon-phone"></span> (503) 7578-7979 </p>
                            <p><span class="glyphicon glyphicon-envelope"></span> contacto_sv@netjob.com</p> 
                          </div>
                          <div class="col-sm-7">
                            <div class="row">
                              <div class="col-sm-6 form-group">
                                <input class="form-control" id="name" name="name" placeholder="Nombre" type="text" required>
                              </div>
                              <div class="col-sm-6 form-group">
                                <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
                              </div>
                            </div>
                            <textarea class="form-control" id="comments" name="comments" placeholder="Comentario" rows="5"></textarea><br>
                            <div class="row">
                              <div class="col-sm-12 form-group">
                                <button class="btn btn-default pull-right" type="submit">Send</button>
                              </div>
                            </div> 
                          </div>
                        </div>
                      </div>
   
                </div>
            </div>
            <div class="s1 m1"></div>
        </div>    
        
    </body>
</html>
