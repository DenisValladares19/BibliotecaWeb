<%-- 
    Document   : ofertas
    Created on : 10-09-2019, 10:31:48 PM
    Author     : Admin
--%>

<%@page import="com.modelo.Oferta"%>
<%@page import="com.modelo.Club"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DaoOferta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
     <%
            
        HttpSession ses=request.getSession();
        if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
        {
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca Online</title>
        <jsp:include page="layout/css.jsp"></jsp:include>
        <%
            DaoOferta dao = new DaoOferta();
        %>
        
        <script lang="JavaScript">
            function cargar(id, nombre, desc, club){
                document.frmOferta.idOferta.value=id;
                document.frmOferta.nombre.value=nombre;
                document.frmOferta.descuento.value=desc;
                document.frmOferta.selectClub.value=club;
            }
        </script>
        <%
            if(request.getAttribute("mjs")!=null){
          %>      
          <script>
            swal.fire("<%= request.getAttribute("mjs")%>");   
          </script>
          <%      
            }
        %>
        
        <%
            if(request.getAttribute("error")!=null){
          %>      
          <script>
            swal.fire("<%= request.getAttribute("error")%>");   
          </script>
          <%      
            }
        %>
    </head>
    <body>
    <jsp:include page="layout/menu_admin.jsp"></jsp:include>
    <br><br><br><br><br><br>
    <div class="container">
        <div class="row">
            <div class="span12">
                <div class="heading">
                    <h3><span>Ofertas</span></h3>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="span1"></div>
            <div class="span5">
                <form action="procesarOferta" method="post" name="frmOferta">
                    <label>Id Oferta</label>
                    <input type="text" name="idOferta" class="span4" required="true"/>
                    <label>Nombre</label>
                    <input type="text" name="nombre" class="span4" required="true"/>
                    <label>Descuento</label>
                    <input type="text" name="descuento" placeholder="00%" class="span4" required="true"/>
                    <label>Club</label>
                    <select name="selectClub" class="span4">
                        <%
                            List<Club> ls = dao.mostrarClub();
                            for(Club u:ls){
                         %>
                         <option value="<%=u.getIdClub() %>"><%=u.getNombre() %></option>
                         <%
                            }
                        %>
                    </select><br>
                    <button type="submit" class="btn btn-success icon-ok"  name="btnIngresar" onclick="return confirm('Desea ingresar un nuevo club?')" value="ingresar"> Ingresar</button>
                     <button type="submit" class="btn btn-info icon-pencil"  name="btnModificar" onclick="return confirm('Desea modificar un nuevo club?')" value="modificar"> Modificar</button>
                     <button type="submit" class="btn btn-danger icon-remove"  name="btnEliminar" onclick="return confirm('Desea eliminar un nuevo club?')" value="eliminar"> Eliminar</button>
                     <button type="reset" class="btn btn-warning icon-refresh"  name="btnLimpiar"> Limpiar</button>
                </form>
            </div>
            <div class="span6">
                <table class = "table table-hover inverse" > 
                    <thead style="background-color: black; color: white;">
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descuento</th>
                    <th>Club</th>
                    <th>Acción</th>
                    </thead>
                    <tbody style="text-align: center;">

                        <%
                            List<Oferta> lst = dao.mostrarOferta();
                            for (Oferta o : lst) {
                        %>
                        <tr>
                            <td><%=o.getIdOferta() %></td>
                            <td><%=o.getNombre() %></td>
                            <td><%=o.getDescuento()%></td>
                            <td><%=o.getClub().getNombre() %></td>
                            <td><a href="javascript:cargar(<%=o.getIdOferta() %>,'<%=o.getNombre()%>','<%=o.getDescuento() %>',<%=o.getClub().getIdClub() %>)" class="btn btn-info">Seleccionar</a></td>
                        </tr>
                        <%
                            }
                        %>

                    </tbody>  
                </table>
            </div>

            
        </div>
     <br><br><br><br><br><br>
    </div>
    <jsp:include page="layout/footer_admin.jsp"></jsp:include>
    </body>
    
     <%
            }
        else
        {
            response.sendRedirect("inicioSesion.jsp");
        }
        %>
</html>
