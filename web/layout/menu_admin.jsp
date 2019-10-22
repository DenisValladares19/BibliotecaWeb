<header>
    
     <%
            
        HttpSession ses=request.getSession();
        if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
        {
    %>
    <!-- start top -->
    <div id="topnav" class="navbar navbar-fixed-top default">
      <div class="navbar-inner">
        <div class="container">
          <div class="logo">
              <a href="admin.jsp"><img src="assets/img/Imagen1.png"width="200px" height="50px"/> </a>
              
          </div>
          <div class="navigation">
            <nav>
              <ul class="nav pull-right">
                <li  ><a class="external" href="admin.jsp">Home</a></li>
                <li><a class="external" href="club.jsp">Club</a></li>
                <li><a class="external" href="ofertas.jsp">Ofertas</a></li>
                <li><a class="external" href="reportes.jsp">Reportes</a></li>
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
              </ul>
            </nav>
          </div>
          <!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <!-- end top -->
    
    <%
            }
        else
        {
            response.sendRedirect("inicioSesion.jsp");
        }
        %>
  </header>
