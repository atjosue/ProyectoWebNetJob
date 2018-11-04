
package com.modelos;

import java.io.Serializable;

/**
 * nombre Oferta
 * fecha 30/10/18
 * version 1.0
 * copyright netjob
 * @author josue
 */

public class Oferta implements Serializable{
  private int idOferta;
  private String  titulo;
  private String  descripcion;
  private int  vacantes;
  private double  SalarioMinimo;
  private double  salarioMaximo;
  private int  idEmpresa;
  private int  aniosExperiencia;
  private int  edadMinima;
  private int  edadMaxima;
  private int  idArea;
  private int  idPuesto;
  private String  fechaPublicacion;
  private int  estado;
  private int  idGradoEstudio;
  private int  sexo;
  private int estadoP;

    public Oferta() {
    }
    
    public Oferta(int idOferta, String titulo, String descripcion, int vacantes, double SalarioMinimo, double salarioMaximo, int idEmpresa, int aniosExperiencia, int edadMinima, int edadMaxima, int idArea, int idPuesto, String fechaPublicacion, int estado, int idGradoEstudio, int sexo, int estadoP) {
        this.idOferta = idOferta;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.vacantes = vacantes;
        this.SalarioMinimo = SalarioMinimo;
        this.salarioMaximo = salarioMaximo;
        this.idEmpresa = idEmpresa;
        this.aniosExperiencia = aniosExperiencia;
        this.edadMinima = edadMinima;
        this.edadMaxima = edadMaxima;
        this.idArea = idArea;
        this.idPuesto = idPuesto;
        this.fechaPublicacion = fechaPublicacion;
        this.estado = estado;
        this.idGradoEstudio = idGradoEstudio;
        this.sexo = sexo;
        this.estadoP = estadoP;
    }

    public int getIdOferta() {
        return idOferta;
    }

    public void setIdOferta(int idOferta) {
        this.idOferta = idOferta;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getVacantes() {
        return vacantes;
    }

    public void setVacantes(int vacantes) {
        this.vacantes = vacantes;
    }

    public double getSalarioMinimo() {
        return SalarioMinimo;
    }

    public void setSalarioMinimo(double SalarioMinimo) {
        this.SalarioMinimo = SalarioMinimo;
    }

    public double getSalarioMaximo() {
        return salarioMaximo;
    }

    public void setSalarioMaximo(double salarioMaximo) {
        this.salarioMaximo = salarioMaximo;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public int getAniosExperiencia() {
        return aniosExperiencia;
    }

    public void setAniosExperiencia(int aniosExperiencia) {
        this.aniosExperiencia = aniosExperiencia;
    }

    public int getEdadMinima() {
        return edadMinima;
    }

    public void setEdadMinima(int edadMinima) {
        this.edadMinima = edadMinima;
    }

    public int getEdadMaxima() {
        return edadMaxima;
    }

    public void setEdadMaxima(int edadMaxima) {
        this.edadMaxima = edadMaxima;
    }

    public int getIdArea() {
        return idArea;
    }

    public void setIdArea(int idArea) {
        this.idArea = idArea;
    }

    public int getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(int idPuesto) {
        this.idPuesto = idPuesto;
    }

    public String getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(String fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getIdGradoEstudio() {
        return idGradoEstudio;
    }

    public void setIdGradoEstudio(int idGradoEstudio) {
        this.idGradoEstudio = idGradoEstudio;
    }

    public int getSexo() {
        return sexo;
    }

    public void setSexo(int sexo) {
        this.sexo = sexo;
    }

    public int getEstadoP() {
        return estadoP;
    }

    public void setEstadoP(int estadoP) {
        this.estadoP = estadoP;
    }

    
    
  
}
