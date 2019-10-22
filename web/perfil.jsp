<%-- 
    Document   : perfil
    Created on : 10-07-2019, 12:52:54 AM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="com.modelo.Cliente"%>
<%@page import="com.dao.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
        <link href="Recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Recursos/bootstrap/js/bootstrap.js" rel="stylesheet" type="text/css"/>
        
        <script src="Recursos/jquery.js" type="text/javascript"></script>
        <script src="Recursos/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        
        
        <script type="text/javascript">
	$(document).ready(function(){
		$('#user,#email,#pass1,#nombre,#apellido,#dir,#pais,#btnG,#btnGua').attr('disabled',true);
                
          $("#btnEdit").click(function(){
                $('#nombre,#apellido,#dir,#btnGua').attr('disabled',false);
                $('#btnEdit').attr('disabled',true);
                
                
                
          $("#btnGua").click(function(){
                $('#nombre,#apellido,#dir,#btnGua').attr('disabled',true);
                $('#btnEdit').attr('disabled',false);
                
                });        
        });
          $("#btnEditar").click(function(){
                $('#user,#email,#btnG').attr('disabled',false);
                $('#btnEditar').attr('disabled',true);
                
          $("#btnG").click(function(){
                $('#user,#email,#btnG').attr('disabled',true);
                $('#btnEditar').attr('disabled',false);
                
        
        });
        });
	});
        
	</script>
        
    </head>
    <body>
        <jsp:include page="layout/menu_pagep.jsp"></jsp:include>
        <%
        
        DaoUsuario d=new DaoUsuario();
        
        %>
        
        <%
            
        HttpSession ses=request.getSession();
        if(ses.getAttribute("sis")!=null)  //Esta sesion trae el ID del Usuario logeado
        {
           int id=Integer.parseInt(ses.getAttribute("sis").toString());                  
       %>
       
       
       <center>
		<div class="col-md-7">
			<br>
			<br>
			<br>
                        <img src="assets/img/user/useer.png" alt=""width="14%" height="10%" />
			<br>
			<br>
		</div>
<br>
	 <br>
				 <div class="container">
			  		<div class="row">
			   			<div class="col-sm">
                                                    <form action="#">
                                                        <button style="font-family: times, serif; font-size:14pt; font-style:italic" class="btn btn-light">
                                                                <img src="assets/img/user/pedidos.png" alt="" width="30%" height="30%"/>
							 	<br>
							 	<br>
								<h2>Tus Pedidos</h2>
								<br>
								<span style="font-size:12pt;">Aqui verificas toda la Informacion de tus Pedidos</span> 	
								<br>
								<br>
							</button>
                                                    </div>
                                                    <div class="col-sm">
			      			<button style="font-family: times, serif; font-size:14pt; font-style:italic" class="btn btn-light" data-toggle="modal" data-target="#personal">
                                                                <img src="assets/img/user/info.png" alt="" width="30%" height="30%"/>
							 	<br>
							 	<br>
								<h2>Informacion General</h2>
								<br>
								<span style="font-size:12pt;">Aqui puedes Editar la Informacion de tu Perfil</span> 	
								<br>
								<br>
							</button>
			    		</div>
			    		<div class="col-sm">
			      			<button style="font-family: times, serif; font-size:14pt; font-style:italic" class="btn btn-light" data-toggle="modal" data-target="#usuario">
                                                                <img src="assets/img/user/seguridad.png" alt="" width="30%" height="30%"/>
							 	<br>
							 	<br>
								<h2>Informacion Usuario</h2>
								<br>
								<span style="font-size:12pt;">Aqui puedes Editar la Informacion de tu Usuario</span> 	
								<br>
								<br>
							</button>
							<br>
							<br>
                                                    </form>
			    		</div>
			  		</div>
			  		<form>
                                            <a href="inicioSesion.jsp?c=1">
                                                <input type="submit" name="c" id="c" value="Cerrar Sesion" class="btn btn-outline-info" 
			  		style="font-family: times, serif; font-size:14pt; font-style:italic">
                                            </a>
			  		</form>
				</div>

       </center>
    
        <%
                            List<Cliente> lst=d.mostrarCliente(id);
                                for(Cliente cli:lst)
                                {
                                
         %>          
    
         <div class="container">

            <!-- Modal -->
            <div class="modal fade" id="usuario" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Informacion Usuario</h5>
                    <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                          <form action="#" method="POST">
                            <label for="usuario">Usuario</label>
                            <input type="text" class="form-control" name="txtUsuario"  placeholder="Introduzca nombre de Usuario" id="user" value="<%= cli.getUsuario() %>">
                            <br>
                            <label for="emanil">Correo Electronico</label>
                            <input type="email" class="form-control" name="txtCorreo" aria-describedby="emailHelp" placeholder="Introduzca su Correo Electronico" id="email" value="<%= cli.getCorreo() %>">
                            <small id="emailHelp" class="form-text text-muted">Nunca compartiremos su correo electrónico con nadie más.</small>
                            <br>
                            <label for="pass">Password</label>
                            <input type="password" class="form-control" name="txtPass1" placeholder="Contraseña" id="pass1" value="<%= cli.getPass() %>">
                            
                  </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-outline-dark" data-dismiss="modal" value="Cerrar" <%-- id="btnEditar" --%> ></button>
                        <!-- <input type="submit" class="btn btn-outline-primary" value="Guardar Informacion" name="btnGuardar" id="btnG"> -->
                    </form>
                  </div>
                </div>
              </div>
            </div>
        </div>
                            
       
         
         <div class="container">

            <!-- Modal -->
            <div class="modal fade" id="personal" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Informacion Personal</h5>
                    <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                          <form action="#" method="POST">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" name="txtNombre"  placeholder="Introduzca su Nombre" id="nombre" value=" <%= cli.getNombre() %>">
                            <br>
                            <label for="apellido">Apellido</label>
                            <input type="text" class="form-control" name="txtApellido"  placeholder="Introduzca su Apellido" id="apellido" value="<%= cli.getApellido() %>">
                            <br>
                            <label for="dir">Direccion</label>
                            <input type="text" class="form-control" name="txtDir" placeholder="Direccion" id="dir" value="<%= cli.getDireccion() %>">
                            <br>
                            <label for="pais">Pais</label>
                            <select id="pais" name="selectPais" class="form-control">
                                <option value="<%= cli.getPais() %>"><%= cli.getNombrePais() %></option>
                            </select>
                      <br>
                  </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-outline-dark" data-dismiss="modal" value="Cerrar" <%-- id="btnEdit" --%> ></button>
                       <!-- <input type="submit" class="btn btn-outline-primary" value="Guardar Informacion" name="btnGuardar" id="btnGua"> -->
                    </form>
                  </div>
                </div>
              </div>
            </div>
        </div>
         
         <%
              }
         
         %>
                            
          <%
           
        }
        else
        {
            response.sendRedirect("inicioSesion.jsp");
        }
        
        
        if(request.getParameter("c")!=null)
        {
            ses.removeAttribute("sis");
            response.sendRedirect("inicioSesion.jsp");
        }

        %>
        <jsp:include page="layout/footeer.jsp"></jsp:include>
    </body>
</html>
