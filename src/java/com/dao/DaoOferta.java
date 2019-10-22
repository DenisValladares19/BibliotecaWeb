
package com.dao;

import com.conexion.Conexion;
import com.modelo.Club;
import com.modelo.Oferta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoOferta
 * Fecha: 09-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class DaoOferta extends Conexion{
    
    public List<Oferta> mostrarOferta() throws Exception{
        ResultSet rs;
        List<Oferta> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT oferta.idOferta, oferta.nombre, oferta.idClub, oferta.descuento, club.nombre AS nomClub FROM oferta JOIN club ON oferta.idClub = club.idClub WHERE oferta.borradoLogico=1";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                Oferta o = new Oferta();
                o.setIdOferta(rs.getInt("idOferta"));
                o.setNombre(rs.getString("nombre"));
                o.setDescuento(rs.getString("descuento"));
                Club c = new Club();
                c.setIdClub(rs.getInt("idClub"));
                c.setNombre(rs.getString("nomClub"));
                o.setClub(c);
                ls.add(o);
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
    
    public void insertarOferta(Oferta o) throws  Exception{
        ResultSet rs;
        try {
            conectar();
            String sql = "INSERT INTO oferta (idClub, nombre, descuento, borradoLogico) VALUES(?,?,?,1)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, o.getClub().getIdClub());
            pre.setString(2, o.getNombre());
            pre.setString(3, o.getDescuento());
            pre.executeUpdate();
            String sql3 = "SELECT * FROM oferta WHERE nombre=?";
            PreparedStatement pre3 = this.getCon().prepareStatement(sql3);
            pre3.setString(1, o.getNombre());
            rs = pre3.executeQuery();
            while(rs.next()){
                String sql2 = "INSERT INTO notificacion(idOferta, estado, borradoLogico) VALUES(?,?,1)";
                PreparedStatement pre2 = this.getCon().prepareStatement(sql2);
                pre2.setInt(1, rs.getInt("idOferta"));
                pre2.setBoolean(2, true);
                pre2.executeUpdate();
            }
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
    }
    
    
    public void modificarOferta(Oferta o) throws  Exception{
        try {
            conectar();
            String sql = "UPDATE oferta  SET idClub=?, nombre=?, descuento=? WHERE idOferta=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, o.getClub().getIdClub());
            pre.setString(2, o.getNombre());
            pre.setString(3, o.getDescuento());
            pre.setInt(4, o.getIdOferta());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
    }
    
    public void eliminarOferta(Oferta o) throws  Exception{
        try {
            conectar();
            String sql = "UPDATE oferta  SET borradoLogico=2 WHERE idOferta=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, o.getIdOferta());
            pre.executeUpdate();
            String sql2 = "UPDATE notificacion  SET borradoLogico=2 WHERE idOferta=?";
            PreparedStatement pre2 = this.getCon().prepareStatement(sql2);
            pre2.setInt(1, o.getIdOferta());
            pre2.executeUpdate();
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
    }
    
    
    
    
}
