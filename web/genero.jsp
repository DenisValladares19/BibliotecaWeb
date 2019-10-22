<%
    if(request.getParameter("g")!=null){
        
    
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
        <br><br><br><br><br><br><br><br><br>
        
        <% 
                    List<Autor> ls = daoA.mostrarGenero(Integer.parseInt(request.getParameter("g")));
                    for(Autor u:ls){
                %>
                <div class="span12">
                  <div class="heading">
                    <h3><span><%= u.getGenero().getNombre() %> </span></h3>
                  </div><br><br>
                <div class="row">
                    <center>
                        <div class="span4"></div>
                        <div class="span4">
                            <p><%= u.getGenero().getDescripcion() %></p>
                        </div>
                    </center>
                </div>
                <%
                     }
                %>
            
         
                </div>
    </div><br><br><br><br>
    <jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>
<%
    }else{


%>

<%
    }
%>

