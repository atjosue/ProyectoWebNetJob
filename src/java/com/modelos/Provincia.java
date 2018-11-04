package com.modelos;

/**
 * Nombre de la clase: Provincia
 * Fecha: 07/08/2018
 * Version: 1.0
 * Copyright: Team 1 Developer's
 * @author Fernando Flamenco
 */
public class Provincia {
    private int idProvincia;
    private String provincia;
    private int idDepartamento;
    private int estado;
    
    private String pais;
    private String departamento;

    public Provincia() {
    }

    public Provincia(int idProvincia, String provincia, int idDepartamento, int estado, String pais, String departamento) {
        this.idProvincia = idProvincia;
        this.provincia = provincia;
        this.idDepartamento = idDepartamento;
        this.estado = estado;
        this.pais = pais;
        this.departamento = departamento;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    
    public int getIdProvincia() {
        return idProvincia;
    }

    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
}

