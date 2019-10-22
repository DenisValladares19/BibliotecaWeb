<%-- 
    Document   : index
    Created on : 10-03-2019, 10:15:08 PM
    Author     : Admin
--%>

<%@page import="com.dao.DaoClub"%>
<%@page import="com.modelo.Club"%>
<%@page import="com.modelo.Libro"%>
<%@page import="com.dao.DaoLibro"%>
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
  <%@page session="true" %>
  <jsp:include page="layout/css.jsp"></jsp:include>
  <%
      DaoAutor daoA = new DaoAutor();
      DaoLibro daoL = new DaoLibro();
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
    <jsp:include page="layout/menu.jsp"></jsp:include>
  <!-- section intro -->
  <section id="intro">
    <div class="slogan">
      <div class="icon">
        <i class="icon-book icon-10x"></i>
      </div>
      <h1>Bienvenido a tu <span>Biblioteca</span> online </h1>
      <h2>Todo lo que necesitas al alcance de tu mano</h2>
    </div>
  </section>
  <!-- end intro -->
  <!-- Section about -->
  <section id="about" class="section">
    <div class="container">
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
            List<Autor> ls = daoA.mostrarAutorIndex();
            for(Autor u:ls){
                
           
        %>
        <div class="span3">
            <img src="assets/img/autor/<%= u.getImagen() %>" alt="<%= u.getNombre()%>" width="400" height="400" class="img-polaroid" />
          <div class="roles">
            <h5><strong><%= u.getNombre()%></strong></h5>
            <p>
                <b>Genero: </b><%= u.getGenero().getNombre() %>
            </p>
            <a href="autor.jsp?a=<%= u.getIdAutor() %>" class="btn btn-theme">Leer mas</a>
          </div>
        </div>
        <%
             }
        %>
        <div class="span3">
            <a href="autores.jsp"><img src="assets/img/autor/masAutor.png" alt="" width="400" height="400" class="" /></a>
          <div class="roles">
            <h5><strong></strong></h5>
           
          </div>
        </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end section about -->
  <!-- section services -->
  <section id="services" class="section parallax dark">
    <div class="container">
      <div class="row">
          
        <div class="span12">
          <div class="heading">
            <h3><span>Libros</span></h3>
          </div>
          <div class="sub-heading">
            
          </div>
        </div>
        
      </div>
      <div class="row">
        <%
              List<Libro> lst = daoL.mostrarLibroIndex();
              for(Libro l:lst){ 
          %>
        <div class="span3">
          <div class="box aligncenter">
            <div class="halftop">
                <img src="assets/img/libro/<%= l.getImagen() %>" alt="<%= l.getNombre()%>"  class="img-polaroid" />
              
            </div>
            <h4><strong><%= l.getNombre()%></strong></h4>
            <a href="ver-libro.jsp?l=<%= l.getIdLibro() %>" class="btn btn-theme">Leer mas</a>
          </div>
        </div>
          <%
            }
        %> 
        <div class="span3">
          <div class="box aligncenter">
            <div class="halftop">
                <a href="libros.jsp"><img src="assets/img/libro/masLibro.png"/></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end section services -->
  <!-- section works -->
  <!-- <section id="works" class="section gray-bg">
    <div class="container">
      <div class="row">
        <div class="span12">
          <div class="heading">
            <h3><span>Membresia</span></h3>
          </div>
          <div class="sub-heading">
            <p>
              We have a history of doing what our name implies, creating a visual language around the beliefs of the brands we work with.
            </p>
          </div>
        </div>
      </div>
      <div class="row">
    
    </div>
  </section> -->
  <!-- section works -->
  <!-- section contact -->
  
  <%

     HttpSession ses=request.getSession();
     if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
       {
     int id=Integer.parseInt(ses.getAttribute("sis").toString());                  
  %>
  <section id="contact" class="section">
    <div class="container">
      <div class="row">
        <div class="span12">
          <div class="heading">
            <h3><span>Club</span></h3>
          </div>
          <div class="sub-heading">
            
          </div>
        </div>
      </div>
        
        
        <div class="row">
        <% 
            
            DaoClub daoC=new DaoClub();
        %>
        <%
            List<Club> l = daoC.mostrarClubIndex();
            for(Club cb:l){
                
           
        %>
        <div class="span3">
          <div class="roles">
            <h3><strong><%= cb.getNombre()%></strong></h3>
            <img src="assets/img/club.jpg"/>
            <br>
            <a href="club?c1=<%= cb.getIdClub() %>&c2=<%= id %>" class="icon-edit btn btn-theme">Unirme</a>
          </div>
        </div>
        <%
             }
        %>
        <div class="span3">
          <div class="box aligncenter">
            <div class="halftop">
                <a href="clubs.jsp"><img src="assets/img/masClub.PNG"/></a>
            </div>
          </div>
        </div>
    </div>

  </section>
  <!-- end section contact -->
   <%
    }  
   %>
    <jsp:include page="layout/footer.jsp"></jsp:include>

</body>

</html>
