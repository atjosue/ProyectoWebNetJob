package com.modelos;

/**
 *
 * @author Kevin Antonio Montiel Ramos
 * Nombre De La Clase: Idioma
 * Fecha: 13/08/2018
 * Version: 1.0
 * Copyright: Grupo 1 
 * 
 */
public class Idioma 
{
 
    private int idIdioma;
    private String idioma;
    private int estado;

    public Idioma() {
    }

    public Idioma(int idIdioma, String idioma, int estado) {
        this.idIdioma = idIdioma;
        this.idioma = idioma;
        this.estado = estado;
    }

    public int getIdIdioma() {
        return idIdioma;
    }

    public void setIdIdioma(int idIdioma) {
        this.idIdioma = idIdioma;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
}
