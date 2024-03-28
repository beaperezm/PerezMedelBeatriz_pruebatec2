package com.gestionturnos.turnero.logica;

import com.gestionturnos.turnero.persistencia.ControladoraPersistencia;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;


public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    
// --------- CIUDADANOS -------------
    
     public void crearCiudadano(String nombre, String apellido, String telefono, String direccion, String dni, String fechaNacimiento) {
         
         //Instanciando un objeto de Ciudadano para guardar los datos introducidos en el formulario
         //La fecha la formateo con el mismo formato de la BBDD
         //Creo en la controladora de persistencia el método crearCiudadano pasándole como parámetro el objeto
        Ciudadano ciudadano = new Ciudadano();
        ciudadano.setNombre(nombre);
        ciudadano.setApellido(apellido);
        ciudadano.setTelefono(telefono);
        ciudadano.setDireccion(direccion);
        ciudadano.setDni(dni);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate ld = LocalDate.parse(fechaNacimiento, formatter);
        ciudadano.setFechaNac(ld);
        controlPersis.crearCiudadano(ciudadano); 
    } 
     
    
    public List<Ciudadano> traerCiudadanos() {    
        return controlPersis.traerCiudadanos();
    }
    
    
    public void eliminarCiudadano(int id) {
        controlPersis.eliminarCiudadano(id);
    }

    public Ciudadano traerCiudadano(int id) {
        return controlPersis.traerCiudadano(id);
    }

    public void editarCiudadano(Ciudadano ciudadano) {
        controlPersis.editarCiudadano(ciudadano);
    }
    
    public List<Ciudadano> traerCiudadanosFiltrados(String dni) {
         //Traigo a todos los ciudadanos
        List<Ciudadano> listaCiudanosFiltrados = controlPersis.traerCiudadanos();
        
       /*  y mediante el stream - filter y collect --> filtro por dni y me devuelve una lista con los elementos que cumplen dichas condiciones (en este caso
           será solo un ciudadano puesto que el DNI es único). */
        List<Ciudadano> filtroCiudadano =  listaCiudanosFiltrados.stream()
              .filter(p -> p.getDni().equalsIgnoreCase(dni))
              .collect(Collectors.toList());
        
            return filtroCiudadano;
    }

    
// --------- TURNOS -------------
    
    public void crearTurno(Turno turno, int id) {
        //Al crear el turno también accedo al ciudadano para asignarle dicho turno a dicho ciudadano
        Ciudadano ciudadano = controlPersis.traerCiudadano(id);
        turno.setCiudadano(ciudadano);
        controlPersis.crearTurno(turno);
    }

    
    public List<Turno> traerTurnos() {
        return controlPersis.traerTurnos();
    }
    

    public void eliminarTurno(int id) {
        controlPersis.eliminarTurno(id);
    }
    
    
    public Turno traerUnTurno(int id) {
        return controlPersis.traerUnTurno(id);
    }
    
    public void editarTurno(Turno turno) {
        controlPersis.editarTurno(turno);
    }

    public List<Turno> traerTurnosPorFechaYEstado(String fecha, String estado) {
            //Traigo todos los turnos
           List<Turno> listaTurnosFiltrados = controlPersis.traerTurnos();
           //La fecha la formateo con el mismo formato de la BBDD
           DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
           LocalDate ld = LocalDate.parse(fecha, formatter);
         
      //y mediante el stream - filter y collect --> filtro por fecha y estado y me devuelve una lista con los elementos que cumplen dichas condiciones.
            List<Turno> filtros =  listaTurnosFiltrados.stream()
                .filter(p -> p.getFecha().equals(ld))
                .filter(e -> e.getEstado().equalsIgnoreCase(estado))
                .collect(Collectors.toList());

            return filtros;
    }
    
        public List<Turno> traerTurnosFiltrados(String dni) {
            //Traigo todos los turnos
          List<Turno> listaTurnosFiltrados = controlPersis.traerTurnos();
        
          //y mediante el stream - filter y collect --> filtro por dni y me devuelve una lista con los turnos asociados a dicho dni
          List<Turno> filtroTurno =  listaTurnosFiltrados.stream()
              .filter(p -> p.getCiudadano().getDni().equalsIgnoreCase(dni) )
              .collect(Collectors.toList());

            return filtroTurno;
    }


}
