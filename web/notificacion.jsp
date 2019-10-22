<%-- 
    Document   : notificacion
    Created on : 10-10-2019, 09:53:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Club"%>
<%@page import="com.modelo.Oferta"%>
<%@page import="com.modelo.Notificacion"%>
<%@page import="com.dao.DaoNotificacion"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="layout/css.jsp"></jsp:include>
        <title>Biblioteca Online</title>
    </head>
    <body>
        <jsp:include page="layout/menu_pages.jsp"></jsp:include>
            <br><br><br><br><br><br>
            <div class="span12">
                <div class="heading">
                    <h3><span>notificación </span></h3><br><br><br><br>
                </div>
            </div>
        <%
            DaoNotificacion daon = new DaoNotificacion();
            Notificacion n = new Notificacion();
            int num = 0;
            List<Notificacion> list = daon.cargarUnaNotificacion(1,Integer.parseInt(request.getParameter("n")));
             for(Notificacion no:list){
        %>
        
        <div class="row">
            <center><div class="span4"></div>
                <div class="span5">
                    <h3><strong><%=no.getOferta().getNombre() %></strong></h3>
                    <h5><strong>Descuento: </strong><%=no.getOferta().getDescuento() %>%</h5>
                    <h5><strong>Club: </strong><%= no.getClub().getNombre() %></h5>
                </div>
            </center>
        </div> 
        <%
            }
        %>
        <br><br><br><br><br><br>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
