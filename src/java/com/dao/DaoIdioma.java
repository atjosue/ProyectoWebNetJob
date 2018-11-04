package com.dao;

import com.conexion.Conexion;
import com.modelos.Idioma;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Kevin Antonio Montiel Ramos
 * Nombre De La Clase: DaoIdioma
 * Fecha: 13/08/2018
 * Version: 1.0
 * Copyright: Grupo 1 
 * 
 */
public class DaoIdioma extends Conexion
{
    
    public List<Idioma> mostrarIdioma() throws Exception
    {
        List<Idioma> listaIdiomas = new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql = "select * from idioma WHERE estado = 1;";
            PreparedStatement pre = getCon().prepareStatement(sql);
            res = pre.executeQuery();
            
            while(res.next())
            {
                Idioma id = new Idioma();
                
                id.setIdIdioma(res.getInt("idIdioma"));
                id.setIdioma(res.getString("idioma"));
                id.setEstado(res.getInt("estado"));
                listaIdiomas.add(id);
            }
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null, "Error Al Mostrar Datos " + e.toString());
        }
        finally
        {
            this.desconectar();
        }
        
        return listaIdiomas;     
    }
    
    public void insertarIdioma(Idioma id) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "INSERT INTO idioma (idioma, estado) VALUES(?,1);";
            PreparedStatement pre = getCon().prepareStatement(sql);
            pre.setString(1, id.getIdioma());
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
    
    public void modificarIdioma(Idioma id) throws Exception
    {
        try 
        {
            this.conectar();
            String slq = " UPDATE idioma set idioma = ?  WHERE idIdioma = ?;";
            PreparedStatement pre = getCon().prepareStatement(slq);
            pre.setString(1, id.getIdioma());
            pre.setInt(2, id.getIdIdioma());
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null, "Error Al Modificar El Idioma " + e.toString());
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void eliminarIdioma(Idioma id) throws Exception
    {
        try 
        {
            this.conectar();
            String sql = "UPDATE idioma set estado = 0  WHERE idIdioma = ?;";
            PreparedStatement pre = getCon().prepareStatement(sql);
            pre.setInt(1, id.getIdIdioma());
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null, "Error Al Eliminar " + e);
        }
        finally
        {
            this.desconectar();
        }
    }
    
}
