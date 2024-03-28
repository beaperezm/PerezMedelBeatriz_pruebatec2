package com.gestionturnos.turnero.servlets;

import com.gestionturnos.turnero.logica.Controladora;
import com.gestionturnos.turnero.logica.Turno;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvTurno", urlPatterns = {"/SvTurno"})
public class SvTurno extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
  
        List<Turno> listaTurnos = new ArrayList<Turno>();
        //Método creado en la controladora para traer todos los turnos de la BBDD
        listaTurnos = control.traerTurnos();

        
        //con HttpSession tomo la sesión de usuario
        //con setAttibute seteo el listado de turnos que hay en la BBDD
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listadoTurnos", listaTurnos );
        
        //Quiero que redireccione a verTurnos.jsp para que me muestre la tabla con los resultados
        response.sendRedirect("verTurnos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        try {
        /* Utilizo getParameter para obtener el valor de un parámetro (en este caso el name de los inputs correspondientes)
             para así conectar este servlet (SvTurno) con el jsp (verTurnos) */
            String fecha = request.getParameter("fecha");
            String tramite = request.getParameter("tramite");
            String estado = request.getParameter("estado");
            String idCiudadano = request.getParameter("ciudadano");
        
       // Formateo la fecha tal y como aparece en la BBDD y almaceno los datos obtenidos del formulario en el objeto 'turno'
            Turno turno = new Turno();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate ld = LocalDate.parse(fecha, formatter);
            turno.setFecha(ld);
            turno.setDescripcionTramite(tramite);
            turno.setEstado(estado);
            
            
        // Error que salta si algún campo del formulario no se rellena
            if(tramite.isEmpty() || idCiudadano.isEmpty()) {
                request.setAttribute("errorMensaje", "¡Todos los campos son obligatorios!");
                request.getRequestDispatcher("/altaTurno.jsp").forward(request, response);
            }
            
            else {
            /* Método creado en la controladora para crear los turnos que se vayan insertando en el formulario 
              y además agrego el ID de ciudadano para que se almacene el ciudadano asignado al turno creado */
               control.crearTurno(turno, Integer.parseInt(idCiudadano));
        
        //Una vez introducidos los datos en el formulario y que se ha hecho click en el botón - me redirecciona al index (a la home)
           response.sendRedirect("index.jsp");
            }
            
   
 
        } catch (DateTimeParseException ex) {
             request.setAttribute("errorMensaje", "¡Todos los campos son obligatorios!");
             request.getRequestDispatcher("/altaTurno.jsp").forward(request, response);
        }
    
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
