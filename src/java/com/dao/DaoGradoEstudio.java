
package com.dao;
import com.conexion.Conexion;
import com.modelos.GradoEstudio;
import java.util.*;
import java.sql.*;

/**
 * nombre DaoGradoEstudio
 * fecha 02/11/18
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class DaoGradoEstudio extends Conexion{
    
    public List<GradoEstudio> mostrarGrados() throws Exception
    {
        List<GradoEstudio> lista = new ArrayList();
        ResultSet res;
        
        try {
            this.conectar();
            String sql="select * from gradoEstudio where estado=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, 1);
            res=pre.executeQuery();
                while(res.next())
                {
                    GradoEstudio ge = new GradoEstudio();
                    ge.setIdGradoEstudio(res.getInt("idGradoEstudio"));
                    ge.setGrado(res.getString("grado"));
                    ge.setEstado(res.getInt("estado"));
                    
                    lista.add(ge);
                }
        } catch (Exception e) {
            throw e;
        }finally
        {
            this.desconectar();
        }
        return lista;
    }
     
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
            
        }
        finally
        {
            this.desconectar();
        }
   
    }

}
