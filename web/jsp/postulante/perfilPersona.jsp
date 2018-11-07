<%-- 
    Document   :perfilPersona
    Created on : 10-26-2018, 04:58:03 PM
    Author     : josue
--%>

<%@page import="java.util.List"%>
<%@page import="com.dao.DaoOferta"%>
<%@page import="com.modelos.Oferta"%>
<%@page import="com.modelos.Postulante"%>
<%@page import="com.dao.DaoPostulante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:include page="../../utilidades/frontend/headerLinks.jsp" />
          <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
         <script src="../../js/postulante/personas.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <%
            HttpSession sesion= request.getSession();
            
            
                //extrayendo la informacion
               
                DaoPostulante daop= new DaoPostulante();
                Postulante post= daop.getInfo(Integer.parseInt(sesion.getAttribute("idUsuario").toString()));
                
              
                 sesion.setAttribute("idPostulante", post.getIdPostulante());
                
                

       %>
    </head>
    <header>
        <nav class="teal lighten-2">
            <div class="nav-wrapper teal lighten-2">
                
                <ul id="nav-mobile" class="left hide-on-med-and-down" style="margin-left: 5%;">
                    <li>
                        <img src="../../Contenido/Imagenes/Sistema/netjob.png" height="50px" width="50px" class="d-inline-block align-top" >
                        &nbsp;&nbsp;&nbsp;
                    </li>
                    
                    <li class="active"><a href="#">Home</a></li>
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown2">Mi Información</a></li>
                    
                </ul>
                
                <ul id="nav-mobile" class="right hide-on-med-and-down" style="margin-right:10%; width: 150px; ">
                    
                    <li style="width: 300px;">
                        <a class="dropdown-trigger" href="#!" data-target="dropdown1">
                <img src="data: image / jpg; base64, <%= post.getBase64Image() %>" class="rounded-circle " width="35px" height="35px" style="border-radius: 16px;">&nbsp;<%=post.getNombres()%>
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
                
                <!-- COntenedor del submenu de mi informacion -->
                 <ul id="dropdown2" class="dropdown-content" style="width: 300px;">
                      <li><a href="Experiencia.jsp">Experiencia Laboral</a></li>
                      <li><a href="Habilidades.jsp">Mis Habilidades</a></li>
                      
                </ul>
                
                
            </div>
         </nav>
    </header>
    <body>
       <br><br>
        
        
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
        <div class="col-md-10 col-sm-10 col-xs-10">
            
           
             <div class=" col-md-12 col-xs-12 col-sm-12 contenedorTargetas">
               <div class=" col-md-12 col-xs-12 col-sm-12">
                <%
                    
                        Postulante pst=daop.getSpecificInfo(Integer.parseInt(sesion.getAttribute("idPostulantePerfil").toString()));
                  
                %>
                <div class="row">
                    <div class="col s12 m7">
                        <div class="card">
                            <div class="card-image">
                                <img src="data: image / jpg; base64, <%= pst.getBase64Image() %>">
                                <span class="card-title" style="color: #000; text-shadow: 1px 2px 3px solid #fff; "><%=pst.getNombres() %> <%=pst.getApellidos() %></span>
                            </div>
                            <div class="card-content">
                                <ul class="collection">
                                    <li class="collection-item"><%=pst.getGenero() %></li>
                                    <li class="collection-item"><%=pst.getFechaNacimiento() %></li>
                                    <li class="collection-item"><%=pst.getTelefono() %></li>
                                    <li class="collection-item"><%=pst.getIdPais() %></li>
                                    <li class="collection-item"><%=pst.getIdPais() %></li>
                                    <li class="collection-item"><%=pst.getIdDepartamento() %></li>
                                    <li class="collection-item"><%=pst.getIdProvincia() %></li>
                                    <li class="collection-item"><%=pst.getCorreo() %></li>
                                    <li class="collection-item"><%=pst.getIdProfesion() %></li>
                                    <li class="collection-item"><%=pst.getIdGradoEstudio() %></li>
                                    <li class="collection-item"><%=pst.getIdIdioma() %></li>

                                    


                                                                        

                                    
                                   
                                    
                                    
                                </ul>
                            </div>
                            <div class="card-action">
                                <a href="#">This is a link</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <%
                
                %>
                    
            </div>
            </div>
        </div>
    
        
        <!-- Contenedor margen derecho-->
        <div class="col-md-1 col-sm-1 col-xs-1"></div>
</html>
