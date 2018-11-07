
package com.dao;

import com.conexion.Conexion;
import com.modelos.DetalleHabilidad;
import com.modelos.Habilidad;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Carlos_Campos
 */
public class DaoDetalleHabilidad extends Conexion {
  
    
    //MOSTRANDO LAS HABILIDADES
    public List<DetalleHabilidad> mostrar(int idPostulante)
    {
        
        List<DetalleHabilidad> lst= new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql="select d.idDetalleHabilidad as idDetalle, h.habilidad as habilidad, h.idHabilidad as idHabilidad from detalleHabilidad d"
                    + " inner join habilidades h on h.idHabilidad=d.idHabilidad where d.idPostulante=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idPostulante);
            res=pre.executeQuery();
            
            while(res.next())
            {
                //seteando habilidad
                Habilidad hab = new Habilidad();
                hab.setHabilidad(res.getString("habilidad"));
                //seteando detalleHAbilidad
                DetalleHabilidad dt= new DetalleHabilidad();
                dt.setIdDetalleHabilidad(res.getInt("idDetalle"));
                dt.setIdHabilidad(res.getInt("idHabilidad"));
                dt.setHabilidad(hab);
                
                
                
                lst.add(dt);
            }
            
        }
        catch (Exception e) 
        {
        }
        return lst;
    
    }
    
    
    public int agregar(DetalleHabilidad det)
    {
        int resp=0;
        
        try 
        {
            this.conectar();
            String sql ="insert into detalleHabilidad values(0,?,?,?)";
            PreparedStatement pre= this.getCon().prepareStatement(sql);
            pre.setInt(1, det.getIdHabilidad());
            pre.setInt(2, det.getIdPostulante());
            pre.setInt(3, 1);
            resp=pre.executeUpdate();
            
            
        } 
        
        catch (Exception e)
        
        {
        }
    
        return resp;
    }
    
    
}
