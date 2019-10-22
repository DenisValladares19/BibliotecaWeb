
package com.dao;

import com.conexion.Conexion;
import com.modelo.Autor;
import com.modelo.Editorial;
import com.modelo.Genero;
import com.modelo.Libro;
import com.modelo.TipoLibro;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Nombre de la clase: DaoLibro
 * Fecha: 06-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class DaoLibro extends Conexion {
    
    public List<Libro> mostrarLibroIndex() throws Exception{
        ResultSet rs;
        List<Libro> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT libro.idLibro, libro.nombre,libro.anioLanzamiento, libro.sinopsis, libro.isbn, libro.cantidad, libro.edicion, libro.costoCompra, libro.costoVenta, libro.urlimagen, libro.urlArchivo, genero.idGenero AS idGenero, genero.nombre AS nombreGen, genero.descripcion AS descGenero, editorial.idEditorial AS idEdit, editorial.nombre AS nombreEdit, tipolibro.idTipoLibro AS idTipoLibro, tipolibro.tipo AS tipoLibro, autor.idAutor AS idAutor, autor.nombre AS nombreAutor, autor.sexo AS sexoAutor, autor.fechaNacimiento AS autorFechaNac, autor.fechaDefuncion AS autorFechaDef, autor.biografia AS autorBiografia, autor.imagen AS autorImagen FROM libro JOIN genero ON libro.idGenero = genero.idGenero JOIN editorial ON libro.idEditorial = editorial.idEditorial JOIN tipolibro ON libro.idTipoLibro = tipolibro.idTipoLibro JOIN autor ON libro.idAutor = autor.idAutor WHERE libro.borradoLogico=1 LIMIT 3";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                Libro l = new Libro();
                l.setIdLibro(rs.getInt("idLibro"));
                l.setNombre(rs.getString("nombre"));
                l.setAnioLanzamiento(rs.getInt("anioLanzamiento"));
                l.setSinopsis(rs.getString("sinopsis"));
                l.setIsbn(rs.getString("isbn"));
                l.setCantidad(rs.getInt("cantidad"));
                l.setEdicion(rs.getString("edicion"));
                l.setCosto(rs.getDouble("costoCompra"));
                l.setPrecio(rs.getDouble("costoVenta"));
                l.setImagen(rs.getString("urlImagen"));
                l.setArchivo(rs.getString("urlArchivo"));
                Genero g = new Genero();
                g.setIdGenero(rs.getInt("idGenero"));
                g.setNombre(rs.getString("nombreGen"));
                g.setDescripcion(rs.getString("descGenero"));
                l.setGenero(g);
                Editorial e = new Editorial();
                e.setIdEditorial(rs.getInt("idEdit"));
                e.setNombre(rs.getString("nombreEdit"));
                l.setEditorial(e);
                TipoLibro tl = new TipoLibro();
                tl.setIdTipoLibro(rs.getInt("idTipoLibro"));
                tl.setTipo(rs.getString("tipoLibro"));
                l.setTipoLibro(tl);
                Autor a = new Autor();
                a.setIdAutor(rs.getInt("idAutor"));
                a.setNombre(rs.getString("nombreAutor"));
                a.setSexo(rs.getString("sexoAutor"));
                a.setFechaNac(rs.getInt("autorFechaNac"));
                a.setFechaDefunsion(rs.getInt("autorFechaDef"));
                a.setBiografia(rs.getString("autorBiografia"));
                a.setImagen(rs.getString("autorImagen"));
                l.setAutor(a);
                ls.add(l); 
            }     
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
    
    public List<Libro> mostrarLibros() throws Exception{
        ResultSet rs;
        List<Libro> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT libro.idLibro, libro.nombre,libro.anioLanzamiento, libro.sinopsis, libro.isbn, libro.cantidad, libro.edicion, libro.costoCompra, libro.costoVenta, libro.urlimagen, libro.urlArchivo, genero.idGenero AS idGenero, genero.nombre AS nombreGen, genero.descripcion AS descGenero, editorial.idEditorial AS idEdit, editorial.nombre AS nombreEdit, tipolibro.idTipoLibro AS idTipoLibro, tipolibro.tipo AS tipoLibro, autor.idAutor AS idAutor, autor.nombre AS nombreAutor, autor.sexo AS sexoAutor, autor.fechaNacimiento AS autorFechaNac, autor.fechaDefuncion AS autorFechaDef, autor.biografia AS autorBiografia, autor.imagen AS autorImagen FROM libro JOIN genero ON libro.idGenero = genero.idGenero JOIN editorial ON libro.idEditorial = editorial.idEditorial JOIN tipolibro ON libro.idTipoLibro = tipolibro.idTipoLibro JOIN autor ON libro.idAutor = autor.idAutor WHERE libro.borradoLogico=1";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            rs = pre.executeQuery();
            while(rs.next()){
                Libro l = new Libro();
                l.setIdLibro(rs.getInt("idLibro"));
                l.setNombre(rs.getString("nombre"));
                l.setAnioLanzamiento(rs.getInt("anioLanzamiento"));
                l.setSinopsis(rs.getString("sinopsis"));
                l.setIsbn(rs.getString("isbn"));
                l.setCantidad(rs.getInt("cantidad"));
                l.setEdicion(rs.getString("edicion"));
                l.setCosto(rs.getDouble("costoCompra"));
                l.setPrecio(rs.getDouble("costoVenta"));
                l.setImagen(rs.getString("urlImagen"));
                l.setArchivo(rs.getString("urlArchivo"));
                Genero g = new Genero();
                g.setIdGenero(rs.getInt("idGenero"));
                g.setNombre(rs.getString("nombreGen"));
                g.setDescripcion(rs.getString("descGenero"));
                l.setGenero(g);
                Editorial e = new Editorial();
                e.setIdEditorial(rs.getInt("idEdit"));
                e.setNombre(rs.getString("nombreEdit"));
                l.setEditorial(e);
                TipoLibro tl = new TipoLibro();
                tl.setIdTipoLibro(rs.getInt("idTipoLibro"));
                tl.setTipo(rs.getString("tipoLibro"));
                l.setTipoLibro(tl);
                Autor a = new Autor();
                a.setIdAutor(rs.getInt("idAutor"));
                a.setNombre(rs.getString("nombreAutor"));
                a.setSexo(rs.getString("sexoAutor"));
                a.setFechaNac(rs.getInt("autorFechaNac"));
                a.setFechaDefunsion(rs.getInt("autorFechaDef"));
                a.setBiografia(rs.getString("autorBiografia"));
                a.setImagen(rs.getString("autorImagen"));
                l.setAutor(a);
                ls.add(l); 
            }     
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
    public List<Libro> verLibro(int idLibro) throws Exception{
        ResultSet rs;
        List<Libro> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT libro.idLibro, libro.nombre,libro.anioLanzamiento, libro.sinopsis, libro.isbn, libro.cantidad, libro.edicion, libro.costoCompra, libro.costoVenta, libro.urlimagen, libro.urlArchivo, genero.idGenero AS idGenero, genero.nombre AS nombreGen, genero.descripcion AS descGenero, editorial.idEditorial AS idEdit, editorial.nombre AS nombreEdit, tipolibro.idTipoLibro AS idTipoLibro, tipolibro.tipo AS tipoLibro, autor.idAutor AS idAutor, autor.nombre AS nombreAutor, autor.sexo AS sexoAutor, autor.fechaNacimiento AS autorFechaNac, autor.fechaDefuncion AS autorFechaDef, autor.biografia AS autorBiografia, autor.imagen AS autorImagen FROM libro JOIN genero ON libro.idGenero = genero.idGenero JOIN editorial ON libro.idEditorial = editorial.idEditorial JOIN tipolibro ON libro.idTipoLibro = tipolibro.idTipoLibro JOIN autor ON libro.idAutor = autor.idAutor WHERE libro.borradoLogico=1 AND libro.idLibro=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idLibro);
            rs = pre.executeQuery();
            while(rs.next()){
                Libro l = new Libro();
                l.setIdLibro(rs.getInt("idLibro"));
                l.setNombre(rs.getString("nombre"));
                l.setAnioLanzamiento(rs.getInt("anioLanzamiento"));
                l.setSinopsis(rs.getString("sinopsis"));
                l.setIsbn(rs.getString("isbn"));
                l.setCantidad(rs.getInt("cantidad"));
                l.setEdicion(rs.getString("edicion"));
                l.setCosto(rs.getDouble("costoCompra"));
                l.setPrecio(rs.getDouble("costoVenta"));
                l.setImagen(rs.getString("urlImagen"));
                l.setArchivo(rs.getString("urlArchivo"));
                Genero g = new Genero();
                g.setIdGenero(rs.getInt("idGenero"));
                g.setNombre(rs.getString("nombreGen"));
                g.setDescripcion(rs.getString("descGenero"));
                l.setGenero(g);
                Editorial e = new Editorial();
                e.setIdEditorial(rs.getInt("idEdit"));
                e.setNombre(rs.getString("nombreEdit"));
                l.setEditorial(e);
                TipoLibro tl = new TipoLibro();
                tl.setIdTipoLibro(rs.getInt("idTipoLibro"));
                tl.setTipo(rs.getString("tipoLibro"));
                l.setTipoLibro(tl);
                Autor a = new Autor();
                a.setIdAutor(rs.getInt("idAutor"));
                a.setNombre(rs.getString("nombreAutor"));
                a.setSexo(rs.getString("sexoAutor"));
                a.setFechaNac(rs.getInt("autorFechaNac"));
                a.setFechaDefunsion(rs.getInt("autorFechaDef"));
                a.setBiografia(rs.getString("autorBiografia"));
                a.setImagen(rs.getString("autorImagen"));
                l.setAutor(a);
                ls.add(l); 
            }     
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
    public List<Genero> listarGenero() throws Exception
    {
        ResultSet rs;
        List<Genero> lst=new ArrayList();
        
        try 
        {
            this.conectar();
            String sql="select * from genero";
            PreparedStatement pst=this.getCon().prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next())
            {
                Genero g=new Genero();
                g.setIdGenero(rs.getInt("idGenero"));
                g.setNombre(rs.getString("nombre"));
                g.setDescripcion(rs.getString("descripcion"));
                lst.add(g);
                
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
    
     public List<Libro> verLibroGenero(int idGenero) throws Exception{
        ResultSet rs;
        List<Libro> ls = new ArrayList();
        try {
            conectar();
            String sql = "SELECT libro.idLibro, libro.nombre,libro.anioLanzamiento, libro.sinopsis, libro.isbn, libro.cantidad, libro.edicion, libro.costoCompra, libro.costoVenta, libro.urlimagen, libro.urlArchivo, genero.idGenero AS idGenero, genero.nombre AS nombreGen, genero.descripcion AS descGenero, editorial.idEditorial AS idEdit, editorial.nombre AS nombreEdit, tipolibro.idTipoLibro AS idTipoLibro, tipolibro.tipo AS tipoLibro, autor.idAutor AS idAutor, autor.nombre AS nombreAutor, autor.sexo AS sexoAutor, autor.fechaNacimiento AS autorFechaNac, autor.fechaDefuncion AS autorFechaDef, autor.biografia AS autorBiografia, autor.imagen AS autorImagen FROM libro JOIN genero ON libro.idGenero = genero.idGenero JOIN editorial ON libro.idEditorial = editorial.idEditorial JOIN tipolibro ON libro.idTipoLibro = tipolibro.idTipoLibro JOIN autor ON libro.idAutor = autor.idAutor WHERE libro.borradoLogico=1 AND libro.idGenero=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, idGenero);
            rs = pre.executeQuery();
            while(rs.next()){
                Libro l = new Libro();
                l.setIdLibro(rs.getInt("idLibro"));
                l.setNombre(rs.getString("nombre"));
                l.setAnioLanzamiento(rs.getInt("anioLanzamiento"));
                l.setSinopsis(rs.getString("sinopsis"));
                l.setIsbn(rs.getString("isbn"));
                l.setCantidad(rs.getInt("cantidad"));
                l.setEdicion(rs.getString("edicion"));
                l.setCosto(rs.getDouble("costoCompra"));
                l.setPrecio(rs.getDouble("costoVenta"));
                l.setImagen(rs.getString("urlImagen"));
                l.setArchivo(rs.getString("urlArchivo"));
                Genero g = new Genero();
                g.setIdGenero(rs.getInt("idGenero"));
                g.setNombre(rs.getString("nombreGen"));
                g.setDescripcion(rs.getString("descGenero"));
                l.setGenero(g);
                Editorial e = new Editorial();
                e.setIdEditorial(rs.getInt("idEdit"));
                e.setNombre(rs.getString("nombreEdit"));
                l.setEditorial(e);
                TipoLibro tl = new TipoLibro();
                tl.setIdTipoLibro(rs.getInt("idTipoLibro"));
                tl.setTipo(rs.getString("tipoLibro"));
                l.setTipoLibro(tl);
                Autor a = new Autor();
                a.setIdAutor(rs.getInt("idAutor"));
                a.setNombre(rs.getString("nombreAutor"));
                a.setSexo(rs.getString("sexoAutor"));
                a.setFechaNac(rs.getInt("autorFechaNac"));
                a.setFechaDefunsion(rs.getInt("autorFechaDef"));
                a.setBiografia(rs.getString("autorBiografia"));
                a.setImagen(rs.getString("autorImagen"));
                l.setAutor(a);
                ls.add(l); 
            }     
        } catch (Exception e) {
            throw e;
        }finally{
            desconectar();
        }
        return ls;
    }
    
}
