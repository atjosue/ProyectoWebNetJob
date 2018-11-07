
package com.modelos;

/**
 * nombre Rubro
 * fecha 07/11/18
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class Rubro {
 
    private int idRubro;
    private String nombre;
    private String descripcion;
    private String estado;

    public Rubro() {
    }

    public Rubro(int idRubro, String nombre, String descripcion, String estado) {
        this.idRubro = idRubro;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public int getIdRubro() {
        return idRubro;
    }

    public void setIdRubro(int idRubro) {
        this.idRubro = idRubro;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
}
