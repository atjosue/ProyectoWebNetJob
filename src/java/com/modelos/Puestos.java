package com.modelos;

/**
 * nombre Puestps
 * fecha 28/10/18
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class Puestos {
    private int idPuesto;
    private String nombrePuesto;
    private String descripcion;
    private int idArea;
    private int estado;
    private int idEmpresa;

    public Puestos() {
    }

    public Puestos(int idPuesto, String nombrePuesto, String descripcion, int idArea, int estado, int idEmpresa) {
        this.idPuesto = idPuesto;
        this.nombrePuesto = nombrePuesto;
        this.descripcion = descripcion;
        this.idArea = idArea;
        this.estado = estado;
        this.idEmpresa = idEmpresa;
    }

    public int getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(int idPuesto) {
        this.idPuesto = idPuesto;
    }

    public String getNombrePuesto() {
        return nombrePuesto;
    }

    public void setNombrePuesto(String nombrePuesto) {
        this.nombrePuesto = nombrePuesto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdArea() {
        return idArea;
    }

    public void setIdArea(int idArea) {
        this.idArea = idArea;
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
