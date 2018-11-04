
package com.modelos;

/**
 * nombre requisitos
 * fecha 03/11/18
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class Requisitos {
    private int idRequisito;
    private String requisito;
    private String descripcion;
    private int idOferta;

    public Requisitos() {
    }

    public Requisitos(int idRequisito, String requisito, String descripcion, int idOferta) {
        this.idRequisito = idRequisito;
        this.requisito = requisito;
        this.descripcion = descripcion;
        this.idOferta = idOferta;
    }

    public int getIdRequisito() {
        return idRequisito;
    }

    public void setIdRequisito(int idRequisito) {
        this.idRequisito = idRequisito;
    }

    public String getRequisito() {
        return requisito;
    }

    public void setRequisito(String requisito) {
        this.requisito = requisito;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdOferta() {
        return idOferta;
    }

    public void setIdOferta(int idOferta) {
        this.idOferta = idOferta;
    }
    
    
}
