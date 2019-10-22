<%-- 
    Document   : REPORTECODIGO
    Created on : 10-10-2019, 08:44:55 PM
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
                File reportFile = new File(application.getRealPath("reportesJ/reporteClientePara.jasper"));

Map parameters = new HashMap();

String idcliente=request.getParameter("txtidcliente");
parameters.put("CODIGO", idcliente); 
byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, con); 

response.setContentType("application/pdf");
response.setContentLength(bytes.length); ServletOutputStream ouputStream = response.getOutputStream(); 
ouputStream.write(bytes, 0, bytes.length); 
ouputStream.flush(); 
ouputStream.close(); %>

            %>
    </body>
</html>
