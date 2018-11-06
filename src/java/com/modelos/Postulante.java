
package com.modelos;

import java.io.InputStream;

/**
 * Nombre de la clase: Postulante
 * Fecha: 29/10/2018
 * Version: 1.0
 * copyRight: Carlos Campos
 * @author Carlos_Campos
 */
public class Postulante {
    
    private int idPostulante;
    private String nombres;
    private String apellidos;
    private String genero;
    private String fechaNacimiento;
    private String telefono;
    private int idProvincia;
    private int idDepartamento;
    private int idPais;
    private int idUsuario;
    private String correo;
    private String direccion;
    private int idProfesion;
    private int idGradoEstudio;
    private int idIdioma;
    private InputStream imagen;
    private String base64Image;
    private String fechaRegistro;
    private int estado;

    public Postulante() {
    }

    public Postulante(int idPostulante, String nombres, String apellidos, String genero, String fechaNacimiento, String telefono, int idProvincia, int idDepartamento, int idPais, int idUsuario, String correo, String direccion, int idProfesion, int idGradoEstudio, int idIdioma, InputStream imagen, String base64Image, String fechaRegistro, int estado) {
        this.idPostulante = idPostulante;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.genero = genero;
        this.fechaNacimiento = fechaNacimiento;
        this.telefono = telefono;
        this.idProvincia = idProvincia;
        this.idDepartamento = idDepartamento;
        this.idPais = idPais;
        this.idUsuario = idUsuario;
        this.correo = correo;
        this.direccion = direccion;
        this.idProfesion = idProfesion;
        this.idGradoEstudio = idGradoEstudio;
        this.idIdioma = idIdioma;
        this.imagen = imagen;
        this.base64Image = base64Image;
        this.fechaRegistro = fechaRegistro;
        this.estado = estado;
    }

    

    public int getIdPostulante() {
        return idPostulante;
    }

    public void setIdPostulante(int idPostulante) {
        this.idPostulante = idPostulante;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getIdProvincia() {
        return idProvincia;
    }

    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public int getIdPais() {
        return idPais;
    }

    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdProfesion() {
        return idProfesion;
    }

    public void setIdProfesion(int idProfesion) {
        this.idProfesion = idProfesion;
    }

    public int getIdGradoEstudio() {
        return idGradoEstudio;
    }

    public void setIdGradoEstudio(int idGradoEstudio) {
        this.idGradoEstudio = idGradoEstudio;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public String getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(String fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getIdIdioma() {
        return idIdioma;
    }

    public void setIdIdioma(int idIdioma) {
        this.idIdioma = idIdioma;
    }
    
    
    
    
    
}
