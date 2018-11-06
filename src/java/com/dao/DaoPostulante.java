
package com.dao;

import com.conexion.Conexion;
import com.modelos.Oferta;
import com.modelos.Postulante;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 * Nombre de la clase:DaoPostulante
 * Fecha: 29/10/2018
 * Version: 1.0
 * copyRight: Carlos Campos
 * @author Carlos_Campos
 */
public class DaoPostulante extends Conexion{
    
    
    public int insertarPostulante(Postulante pos) throws Exception{
        
        int resp=0;
        try {
            
            this.conectar();
            String sql = "insert into postulante values(0,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = this.getCon().prepareStatement(sql);
            pst.setString(1, pos.getNombres());
            pst.setString(2, pos.getApellidos());
            pst.setString(3, pos.getGenero());
            pst.setString(4, pos.getFechaNacimiento());
            pst.setString(5, pos.getTelefono());
            pst.setInt(6, pos.getIdProvincia());
            pst.setInt(7, pos.getIdDepartamento());
            pst.setInt(8, pos.getIdPais());
            pst.setInt(9, pos.getIdUsuario());
            pst.setString(10, pos.getCorreo());
            pst.setString(11, pos.getDireccion());
            pst.setInt(12, pos.getIdProfesion());
            pst.setInt(13, pos.getIdGradoEstudio());
            pst.setInt(14, pos.getIdIdioma());
            pst.setBlob(15, pos.getImagen());
            pst.setString(16, pos.getFechaRegistro());
            pst.setInt(17, 1);
            resp=pst.executeUpdate();
        } catch (Exception e) {
            throw e;
        }finally{
            this.desconectar();
        }
        
        return resp;
    }
    
    
    //OBTNER INFORMACION DE LOS POSTULANTES
    public Postulante getInfo(int idUsuario)
    {
        Postulante pos= new Postulante();
        ResultSet res;
        try 
        {
            this.conectar();
            
            String sql="select idPostulante ,nombres, apellidos, fotoPerfil from postulante where idUsuario=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idUsuario);
            res=pre.executeQuery();
            while(res.next())
            {
               
                pos.setNombres(res.getString("nombres"));
                pos.setApellidos(res.getString("apellidos"));
                pos.setIdPostulante(res.getInt("idPostulante"));
                
                Blob blob= res.getBlob("fotoPerfil");
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
                    
                    pos.setBase64Image(base64Image);
                    inputStream.close();
                    outputStream.close();
               }
            }
        }
        
        catch (Exception e) {
        }
        
        return pos;
    }
    
    
    //EXTRAYENDO DATOS DE OFERTA
    public List<Oferta> getOfertas()
    {
        List<Oferta> lstOferta= new ArrayList();
        ResultSet res;
        
        try 
        {
            this.conectar();
            String sql="select e.nombre as nombre, o.idOferta as idOferta, o.titulo as titulo, o.Descripciona as descripcion from oferta o inner join empresa e on o.idEmpresa= e.idEmpresa;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Oferta of= new Oferta();
                of.setIdOferta(res.getInt("idOferta"));
                of.setTitulo(res.getString("titulo"));
                of.setDescripcion(res.getString("descripcion"));
                of.setIdEmpresa(res.getInt(""));
            }
            
        }
        catch (Exception e)
        {
        }
        return lstOferta;
    }
    
}
