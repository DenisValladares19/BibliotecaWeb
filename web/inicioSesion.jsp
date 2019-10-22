<%-- 
    Document   : inicioSesion
    Created on : 10-04-2019, 09:24:39 PM
    Author     : ADMIN
--%>

<%@page import="com.modelo.Pais"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.DaoCliente"%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.Cliente"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Biblioteca Online </title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximun-scale=1">
        <link href="Recursos/estilo.css" rel="stylesheet" type="text/css"/>

        <link href="Recursos/bootstrap/css/app.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="Recursos/bootstrap/js/app.js">        
        
        <link href="Recursos/fontawesome/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="Recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Recursos/bootstrap/js/bootstrap.js" rel="stylesheet" type="text/css"/>
        
        <script src="Recursos/jquery.js" type="text/javascript"></script>
        <script src="Recursos/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        
        <link href="Recursos/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="Recursos/sweetalert2/sweetalert2.min.js" type="text/javascript"></script>
        
	<script type="text/javascript">
		function Mostrar(){
			document.getElementById("form_reg").style.display ="block";
			document.getElementById("div").style.display ="none";
		}
		function Ocultar(){
			document.getElementById("form_reg").style.display ="none";
			document.getElementById("div").style.display ="block";
		}
	</script>
         <%
            if(request.getAttribute("msj")!=null)
            {
         %>
         
         <script>
             $(document).ready(function(e)
             {
                swal.fire("<%= request.getAttribute("info") %>","<%= request.getAttribute("msj") %>","error"); 
             });
         </script>
         <%
             }
          %>
	
</head>
<body>
    <jsp:include page="layout/menu_pagep.jsp"></jsp:include>
    
            <%

            DaoCliente dao= new DaoCliente();

            %>    
<br>
<br>

<br>

    <div class="container">

            <!-- Modal -->
            <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Inicio de Sesion</h5>
                    <button type="button" class="close" data-dismiss="modal">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                          <br>
                          <form action="login" method="POST">
                              <label for="email">Correo Electronico</label>
                            <input type="email" class="form-control" name="txtCorreo" aria-describedby="emailHelp" placeholder="Introduzca su Correo Electronico">
                            <small id="emailHelp" class="form-text text-muted">Nunca compartiremos su correo electrónico con nadie más.</small>
                            <br>
                            <label for="pass">Password</label>
                            <input type="password" class="form-control" name="txtPass" placeholder="Contraseña">
                      <br>
                  </div>
                    <div class="modal-footer">
                    <input type="submit" class="btn btn-outline-dark" data-dismiss="modal" value="Cerrar"></button>
                    <input type="submit" class="btn btn-outline-primary" value="Iniciar Sesion" name="btnLogin">
                    </form>
                  </div>
                </div>
              </div>
            </div>
       </div>

        <%
             if(request.getAttribute("v")!=null)
             {
                 if(request.getAttribute("v")=="1")
                 {
                     HttpSession ses=request.getSession();
                     ses.setAttribute("sis",request.getAttribute("id"));
                     int rol=Integer.parseInt(request.getAttribute("rol").toString());
                     
                     if(rol==3)
                     {
                         response.sendRedirect("perfil.jsp");
                     }
                     else if(rol==1)
                     {
                         response.sendRedirect("admin.jsp");
                     }
                     
                 }
             }
         %>

       <div id="div">
		<h2> Biblioteca Online te Ofrece los Siguientes Beneficios al momento de Crear una Cuenta en nuestro sitio. </h2>
	<br>
	<br>
	<br>
		<div class="col-md-10" style="margin: auto;">
			<div class="row" style="padding-left: 20px;">
				<div class="col-md-7" style="margin-top: 2em;">
					<h3> Sin Registro </h3><br>
					<p> <i class="far fa-check-circle"></i> Ver Información de Libros </p>
					<p> <i class="far fa-check-circle"></i> Cotizar Precio de Libros </p>
					<div id="no">
						<p> <i class="far fa-times-circle"></i> Realizar Prestamos de Libros </p>
					<p> <i class="far fa-times-circle"></i> Recibir descuentos en la Compras de Libros </p>
					<p> <i class="far fa-times-circle"></i> Recibir Super Ofertas </p>
					<p> <i class="far fa-times-circle"></i> Pertenecer a un Club </p>
					<p> <i class="far fa-times-circle"></i> Suscripciones </p><br>
					</div>
					
					<input type="submit" name="btnRegistrar" value="Registrarte Ahora" class="btn btn-outline-primary" onclick="Mostrar()">
				</div>	
				<div class="col-md-5" style="margin-top: 2em;">
					<h3> Registrado </h3><br>
						<p> <i class="far fa-check-circle"></i> Ver Información de Libros </p>
						<p> <i class="far fa-check-circle"></i> Cotizar Precio de Libros </p>
						<p> <i class="far fa-check-circle"></i> Realizar Prestamos de Libros </p>
						<p> <i class="far fa-check-circle"></i> Recibir descuentos en la Compras de Libros </p>
						<p> <i class="far fa-check-circle"></i> Recibir Super Ofertas </p>
						<p> <i class="far fa-check-circle"></i> Pertenecer a un Club </p>
						<p> <i class="far fa-check-circle"></i> Suscripciones </p><br>
						<input type="submit" name="btnLogin" value="Inicia Sesion" class="btn btn-outline-primary" data-toggle="modal" data-target="#login">
				</div>
			</div>
		</div>
        </div>
