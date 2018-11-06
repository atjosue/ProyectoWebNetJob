package com.dao;
import com.conexion.Conexion;
import com.modelos.Departamento;
import com.modelos.Provincia;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
 

/**
 * Nombre de la clase: DaoProvincia
 * Fecha: 07/08/2018
 * Version: 1.0
 * Copyright: Team 1 Developer's
 * @author Fernando Flamenco
 */
public class DaoProvincia extends Conexion {
   public List<Provincia> mostrarProvincia() throws Exception
    {
        List<Provincia>listaProvincias = new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql="select pr.idProvincia, pr.provincia, d.departamento, p.pais from provincia pr\n" +
"inner join departamento d on d.idDepartamento = pr.idDepartamento\n" +
"inner join pais p on d.idPais = p.idPais \n" +
"where pr.estado=1;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            
            while(res.next())
            {
                Provincia pv = new Provincia();
                pv.setIdProvincia(res.getInt("idProvincia"));
                pv.setProvincia(res.getString("provincia"));
                pv.setDepartamento(res.getString("departamento"));
                pv.setPais(res.getString("pais"));
                listaProvincias.add(pv);
            }
            
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null,"Error al Mostrar Provincia. \n Sistema Dice: "+e.toString(),"Error!",2);
        }
        finally
        {
            this.desconectar();
        }
        return listaProvincias;
    }
    
    public void insertarProvincia(Provincia pv) throws Exception
    {
        try 
        {
            this.conectar();
            String sql="insert into provincia values(?,?,?,?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1,pv.getIdProvincia());
            pre.setString(2,pv.getProvincia());
            pre.setInt(3,pv.getIdDepartamento());
            pre.setInt(4,pv.getEstado());
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null,"Error al Insertar Provincia. \n Sistema Dice: "+e.toString(),"Error!",2);
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void modificarProvincia(Provincia pv) throws Exception
    {
        try 
        {
            this.conectar();
            String sql="update provincia set provincia=?, idDepartamento=?, estado=? where idProvincia=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1,pv.getProvincia());
            pre.setInt(2,pv.getIdDepartamento());
            pre.setInt(3,pv.getEstado());
            pre.setInt(4,pv.getIdProvincia());
            
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null,"Error al Modificar Provincia. \n Sistema Dice: "+e.toString(),"Error!",2);
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void eliminarProvincia(Provincia pv) throws Exception
    {
        try 
        {
            this.conectar();
            String sql="update provincia set estado=0 where idProvincia=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1,pv.getIdProvincia());
            pre.executeUpdate();
        } 
        catch (Exception e) 
        {
            JOptionPane.showMessageDialog(null,"Error al Eliminar Provincia. \n Sistema Dice: "+e.toString(),"Error!",2);
        }
        finally
        {
            this.desconectar();
        }
    } 
    
    
    
    
    public List<Provincia> mostrarDeptoPorPais(int id) throws Exception
    {
        ArrayList<Provincia>listaProvincia = new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql="select pr.idProvincia as idProvincia, pr.provincia as provincia, d.departamento as departamento, p.pais as pais from provincia pr\n" +
"inner join departamento d on d.idDepartamento = pr.idDepartamento\n" +
"inner join pais p on d.idPais = p.idPais \n" +
"where pr.idDepartamento=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            res=pre.executeQuery();
            
            while(res.next())
            {
                Provincia pv = new Provincia();
                pv.setProvincia(res.getString("provincia"));
                pv.setDepartamento(res.getString("departamento"));
                pv.setPais(res.getString("pais"));
                pv.setIdProvincia(res.getInt("idProvincia"));

                listaProvincia.add(pv);
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
        return listaProvincia;
    }
}

