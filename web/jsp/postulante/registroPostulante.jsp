<%-- 
    Document   : registroPostulante
    Created on : 10-26-2018, 05:07:53 PM
    Author     : josue
--%>

<%@page import="java.util.List"%>
<%@page import="com.dao.*"%>
<%@page import="com.modelos.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../utilidades/frontend/materialize/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="../../utilidades/frontend/Semantic-UI-CSS-master/semantic.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../utilidades/frontend/bootstrap/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../utilidades/frontend/materialize/js/materialize.min.js" type="text/javascript"></script>
        <script src="../../utilidades/frontend/Semantic-UI-CSS-master/semantic.min.js" type="text/javascript"></script>
        <script src="../../js/postulante/registrarPostulante.js" type="text/javascript"></script>
        
        <title>Información de Perfil</title>
        
        <!-- codigo jsp -->
        
        <%
                Pais pa= new Pais();
                
        %>
    </head>
    <body>
        
        
        <div class="container white" style="min-height: 100vh; padding: 20px; ">
                
             <div class="row">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s6 ">
          <input id="nombres" type="text" class="validate">
          <label for="nombres">Nombres</label>
        </div>
        <div class="input-field col s6">
          <input id="apellidos" type="text" class="validate">
          <label for="nombres">Apellidos</label>
        </div>
      </div>
      <div class="row">
         <div class="input-group col s6">
             <label>Genero</label><br>
      <label>
          <input name="genero" type="radio" checked  value="Femenino"/>
          <span>Femenino</span>
      </label>
       <label>
          <input name="genero" type="radio" checked  value="Masculino"/>
          <span>Masculino</span>
      </label>
         
        </div>
           <div class="input-field col s6">
          <input id="fecha" type="text" class="datepicker">
          <label for="nombres">Fecha de Nacimiento</label>
        </div>
      </div>
         <div class="row">
        <div class="input-field col s6 ">
          <input id="telefono" type="text" class="validate">
          <label for="telefono">Telefono</label>
        </div>
        <div class="input-field col s6">
            
            <select class="search selection" id="pais">
                <%
                                DaoPais daop= new DaoPais();
                                
                                List<Pais> lstP=daop.mostrarPais();
                                for(Pais c:lstP)
                                {
                            %>
                            <option value="<%=c.getIdPais()%>"><%=c.getPais()%></option>
                
                <%
                    }
                %>
            </select>
          <label for="pais">Pais</label>
        </div>
      </div>
        <div class="row">
        <div class="input-field col s6 ">
          <select class="search selection" id="departamento">
               
                            
                
              
            </select>
          <label for="departamento">Deparatamento</label>
        </div>
        <div class="input-field col s6">
            <select class="search selection" id="municipio">
                  <%
                                DaoProvincia daopro= new DaoProvincia();
                                
                                List<Provincia> lstpro=daopro.mostrarDeptoPorPais(6);
                                for(Provincia pro:lstpro)
                                {
                            %>
                            <option value="<%=pro.getIdProvincia()%>"><%=pro.getProvincia()%></option>
                
                <%
                    }
                %>
            </select>
          <label for="municipio">Municipio</label>
        </div>
      </div>
        
        <div class="row">
        <div class="input-field col s6 ">
            <input id="correo" type="email" class="validate">
          <label for="correo">Correo</label>
        </div>
        <div class="input-field col s6">
            <label>Direccion</label>
            <textarea>
                
            </textarea>
        </div>
      </div>
         <div class="row">
        <div class="input-field col s6 ">
          <select class="search selection" id="profesion">
                <%
                                DaoProfesion daopf= new DaoProfesion();
                                
                                List<Profesion> lstpf=daopf.mostrarProfesiones();
                                for(Profesion pf:lstpf)
                                {
                            %>
                            <option value="<%=pf.getIdProfesion()%>"><%=pf.getNombre()%></option>
                
                <%
                    }
                %>
            </select>
          <label for="departamento">Profesion</label>
        </div>
        <div class="input-field col s6">
            <select class="search selection" id="gradoEstudio">
                <%
                                DaoGradoEstudio daog= new DaoGradoEstudio();
                                
                                List<GradoEstudio> lstg=daog.mostrarGrado();
                                for(GradoEstudio g:lstg)
                                {
                            %>
                            <option value="<%=g.getIdGradoEstudio()%>"><%=g.getGrado()%></option>
                
                <%
                    }
                %>
            </select>
          <label for="municipio">Grado de Estudio</label>
        </div>
      </div>
         <div class="row">
        <div class="input-field col s6 ">
          <select class="search selection" id="idiomas">
                <%
                                DaoIdioma daoi= new DaoIdioma();
                                
                                List<Idioma> lsti=daoi.mostrarIdioma();
                                for(Idioma i:lsti)
                                {
                            %>
                            <option value="<%=i.getIdIdioma()%>"><%=i.getIdioma()%></option>
                
                <%
                    }
                %>
            </select>
          <label for="departamento">Idiomas</label>
        </div>
      </div>
        
     <div class="row">
        <div class="input-field col s12 ">
            <button class="btn blue waves-light" > Guardar Cambios</button>
            <button class="btn green waves-light" > Cancelar</button>
        </div>
      </div>
     
    </form>
  </div>
        
   </div><!--fin CONTAINER-->
        
    </body>
</html>
