package com.dao;
import com.conexion.Conexion;
import com.modelos.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;


/**
 * Nombre de la clase: DaoPais
 * Fecha: 07/08/2018
 * Version: 1.0
 * Copyright: Team 1 Developer's
 * @author Fernando Flamenco
 */
public class DaoPais extends Conexion{
    
    public ArrayList<Pais> mostrarPais() throws Exception
    {
        ArrayList<Pais>listaPaises = new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql="select * from pais where estado=1;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            
            while(res.next())
            {
                Pais ps = new Pais();
                ps.setIdPais(res.getInt("idPais"));
              
                ps.setPais(res.getString("pais"));
                ps.setEstado(res.getInt("estado"));
                listaPaises.add(ps);
            }
            
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null,"Error al Mostrar datos. \n Sistema Dice: "+e.toString(),"Error!",2);
        }
        finally
        {
            this.desconectar();
        }
        return listaPaises;
    }
    
    public void insertarPais(Pais ps) throws Exception
    {
        try 
        {
            this.conectar();
            String sql="insert into pais values(?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1,ps.getIdPais());
            pre.setString(2,ps.getPais());
            pre.setInt(3,ps.getEstado());
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null,"Error al Insertar datos. \n Sistema Dice: "+e.toString(),"Error!",2);
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void modificarPais(Pais ps) throws Exception
    {
        try 
        {
            this.conectar();
            String sql="update pais set pais=?, estado=? where idPais=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1,ps.getPais());
            pre.setInt(2,ps.getEstado());
            pre.setInt(3,ps.getIdPais());
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null,"Error al Modificar datos. \n Sistema Dice: "+e.toString(),"Error!",2);
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void eliminarPais(Pais ps) throws Exception
    {
        try 
        {
            this.conectar();
            String sql="update pais set estado=0 where idPais=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1,ps.getIdPais());
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null,"Error al Eliminar dato. \n Sistema Dice: "+e.toString(),"Error!",2);
        }
        finally
        {
            this.desconectar();
        }
    }
    
}
