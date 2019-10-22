<%-- 
    Document   : admin
    Created on : 10-07-2019, 08:38:34 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca Online</title>
        <jsp:include page="layout/css.jsp"></jsp:include>
    </head>
 <%
            
        HttpSession ses=request.getSession();
        if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
        {
%>

    <jsp:include page="layout/menu_admin.jsp"></jsp:include>
    <body><br><br><br><br><br><br><br><br>
        <div class="container">
            <div class="row">
                <div class="span4">
                    <a href="ofertas.jsp"><img src="assets/img/btnOfertas.png" alt=""/></a>   
                </div>
                <div class="span4">
                    <a href="club.jsp"><img src="assets/img/btnClub.png" alt=""/></a>
                </div>
                <div class="span4">
                    <a href="reportes.jsp"><img src="assets/img/btnReporte.png" alt=""/> </a>  
                </div>
            </div>
            
           
        </div> 
        <center>
               <a href="perfil.jsp?c=1">
               <input type="submit" name="c" id="c" value="Cerrar Sesion" class="btn btn-info" 
		style="font-family: times, serif; font-size:14pt; font-style:italic">
           </a>
            </center>
    <br><br><br><br><br><br><br>
    <jsp:include page="layout/footer_admin.jsp"></jsp:include>
    </body>
</html>

        <%
            }
        else
        {
            response.sendRedirect("inicioSesion.jsp");
        }
        %>