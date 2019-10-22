
package com.modelo;

/**
 * Nombre de la clase: Autor
 * Fecha: 04-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Autor {
    private int idAutor;
    private String nombre;
    private String sexo;
    private int fechaNac;
    private int fechaDefunsion;
    private String imagen;
    private String biografia;
    private Genero genero;
    private Pais pais;

    public Autor() {
    }

    public Autor(int idAutor, String nombre, String sexo, int fechaNac, int fechaDefunsion, String imagen, String biografia, Genero genero, Pais pais) {
        this.idAutor = idAutor;
        this.nombre = nombre;
        this.sexo = sexo;
        this.fechaNac = fechaNac;
        this.fechaDefunsion = fechaDefunsion;
        this.imagen = imagen;
        this.biografia = biografia;
        this.genero = genero;
        this.pais = pais;
    }

    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int idAutor) {
        this.idAutor = idAutor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(int fechaNac) {
        this.fechaNac = fechaNac;
    }

    public int getFechaDefunsion() {
        return fechaDefunsion;
    }

    public void setFechaDefunsion(int fechaDefunsion) {
        this.fechaDefunsion = fechaDefunsion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    
}
