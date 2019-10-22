/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.dao.DaoOferta;
import com.modelo.Club;
import com.modelo.Oferta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ProcesarOferta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Oferta o = new Oferta();
        Club c = new Club();
        DaoOferta dao = new DaoOferta();
        RequestDispatcher rd = null;
        String m = null;
        try {
            o.setIdOferta(Integer.parseInt(request.getParameter("idOferta")));
            o.setNombre(request.getParameter("nombre"));
            o.setDescuento(request.getParameter("descuento"));
            c.setIdClub(Integer.parseInt(request.getParameter("selectClub")));
            o.setClub(c);
            if(request.getParameter("btnIngresar")!=null){
                dao.insertarOferta(o);
                m = "Insertado correctamente";
            }else if(request.getParameter("btnModificar")!=null){
                dao.modificarOferta(o);
                m = "Modificado correctamente";
            }else{
                dao.eliminarOferta(o);
                m = "Eliminado correctamente";
            }
             rd=request.getRequestDispatcher("ofertas.jsp");
            request.setAttribute("mjs", m);
        } catch (Exception e) {
            request.setAttribute("error", e.toString());
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
