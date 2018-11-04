
package com.dao;
import com.conexion.Conexion;
import com.modelos.Usuario;
import static java.lang.System.out;
import java.sql.*;

/**
 *
 * @author Carlos_Campos
 */
public class DaoUsuario extends Conexion{
    public static  String tipo;
    public static String usuario;
    
    //metodo de acceso
    public int login(Usuario us) throws Exception        
    {
        
        ResultSet res;
        int rol=0;
       
        
        
        try 
        {
            this.conectar();
            String sql="select idRol from usuario where nombreUsuario=? and contraseña=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setString(1, us.getNombreUsuario());
            pre.setString(2, us.getContraseña());
            res=pre.executeQuery();
            
            if(res.next())
            {
                rol=res.getInt("idRol");
                
               
            }
            
               
        } 
        catch (SQLException e)
        {
            out.print(e);
                    
        }
        
           return rol;  
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
    
}
