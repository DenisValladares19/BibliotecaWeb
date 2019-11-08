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
  <jsp:include page="layout/css1.jsp"></jsp:include>
  <%
      DaoAutor daoA = new DaoAutor();
      Autor a = new Autor();
  %>
</head>

<body>
    <jsp:include page="layout/menu_pagep.jsp"></jsp:include>
    <div class="container">
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0"> Autores </h2>
      <div class="row">
      <%
          List<Autor> ls = daoA.mostrarAutores();
          for (Autor u : ls) {
      %>
      
      <div class="col-md-6 col-lg-4">
          <div class="mx-auto">
            <div class="d-flex align-items-center justify-content-center h-100 w-100">
              <div class="text-center text-white">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
           <img src="assets/img/autor/<%= u.getImagen()%>" alt="<%= u.getNombre()%>" class="img-fluid" />
            <div class="text-center">
                <h5><strong><%= u.getNombre()%></strong></h5>
                <p>
                    <b>Genero: </b><a href="genero.jsp?g=<%= u.getGenero().getIdGenero() %>"> <%= u.getGenero().getNombre() %> </a>
                </p>
                <a href="autor.jsp?a=<%= u.getIdAutor()%>" class="btn btn-outline-primary">Leer mas</a>
            </div>
          <br>
          </div>
       </div>
      <%
          }
      %>
    </div>
    </div>
    <jsp:include page="layout/footeer.jsp"></jsp:include>
</body>
</html>
