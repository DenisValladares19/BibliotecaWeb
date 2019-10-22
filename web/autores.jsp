<%-- 
    Document   : autores
    Created on : 10-05-2019, 10:21:10 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="com.modelo.Autor"%>
<%@page import="com.dao.DaoAutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Biblioteca Online</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <jsp:include page="layout/css.jsp"></jsp:include>
  <%
      DaoAutor daoA = new DaoAutor();
      Autor a = new Autor();
  %>
</head>

<body>
    <jsp:include page="layout/menu_pages.jsp"></jsp:include>
    <div class="container mt-5">
        <br><br><br><br><br><br>
        <div class="row">
        <div class="span12">
          <div class="heading">
            <h3><span>Autores</span></h3>
          </div>
          <div class="sub-heading">
           
          </div>
        </div>
      </div>
      <div class="row">
      <%
          List<Autor> ls = daoA.mostrarAutores();
          for (Autor u : ls) {
      %>
      <div class="span3">
          <img src="assets/img/autor/<%= u.getImagen()%>" alt="<%= u.getNombre()%>" width="400" height="300" class="img-polaroid" />
          <div class="roles">
              <h5><strong><%= u.getNombre()%></strong></h5>
              <p>
                  <b>Genero: </b><a href="genero.jsp?g=<%= u.getGenero().getIdGenero() %>"> <%= u.getGenero().getNombre() %> </a>
              </p>
              <a href="autor.jsp?a=<%= u.getIdAutor()%>" class="btn btn-theme">Leer mas</a>
          </div>
          <br>
      </div>
      <%
          }
      %>
    </div>
    </div>
    <jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>
