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
    </head>
    <body>
        <nav class="navbar navbar-default" style="">
            <div class="container-fluid">
              <div class="navbar-header">
                  <a class="navbar-brand" href="#">
                      <img src="Contenido/Imagenes/Sistema/netjob.png" height="50px" width="50px" class="d-inline-block align-top" style="margin-top: -14px;">
                  
                  </a>
              </div>
              <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Empresas</a></li>
                <li><a href="#">Nuestro equipo</a></li>
                <li><a href="#">¿Quines Somos?</a></li>
              </ul>
                <form class="navbar-form navbar-right" style="margin-right: 100px;" action="/action_page.php">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search">
                      <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">
                          <i class="glyphicon glyphicon-search"></i>
                        </button>
                      </div>
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right" style="margin-right: -350px">
                <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Login</a></li>
                
              </ul>
            </div>
          </nav>
        <br>
        
    </body>
</html>
