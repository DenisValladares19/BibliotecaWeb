
package com.dao;

import com.conexion.Conexion;
import com.modelo.Cliente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Nombre de la clase: DaoUsuario
 * Fecha: 01-10-2019
 * Version: 1.0
 * Copyright: Biblioteca Online
 * @author Edgard Palacios 
 */

public class DaoUsuario extends Conexion{
    
    
    public boolean validar(String correo,String pass) throws Exception
    {
         ResultSet rs = null;
         
         String sql = "select * from usuarios where correo=? and password=?";
        try 
        {
            conectar();
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, correo);
            pre.setString(2, pass);
            rs = pre.executeQuery();
            while(rs.next())
            {
                return true;
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
        
        return false;
    }
    
    
    
    public int sacarId(String correo,String pass) throws Exception
    {
         ResultSet rs = null;
         
         String sql = "select id from usuarios where correo=? and password=?";
         int id=0;
        try 
        {
            conectar();
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, correo);
            pre.setString(2, pass);
            rs = pre.executeQuery();
            while(rs.next())
            {
                id= rs.getInt("id");
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            desconectar();
        }
        
        return id;
    }
    
    
    public int sacarRol(String correo,String pass) throws Exception
    {
         ResultSet rs = null;
         
         String sql = "select id_tipo from usuarios where correo=? and password=?";
         int rol=0;
        try 
        {
            conectar();
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, correo);
            pre.setString(2, pass);
            rs = pre.executeQuery();
            while(rs.next())
            {
                rol= rs.getInt("id_tipo");
            }
        } 
        catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            desconectar();
        }
        
        return rol;
    }
    
    public List<Cliente> mostrarCliente(int id) throws Exception
    {
        ResultSet rs;
        List<Cliente>lst=new ArrayList();
        
        try 
        {
         conectar();
         String sql="SELECT cliente.idCliente, cliente.nombre,cliente.apellido, cliente.direccion,usuarios.usuario,correo,password "
                 + "AS usuarios, pais.idPais,pais.nombre AS pais FROM cliente JOIN usuarios on cliente.idUsuario = usuarios.id JOIN pais "
                 + "ON cliente.idPais = pais.idPais WHERE cliente.idUsuario=? and cliente.borradoLogico=1";
         PreparedStatement pre=this.getCon().prepareStatement(sql);
         pre.setInt(1,id);
         rs=pre.executeQuery();
         while(rs.next())
         {
             Cliente cli=new Cliente();
             cli.setIdCliente(rs.getInt("idCliente"));
             cli.setNombre(rs.getString("nombre"));
             cli.setApellido(rs.getString("apellido"));
             cli.setDireccion(rs.getString("direccion"));
             cli.setUsuario(rs.getString("usuario"));
             cli.setCorreo(rs.getString("correo"));
             cli.setPass(rs.getString("usuarios"));
             cli.setPais(rs.getInt("idPais"));
             cli.setNombrePais(rs.getString("pais"));
             lst.add(cli);
         }
            
        } catch (Exception e) 
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        
        return lst;
    
    }
    
    
    
}
