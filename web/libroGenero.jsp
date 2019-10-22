<%-- 
    Document   : libroGenero
    Created on : 10-09-2019, 08:25:31 PM
    Author     : ADMIN
--%>

<%@page import="com.modelo.Genero"%>
<%@page import="com.modelo.Libro"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DaoLibro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>Biblioteca Online</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <jsp:include page="layout/css.jsp"></jsp:include>
  
  <%
      DaoLibro daoL=new DaoLibro();
  %>
  
    </head>
     <body>
    <jsp:include page="layout/menu_pages.jsp"></jsp:include>
      
   
    <div class="container mt-5">
        <br><br><br><br><br><br>
        <div class="row">
        <div class="span12">
          <div class="heading">
            <h3><span>Genero de Libros</span></h3>
          </div>
            <br><br><br>
            
       <%
          List<Genero> g = daoL.listarGenero();
          for (Genero ge : g) {
      %>
          <div class="heading">
           <h3><span><%= ge.getNombre() %> </span></h3>
           <br>
           <br>
          </div>
          <div class="row">
      <%
          List<Libro> ls = daoL.verLibroGenero(ge.getIdGenero());
          for (Libro lib : ls) {
      %>
      <div class="span3">
          <img src="assets/img/libro/<%= lib.getImagen()%>" alt="<%= lib.getNombre()%>" width="400" height="400" class="img-polaroid" />
          <div class="roles">
              <h5><strong><%= lib.getNombre()%></strong></h5>
              <p>
                  <b>Genero: </b><a href="genero.jsp?g=<%= lib.getGenero().getIdGenero() %>"><%= lib.getGenero().getNombre()%></a>
              </p>
              <a href="ver-libro.jsp?l=<%= lib.getIdLibro() %>" class="btn btn-theme">Leer mas</a>
          </div>
      </div>
      <%
          }
      %>
      
          </div>
      <br><br><br>
    <%
      }
    %>
    </div>
    </div>
    </div>
     <jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>
