package com.gestionturnos.turnero.servlets;

import com.gestionturnos.turnero.logica.Controladora;
import com.gestionturnos.turnero.logica.Turno;
import java.io.IOException;
import java.time.format.DateTimeParseException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvFiltrarTurno", urlPatterns = {"/SvFiltrarTurno"})
public class SvFiltrarTurno extends HttpServlet {
    
    Controladora control = new Controladora();
  
 

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        
        try {
           //Filtro a través de la fecha y el estado del turno
            String fecha = request.getParameter("fecha");
            
          //Como la fecha al inicio es null se añade este if para evitar que dé error
            if(fecha == null) {
                fecha = "9999-01-01";
            }
            String estado = request.getParameter("estado");
       
           //Método creado en la controladora para que me traiga los turnos en función de la fecha y estado indicado por el usuario
            List<Turno> listaTurnosFiltrados = control.traerTurnosPorFechaYEstado(fecha, estado);
  
            HttpSession misesion = request.getSession();
            misesion.setAttribute("listadoTurnosFiltrados", listaTurnosFiltrados);
        
            response.sendRedirect("turnosFiltrados.jsp");
        } catch (DateTimeParseException ex) {
             request.setAttribute("errorMensaje", "¡Todos los campos son obligatorios!");
             request.getRequestDispatcher("/turnosFiltrados.jsp").forward(request, response);
        }

        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
