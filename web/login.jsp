<%-- 
    Document   : login
    Created on : 10-26-2018, 05:07:11 PM
    Author     : josue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NetJob</title>
        <jsp:include page="utilidades/frontend/headerLinks.jsp" />
        <script src="js/index.js" type="text/javascript"></script>
    </head>
    <body>
        <center><div class="container">
        <br><br><br>
          <div class="form-column col-md-4 col-sm-4 col-xs-4" ></div>
                <div class="card card-container form-column col-md-5 col-sm-5 col-xs-5" >


                    <img id="profile-img" class="profile-img-card" src="Contenido/Imagenes/Sistema/netjob.png"/>
                    
                    <div class="content-form">
                        <h3>Inicia Sesión</h3>
                    <h4>¿NetJob? <a href="registroUsuarios.jsp">Regístrate</a></h4>
                    
                    <p id="profile-name" class="profile-name-card"></p>
                    <form class="form-signin" method="POST" id="infoUsuario">
                        <span id="reauth-user" class="reauth-user"></span>
                        <input type="text" name="user" class="form-control" placeholder="Usuario" value="" required autofocus id="user">
                        <input type="password" name="pass" class="form-control" placeholder="Password" value="" required id="pass">
                        <div id="remember" class="checkbox">
                            <label>
                                <input type="checkbox" value="remember-me" name="recordar"> Recordarme
                            </label>
                        </div>
                        <div class="btn btn-lg btn-primary btn-block btn-signin"  id="login">Iniciar Sesion</div>
                    </form><!-- /form -->
                    <a href="index.jsp" class="forgot-password">
                        Regresar
                    </a>
                </div><!-- /card-container -->
              </div>
            </div><!-- /container -->
        </center>
    </body>
</html>
