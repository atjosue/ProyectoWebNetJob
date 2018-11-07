
package com.dao;
import com.conexion.Conexion;
import com.modelos.Empresa;
import com.modelos.Usuario;
import static java.lang.System.out;
import java.sql.*;
import java.util.List;
import jdk.nashorn.internal.ir.BreakNode;

/**
 *
 * @author Carlos_Campos
 */
public class DaoUsuario extends Conexion{
    public static  String tipo;
    public static String usuario;
    
    //metodo de acceso
    public Usuario login(Usuario us) throws Exception        
    {
        Usuario usu= new Usuario();
        ResultSet res;
        int rol=0;
       
        try 
        {
            this.conectar();
            String sql="select * from usuario where nombreUsuario=? and contraseña=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setString(1, us.getNombreUsuario());
            pre.setString(2, us.getContraseña());
            res=pre.executeQuery();
            
            if(res.next())
            {
                usu.setIdUsuario(res.getInt("idUsuario"));
                usu.setIdRol(res.getInt("idRol"));
                usu.setNombreUsuario(res.getString("nombreUsuario"));
            }  
        } 
        catch (SQLException e)
        {
            out.print(e);
                    
        }
        
           return usu;  
    }
    
    
    //registrarUsuarios
    public int insertar(Usuario u) throws Exception
    {
        int resp=0;
        try {
            this.conectar();
            String sql = "INSERT INTO `vacantes`.`usuario` (`nombreUsuario`, `contraseña`, `estado`, `idRol`) VALUES (?,?, ?, ?);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, u.getNombreUsuario());
            pre.setString(2,u.getContraseña());
            pre.setInt(3, 1);
            pre.setInt(4, u.getIdRol());
            pre.executeUpdate();
            
            resp=1;
        } catch (SQLException e) {
            
        }finally
        {
            this.desconectar();
        }
        
        return resp;
    
    }
    
    
    //METODO PARA VERIFICAR
    public int verificar(int idUsuario) throws Exception
    {
        ResultSet res;
        int resp=0;
        try {
            this.conectar();
            String sql = "select * from postulante where idUsuario=? ";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idUsuario);
            
            res=pre.executeQuery();
            if(res.next())
            {
                resp=1;
            }
            
            
            
        } catch (SQLException e) {
            
        }finally
        {
            this.desconectar();
        }
        
        return resp;
    
    }
    
    //METODO PARA VERIFICAR
    public int  agregarEmpresa(Usuario use, Empresa em) throws Exception
    {
        ResultSet res;
        int resp=0;
        String us1=use.getNombreUsuario();
        String us2=use.getNombreUsuario();
        int idUsuario=0;
        try {
            this.conectar();
            String sql ="insert into usuario values(?,?,?,?,?)";
            String sql3 ="select idUsuario from usuario where nombreUsuario='"+use.getNombreUsuario()+"'";
            
            PreparedStatement pre1 = this.getCon().prepareStatement(sql);
            PreparedStatement pre3 = this.getCon().prepareStatement(sql3);
            
            pre1.setInt(1,0);
            pre1.setString(2, use.getNombreUsuario());
            pre1.setString(3, use.getContraseña());
            pre1.setInt(4, 1);
            pre1.setInt(5, 4);
            
            idUsuario=pre1.executeUpdate();
            res=pre3.executeQuery();
            while(res.next())
            {
                idUsuario=res.getInt("idUsuario");
            }
            
        } catch (SQLException e) {
            throw e;
        }finally
        {
            this.desconectar();
        }
        
        return idUsuario;
    
    }
    
    
    
}
