
package com.dao;

import com.conexion.Conexion;
import com.modelos.Oferta;
import java.util.*;
import java.sql.*;

/**
 * nombre DaoOferta
 * fecha 01/11/18
 * version 1.0
 * copyright netjob
 * @author josue
 */
public class DaoOferta extends Conexion{
    
    public List<Oferta> mostrarOfertas()
    {   
        List<Oferta> lista = new ArrayList();
        return lista;
    }
    
    public List<Oferta> mostrarOfertaEmpresa(int idUsuarioEmpresa) throws Exception
    {   
        List<Oferta> lista = new ArrayList();
        ResultSet res;
        try {
            this.conectar();
            String sql="select o.idEmpresa as empresa , idOferta , titulo , "
                    + "descripcion , vacantes , salarioMinimo , salarioMaximo , "
                    + "aniosExperiencia , edadMinima , edadMaxima , idArea , "
                    + "idPuesto , idGradoEstudio , sexo , estadoP  from oferta o "
                    + "inner join empresa e on e.idUsuario=?;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idUsuarioEmpresa);
            res=pre.executeQuery();
            while (res.next()) {                
                Oferta o= new Oferta();
                o.setIdEmpresa(res.getInt("empresa"));
                o.setIdOferta(res.getInt("idOferta"));
                o.setTitulo(res.getString("titulo"));
                o.setDescripcion(res.getString("descripcion"));
                o.setVacantes(res.getInt("vacantes"));
                o.setSalarioMinimo(res.getDouble("salarioMinimo"));
                o.setSalarioMaximo(res.getDouble("salarioMaximo"));
                o.setAniosExperiencia(res.getInt("aniosExperiencia"));
                o.setEdadMinima(res.getInt("edadMinima"));
                o.setEdadMaxima(res.getInt("edadMaxima"));
                o.setIdArea(res.getInt("idArea"));
                o.setIdPuesto(res.getInt("idPuesto"));
                o.setIdGradoEstudio(res.getInt("idGradoEstudio"));
                o.setSexo(res.getInt("sexo"));
                o.setEstadoP(res.getInt("estadoP"));
                lista.add(o);
              }
        } catch (Exception e) {
            throw e;
        }
        return lista;
    } 
    
    public int obtenerIdEmpresa(int idUs) throws Exception
    {
        int idEmp=0;
        ResultSet res;
        
        try {
            this.conectar();
            String sql="select idEmpresa from empresa where idUsuario=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idUs);
            res= pre.executeQuery();
            while (res.next()) {                
                idEmp = res.getInt("idEmpresa");
            }
        } catch (Exception e) {
            throw e;
        }
        return idEmp;
    }
    
    public List agregarOferta(Oferta of) throws Exception
    {
        List ret = new ArrayList();
        
        int ofertaAgregada=0;
        int idOferta=0;
        ResultSet res;
        try {
            this.conectar();
            String sql="INSERT INTO oferta VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            String sql2="select idOferta from oferta where edadMaxima=? and idEmpresa=? and idGradoEstudio=? and fechaPublicacion=?;";
            
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            PreparedStatement pre2 = this.getCon().prepareStatement(sql2);
            
            pre.setInt(1, of.getIdOferta());
            pre.setString(2, of.getTitulo());
            pre.setString(3, of.getDescripcion());
            pre.setInt(4, of.getVacantes());
            pre.setDouble(5, of.getSalarioMinimo());
            pre.setDouble(6, of.getSalarioMaximo());
            pre.setInt(7, of.getIdEmpresa());
            pre.setInt(8, of.getAniosExperiencia());
            pre.setInt(9, of.getEdadMinima());
            pre.setInt(10, of.getEdadMaxima());
            pre.setInt(11, of.getIdArea());
            pre.setInt(12, of.getIdPuesto());
            pre.setString(13, of.getFechaPublicacion());
            pre.setInt(14, of.getEstado());
            pre.setInt(15, of.getIdGradoEstudio());
            pre.setInt(16, of.getSexo());
            pre.setInt(17, of.getEstadoP());
            pre2.setInt(1, of.getEdadMaxima());
            pre2.setInt(2, of.getIdEmpresa());
            pre2.setInt(3, of.getIdGradoEstudio());
            pre2.setString(4, of.getFechaPublicacion());
            ofertaAgregada=pre.executeUpdate();
            res=pre2.executeQuery();
            while(res.next())
            {
                idOferta=res.getInt("idOferta");
            }
            
        } catch (Exception e) {
            throw e;
        }
        
        ret.add(ofertaAgregada);
        ret.add(idOferta);
        
        return ret;
    }
    
    /*public int agregarOferta(Oferta of) throws Exception
    {
        int r=0;
        
        try {
            this.conectar();
            String sql="INSERT INTO oferta VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, of.getIdOferta());
            pre.setString(2, of.getTitulo());
            pre.setString(3, of.getDescripcion());
            pre.setInt(4, of.getVacantes());
            pre.setDouble(5, of.getSalarioMinimo());
            pre.setDouble(6, of.getSalarioMaximo());
            pre.setInt(7, of.getIdEmpresa());
            pre.setInt(8, of.getAniosExperiencia());
            pre.setInt(9, of.getEdadMinima());
            pre.setInt(10, of.getEdadMaxima());
            pre.setInt(11, of.getIdArea());
            pre.setInt(12, of.getIdPuesto());
            pre.setString(13, of.getFechaPublicacion());
            pre.setInt(14, of.getEstado());
            pre.setInt(15, of.getIdGradoEstudio());
            pre.setInt(16, of.getSexo());
            pre.setInt(17, of.getEstadoP());
            r=pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
        return r;
    }*/
    
}
