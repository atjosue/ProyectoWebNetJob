
package com.conexion;

import java.sql.*;


/**
 * nombre:Conexion
 * fecha 27/10/18
 * version 1.0
 * copyright: netjob
 * @author josue
 */
public class Conexion {
    Connection con;

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    public void conectar() throws Exception
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vacantes", "root", "");
        } catch (Exception e) {
            throw e;
        }
    }
    
    public void desconectar() throws Exception
    {
        try {
            if (con!=null) {
                if (!con.isClosed()) {
                    con.close();
                }
            }
        } catch (Exception e) {
            throw e;
        }
    
    }
    
}
