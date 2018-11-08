
package com.modelos;

/**
 *
 * @author Carlos_Campos
 */
public class Experiencia {
    
    private int idExperiencia;
    private String empresa;
    private String cargo;
    private String descripcion;
    private int tiempoLaborado;
    private int idPostulante;
    private int estado;

    public Experiencia() {
    }

    public Experiencia(int idExperiencia, String empresa, String cargo, String descripcion, int tiempoLaborado, int idPostulante, int estado) {
        this.idExperiencia = idExperiencia;
        this.empresa = empresa;
        this.cargo = cargo;
        this.descripcion = descripcion;
        this.tiempoLaborado = tiempoLaborado;
        this.idPostulante = idPostulante;
        this.estado = estado;
    }

    public int getIdExperiencia() {
        return idExperiencia;
    }

    public void setIdExperiencia(int idExperiencia) {
        this.idExperiencia = idExperiencia;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getTiempoLaborado() {
        return tiempoLaborado;
    }

    public void setTiempoLaborado(int tiempoLaborado) {
        this.tiempoLaborado = tiempoLaborado;
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
