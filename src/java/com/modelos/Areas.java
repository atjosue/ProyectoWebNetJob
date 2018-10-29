
package com.modelos;

/**
 * nombre Areas
 * fecha 28/10/18
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class Areas {
    
    private int idArea;
    private String nombre;
    private int estado;
    private int idEmpresa;

    public Areas() {
    }
    
     public Areas(int idArea, String nombre, int estado, int idEmpresa) {
        this.idArea = idArea;
        this.nombre = nombre;
        this.estado = estado;
        this.idEmpresa = idEmpresa;
    }
     
    public int getIdArea() {
        return idArea;
    }

    public void setIdArea(int idArea) {
        this.idArea = idArea;
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

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

   
    
}
