package com.dao;

import com.conexion.Conexion;
import com.modelos.Profesion;
import java.util.*;
import java.sql.*;
import javax.swing.ComboBoxModel;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;

/**
 * nombre de la clase: DaoProfesion
 * fecha: 04/09/18
 * version 1.0
 * copyright team developer's 1
 * @author josue
 */
public class DaoProfesion  extends Conexion{
    
    public List<Profesion> mostrarProfesiones() throws Exception
    {
        ResultSet res;
        List<Profesion> listadoProfesiones = new ArrayList();
        try {
            this.conectar();
            String Sql="Select * from profesion where estado='1'";
            PreparedStatement pre = this.getCon().prepareStatement(Sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Profesion p = new Profesion();
                p.setIdProfesion(res.getInt("idProfesion"));
                p.setNombre(res.getString("profesion"));
                p.setEstado(res.getInt("estado"));
                p.setDescripcion(res.getString("descripcion"));
                listadoProfesiones.add(p);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener profesiones."+e);
        }
        return listadoProfesiones;
    }
    
    public void insertar(Profesion p) throws Exception
    {
        try {
            this.conectar();
            String sql="INSERT INTO profesion VALUES (?,?,?,?);";
            PreparedStatement pre = this.getCon().prepareCall(sql);
            pre.setInt(1, 0);
            pre.setString(2, p.getNombre());
            pre.setInt(3, p.getEstado());
            pre.setString(4, p.getDescripcion());
            pre.executeUpdate();
            JOptionPane.showMessageDialog(null,"Profesion agregada con exito");
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al agregar Profesion");
        }
    }
    
    public void editar(Profesion p) throws Exception
    {
        try {
            this.conectar();
            String sql="UPDATE profesion SET profesion=?, descripcion=? WHERE idProfesion=?;";
            PreparedStatement pre = this.getCon().prepareCall(sql);
            pre.setString(1, p.getNombre());
            pre.setString(2, p.getDescripcion());
            pre.setInt(3, p.getIdProfesion());
            
            pre.executeUpdate();
            JOptionPane.showMessageDialog(null,"Profesion modifiacada con exito");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al modificar Profesion");
        }
    }
    
    public void eliminar(Profesion p) throws Exception
    {
        try {
            this.conectar();
            String sql="UPDATE profesion SET estado=? WHERE idProfesion=?;";
            PreparedStatement pre = this.getCon().prepareCall(sql);
            pre.setInt(1, 0);
            pre.setInt(2, p.getIdProfesion());
            
            pre.executeUpdate();
            JOptionPane.showMessageDialog(null,"Profesion eliminada con exito");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al modificar Profesion");
        }
    }
    
    public DefaultComboBoxModel combo(DefaultComboBoxModel c) throws Exception
    {
        ResultSet res;
        try {
            this.conectar();
            String Sql="Select profesion from profesion where estado='1'";
            PreparedStatement pre = this.getCon().prepareStatement(Sql);
            res=pre.executeQuery();
            while(res.next())
            {
                c.addElement(res.getString("profesion"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener datos de Combo."+e);
        }
        return c;
    }
    
    public int obtenerId(String a) throws Exception
    {
        
        int b=0;
        ResultSet res;
     try {
            this.conectar();
            String sql="Select idProfesion from profesion where profesion=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, a);
         
            res= pre.executeQuery();
                while (res.next()) {             
                        b=res.getInt("idProfesion");
                    }
                
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener id de la Profesion"+e);
        }   
     
     return b;
    }
    
    public String obtenerProfesion(int a) throws Exception
    {
        String b="";
        ResultSet res;
     try {
            this.conectar();
            String sql="Select profesion from profesion where idProfesion=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, a);
         
            res= pre.executeQuery();
                while (res.next()) {             
                        b=res.getString("profesion");
                    }
                
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al obtener id de la Profesion");
        }   
     
     return b;
    }
    
}
