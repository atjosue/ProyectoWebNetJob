package com.dao;
import com.conexion.Conexion;
import com.modelos.Departamento;
import com.modelos.Pais;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 * Nombre de la clase: DaoDepartamento
 * Fecha: 07/08/2018
 * Version: 1.0
 * Copyright: Team 1 Developer's
 * @author Fernando Flamenco
 */
public class DaoDepartamento extends Conexion{
    public List<Departamento> mostrarDepartamento() throws Exception
    {
        List<Departamento>listaDepartamentos = new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql="select d.idDepartamento, d.departamento,d.idPais, d.estado, p.pais from departamento d\n" +
"inner join pais p on d.idPais = p.idPais\n" +
"where d.estado=1 AND p.estado=1;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            
            while(res.next())
            {
                Departamento dp = new Departamento();
                dp.setIdDepartamento(res.getInt("idDepartamento"));
                dp.setDepartamento(res.getString("departamento"));
                dp.setIdPais(res.getInt("idPais"));
                dp.setEstado(res.getInt("estado"));
                dp.setPais(res.getString("pais"));
                listaDepartamentos.add(dp);
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
        return listaDepartamentos;
    }
    
    
    
    public void insertarDepartamento(Departamento dp) throws Exception
    {
        try 
        {
            this.conectar();
            String sql="insert into departamento values(?,?,?,?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1,dp.getIdDepartamento());
            pre.setString(2,dp.getDepartamento());
            pre.setInt(3,dp.getIdPais());
            pre.setInt(4,dp.getEstado());
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
    
    public void modificarDepartamento(Departamento dp) throws Exception
    {
        try 
        {
            this.conectar();
            String sql="update departamento set departamento=?, idPais=?, estado=? where idDepartamento=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1,dp.getDepartamento());
            pre.setInt(2,dp.getIdPais());
            pre.setInt(3,dp.getEstado());
            pre.setInt(4,dp.getIdDepartamento());
            
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
    
    public void eliminarDepartamento(Departamento dp) throws Exception
    {
        try 
        {
            this.conectar();
            String sql="update departamento set estado=0 where idDepartamento=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1,dp.getIdDepartamento());
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
    
   
    
    public List<Departamento> mostrarDeptoPorPais(int id) throws Exception
    {
        ArrayList<Departamento>listaDepartamentos1 = new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql="select d.idDepartamento, d.departamento,d.idPais, p.pais from departamento d\n" +
"inner join pais p on d.idPais = p.idPais\n" +
"where d.idPais=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            res=pre.executeQuery();
            
            while(res.next())
            {
                Departamento dp = new Departamento();
                dp.setIdDepartamento(res.getInt("idDepartamento"));
                dp.setDepartamento(res.getString("departamento"));
                dp.setPais(res.getString("pais"));
                dp.setIdPais(res.getInt("idPais"));

                listaDepartamentos1.add(dp);
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
        return listaDepartamentos1;
    }
    
}
