package com.dao;

import com.conexion.Conexion;
import com.modelos.Requisitos;
import java.sql.*;
import java.util.*;

/**
 * nombre DaoRequisito
 * fecha 03/11/18
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class DaoRequisito extends Conexion{
    
    private List<Requisitos> mostrarRequisito(int idOf) throws Exception
    {
        ResultSet res;
        List<Requisitos> lista = new ArrayList();
        
        try {
            this.conectar();
            String sql="select * from requisitos where estado=? and idOferta=?";
            PreparedStatement pre= this.getCon().prepareStatement(sql);
            pre.setInt(1, 1);
            pre.setInt(2, idOf );
            res=pre.executeQuery();
            while(res.next())
            {
                Requisitos r = new Requisitos();
                r.setIdRequisito(res.getInt("idRequisito"));
                r.setRequisito(res.getString("requisito"));
                r.setDescripcion(res.getString("descripcion"));
                r.setIdOferta(res.getInt("idOferta"));
                lista.add(r);
            }
        } catch (Exception e) {
            throw e;
        }
        return lista;
    }
    
    private int agregarRequisito(Requisitos re) throws Exception
    {
        int resp=0;
        ResultSet res;
        
        try {
            this.conectar();
            String sql="Insert into requisitos values(?,?,?,?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, 0);
            pre.setString(2, re.getRequisito());
            pre.setString(3, re.getDescripcion());
            pre.setInt(4, re.getIdOferta());
            resp = pre.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
        return resp;
    }
    
}
