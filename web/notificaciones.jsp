<%-- 
    Document   : notificaciones
    Created on : 10-10-2019, 11:10:02 PM
    Author     : Admin
--%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Club"%>
<%@page import="com.modelo.Oferta"%>
<%@page import="com.modelo.Notificacion"%>
<%@page import="com.dao.DaoNotificacion"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            HttpSession ses=request.getSession();         
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca Online</title>
        <jsp:include page="layout/css.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="layout/menu_pages.jsp"></jsp:include>
            <br><br><br><br><br><br>
            <div class="span12">
                <div class="heading">
                    <h3><span>notificaciones </span></h3><br><br><br><br>
                </div>
            </div>
            <div class="container">
        <%
            DaoNotificacion daon = new DaoNotificacion();
            Notificacion n = new Notificacion();
            if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
        {
           int id=Integer.parseInt(ses.getAttribute("sis").toString()); 
            List<Notificacion> list = daon.cargarNotificacion(id);
             for(Notificacion no:list){
        %>
        
        <div class="row"><div class="span1"></div>
            <div class="span10" style="background: <%=(no.getEstado())?"#D2FEC5":"#FFFFFF"%>; padding: 15px;">
                <h5><strong><%=no.getOferta().getNombre()%></strong></h5>
                <p><strong>Descuento: </strong><%=no.getOferta().getDescuento()%>%</p>
                <p><strong>Club: </strong><%= no.getClub().getNombre()%></p>
            </div> 
        </div>
        <%
            }
}
        %>
        </div>
        <br><br><br><br><br><br>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>
</html>
