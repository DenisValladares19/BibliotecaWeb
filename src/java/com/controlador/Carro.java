
package com.controlador;

import com.dao.DaoLibro;
import com.modelo.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Nombre de la clase: Carro
 * Fecha: 04-11-2019
 * version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Carro extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession carrito = request.getSession();
        Map<String,String> arreglo = new HashMap<String, String>();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int cant = Integer.parseInt(request.getParameter("cant"));
            DaoLibro dao = new DaoLibro();
            List<Libro> ls = dao.verLibro(id);
            HashMap nuevoArreglo = (HashMap)request.getAttribute("carrito");
            for(Libro l:ls){
               
                    if(!nuevoArreglo.get("idLibro").equals(id)){
                        arreglo.put("idLibro",Integer.toString(l.getIdLibro()));
                        arreglo.put("nombre", l.getNombre());
                        arreglo.put("imagen", l.getImagen());
                        arreglo.put("cantidad", Integer.toString(cant));
                        arreglo.put("autor", l.getAutor().getNombre());
                        arreglo.put("editorial", l.getEditorial().getNombre());
                        out.print("si entro a la condicion");
                    }else{
                        arreglo.put("cantidad",(arreglo.get("cantidad")+1));
                        out.print("si entro a la otra condicion");
                    }
                
            }
        } catch (Exception e) {
        }
        //carrito.setAttribute("carrito", arreglo);
        //out.print(arreglo);
        
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Carro.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Carro.class.getName()).log(Level.SEVERE, null, ex);
        }
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
