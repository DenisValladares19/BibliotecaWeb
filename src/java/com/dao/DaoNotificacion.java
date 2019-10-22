
package com.dao;

import com.conexion.Conexion;
import com.modelo.Club;
import com.modelo.Notificacion;
import com.modelo.Oferta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoNotificacion
 * Fecha: 09-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class DaoNotificacion extends Conexion{
    
    public List<Notificacion> cargarNotificacion(int idCliente) throws Exception{
        ResultSet rs;
        List<Notificacion> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT oferta.nombre, oferta.descuento,"
                    + " notificacion.estado, club.nombre AS club, notificacion.idNotificacion "
                    + " FROM detalleclubcliente JOIN club ON"
                    + " detalleclubcliente.idClub = club.idClub"
                    + " JOIN oferta ON club.idClub = oferta.idClub "
                    + " JOIN notificacion ON oferta.idOferta = notificacion.idOferta"
                    + " WHERE detalleclubcliente.idCliente = ?"
                    + "  AND notificacion.borradoLogico = 1"
                    + " AND oferta.borradoLogico = 1 ORDER BY notificacion.idNotificacion DESC ";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idCliente);
            rs = pre.executeQuery();
            
            while(rs.next()){
                Notificacion n = new Notificacion();
                n.setEstado(rs.getBoolean("estado"));
                n.setIdNotificacion(rs.getInt("idNotificacion"));
                Oferta o = new Oferta();
                o.setNombre(rs.getString("nombre"));
                o.setDescuento(rs.getString("descuento"));
                n.setOferta(o);
                Club c = new Club();
                c.setNombre(rs.getString("club"));
                n.setClub(c);
                ls.add(n);
            }
            
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        } 
        return ls;
    }
    
    public List<Notificacion> cargarUnaNotificacion(int idCliente, int idNoti) throws Exception{
        ResultSet rs;
        List<Notificacion> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT oferta.nombre, oferta.descuento, notificacion.estado, club.nombre AS club, notificacion.idNotificacion FROM detalleclubcliente JOIN club ON detalleclubcliente.idClub = club.idClub JOIN oferta ON club.idClub = oferta.idClub JOIN notificacion ON oferta.idOferta = notificacion.idOferta WHERE detalleclubcliente.idCliente = ?  AND notificacion.borradoLogico = 1 AND oferta.borradoLogico = 1 AND notificacion.idNotificacion = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idCliente);
            pre.setInt(2, idNoti);
            rs = pre.executeQuery();
            
            while(rs.next()){
                Notificacion n = new Notificacion();
                n.setEstado(rs.getBoolean("estado"));
                n.setIdNotificacion(rs.getInt("idNotificacion"));
                Oferta o = new Oferta();
                o.setNombre(rs.getString("nombre"));
                o.setDescuento(rs.getString("descuento"));
                n.setOferta(o);
                Club c = new Club();
                c.setNombre(rs.getString("club"));
                n.setClub(c);
                ls.add(n);
            }
            
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        } 
        return ls;
    }
    
    public boolean modificarEstado(int idNoti) throws Exception{
        try {
            conectar();
            String sql = "UPDATE notificacion SET estado=false WHERE idNotificacion =?  AND estado = true";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idNoti);
            if(pre.executeUpdate()>0){
                return true;
            }else{
                return false;
            }  
        } catch (Exception e) {
            throw e;
        }
    }
    
}
