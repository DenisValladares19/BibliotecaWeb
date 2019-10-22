<%-- 
    Document   : reporteEmpleado
    Created on : 10-10-2019, 06:40:29 PM
    Author     : said
--%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
            <%
                Connection con;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Biblioteca","root","");
                File reporte = new File(application.getRealPath("reportesJ/reporteEmpleado.jasper"));
                Map parametros = new HashMap();
                byte[] bytes = JasperRunManager.runReportToPdf
                (reporte.getPath(), parametros,con);
                response.setContentType("application/pdf");
                response.setContentLengthLong(bytes.length);
                ServletOutputStream output = response.getOutputStream();
                response.getOutputStream();
                output.write(bytes,0,bytes.length);
                output.flush();
                output.close();
            %>
    </body>
</html>
