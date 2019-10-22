<%
    if(request.getParameter("a")!=null){
        
    
%>
<%-- 
    Document   : index
    Created on : 10-03-2019, 10:15:08 PM
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
        
            
                <% 
                    List<Autor> ls = daoA.mostrarUnAutor(Integer.parseInt(request.getParameter("a")));                    
                    for(Autor u:ls){
                %>
                <div class="span12">
                  <div class="heading">
                    <h3><span><%= u.getNombre()%> </span></h3><br><br><br><br>
                  </div>
                </div>
                <div class="row">
                    <div class="span2"></div>
                    <div class="span5">
                        <h5><strong>Fecha de Nacimiento: </strong><%= u.getFechaNac() %></h5>
                        
                        <%
                            if(u.getFechaDefunsion()>0)
                            {
                        
                        %>
                        
                        <h5><strong>Fecha de Defunción: </strong><%= u.getFechaDefunsion() %></h5>
                        <%
                            }
                        %>
                        
                        <h5><strong>Genero: </strong><a href="genero.jsp?g=<%= u.getGenero().getIdGenero() %>"><%= u.getGenero().getNombre() %></a></h5>
                        <h5><strong>País: </strong><%= u.getPais().getNombre() %></h5>
                        <h5><strong>Biografia</strong></h5>
                        <p align="justify" ><%= u.getBiografia() %></p>
                    </div>
                    <div class="span4">
                        <img src="assets/img/autor/<%= u.getImagen() %>" alt="<%= u.getNombre()%>" class="image-wrapp" />
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
