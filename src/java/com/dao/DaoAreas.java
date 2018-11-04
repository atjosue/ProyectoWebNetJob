
package com.dao;

import com.conexion.Conexion;
import com.modelos.Areas;
import java.sql.*;
import java.util.*;

/**
 * nombre DaoAreas
 * fecha 28/10/2018
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class DaoAreas extends Conexion{
    //METODO PARA MOSTRAR LOS DATOS
    
    public List<Areas> mostrarAreas() throws SQLException, Exception
    {
        List<Areas> listadoAreas= new ArrayList();
        ResultSet res;
        try {
            this.conectar();
            String sql="select * from area where estado=1";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Areas ar= new Areas();
                ar.setIdArea(res.getInt("idArea"));
                ar.setNombre(res.getString("nombre"));
                ar.setEstado(res.getInt("estado"));
                ar.setIdEmpresa(1);
                listadoAreas.add(ar);
            }
            
        } 
        catch (SQLException e) 
        {
            throw e;
        } 
        finally
        {
            this.desconectar();
        }
        return listadoAreas;
    }
    public Areas mostrarArea() throws SQLException, Exception
    {
        Areas ar= new Areas();
        ResultSet res;
        try {
            this.conectar();
            String sql="select * from area where estado=1 and idArea=1";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                
                ar.setIdArea(res.getInt("idArea"));
                ar.setNombre(res.getString("nombre"));
                ar.setEstado(res.getInt("estado"));
                ar.setIdEmpresa(1);
                
            }
            
        } 
        catch (SQLException e) 
        {
            throw e;
        } 
        finally
        {
            this.desconectar();
        }
        return ar;
    }
    
    //INSERTAR AREAS
    public int insertarArea(Areas ar) throws Exception
    {
        int a=0;
        try 
        {
            this.conectar();
            
            String sql="insert into area(nombre, estado) values(?,?)";
            PreparedStatement pre= this.getCon().prepareStatement(sql);
            pre.setString(1, ar.getNombre());
            pre.setInt(2, ar.getEstado());
             a=pre.executeUpdate();
        }
        catch (SQLException e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        return a;
    }
    
    //MODIFICAR AREA
      public int ModificarArea(Areas ar) throws Exception
    {
        int a=0;
        try 
        {
            this.conectar();
            String sql="update area set nombre=? where idArea=?";
            PreparedStatement pre= this.getCon().prepareStatement(sql);
            pre.setString(1, ar.getNombre());
            pre.setInt(2, ar.getIdArea());
            a=pre.executeUpdate();
        }
        catch (SQLException e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        return a;
    }
      
      
      //ELIMINAR AREA
      public int eliminarArea(Areas ar) throws Exception
    {
        int a=0;
        try 
        {
            this.conectar();
            String sql="update area set estado=? where idArea=?";
            PreparedStatement pre= this.getCon().prepareStatement(sql);
            pre.setInt(1, 0);
            pre.setInt(2, ar.getIdArea());
            a=pre.executeUpdate();
        }
        catch (SQLException e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        return a;
    }
    
    
    public List<Areas> infoArea( int cod) throws SQLException, Exception
    {
        List<Areas> listadoAreas= new ArrayList();
        ResultSet res;
        try {
            this.conectar();
            String sql="select * from area where idArea=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, cod);
            res=pre.executeQuery();
            while(res.next())
            {
                Areas ar= new Areas();
                ar.setIdArea(res.getInt("idArea"));
                ar.setNombre(res.getString("nombre"));
                ar.setEstado(res.getInt("estado"));
                ar.setIdEmpresa(res.getInt("idEmpresa"));
                listadoAreas.add(ar);
            }
            
        } 
        catch (SQLException e) 
        {
            throw e;
        } 
        finally
        {
            this.desconectar();
        }
        return listadoAreas;
    }
    
}