<center>
	<div class="root" id="form_reg" style="display: none">
            <form action="procesarCliente" class="form-register" method="POST">
            <div class="form-register__header">
                <ul class="progressbar" style="background: rgba(197, 222, 255,0.1);">
                    <li class="progressbar__option active">paso 1</li>
                    <li class="progressbar__option">paso 2</li>
                </ul>
                <h1 class="form-register__title">Resgistrate en LibraNet</h1>
            </div>
            <div class="form-register__body">
                <div class="step active" id="step-1">
                    <div class="step__header">
                        <h2 class="step__title">Información del Cliente</h2>
                    </div>
                    <div class="step__body">
                        <input type="text" placeholder="Nombre" class="step__input" name="txtNombre">
                        <input type="text" placeholder="Apellido" class="step__input" name="txtApellido">
                        <textarea rows="4" cols="80" placeholder="Direccion" class="step__input" name="txtDireccion"></textarea>
                        <label>Pais</label>
                         <td><select name="selectPais" class="form-control">
                                    <%
                                       List<Cliente> lstC=dao.listarPais();
                                       for(Cliente cli:lstC)
                                       {
                                          
                                    %>       
                                         
                                    <option value="<%= cli.getPais() %>" > <%= cli.getNombrePais() %> </option>
                                    
                                    <%       
                                           
                                       }

                                    %>    
                        </select>
                            </td> 
                    </div>
                    <div class="step__footer">
                    	 <button type="button" class="step__button step__button" data-to_step="2" data-step="1" onclick="Ocultar()">Cancelar</button>
                        <button type="button" class="step__button step__button--next" data-to_step="2" data-step="1">Siguiente</button>
                    </div>
                </div>
                <div class="step" id="step-2">
                    <div class="step__header">
                        <h2 class="step__title">Información del Usuario</h2>
                    </div>
                    <div class="step__body">
                         <input type="text" placeholder="Usuario" class="step__input" name="txtUsuario">
                        <input type="email" placeholder="Correo" class="step__input" name="txtCorreo">
                        <input type="password" placeholder="Contraseña" class="step__input" name="txtPass1">
                        <input type="password" placeholder="Confirmar contraseña" class="step__input" name="txtPass2">
                    </div>
                    <div class="step__footer">
                        <button type="button" class="step__button step__button--back" data-to_step="1" data-step="2">Regresar</button>
                        <button type="submit" class="step__button" name="btnEnviar" >Registrarse</button>
                    </div>
                </div>
            </div>
        </form>
        </div>
</div>

    <script src="Recursos/bootstrap/js/app.js" type="text/javascript"></script>
</center>
<jsp:include page="layout/footeer.jsp"></jsp:include>
    </body>
</html>
