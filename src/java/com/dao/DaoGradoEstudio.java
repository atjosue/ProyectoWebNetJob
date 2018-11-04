package com.dao;

import com.conexion.Conexion;
import com.modelos.GradoEstudio;
import com.modelos.Idioma;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Kevin Antonio Montiel Ramos
 * Nombre De La Clase: DaoGradoEstudio
 * Fecha: 15/08/2018
 * Version: 1.0
 * Copyright: Grupo 1 
 * 
 */
public class DaoGradoEstudio extends Conexion 
{  
    public List<GradoEstudio> mostrarGrado() throws Exception
    {
        List<GradoEstudio> listaGrado = new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql = "SELECT * FROM gradoEstudio WHERE estado = 1;";
            PreparedStatement pre = getCon().prepareStatement(sql);
            res=pre.executeQuery();
            
            while(res.next())
            {   
                GradoEstudio gr = new GradoEstudio();
                
                gr.setIdGradoEstudio(res.getInt("idGradoEstudio"));
                gr.setGrado(res.getString("grado"));
                gr.setEstado(res.getInt("estado"));
                listaGrado.add(gr);     
            }
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null, "Error Al Mostar Datos" + e);
        }
        finally
        {
            this.desconectar();
        }
        
        return listaGrado;
    }
       
    public void insertarGrado(GradoEstudio gr) throws Exception
    {
        
        try 
        {
            this.conectar();
            String sql = "INSERT INTO gradoEstudio (grado, estado) VALUES (?, 1);";
            PreparedStatement pre = getCon().prepareStatement(sql);
            pre.setString(1, gr.getGrado());
            pre.executeUpdate();
        }
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null, "Error Al Insertar Datos" + e);
        }
        finally
        {
            this.desconectar();
        }    
    }
    
    public void modificarDatos(GradoEstudio gr) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "UPDATE gradoEstudio set grado = ? WHERE idGradoEstudio = ?;";
            PreparedStatement pre = getCon().prepareStatement(sql);
            pre.setString(1, gr.getGrado());
            pre.setInt(2, gr.getIdGradoEstudio());
            pre.executeUpdate();
        } 
        catch (Exception e)
        {
            JOptionPane.showMessageDialog(null, "Error Al Modificar Datos" + e);
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void eliminarGrado(GradoEstudio gr) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "UPDATE gradoEstudio set estado = 0  WHERE idGradoEstudio = ?;";
            PreparedStatement pre = getCon().prepareStatement(sql);
            pre.setInt(1, gr.getIdGradoEstudio());
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null, "Error Al Eliminar Datos" + e);
        }
        finally
        {
            this.desconectar();
        }
   
    }
}
