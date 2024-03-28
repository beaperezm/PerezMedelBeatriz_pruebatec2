package com.gestionturnos.turnero.servlets;

import com.gestionturnos.turnero.logica.Ciudadano;
import com.gestionturnos.turnero.logica.Controladora;
import com.gestionturnos.turnero.logica.Turno;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvFiltrarCiudadano", urlPatterns = {"/SvFiltrarCiudadano"})
public class SvFiltrarCiudadano extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");

         //Filtro a través del DNI del Ciudadano
        String dni = request.getParameter("dniciudadano");
        
        List<Turno> listaTurnosFiltrados = new ArrayList<Turno>();
        List<Ciudadano> listaCiudadanosFiltrados = new ArrayList<Ciudadano>();
 
       //Creados ambos métodos para que me devuelva al ciudadano filtrado y la fecha de sus turnos
       listaCiudadanosFiltrados = control.traerCiudadanosFiltrados(dni);
       listaTurnosFiltrados = control.traerTurnosFiltrados(dni);
  
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listadoCiudadanosFiltrados", listaCiudadanosFiltrados);
        
        HttpSession misesion2 = request.getSession();
        misesion2.setAttribute("listadoTurnosFiltrados", listaTurnosFiltrados);
     
        response.sendRedirect("ciudadanosFiltrados.jsp");
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
