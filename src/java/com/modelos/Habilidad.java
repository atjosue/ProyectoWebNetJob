
package com.modelos;

/**
 *
 * @author Carlos_Campos
 */
public class Habilidad {
    
    private int idHabilidad;
    private String habilidad;
    private int estado;
    private String descripcion;
    private int idProfesion;

    public Habilidad() {
    }

    public Habilidad(int idHabilidad, String habilidad, int estado, String descripcion, int idProfesion) {
        this.idHabilidad = idHabilidad;
        this.habilidad = habilidad;
        this.estado = estado;
        this.descripcion = descripcion;
        this.idProfesion = idProfesion;
    }

    public int getIdHabilidad() {
        return idHabilidad;
    }

    public void setIdHabilidad(int idHabilidad) {
        this.idHabilidad = idHabilidad;
    }

    public String getHabilidad() {
        return habilidad;
    }

    public void setHabilidad(String habilidad) {
        this.habilidad = habilidad;
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

    public int getIdProfesion() {
        return idProfesion;
    }

    public void setIdProfesion(int idProfesion) {
        this.idProfesion = idProfesion;
    }
    
    
    
    
    
}
