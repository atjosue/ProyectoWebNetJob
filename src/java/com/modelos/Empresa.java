
package com.modelos;

import java.io.InputStream;

/**
 * nombre Empresa
 * fecha  06/11/18
 * version 1.0
 * copyright netjob
/* @author josue
 */
public class Empresa {
    
    private int idEmpresa; 
    private String nombre;
    private String direccion;
    private String telefono;
    private String mision;
    private String vision;
    private String correo;
    private String latitud;
    private String longitud;
    private int idUsuario;
    private int idRubro;
    private int idProvincia;
    private int idDepartamento;
    private int idPais;
    private int estado;
    private String facebook;
    private String instagram;
    private String paginaWeb;
    private String descripcion1;
    private String descripcion2;
    private InputStream imagen;
    private String base64Image;
    private InputStream imagen2;
    private String base64Image2;
    private int estadoA;

    public Empresa() {
    }

    public Empresa(int idEmpresa, String nombre, String direccion, String telefono, String mision, String vision, String correo, String latitud, String longitud, int idUsuario, int idRubro, int idProvincia, int idDepartamento, int idPais, int estado, String facebook, String instagram, String paginaWeb, String descripcion1, String descripcion2, InputStream imagen, String base64Image, InputStream imagen2, String base64Image2, int estadoA) {
        this.idEmpresa = idEmpresa;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.mision = mision;
        this.vision = vision;
        this.correo = correo;
        this.latitud = latitud;
        this.longitud = longitud;
        this.idUsuario = idUsuario;
        this.idRubro = idRubro;
        this.idProvincia = idProvincia;
        this.idDepartamento = idDepartamento;
        this.idPais = idPais;
        this.estado = estado;
        this.facebook = facebook;
        this.instagram = instagram;
        this.paginaWeb = paginaWeb;
        this.descripcion1 = descripcion1;
        this.descripcion2 = descripcion2;
        this.imagen = imagen;
        this.base64Image = base64Image;
        this.imagen2 = imagen2;
        this.base64Image2 = base64Image2;
        this.estadoA = estadoA;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getMision() {
        return mision;
    }

    public void setMision(String mision) {
        this.mision = mision;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdRubro() {
        return idRubro;
    }

    public void setIdRubro(int idRubro) {
        this.idRubro = idRubro;
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

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getPaginaWeb() {
        return paginaWeb;
    }

    public void setPaginaWeb(String paginaWeb) {
        this.paginaWeb = paginaWeb;
    }

    public String getDescripcion1() {
        return descripcion1;
    }

    public void setDescripcion1(String descripcion1) {
        this.descripcion1 = descripcion1;
    }

    public String getDescripcion2() {
        return descripcion2;
    }

    public void setDescripcion2(String descripcion2) {
        this.descripcion2 = descripcion2;
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

    public InputStream getImagen2() {
        return imagen2;
    }

    public void setImagen2(InputStream imagen2) {
        this.imagen2 = imagen2;
    }

    public String getBase64Image2() {
        return base64Image2;
    }

    public void setBase64Image2(String base64Image2) {
        this.base64Image2 = base64Image2;
    }

    public int getEstadoA() {
        return estadoA;
    }

    public void setEstadoA(int estadoA) {
        this.estadoA = estadoA;
    }
    
    
    
    
    
}
