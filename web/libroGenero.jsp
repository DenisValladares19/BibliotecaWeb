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
  <jsp:include page="layout/css1.jsp"></jsp:include>
  
  <%
      DaoLibro daoL=new DaoLibro();
  %>
  
    </head>
     <body>
    <jsp:include page="layout/menu_pagep.jsp"></jsp:include>
     <div class="container">
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Genero de Libros </h2>
        <br><br><br>
       <%
          List<Genero> g = daoL.listarGenero();
          for (Genero ge : g) {
      %>
      
      <div class="container">
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0"> <%= ge.getNombre() %> </h2>
      <div class="row">
      <%
          List<Libro> ls = daoL.verLibroGenero(ge.getIdGenero());
          for (Libro lib : ls) {
      %>
      <div class="col-md-6 col-lg-4">
          <div class="mx-auto">
            <div class="d-flex align-items-center justify-content-center h-100 w-100">
              <div class="text-center text-white">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
          <img src="assets/img/libro/<%= lib.getImagen()%>" alt="<%= lib.getNombre()%>" width="300" height="200" class="img-fluid" />
          <div class="text-center">
              <h5><strong><%= lib.getNombre()%></strong></h5>
              <p>
                  <b>Genero: </b><a href="genero.jsp?g=<%= lib.getGenero().getIdGenero() %>"><%= lib.getGenero().getNombre()%></a>
              </p>
              <a href="ver-libro.jsp?l=<%= lib.getIdLibro() %>" class="btn btn-outline-primary">Leer mas</a>
          </div>
      </div>
           </div>
           
      <%
          }
      %>
      </div>
          </div>
      <br><br><br>
    <%
      }
    %>
    </div>
    </div>
     <jsp:include page="layout/footeer.jsp"></jsp:include>
</body>
</html>
