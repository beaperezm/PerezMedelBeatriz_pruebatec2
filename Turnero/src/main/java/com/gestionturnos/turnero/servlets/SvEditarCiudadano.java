package com.gestionturnos.turnero.servlets;

import com.gestionturnos.turnero.logica.Ciudadano;
import com.gestionturnos.turnero.logica.Controladora;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvEditarCiudadano", urlPatterns = {"/SvEditarCiudadano"})
public class SvEditarCiudadano extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Traigo al ciudadano por el id porque al ser la Primary Key es única para cada registro de dicha tabla - por lo tanto me va a traer sólo el objeto con el elemento que quiero modificar
        int id = Integer.parseInt(request.getParameter("id"));
        Ciudadano ciudadano = control.traerCiudadano(id);
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("editarCiudad", ciudadano);
        
        response.sendRedirect("editarCiudadano.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        String fechaNacimiento = request.getParameter("fechanacimiento");
        
        //Con esto estoy actualizando lo que ya tengo en la BBDD
        Ciudadano ciudadano = (Ciudadano) request.getSession().getAttribute("editarCiudad");
        ciudadano.setNombre(nombre);
        ciudadano.setApellido(apellido);
        ciudadano.setTelefono(telefono);
        ciudadano.setDireccion(direccion);
        ciudadano.setDni(dni);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate ld = LocalDate.parse(fechaNacimiento, formatter);
        ciudadano.setFechaNac(ld);
        
        control.editarCiudadano(ciudadano);
        
        response.sendRedirect("SvCiudadano");
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
