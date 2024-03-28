package com.gestionturnos.turnero.servlets;

import com.gestionturnos.turnero.logica.Controladora;
import com.gestionturnos.turnero.logica.Turno;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvEditarTurno", urlPatterns = {"/SvEditarTurno"})
public class SvEditarTurno extends HttpServlet {
    
     Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
  
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //Traigo al turno por el id porque al ser la Primary Key es única para cada registro de dicha tabla - por lo tanto me va a traer sólo el objeto con el elemento que quiero modificar
        int id = Integer.parseInt(request.getParameter("id"));
        Turno turno = control.traerUnTurno(id);
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("editarTurn", turno);
    
        response.sendRedirect("editarTurno.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fecha = request.getParameter("fecha");
        String tramite = request.getParameter("tramite");
        String idCiudadano = request.getParameter("idciudadano");
        String estado = request.getParameter("estado");
       
        
        
        //Con esto estoy actualizando lo que ya tengo en la BBDD
        Turno turno = (Turno) request.getSession().getAttribute("editarTurn");
        turno.getCiudadano().setId_ciudadano(Integer.parseInt(idCiudadano));
        turno.setDescripcionTramite(tramite);
        turno.setEstado(estado);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate ld = LocalDate.parse(fecha, formatter);
        turno.setFecha(ld);
        
        control.editarTurno(turno);
        
        response.sendRedirect("SvTurno");
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
