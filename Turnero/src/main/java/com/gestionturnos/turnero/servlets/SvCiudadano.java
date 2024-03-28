package com.gestionturnos.turnero.servlets;

import com.gestionturnos.turnero.logica.Ciudadano;
import com.gestionturnos.turnero.logica.Controladora;
import com.gestionturnos.turnero.logica.RegexDni;
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


@WebServlet(name = "SvCiudadano", urlPatterns = {"/SvCiudadano"})
public class SvCiudadano extends HttpServlet {
    
    Controladora control = new Controladora();
    RegexDni regex = new RegexDni();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        List<Turno> listaTurnos = new ArrayList<Turno>();
        List<Ciudadano> listaCiudadanos = new ArrayList<Ciudadano>();
        
        //Métodos creados en la controladora para traer todos los ciudadanos y turnos de la BBDD
        listaCiudadanos = control.traerCiudadanos();
        listaTurnos = control.traerTurnos();
        
        //con HttpSession tomo la sesión de usuario
        //con setAttibute seteo el listado, en este caso de ciudadanos y turnos, que hay en la BBDD
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listadoCiudadanos", listaCiudadanos );
        
        /* Seteo el listado de turnos porque quiero que en la aplicación al ver el listado de ciudadanos
           me aparezcan los turnos asociados a éstos
        */
        HttpSession misesion2 = request.getSession();
        misesion2.setAttribute("listadoTurnos", listaTurnos ); //alias al atributo
        
        //Quiero que redireccione a verCiudadanos.jsp para que me muestre la tabla con los resultados
        response.sendRedirect("verCiudadanos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        //Utilizo getParameter para obtener el valor de un parámetro (en este caso el name de los inputs correspondientes)
        //para así conectar este servlet (SvCiudadano) con el jsp (verCiudadanos)
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        String fechaNacimiento = request.getParameter("fechanacimiento");

        //Errores que saltan si algún campo del formulario no se rellena y/o si el formato del DNI es incorrecto
        if(nombre.isEmpty() || apellido.isEmpty() || telefono.isEmpty() || direccion.isEmpty() || dni.isEmpty() || fechaNacimiento.isEmpty() || !regex.comprobarDni(dni)) {
            request.setAttribute("errorMensaje", "¡Todos los campos son obligatorios!"); 
            if(regex.comprobarDni(dni)) {
               request.setAttribute("errorMensaje", "¡Todos los campos son obligatorios!"); 
            }
            else {
                  request.setAttribute("errorDni", "Formato DNI incorrecto, (ejemplo: 12345678P)");    
            }
            request.getRequestDispatcher("/altaCiudadano.jsp").forward(request, response);
        }
        else {
              //Método creado en la controladora para crear los ciudadanos que se vayan insertando en el formulario
              control.crearCiudadano(nombre, apellido, telefono, direccion, dni, fechaNacimiento);
        
              //Una vez introducidos los datos en el formulario y que se ha hecho click en el botón - me redirecciona al index (a la home)
              response.sendRedirect("index.jsp");
        }

    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
