
package com.modelo;

/**
 * Nombre de la clase: Editorial
 * Fecha: 05-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Editorial {
    private int idEditorial;
    private String nombre;
    private Pais pais;

    public Editorial() {
    }

    public Editorial(int idEditorial, String nombre, Pais pais) {
        this.idEditorial = idEditorial;
        this.nombre = nombre;
        this.pais = pais;
    }

    public int getIdEditorial() {
        return idEditorial;
    }

    public void setIdEditorial(int idEditorial) {
        this.idEditorial = idEditorial;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }
}
