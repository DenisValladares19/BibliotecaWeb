<%-- 
    Document   : club
    Created on : 10-07-2019, 10:44:08 PM
    Author     : Admin
--%>

<%@page import="com.modelo.Club"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DaoClub"%>
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
            DaoClub daoc = new DaoClub();
        %>
        
        <script lang="JavaScript">
            function cargar(id, nombre){
                document.frmClub.idClub.value=id;
                document.frmClub.nombre.value=nombre;
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
                    <h3><span>club</span></h3>
            </div>
         </div>
         </div>
         <div class="row">
             <div class="span2"></div>
             <div class="span4">
                 <form action="procesarClub" method="post" name="frmClub">
                     <label>Id Club</label>
                     <input type="text" id="id" name="idClub" class="span2" required="true"/>
                     <label>Nombre</label>
                     <input type="text"  name="nombre" class="span2" required="true"/><br>
                     <button type="submit" class="btn btn-success icon-ok"  name="btnIngresar" onclick="return confirm('Desea ingresar un nuevo club?')" value="ingresar"></button>
                     <button type="submit" class="btn btn-info icon-pencil"  name="btnModificar" onclick="return confirm('Desea modificar un nuevo club?')" value="modificar"></button>
                     <button type="submit" class="btn btn-danger icon-remove"  name="btnEliminar" onclick="return confirm('Desea eliminar un nuevo club?')" value="eliminar"></button>
                     <button type="reset" class="btn btn-warning icon-refresh"  name="btnLimpiar"></button>
                 </form>
             </div>
             <div class="span4">
                 <table class = "table table-hover inverse" > 
                     <thead style="background-color: black; color: white;">
                     <th>Id</th>
                     <th>Nombre</th>
                     <th>Acción</th>
                     </thead>
                     <tbody style="text-align: center;">
                         
                             <%
                                 List<Club> ls = daoc.mostrar1Club();
                                 for(Club c:ls){        
                            %>
                            <tr>
                            <td><%=c.getIdClub() %></td>
                            <td><%=c.getNombre() %></td>
                            <td><a href="javascript:cargar(<%=c.getIdClub() %>,'<%=c.getNombre() %>')" class="btn btn-info">Seleccionar</a></td>
                            </tr>
                            <%
                                 }
                             %>
                         
                     </tbody>  
                </table>
             </div>
         </div>
         
         
         
      
     <br><br><br>
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
