
package com.dao;

import com.conexion.Conexion;
import com.modelos.Habilidad;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Carlos_Campos
 */
public class DaoHabilidad extends Conexion{
    
    
    public List<Habilidad> mostrar()
    {
        
        List<Habilidad> lst= new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql="select * from habilidades";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
          
            res=pre.executeQuery();
            
            while(res.next())
            {
                //seteando habilidad
                Habilidad hab= new Habilidad();
                hab.setIdHabilidad(res.getInt("idHabilidad"));
                hab.setHabilidad(res.getString("habilidad"));
                
                
               
                
                
                lst.add(hab);
            }
            
        }
        catch (Exception e) 
        {
        }
        return lst;
    
    }
}
