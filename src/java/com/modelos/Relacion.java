
package com.modelos;

/**
 *
 * @author Carlos_Campos
 */
public class Relacion {
   
    private int idRelacion;
     private int idSeguido;
     private int idSeguidor;
     private int estado;

    public Relacion() {
    }

    public Relacion(int idRelacion, int idSeguido, int idSeguidor, int estado) {
        this.idRelacion = idRelacion;
        this.idSeguido = idSeguido;
        this.idSeguidor = idSeguidor;
        this.estado = estado;
    }

    public int getIdRelacion() {
        return idRelacion;
    }

    public void setIdRelacion(int idRelacion) {
        this.idRelacion = idRelacion;
    }

    public int getIdSeguido() {
        return idSeguido;
    }

    public void setIdSeguido(int idSeguido) {
        this.idSeguido = idSeguido;
    }

    public int getIdSeguidor() {
        return idSeguidor;
    }

    public void setIdSeguidor(int idSeguidor) {
        this.idSeguidor = idSeguidor;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
     
     
     
     
    
    
}
