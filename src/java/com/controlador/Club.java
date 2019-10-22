/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.dao.DaoClub;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Nombre del Servlet: Club
 * Fecha: 01-10-2019
 * Version: 1.0
 * Copyright: Biblioteca Online
 * @author Edgard Palacios 
 */

public class Club extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=null;
        DaoClub c=new DaoClub();
        
        int idClub=Integer.parseInt(request.getParameter("c1").toString());
        int idClie=Integer.parseInt(request.getParameter("c2").toString());
        
        try {
             if(request.getParameter("c1")!=null)
                    {
                    if(request.getParameter("c1")!=null){
                    if(request.getParameter("c2")!=null){
                    
                   
                        if(c.validar(idClie, idClub)==true)
                    {
                        request.setAttribute("info","Ya eres parte de Este Club");
                        request.setAttribute("type","error");
                    }
                    else
                    {
                        c.insertarClienteClub(idClie, idClub);
                        request.setAttribute("info","¡ENHORABUENA! Fuistes Agregado de este Club");
                        request.setAttribute("type","success");
                        
                    }
                    }
                      
                }
                
            }
            
            rd=request.getRequestDispatcher("clubs.jsp");
        } 
        catch (Exception e) {
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
