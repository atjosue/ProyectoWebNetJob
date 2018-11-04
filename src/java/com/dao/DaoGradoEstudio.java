
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
    
    
}
