
package com.modelos;

/**
 * Nombre de la clase: Usuario
 * Fecha: 20/02/2018
 * Version 1.0
 * copyRight 
 * @author Carlos Campos
 */
public class Usuario {
    
    
    private int idUsuario;
    private String nombreUsuario;
    private String contraseña;
    private int estado;
    private int idRol;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nombreUsuario, String contraseña, int estado, int idRol) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.contraseña = contraseña;
        this.estado = estado;
        this.idRol = idRol;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }
    
    
    
}
