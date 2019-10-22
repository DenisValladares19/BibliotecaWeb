
<%@page import="com.modelo.Libro"%>
<%
    if(request.getParameter("l")!=null){
        
    
%>
<%-- 
    Document   : index
    Created on : 10-03-2019, 10:15:08 PM
    Author     : Admin
--%>
<%@page import="com.dao.DaoLibro"%>
<%@page import="java.util.List"%>
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
      DaoLibro daoL = new DaoLibro();
  %>
</head>

<body>
    <jsp:include page="layout/menu_pages.jsp"></jsp:include>
    <div class="container mt-5">
        <br><br><br><br><br><br>
        
            
                <% 
                    List<Libro> ls = daoL.verLibro(Integer.parseInt(request.getParameter("l")));                    
                    for(Libro l:ls){
                %>
                <div class="span12">
                  <div class="heading">
                    <h3><span><%= l.getNombre()%> </span></h3><br><br><br><br>
                  </div>
                </div>
                <div class="row">
                    <div class="span2"></div>
                    <div class="span4">
                    
                        <h5><strong>Autor: </strong><a href="autor.jsp?a=<%=  l.getAutor().getIdAutor() %>">  <%= l.getAutor().getNombre() %></a></h5>
                        <h5><strong>Genero: </strong><a href="genero.jsp?g=<%= l.getGenero().getIdGenero() %>"><%= l.getGenero().getNombre() %></a></h5>
                        <h5><strong>Fecha de Lanzamiento: </strong><%= l.getAnioLanzamiento() %></h5>
                        <h5><strong>Editorial: </strong><%= l.getEditorial().getNombre() %></h5>
                        <h5><strong>Edición: </strong><%= l.getEdicion() %></h5>
                        <input type="number" class="control-list" min="1"/><br>
                        <div class="row">
                            <div class="span2">
                                <button class="btn btn-success btn-block">Comprar</button>
                            </div>
                        </div>
                        <div class="row"><p> </p></div>
                        <div class="row">
                            <div class="span2">
                                <button class="btn btn-warning btn-block">Prestar</button>
                            </div>
                        </div>
                        <h5><strong>Sinpsis</strong></h5>
                        <p align="justify" ><%= l.getSinopsis() %></p>
                    </div>
                    <div class="span4">
                        <img src="assets/img/libro/<%= l.getImagen() %>" alt="<%= l.getNombre()%>" class="image-wrapp" />
                    </div>
                </div>
                <%
                     }
                %>
            
         
        
    </div>
    <jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>
<%
    }else{


%>

<%
    }
%>
