<%-- 
    Document   : clubs
    Created on : 10-10-2019, 11:33:44 PM
    Author     : ADMIN
--%>

<%@page import="com.modelo.Club"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DaoClub"%>
<%@page session="true" %>
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
    
        <script src="Recursos/jquery.js" type="text/javascript"></script>
        <link href="Recursos/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="Recursos/sweetalert2/sweetalert2.min.js" type="text/javascript"></script>
  
  <%
      DaoClub daoC=new DaoClub();
      HttpSession ses=request.getSession();
 %>
 
 
 <%
            if(request.getAttribute("info")!=null)
            {
         %>
         <script>
           $(document).ready(function(e)
             {
               const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 6000
              })

              Toast.fire({
                type: '<%= request.getAttribute("type") %>',
                title: '<%= request.getAttribute("info") %>'
              })
             });
         </script>
         
         <%
             }
          %>
  
    </head>
     <body>
         
         
         
          <%
              
              
              if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
                {
             int id=Integer.parseInt(ses.getAttribute("sis").toString()); 

            %>
    <jsp:include page="layout/menu_pages.jsp"></jsp:include>
    <div class="container mt-5">
        <br><br><br><br><br><br>
        <div class="row">
        <div class="span12">
          <div class="heading">
            <h3><span>Clubs</span></h3>
          </div>
          <div class="sub-heading">
           
          </div>
        </div>
      </div>
      <div class="row">
      <%
          List<Club> c = daoC.mostrarClub();
          for (Club lib : c) {
              
          int icb=lib.getIdClub();
      %>
      <div class="span3">
          <div class="roles">
              <h3><strong><%= lib.getNombre()%></strong></h3>
              <p>
                  <img src="assets/img/club.jpg"/>
              </p>  <a href="club?c1=<%= lib.getIdClub() %>&c2=<%= id %>" class="icon-edit btn btn-theme">
                  Unirme
              </a>
          </div>
      <br>
      <%
      
      if(request.getParameter("btnC")!=null)
      {
              daoC.insertarClienteClub(lib.getIdClub(), id);
      }
      
      
      %>
      <br>
      </div>
      <%
          }
      %>

       <%
           
        }
        
        %>
      
    </div>
    </div>
    <jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>
