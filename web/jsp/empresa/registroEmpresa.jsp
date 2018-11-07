<%-- 
    Document   : registroEmpresa
    Created on : 10-26-2018, 05:07:37 PM
    Author     : josue
--%>

<%@page import="com.modelos.Pais"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DaoPais"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NetJob</title>
        <jsp:include page="../../utilidades/frontend/headerLinks.jsp" />
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/empresa/registroEmpresa.js" type="text/javascript"></script>
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
        <div class="row">
            
            <div class="s1 m1"></div>
            <div class="s10 m10">
                <div class="col-sm-12 col-md-12 col-xs-12">
                     <div class="container">
                        <div class="jumbotron">
                            <div class="container">
                          <h3>Registrate</h3> <br>
                          <form action="action">
                            <div class="input-field col-md-6 col-md-6 col-xs-6">
                                <input id="txtNombre" name="txtNombre" type="text" class="validate">
                                <label for="txtNombre">Nombre de la Empresa</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="txtCorreo" name="txtCorreo" type="email" class="validate">
                                <label for="txtCorreo">Correo Electronico</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="txtTelefono" name="txtTelefono" type="text" class="validate">
                                <label for="txtTelefono">Telefono</label>
                            </div>
                            
                            <div class="input-field col s6">
                                <input id="txtUsuario" name="txtUsuario" type="text" class="validate">
                                <label for="txtUsuario">Usuario</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="txtPass" name="txtPass" type="password" class="validate">
                                <label for="txtPass">Contraseña</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="txtRePass" name="txtRePass" type="password" class="validate">
                                <label for="txtRePass">Repetir Contraseña</label>
                            </div>
                            <div class="input-field col s6">
                                
                                <select id="selectPais" class="mierda">
                                    <% 
                                    DaoPais d = new DaoPais();
                                    List<Pais> comboPais = d.mostrarPais();
                                     
                                        for (int i = 0; i < comboPais.size(); i++) {
                                        Pais combo = (Pais)comboPais.get(i);
                                    %>
                                    <option value="<%= combo.getIdPais() %>" id="<%= combo.getIdPais() %>"><%= combo.getPais() %></option>
                                  
                                  <% } %>
                                </select>
                                <label for="selectPais">Seleccionar Area de la empresa</label>
                            </div>
                                <div class="col s2"></div>
                            <div class="waves-effect waves-green btn btn-danger" id="btnRegistrar" >
                                Registrar
                            </div>
                           </form>
                          </div>
                       </div>
                     </div>
                </div>
            </div>
            <div class="s1 m1"></div>
            
        </div>    
        
    </body>
    <footer class=" teal lighten-2">
     
        <div class="row">
            <div class="col s1"></div>
            <div class="col s10">
                <div class="col-md-12 col-sm-12 col-xs-12" style="height: 80px;">
                    <div class="col-md-1 col-sm-1 col-xs-1"></div>
                    <div class="col-md-7 col-sm-7 col-xs-7">
                    <h5><br>¿Eres una empresa? se parte de nuestra familia y  logra muchas cosas.!<br><br></h5>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4">
                        <img src="Contenido/Imagenes/Sistema/iconos.png" width="250px" height="65px" />
                    </div>
                </div>
                <div class="clearfix"></div>
                
                <br>
                <div class="col-md-1 col-sm-1 col-xs-1"></div>
                <div class="col-md-4 col-sm-4 col-xs-4">
                    <div class="btn btn-default" id="btnAbrirRegistro">
                    Ver Mas..
                    </div>
                </div>
                
            </div>
            <div class="col s1"></div>
            <div class="clearfix"l></div>
            <div class="s12" style="background-color: #00897b; height: 50px; font-size: 16px; width: 100%;"><br>
                    <center>  NETJOB todos los derechos reservados por Copyright. © 2018  </center>
            </div>
            
        </div>
     
  </footer>
</html>
