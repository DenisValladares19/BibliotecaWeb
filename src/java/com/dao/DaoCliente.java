
package com.dao;

import com.conexion.Conexion;
import com.modelo.Cliente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JOptionPane;

/**
 * Nombre de la clase: DaoCliente
 * Fecha: 01-10-2019
 * Version: 1.0
 * Copyright: Biblioteca Online
 * @author Edgard Palacios 
 */

public class DaoCliente extends Conexion{
    
    
     public int sacarIdUser(String user) throws Exception{
         this.conectar();
         ResultSet rs2;
            int idUser=0;
            try {
             String sql2 = "SELECT id FROM usuarios WHERE usuario=?";
            PreparedStatement pre2 = this.getCon().prepareStatement(sql2);
            pre2.setString(1, user);
            rs2 = pre2.executeQuery();
            while(rs2.next()){
                idUser= rs2.getInt("id");
            }
         } catch (Exception e) {
             throw e;
        }
        finally
        {
            this.desconectar();
        }
            return idUser;
     }
    
    
    
    
     public void insertarCliente(Cliente cli) throws ClassNotFoundException, SQLException, Exception
    {
        try 
        {
            this.conectar();
            String sql="insert into usuarios(usuario,password,correo,borradoLogico,id_tipo) values(?,?,?,1,3);";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setString(1,cli.getUsuario());
            pre.setString(2, cli.getPass());
            pre.setString(3, cli.getCorreo());
            pre.executeUpdate();  
            
            
            
            String sql3 = "INSERT INTO cliente(nombre, apellido, direccion , idPais , idUsuario, borradoLogico) VALUES(?,?,?,?,?,1)";
            PreparedStatement pre3 = this.getCon().prepareStatement(sql3);
            pre3.setString(1, cli.getNombre());
            pre3.setString(2, cli.getApellido());
            pre3.setString(3, cli.getDireccion());
            pre3.setInt(4, cli.getPais());
            pre3.setInt(5, sacarIdUser(cli.getUsuario()));
            pre3.executeUpdate();
            
            
        } catch (SQLException e) 
        {
           throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
     
     
     public List<Cliente> listarPais() throws Exception
    {
        ResultSet rs;
        List<Cliente> lst=new ArrayList();
        
        try 
        {
            this.conectar();
            String sql="select idPais,nombre from pais";
            PreparedStatement pst=this.getCon().prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next())
            {
                Cliente cli=new Cliente();
                cli.setPais(rs.getInt("idPais"));
                cli.setNombrePais(rs.getString("nombre"));
                lst.add(cli);
                
            }
            
        }
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        return lst;
    }
    
      public boolean esEmail(String correo) {

        // Patrón para validar el email
        Pattern pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");

        Matcher mather = pattern.matcher(correo);

        return mather.find();

    }
}
