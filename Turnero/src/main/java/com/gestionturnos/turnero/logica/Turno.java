package com.gestionturnos.turnero.logica;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Turno implements Serializable {
    
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int idTurno;
    private String estado;
    private LocalDate fecha;
    private String descripcionTramite;

    
    @ManyToOne
    @JoinColumn(name = "ciudadano_id")
    private Ciudadano ciudadano;

    public Turno() {
    }

    public Turno(int idTurno, String estado, LocalDate fecha, String descripcioTramite) {
        this.idTurno = idTurno;
        this.estado = estado;
        this.fecha = fecha;
        this.descripcionTramite = descripcionTramite;

    }

    public Turno(String estado, LocalDate fecha, String descripcionTramite, Ciudadano ciudadano) {
        this.estado = estado;
        this.fecha = fecha;
        this.descripcionTramite = descripcionTramite;
        this.ciudadano = ciudadano;

    }

    
    public int getIdTurno() {
        return idTurno;
    }

    public void setIdTurno(int idTurno) {
        this.idTurno = idTurno;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public String getDescripcionTramite() {
        return descripcionTramite;
    }

    public void setDescripcionTramite(String descripcionTramite) {
        this.descripcionTramite = descripcionTramite;
    }

    public Ciudadano getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(Ciudadano ciudadano) {
        this.ciudadano = ciudadano;
    }
    
  //Esta función establece el patrón de la fecha tal y como aparece en el input date
    public String fechaFormateada() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return formatter.format(fecha);
    }

    
}
