
package com.dao;

import com.conexion.Conexion;
import com.modelo.Autor;
import com.modelo.Genero;
import com.modelo.Pais;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoAutor
 * Fecha: 04-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class DaoAutor extends Conexion {
    
    public List<Autor> mostrarAutorIndex() throws Exception{
        List ls = new ArrayList();
        ResultSet rs;
        try {
            conectar();
            String sql = "SELECT autor.idAutor, autor.nombre, autor.sexo, autor.fechaNacimiento, autor.fechaDefuncion, autor.imagen, autor.biografia, genero.idGenero,genero.nombre AS genero, pais.nombre AS pais FROM autor JOIN genero on autor.idGenero = genero.idGenero JOIN pais ON autor.idPais = pais.idPais WHERE autor.borradoLogico=1 LIMIT 3";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                Autor a = new Autor();
                a.setIdAutor(rs.getInt("idAutor"));
                a.setNombre(rs.getString("nombre"));
                a.setSexo(rs.getString("sexo"));
                a.setFechaNac(rs.getInt("fechaNacimiento"));
                a.setFechaDefunsion(rs.getInt("fechaDefuncion"));
                a.setImagen(rs.getString("imagen"));
                a.setBiografia(rs.getString("biografia"));
                Genero g = new Genero();
                g.setIdGenero(rs.getInt("idGenero"));
                g.setNombre(rs.getString("genero"));
                a.setGenero(g);
                Pais p = new Pais();
                p.setNombre(rs.getString("pais"));
                a.setPais(p);
                ls.add(a);
            }
            
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
    public List<Autor> mostrarUnAutor(int idAutor) throws Exception{
        List ls = new ArrayList();
        ResultSet rs;
        try {
            conectar();
            String sql = "SELECT autor.idAutor, autor.nombre, autor.sexo, autor.fechaNacimiento, autor.fechaDefuncion, autor.imagen, autor.biografia, genero.nombre AS gen, genero.descripcion AS genDes, genero.idGenero AS idGen, pais.nombre AS pais FROM autor JOIN genero on autor.idGenero = genero.idGenero JOIN pais ON autor.idPais = pais.idPais WHERE autor.borradoLogico=1 AND autor.idAutor=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idAutor);
            rs = pre.executeQuery();
            while(rs.next()){
                Autor a = new Autor();
                a.setIdAutor(rs.getInt("idAutor"));
                a.setNombre(rs.getString("nombre"));
                a.setSexo(rs.getString("sexo"));
                a.setFechaNac(rs.getInt("fechaNacimiento"));
                a.setFechaDefunsion(rs.getInt("fechaDefuncion"));
                a.setImagen(rs.getString("imagen"));
                a.setBiografia(rs.getString("biografia"));
                Genero g = new Genero();
                g.setNombre(rs.getString("gen"));
                g.setDescripcion(rs.getString("genDes"));
                g.setIdGenero(rs.getInt("idGen"));
                a.setGenero(g);
                Pais p = new Pais();
                p.setNombre(rs.getString("pais"));
                a.setPais(p);
                ls.add(a);
            }
            
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
    public List<Autor> mostrarAutores() throws Exception{
        List ls = new ArrayList();
        ResultSet rs;
        try {
            conectar();
            String sql = "SELECT autor.idAutor, autor.nombre, autor.sexo, autor.fechaNacimiento, autor.fechaDefuncion, autor.imagen, autor.biografia, genero.idGenero, genero.nombre AS gen, genero.descripcion AS genDes, pais.nombre AS pais FROM autor JOIN genero on autor.idGenero = genero.idGenero JOIN pais ON autor.idPais = pais.idPais WHERE autor.borradoLogico=1";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                Autor a = new Autor();
                a.setIdAutor(rs.getInt("idAutor"));
                a.setNombre(rs.getString("nombre"));
                a.setSexo(rs.getString("sexo"));
                a.setFechaNac(rs.getInt("fechaNacimiento"));
                a.setFechaDefunsion(rs.getInt("fechaDefuncion"));
                a.setImagen(rs.getString("imagen"));
                a.setBiografia(rs.getString("biografia"));
                Genero g = new Genero();
                g.setIdGenero(rs.getInt("idGenero"));       
                g.setNombre(rs.getString("gen"));
                g.setDescripcion(rs.getString("genDes"));
                a.setGenero(g);
                Pais p = new Pais();
                p.setNombre(rs.getString("pais"));
                a.setPais(p);
                ls.add(a);
            }
            
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
    public List<Autor> mostrarGenero(int id) throws Exception{
        List ls = new ArrayList();
        ResultSet rs;
        try {
            conectar();
            String sql = "SELECT * FROM genero WHERE idGenero=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, id);
            rs = pre.executeQuery();
            while(rs.next()){
                Autor a = new Autor();
                Genero g = new Genero();
                g.setNombre(rs.getString("nombre"));
                g.setDescripcion(rs.getString("descripcion"));
                a.setGenero(g);
                ls.add(a);
            }   
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
}
