<%-- 
    Document   : RegistroUsuarios
    Created on : 10-30-2018, 11:36:12 AM
    Author     : Carlos_Campos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <jsp:include page="utilidades/frontend/headerLinks.jsp" />
        <script src="js/index.js" type="text/javascript"></script>
    </head>
    <body>
        
        
        <p>Registro de Usuarios</p>
        <center><div class="container">
        <br><br><br>
          <div class="form-column col-md-4 col-sm-4 col-xs-4" ></div>
                <div class="card card-container form-column col-md-5 col-sm-5 col-xs-5" >


                  
                    
                    <div class="content-form">
          
                    <p id="profile-name" class="profile-name-card"></p>
                    <form class="form-signin" method="POST" id="registroUsuario">
                        
                        <span id="reauth-user" class="reauth-user"></span>
                        
                        <input type="text" name="user" class="form-control" placeholder="Usuario" value="" required autofocus id="user">
                        
                        <input type="password" name="pass" class="form-control" placeholder="Contraseña" value="" required id="pass">
                        <input type="password" name="secondPassword" class="form-control" placeholder="Reescriba su Contraseña" value="" required id="pass2">
                        <input type="hidden" name="key"  value="addPost"/>
                        <input type="hidden" name="rol"  value="3"/>
                        
                        
                        <div id="remember" class="checkbox">
                            <label>
                                <input type="checkbox" value="remember-me" name="recordar"> Recordarme
                            </label>
                        </div>
                        <div class="btn btn-lg btn-primary btn-block btn-signin"  id="add">REGISTRARSE</div>
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
