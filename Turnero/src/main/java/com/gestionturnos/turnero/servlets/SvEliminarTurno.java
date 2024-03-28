package com.gestionturnos.turnero.servlets;

import com.gestionturnos.turnero.logica.Controladora;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SvEliminarTurno", urlPatterns = {"/SvEliminarTurno"})
public class SvEliminarTurno extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //Utilizo el id para eliminar sólo un Turno
        int id = Integer.parseInt(request.getParameter("id"));
        
        try {
            control.eliminarTurno(id);
        } catch (Exception ex) {
            Logger.getLogger(SvEliminarTurno.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("SvTurno");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
