<%@page import="java.util.List"%>
<%@page import="com.modelo.Club"%>
<%@page import="com.modelo.Oferta"%>
<%@page import="com.modelo.Notificacion"%>
<%@page import="com.dao.DaoNotificacion"%>
<%@page session="true" %>
<header>
    
    <%
         DaoNotificacion daon = new DaoNotificacion();
         Notificacion n = new Notificacion();
         int num = 0;
    
    %>
    
        <%
            HttpSession ses=request.getSession();         
        %>
    <!-- start top -->
    
    <div id="topnav" class="navbar navbar-fixed-top default">
      <div class="navbar-inner">
        <div class="container">
          <div class="logo">
            <a href="./"><img src="assets/img/Imagen1.png"width="200px" height="50px"/> </a>
          </div>
          <div class="navigation">
            <nav>
              <ul class="nav pull-right">
                <li class="current"><a href="#intro">Home</a></li>
                <li><a href="#about" >Autores</a></li>
                <li><a href="#services">Libros</a></li>
                <li><a class="external" href="libroGenero.jsp">Genero de Libro</a></li>
                
                <!-- <li><a href="#works">Membresia</a></li> -->
                    
                     <%
                    if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
                        {
                    %>
                    <li><a href="#contact">Club</a></li>
                    
                    <% 
                    }
                    %>
                
                
                 <li ><a  href="carrito.jsp"><i class="icon-shopping-cart icon-1x"></i><span class="badge badge-info">4</span></i></a></li>
            <%
        
             if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
        {
           int id=Integer.parseInt(ses.getAttribute("sis").toString());    
             List<Notificacion> list = daon.cargarNotificacion(id);
            %>
                 <li class="dropdown"><a  href="notificaciones.jsp" class="external"><i class="icon-globe icon-1x"></i><span class="badge badge-info"><div id="noti"></div></span></a>
                     <ul class="dropdown-menu">
                         <%                         
                              for(Notificacion no:list){
                                num++; 
                                  
                         %>
                         <a href="procesarNotificacion?n=<%= no.getIdNotificacion() %>" class="external" style="text-decoration: none; color: black;">
                         <li >
                             <div class="span3" id="n" style="background: <%=(no.getEstado())?"#D2FEC5":"#FFFFFF"%>; padding: 5px;">
                                 <p><b>Oferta:</b> <%= no.getOferta().getNombre() %></p>
                             </div>
                         </li>
                        </a>
                             
                        <%
                             }
                        %>
                        <script>
                           var noti = document.getElementById("noti");
                           noti.innerHTML = "<%=num%>";
                        </script>
                  </ul>
                 </li>
                 
                 <%
                 }
                 %>
                <li class="dropdown">
                  <a href="#"><i class="icon-angle-down"></i></a>
                  <ul class="dropdown-menu">
                    <li><a href="perfil.jsp" class="external">Perfil</a></li>
                    <li><a href="prestamos.jsp" class="external">Prestamos</a></li>
                    
                    <%
                    if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
                        {
                    %>
                    <div class="divider"></div>
                    <li><a href="inicioSesion.jsp?c=1" class="external">Cerrar Session</a></li>
                    
                    <% 
                    }
                    %>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
          <!--/.nav-collapse -->
        </div>
      </div>
    </div>
                        
                           
    <!-- end top -->
  </header>
