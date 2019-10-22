
package com.controlador;

import com.dao.DaoCliente;
import com.dao.DaoUsuario;
import com.modelo.Cliente;
import com.modelo.Pais;
import com.modelo.Sha1;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre del Servlet: ProcesarCliente
 * Fecha: 01-10-2019
 * Version: 1.0
 * Copyright: Biblioteca Online
 * @author Edgard Palacios 
 */

public class ProcesarCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=null;
        
        Cliente cli=new Cliente();
        DaoCliente dao=new DaoCliente();
        DaoUsuario us=new DaoUsuario();
        
        Sha1 sha=new Sha1();
        String msj=null;
        try 
        {
            String pass1=request.getParameter("txtPass1");
            String pass2=request.getParameter("txtPass2");
            
            cli.setNombre(request.getParameter("txtNombre"));
            cli.setApellido(request.getParameter("txtApellido"));
            cli.setDireccion(request.getParameter("txtDireccion"));
            cli.setPais(Integer.parseInt(request.getParameter("selectPais")));
            
            cli.setUsuario(request.getParameter("txtUsuario"));
            
            
             
             if(request.getParameter("btnEnviar")!=null)
             {
                 
                 if(pass1.equals(pass2))
                {
                 cli.setPass(sha.sha1(pass2));
                 
                    if (dao.esEmail(request.getParameter("txtCorreo"))) 
                    {
                          cli.setCorreo(request.getParameter("txtCorreo"));
                          
                          dao.insertarCliente(cli);
                          
                 int rol=us.sacarRol(cli.getCorreo(), cli.getPass());
                          
                   int id=us.sacarId(cli.getCorreo(), cli.getPass());
                   request.setAttribute("v","1");
                   request.setAttribute("id",id);
                   request.setAttribute("rol",rol);
                   
                   
                   }
                  else
                  {
                      msj="Correo es Invalido";
                  }
                 
                }
                else
                {
                    
                    msj="Contraseñas no Coinciden";
                }
                 
             }
             else
             {
                 msj="Algunas Campos Vacios,Intenta Llenar todos los campos";
             }
             
             rd=request.getRequestDispatcher("inicioSesion.jsp");
            request.setAttribute("msj", msj);
            request.setAttribute("info","Algunas Campos Vacios,Intenta Llenar todos los campos");
        } 
        catch (Exception e) 
        {
        request.setAttribute("Error",e.toString());
        }
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
