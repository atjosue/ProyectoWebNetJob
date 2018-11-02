
package com.modelos;
import com.conexion.Conexion;
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
        String rol="";
        String user="";
        int resp=0;
        
        
        try 
        {
            this.conectar();
            String sql="select r.descRol as rol, u.nombreUsuario as user from usuario u inner join Rol r on r.idRol=u.idRol where nombreUsuario=? and contraseña=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setString(1, us.getNombreUsuario());
            pre.setString(2, us.getContraseña());
            res=pre.executeQuery();
            
            if(res.next())
            {
                rol=res.getString("rol");
                user=res.getString("user");
                
                //asignando los valores a las variables Globales
                tipo=rol;
                usuario=user;
                resp=1;
            }
            else
            {
               resp=0;
            }
               
        } 
        catch (SQLException e)
        {
            out.print(e);
                    
        }
        
           return resp;  
    }
    
}
