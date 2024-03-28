package com.gestionturnos.turnero.logica;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class Ciudadano implements Serializable {
    
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id_ciudadano;
    private String nombre;
    private String apellido;
    private String telefono;
    private String direccion;
    private String dni;
    private LocalDate fechaNac;
    @OneToMany(mappedBy="ciudadano") //--> Va a ir a la clase turno y va a buscar algo que se llame turno
    private List<Turno> listadoTurnos; //con esto tengo la relación 1 a N (1 ciudadano puede tener una lista de turnos)


    public Ciudadano() {
    }

       
    
    public Ciudadano(String nombre, String apellido, String telefono, String direccion, String dni, LocalDate fechaNac, List<Turno> listadoTurnos) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.direccion = direccion;
        this.dni = dni;
        this.fechaNac = fechaNac;
        this.listadoTurnos = listadoTurnos;
    }

    
    public int getId_ciudadano() {
        return id_ciudadano;
    }

    public void setId_ciudadano(int idCiudadano) {
        this.id_ciudadano = idCiudadano;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public LocalDate getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(LocalDate fechaNac) {
        this.fechaNac = fechaNac;
    }

    public List<Turno> getListadoTurnos() {
        return listadoTurnos;
    }

    public void setListadoTurnos(List<Turno> listadoTurnos) {
        this.listadoTurnos = listadoTurnos;
    }
    
    //Esta función establece el patrón de la fecha de Nacimiento tal y como aparece en el input date
    public String fechaNacFormateada() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return formatter.format(fechaNac);
    }

}
