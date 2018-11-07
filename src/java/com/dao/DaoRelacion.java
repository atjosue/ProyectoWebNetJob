
package com.dao;

import com.conexion.Conexion;
import com.modelos.Relacion;

import java.sql.*;

/**
 *
 * @author Carlos_Campos
 */
public class DaoRelacion extends Conexion {
    
    public int seguir(Relacion re)
    {
        int resp=0;
        try 
        {
                this.conectar();
                String sql="insert into relacion values(0,?,?,?)";
                PreparedStatement pre = this.getCon().prepareStatement(sql);
                pre.setInt(1, re.getIdSeguido());
                pre.setInt(2, re.getIdSeguidor());
                pre.setInt(3, 1);
               resp=pre.executeUpdate();
        }
        catch (Exception e)
        {
        }
        return resp;
    }
    
    
    
    
}
