package com.modelos;

/**
 * Nombre de la clase: Departamento
 * Fecha: 07/08/2018
 * Version: 1.0
 * Copyright: Team 1 Developer's
 * @author Fernando Flamenco
 */
public class Departamento {
    private int idDepartamento;
    private String departamento;
    private int idPais;
    private int estado;
    private String pais;

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public Departamento() {
    }

    public Departamento(int idDepartamento, String departamento, int idPais, int estado) {
        this.idDepartamento = idDepartamento;
        this.departamento = departamento;
        this.idPais = idPais;
        this.estado = estado;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public int getIdPais() {
        return idPais;
    }

    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
}

