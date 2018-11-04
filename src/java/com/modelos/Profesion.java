package com.modelos;

/**
 * nombre de la clase Profesion 
 * fecha: 04/09/18
 * version 1.0
 * copyright Team Developer's 1
 * @author josue
 */
public class Profesion {
    private int idProfesion;
    private String nombre;
    private int estado;
    private String descripcion;

    public Profesion() {
    }

    public Profesion(int idProfesion, String nombre, int estado, String descripcion) {
        this.idProfesion = idProfesion;
        this.nombre = nombre;
        this.estado = estado;
        this.descripcion = descripcion;
    }

    public int getIdProfesion() {
        return idProfesion;
    }

    public void setIdProfesion(int idProfesion) {
        this.idProfesion = idProfesion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
       
}
