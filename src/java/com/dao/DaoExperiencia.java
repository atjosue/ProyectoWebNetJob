
package com.dao;

import com.conexion.Conexion;
import com.modelos.Experiencia;
import java.util.*;
import java.sql.*;


/**
 *
 * @author Carlos_Campos
 */
public class DaoExperiencia extends Conexion{
 
    public List<Experiencia> mostrarExperiencia(int idPostulante) throws Exception
    {   
        List<Experiencia> lista = new ArrayList();
        ResultSet res;
        try {
            this.conectar();
            String sql="select * from experiencia where idPostulante=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idPostulante);
            
            res=pre.executeQuery();
            while (res.next()) {                
                
                Experiencia exp= new Experiencia();
                
                exp.setIdExperiencia(res.getInt("idExperiencia"));
                exp.setEmpresa(res.getString("empresa"));
                exp.setCargo(res.getString("cargo"));
                exp.setDescripcion(res.getString("descripcion"));
                exp.setTiempoLaborado(res.getInt("tiempoLaborado"));
                exp.setIdPostulante(res.getInt("idPostulante"));
                lista.add(exp);
                
              }
        } catch (Exception e) {
            throw e;
        }
        return lista;
    }
    
    //INSERTAR EXPERIENCIA
    
    public int registrarExperiencia(Experiencia ex)
    {
            int resp=0;
            try 
            {
                this.conectar();
                String sql="insert into experiencia values(0,?,?,?,?,?,?)";
                PreparedStatement pre = this.getCon().prepareStatement(sql);
                pre.setString(1, ex.getEmpresa());
                pre.setString(2, ex.getCargo());
                pre.setString(3, ex.getDescripcion());
                pre.setInt(4, ex.getTiempoLaborado());
                pre.setInt(5, ex.getIdPostulante());
                pre.setInt(6, 1);
                
                resp=pre.executeUpdate();
            }
            catch (Exception e)
            
            {
                
           }
            
            return resp;
    }
    
    
    
    
    
    
    
    
}
