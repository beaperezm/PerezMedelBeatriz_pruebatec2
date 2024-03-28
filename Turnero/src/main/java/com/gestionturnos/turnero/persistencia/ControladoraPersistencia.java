package com.gestionturnos.turnero.persistencia;

import com.gestionturnos.turnero.logica.Ciudadano;
import com.gestionturnos.turnero.logica.Turno;
import com.gestionturnos.turnero.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {
    
    CiudadanoJpaController ciudadanoJPA = new CiudadanoJpaController();
    TurnoJpaController turnoJPA = new TurnoJpaController();
    
    
    
    // --------- CIUDADANOS -------------
    public void crearCiudadano(Ciudadano ciudadano) {
        ciudadanoJPA.create(ciudadano);
    }
    
   public List<Ciudadano> traerCiudadanos() {
          return ciudadanoJPA.findCiudadanoEntities();
    }
    
    
    public Ciudadano traerCiudadano(int id) {
        return ciudadanoJPA.findCiudadano(id);
    }
    
 
    public void editarCiudadano(Ciudadano ciudadano) {
        try {
            ciudadanoJPA.edit(ciudadano);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarCiudadano(int id) {
        try {
            ciudadanoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    // --------- TURNOS -------------
    
    public void crearTurno(Turno turno) {
       turnoJPA.create(turno);
    }
    
    public List<Turno> traerTurnos() {
        return turnoJPA.findTurnoEntities();
    }

    public void eliminarTurno(int id) {
        try {
            turnoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Turno traerUnTurno(int id) {
       return turnoJPA.findTurno(id);
    }

    public void editarTurno(Turno turno) {
        try {
            turnoJPA.edit(turno);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

 
}
