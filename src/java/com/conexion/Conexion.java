
package com.conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Nombre de la clase: Conexion
 * Fecha: 04-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Conexion {
    private Connection con;

    public Connection getCon() {
        return con;
    }
    
    public void conectar() throws Exception{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca","root","");
        } catch (Exception e) {
            throw e;
        }
    }
    
    public void desconectar() throws Exception{
        try {
            if(con!=null){
                con.close();
            }else if(con.isClosed()==false){
                con.close();
            }
        } catch (Exception e) {
            throw e;
        }
    }
    
}
