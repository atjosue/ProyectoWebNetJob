
package com.dao;

import com.conexion.Conexion;
import com.modelos.Empresa;
import com.modelos.Rubro;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.*;

/**
 * nombre DaoEmpresa
 * fecha 01/11/18
 * version  1.0
 * copyright netjob
 * @author josue
 */
public class DaoEmpresa extends Conexion{
    
    public int agregarEmpresa(Empresa em)
    {
        int resp=0;
        
        try {
            this.conectar();
            String sql ="INSERT INTO empresa (idEmpresa , nombre, telefono, correo, "
                    + "idUsuario,idPais, estado, estadoA ) VALUES "
                    + "(0,'"+em.getNombre()+"','"+em.getTelefono()+"','"+em.getCorreo()+"',"
                    + ""+em.getIdUsuario()+","+em.getIdPais()+",1,0);";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            
            resp=pre.executeUpdate();
        } catch (Exception e) {
        }
        
        return resp;
    }
    
    public List<Rubro> listarRubros() throws Exception
    {
       ResultSet res;
       List<Rubro> lista= new ArrayList();
        try {
            this.conectar();
            String sql="select * from rubro;";
            PreparedStatement pre= this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Rubro r = new Rubro();
                r.setIdRubro(res.getInt("idRubro"));
                r.setNombre(res.getString("nombre"));
                r.setDescripcion(res.getString("descripcion"));
                lista.add(r);
            }
            
        } catch (Exception e) {
            throw e;
        }
       
        return lista;
    }
            
    public List<Empresa> getDataEmpresa(int cod) throws Exception
    {
        ResultSet res;
        List<Empresa> listadoEmpresa= new ArrayList();
        try {
         this.conectar();
         String sql = "select * from empresa where idUsuario=?";
         PreparedStatement pre = this.getCon().prepareStatement(sql);
         pre.setInt(1, cod);
         res= pre.executeQuery();
            while (res.next()) {                
                Empresa e = new Empresa();
                e.setIdEmpresa(res.getInt("idEmpresa"));
                e.setNombre(res.getString("nombre"));
                e.setDireccion(res.getString("direccion"));
                e.setTelefono(res.getString("telefono"));
                e.setMision(res.getString("mision"));
                e.setVision(res.getString("mision"));
                e.setCorreo(res.getString("correo"));
                e.setLatitud(res.getString("latitud"));
                e.setLongitud(res.getString("longitud"));
                e.setIdUsuario(res.getInt("idUsuario"));
                e.setIdRubro(res.getInt("idRubro"));
                e.setIdProvincia(res.getInt("idProvincia"));
                e.setIdDepartamento(res.getInt("idDepartamento"));
                e.setIdPais(res.getInt("idPais"));
                e.setEstado(res.getInt("estado"));
                e.setFacebook(res.getString("facebook"));
                e.setInstagram(res.getString("instagram"));
                e.setPaginaWeb(res.getString("paginaweb"));
                e.setDescripcion1(res.getString("descripcion1"));
                e.setDescripcion2(res.getString("descripcion2"));
                e.setEstadoA(res.getInt("estadoA"));
                
                //---------------------------Imagen 1
                Blob blob= res.getBlob("imagen");
                if(blob !=null)
                {
                    InputStream inputStream= blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer= new byte[4096];
                    int bytesRead= -1;
                    while((bytesRead= inputStream.read(buffer))!= -1)
                    {
                                outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imagesBytes = outputStream.toByteArray();
                    String base64Image= Base64.getEncoder().encodeToString(imagesBytes);
                    
                    e.setBase64Image(base64Image);
                    inputStream.close();
                    outputStream.close();
               }
                //----------------------------------------imagen 2
                Blob blob2= res.getBlob("imagen2");
                if(blob2 !=null)
                {
                    InputStream inputStream= blob2.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer= new byte[4096];
                    int bytesRead= -1;
                    while((bytesRead= inputStream.read(buffer))!= -1)
                    {
                                outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imagesBytes = outputStream.toByteArray();
                    String base64Image= Base64.getEncoder().encodeToString(imagesBytes);
                    
                    e.setBase64Image2(base64Image);
                    inputStream.close();
                    outputStream.close();
               }
                
                
                listadoEmpresa.add(e);
            }
            
        } catch (SQLException e) {
           throw e;
        }finally
        {
            this.desconectar();
        }
        
        return listadoEmpresa;
    };
    
    public String primera( int cod) throws Exception
    {
       ResultSet res;
       int a=0;
       String b="";
       
        try {
            this.conectar();
            String sql="select descripcion1 as d from empresa where idUsuario=?;";
            PreparedStatement pre= this.getCon().prepareStatement(sql);
            pre.setInt(1, cod);
            res=pre.executeQuery();
            if(res.next())
            {
                b=res.getString("d"); 
            }   
            
        } catch (Exception e) {
            throw e;
        }
       
        return b;
    }
    
    
}
