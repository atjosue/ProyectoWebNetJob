
package com.dao;

import com.conexion.Conexion;
import java.sql.*;
import com.google.gson.Gson;
import com.modelos.GraficoModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Fernando
 */
public class Graficos extends Conexion{
     public String grafica1() {
       ArrayList<Object> data = new ArrayList<Object>();
         
        ResultSet res;
        Gson json = new Gson();
        try {
            this.conectar();
            String sql = "select count(idPostulante) as Total, fechaAplicacion as Fecha from aplicacionOferta where estado=1  group by day(fechaAplicacion) order by (fechaAplicacion) desc limit 5;";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            res = pre.executeQuery();
          while(res.next())
          {
              GraficoModel gf = new GraficoModel();     
              gf.setFecha(res.getString("Fecha"));
              gf.setTotal(res.getInt("Total"));
              data.add(gf);
          }
            
        } catch (Exception e) {

        } finally {

        }
        return json.toJson(data);
    }
}
