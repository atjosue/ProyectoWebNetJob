package com.modelos;

/**
 * Nombre de la clase: Pais
 * Fecha: 07/08/2018
 * Version: 1.0
 * Copyright: Team 1 Developer's
 * @author Fernando Flamenco
 */
public class Pais {
    private int idPais;
    private String pais;
    private int estado;

    public Pais() {
    }

    public Pais(int idPais, String pais, int estado) {
        this.idPais = idPais;
        this.pais = pais;
        this.estado = estado;
    }

    public int getIdPais() {
        return idPais;
    }

    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
}

