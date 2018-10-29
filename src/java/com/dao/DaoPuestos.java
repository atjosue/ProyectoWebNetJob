
package com.dao;
import com.conexion.Conexion;
import com.modelos.Puestos;
import java.util.*;
import java.sql.*;

/**
 * nombre DaoPuestos
 * fecha 28/10/18
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class DaoPuestos extends Conexion {
    //metodo para mostrar puestos
    public List<Puestos> mostrar() throws Exception
    {
        ResultSet res;
        List<Puestos> listadoPuestos= new ArrayList();
        try {
         this.conectar();
         String sql = "select * from puesto where estado=1";
         PreparedStatement pre = this.getCon().prepareStatement(sql);
         res= pre.executeQuery();
            while (res.next()) {                
                Puestos p = new Puestos();
                p.setIdPuesto(res.getInt("idPuesto"));
                p.setNombrePuesto(res.getString("nombrePuesto"));
                p.setDescripcion(res.getString("descripcion"));
                p.setIdArea(res.getInt("idArea"));
                p.setIdEmpresa(res.getInt("idEmpresa"));
                listadoPuestos.add(p);
            }
            
        } catch (SQLException e) {
           throw e;
        }finally
        {
            this.desconectar();
        }
        
        return listadoPuestos;
    }
    
    //metodo para mostrar puestos por empresa
    public List<Puestos> mostrarPuestoEmpresa(int cod) throws Exception
    {
        ResultSet res;
        List<Puestos> listadoPuestos= new ArrayList();
        try {
         this.conectar();
         String sql = "select * from puesto where estado=1 and idEmpresa=?";
         PreparedStatement pre = this.getCon().prepareStatement(sql);
         pre.setInt(1, cod);
         res= pre.executeQuery();
            while (res.next()) {                
                Puestos p = new Puestos();
                p.setIdPuesto(res.getInt("idPuesto"));
                p.setNombrePuesto(res.getString("nombrePuesto"));
                p.setDescripcion(res.getString("descripcion"));
                p.setIdArea(res.getInt("idArea"));
                p.setIdEmpresa(res.getInt("idEmpresa"));
                listadoPuestos.add(p);
            }
            
        } catch (SQLException e) {
           throw e;
        }finally
        {
            this.desconectar();
        }
        
        return listadoPuestos;
    }
    
    //Metodo para insertar puestos
    public void agregar(Puestos p) throws Exception
    {
        try {
           this.conectar();
           String sql="insert into puesto values(?,?,?,?,?,?)";
           PreparedStatement pre = this.getCon().prepareStatement(sql);
           pre.setInt(1, 0);
           pre.setString(2, p.getNombrePuesto());
           pre.setString(3, p.getDescripcion());
           pre.setInt(4, p.getIdArea());
           pre.setInt(5, p.getEstado());
           pre.setInt(6, p.getIdEmpresa());
           pre.executeUpdate();
           
        } catch (SQLException e) {
            throw e;
        }finally
        {
        this.desconectar();
        }
    
    }
    
    //Metodo para modificar puestos
    public void modificar(Puestos p) throws Exception
    {
        try {
           this.conectar();
           String sql="update puesto set nombrePuesto=?, descripcion=?, idArea=? where idPuesto=? ";
           PreparedStatement pre = this.getCon().prepareStatement(sql);
           pre.setString(1, p.getNombrePuesto());
           pre.setString(2, p.getDescripcion());
           pre.setInt(3, p.getIdArea());
           pre.setInt(4, p.getIdPuesto());
           pre.executeUpdate();
           
        } catch (SQLException e) {
            throw e;
        }finally
        {
        this.desconectar();
        }
    
    }
    
    
    //metodo para eliminar puestos
    public void eliminar(Puestos p) throws Exception
    {
        try {
           this.conectar();
           String sql="update puesto set estado=? where idPuesto=? ";
           PreparedStatement pre = this.getCon().prepareStatement(sql);
           pre.setInt(1, p.getEstado());
           pre.setInt(2, p.getIdPuesto());
           pre.executeUpdate();
           
        } catch (SQLException e) {
            throw e;
        }finally
        {
        this.desconectar();
        }
    
    }
    
    //obtener el id
    public int getIdArea(String area) throws Exception
    {
        int cod=0;
        ResultSet res;
       
        try {
            
            this.conectar();
            String sql="Select idArea from area where nombre=?";
            PreparedStatement pre= this.getCon().prepareStatement(sql);
            pre.setString(1,area);
            res=pre.executeQuery();
                while(res.next())
                {
                    cod=res.getInt("idArea");
                }
        } catch (SQLException e) {
            throw e;
        }
        return cod;
    } 
    
    public String getNombreArea(int id) throws Exception
    {
        String nombre="";
        ResultSet res;
        
        try {
            this.conectar();
            String sql="Select nombre from area where idArea=?";
            PreparedStatement pre= this.getCon().prepareStatement(sql);
            pre.setInt(1,id);
            res=pre.executeQuery();
                while(res.next())
                {
                    nombre=res.getString("nombre");
                }
        } catch (SQLException e) {
            throw e;
        }
        return nombre;
    }
    
    
}
