
package com.modelos;

/**
 *
 * @author Carlos_Campos
 */
public class DetalleHabilidad {
    
    
    private int idDetalleHabilidad;
    private int idHabilidad;
    private int idPostulante;
    private int estado;
    private Habilidad habilidad;

    public DetalleHabilidad() {
    }

    public DetalleHabilidad(int idDetalleHabilidad, int idHabilidad, int idPostulante, int estado) {
        this.idDetalleHabilidad = idDetalleHabilidad;
        this.idHabilidad = idHabilidad;
        this.idPostulante = idPostulante;
        this.estado = estado;
    }

    public Habilidad getHabilidad() {
        return habilidad;
    }

    public void setHabilidad(Habilidad habilidad) {
        this.habilidad = habilidad;
    }

    public int getIdDetalleHabilidad() {
        return idDetalleHabilidad;
    }

    public void setIdDetalleHabilidad(int idDetalleHabilidad) {
        this.idDetalleHabilidad = idDetalleHabilidad;
    }

    public int getIdHabilidad() {
        return idHabilidad;
    }

    public void setIdHabilidad(int idHabilidad) {
        this.idHabilidad = idHabilidad;
    }

    public int getIdPostulante() {
        return idPostulante;
    }

    public void setIdPostulante(int idPostulante) {
        this.idPostulante = idPostulante;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
}
