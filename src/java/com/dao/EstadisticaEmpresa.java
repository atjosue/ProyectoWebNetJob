package com.dao;
import com.conexion.Conexion;
import java.sql.*;

/**
 *
 * @author Fernando
 */
public class EstadisticaEmpresa extends Conexion{
    
    public int userActive() throws Exception
    {
        int users=0;
        ResultSet res;
        try 
        {
            this.conectar();
            String sql="select count(*) as UsuariosActivos from postulante where estado=1;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res = pre.executeQuery();
            
            while(res.next())
            {
                users = res.getInt(1);
            }
            
        } 
        catch (Exception e) 
        {
            
        }
        finally
        {
            this.desconectar();
        }
        return users;
    }
    
    
    public int businessActive() throws Exception
    {
        int business=0;
        ResultSet res;
        try 
        {
            this.conectar();
            String sql="select count(*) as EmpresasAcrivas from empresa where estado=1;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res = pre.executeQuery();
            
            while(res.next())
            {
                business = res.getInt(1);
            }
            
        } 
        catch (Exception e) 
        {
            
        }
        finally
        {
            this.desconectar();
        }
        return business;
    }
    
    public int OfferBusinessActive(int id) throws Exception
    {
        int bussines=0;
        ResultSet res;
        try 
        {
            this.conectar();
            String sql="select count(*) as Ofertas from oferta where idEmpresa = (select idEmpresa from empresa e inner join usuario u on e.idUsuario=e.idUsuario where u.idUsuario=?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            res = pre.executeQuery();
            
            while(res.next())
            {
                bussines = res.getInt(1);
            }
            
        } 
        catch (Exception e) 
        {
            
        }
        finally
        {
            this.desconectar();
        }
        return bussines;
    }
    
    public int OfferActive() throws Exception
    {
        int offer=0;
        ResultSet res;
        try 
        {
            this.conectar();
            String sql="select count(*) as Ofertas from oferta where estadoP=1;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res = pre.executeQuery();
            
            while(res.next())
            {
                offer = res.getInt(1);
            }
            
        } 
        catch (Exception e) 
        {
            
        }
        finally
        {
            this.desconectar();
        }
        return offer;
    }
    
    public int followers(int id) throws Exception
    {
        int followers=0;
        ResultSet res;
        try 
        {
            this.conectar();
            String sql="select count(*) as Seguidores from relacion where idSeguidor = (select idEmpresa from empresa e inner join usuario u on e.idUsuario=e.idUsuario where u.idUsuario=?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            res = pre.executeQuery();
            
            while(res.next())
            {
                followers = res.getInt(1);
            }
            
        } 
        catch (Exception e) 
        {
            
        }
        finally
        {
            this.desconectar();
        }
        return followers;
    }
    
    
    public int following(int id) throws Exception
    {
        int following=0;
        ResultSet res;
        try 
        {
            this.conectar();
            String sql="select count(*) as Seguidores from relacion where idSeguido = (select idEmpresa from empresa e inner join usuario u on e.idUsuario=e.idUsuario where u.idUsuario=?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            res = pre.executeQuery();
            
            while(res.next())
            {
                following = res.getInt(1);
            }
            
        } 
        catch (Exception e) 
        {
            
        }
        finally
        {
            this.desconectar();
        }
        return following;
    }
    
    public int postActive(int id) throws Exception
    {
        int post=0;
        ResultSet res;
        try 
        {
            this.conectar();
            String sql="select count(*) as Ofertas from oferta where idEmpresa = (select idEmpresa from empresa e inner join usuario u on e.idUsuario=e.idUsuario where u.idUsuario=?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            res = pre.executeQuery();
            
            while(res.next())
            {
                post = res.getInt(1);
            }
            
        } 
        catch (Exception e) 
        {
            
        }
        finally
        {
            this.desconectar();
        }
        return post;
    }
    
    
    public int postulacion(int id) throws Exception
    {
        int postula=0;
        ResultSet res;
        try 
        {
            this.conectar();
            String sql="select count(*) as Total from aplicacionOferta where estado=1 and idPostulante = (select idPostulante from postulante where estado=1 and idUsuario=?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            res = pre.executeQuery();
            
            while(res.next())
            {
                postula = res.getInt(1);
            }
            
        } 
        catch (Exception e) 
        {
            
        }
        finally
        {
            this.desconectar();
        }
        return postula;
    }
    
}

