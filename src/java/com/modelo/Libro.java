
package com.modelo;

/**
 * Nombre de la clase: Editorial
 * Fecha: 05-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Libro {
    private int idLibro;
    private String nombre;
    private Genero genero;
    private int anioLanzamiento;
    private Editorial editorial;
    private String sinopsis;
    private String isbn;
    private int cantidad;
    private TipoLibro tipoLibro;
    private String edicion;
    private Autor autor;
    private String imagen;
    private String archivo;
    private Double costo;
    private Double precio;

    public Libro() {
    }

    public Libro(int idLibro, String nombre, Genero genero, int anioLanzamiento, Editorial editorial, String sinopsis, String isbn, int cantidad, TipoLibro tipoLibro, String edicion, Autor autor, String imagen, String archivo, Double costo, Double precio) {
        this.idLibro = idLibro;
        this.nombre = nombre;
        this.genero = genero;
        this.anioLanzamiento = anioLanzamiento;
        this.editorial = editorial;
        this.sinopsis = sinopsis;
        this.isbn = isbn;
        this.cantidad = cantidad;
        this.tipoLibro = tipoLibro;
        this.edicion = edicion;
        this.autor = autor;
        this.imagen = imagen;
        this.archivo = archivo;
        this.costo = costo;
        this.precio = precio;
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public int getAnioLanzamiento() {
        return anioLanzamiento;
    }

    public void setAnioLanzamiento(int anioLanzamiento) {
        this.anioLanzamiento = anioLanzamiento;
    }

    public Editorial getEditorial() {
        return editorial;
    }

    public void setEditorial(Editorial editorial) {
        this.editorial = editorial;
    }

    public String getSinopsis() {
        return sinopsis;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public TipoLibro getTipoLibro() {
        return tipoLibro;
    }

    public void setTipoLibro(TipoLibro tipoLibro) {
        this.tipoLibro = tipoLibro;
    }

    public String getEdicion() {
        return edicion;
    }

    public void setEdicion(String edicion) {
        this.edicion = edicion;
    }

    public Autor getAutor() {
        return autor;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getArchivo() {
        return archivo;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }

    public Double getCosto() {
        return costo;
    }

    public void setCosto(Double costo) {
        this.costo = costo;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }
}
