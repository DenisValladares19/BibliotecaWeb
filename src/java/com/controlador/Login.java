/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.dao.DaoUsuario;
import com.modelo.Sha1;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre del Servlet: Login
 * Fecha: 01-10-2019
 * Version: 1.0
 * Copyright: Biblioteca Online
 * @author Edgard Palacios 
 */

public class Login extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=null;
        DaoUsuario us=new DaoUsuario();
        
        //Tomando Informacion para Logearse
        Sha1 sh=new Sha1();
         String user=request.getParameter("txtCorreo");
         String  pas=request.getParameter("txtPass");
         String pass=sh.sha1(pas);
         
        try 
        {
           if(request.getParameter("btnLogin")!=null)
           {
               if(us.validar(user, pass))
               {    
                   int rol=us.sacarRol(user, pass);
                   
                   if(rol==2)
                   {
                       request.setAttribute("info","¡A ocurrido un Error!");
                       request.setAttribute("msj","Lo Lamentamos, Pero no tienes los Privilegios para poder Acceder");
                   }
                   else
                   {
                   int id=us.sacarId(user, pass);
                   request.setAttribute("v","1");
                   request.setAttribute("id",id);
                   request.setAttribute("rol",rol);
                   }
                   
               }
               else
               {
                   request.setAttribute("v","0");
                   request.setAttribute("info","¡Informacion Incorrecta!");
                   request.setAttribute("msj","Usuario o Contraseña Incorrecto");
               }
               
               
           }
           rd=request.getRequestDispatcher("inicioSesion.jsp");
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
