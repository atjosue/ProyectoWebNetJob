package com.modelos;

/**
 *
 * @author Kevin Antonio Montiel Ramos
 * Nombre De La Clase: GradoEstudio
 * Fecha: 15/08/2018
 * Version: 1.0
 * Copyright: Grupo 1 
 * 
 */
public class GradoEstudio 
{
    
    private int idGradoEstudio;
    private String grado;
    private int estado;

    public GradoEstudio() {
    }

    public GradoEstudio(int idGradoEstudio, String grado, int estado) {
        this.idGradoEstudio = idGradoEstudio;
        this.grado = grado;
        this.estado = estado;
    }

    public int getIdGradoEstudio() {
        return idGradoEstudio;
    }

    public void setIdGradoEstudio(int idGradoEstudio) {
        this.idGradoEstudio = idGradoEstudio;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
}
