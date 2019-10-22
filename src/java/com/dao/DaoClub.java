
package com.dao;

import com.conexion.Conexion;
import com.modelo.Club;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoClub
 * Fecha: 01-10-2019
 * Version: 1.0
 * Copyright: Biblioteca Online
 * @author Edgard Palacios 
 */
public class DaoClub extends Conexion{
    
    public List<Club> mostrarClubIndex() throws Exception{
        ResultSet rs;
        List<Club> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT * from club LIMIT 3";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                Club c=new Club();
                c.setIdClub(rs.getInt("idClub"));
                c.setNombre(rs.getString("nombre"));
                ls.add(c); 
            }     
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
    
    public List<Club> mostrarClub() throws Exception{
        ResultSet rs;
        List<Club> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT * from club";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                Club c=new Club();
                c.setIdClub(rs.getInt("idClub"));
                c.setNombre(rs.getString("nombre"));
                ls.add(c); 
            }     
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
    
    public boolean validar(int idClie,int idClub) throws Exception
    {
         ResultSet rs = null;
         
         String sql = "SELECT * FROM detalleclubcliente where idClub=? and idCliente=?";
        try 
        {
            conectar();
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idClub);
            pre.setInt(2, idClie);
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
    
    
    
    public void insertarClienteClub(int idClie,int idClub) throws ClassNotFoundException, SQLException, Exception
    {
        try 
        {
            this.conectar();
            String sql="insert into detalleClubCliente(idCliente,idClub)value(?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1,idClie);
            pre.setInt(2, idClub);
            pre.executeUpdate();  
            
            
        } catch (SQLException e) 
        {
           throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    
    
    public List<Club> mostrar1Club() throws  Exception{
        ResultSet rs;
        List<Club> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT * FROM club WHERE borradoLogico=1";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                Club c = new Club();
                c.setIdClub(rs.getInt("idClub"));
                c.setNombre(rs.getString("nombre"));
                ls.add(c);
            }
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
    public void insertarClub(Club c) throws Exception{
        try {
            conectar();
            String sql = "INSERT INTO club (nombre, borradoLogico) VALUES(?,1)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getNombre());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
    }
    
    public void modificarClub(Club c) throws Exception{
        try {
            conectar();
            String sql = "UPDATE club SET nombre=? WHERE idClub=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getNombre());
            pre.setInt(2, c.getIdClub());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
    }
    
    public void eliminarClub(Club c) throws Exception{
        try {
            conectar();
            String sql = "UPDATE club SET borradoLogico=2 WHERE idClub=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getIdClub());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
    }
    
    
    
}
