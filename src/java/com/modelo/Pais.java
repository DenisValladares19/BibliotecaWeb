
package com.modelo;

/**
 * Nombre de la clase: Pais
 * Fecha: 04-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Pais {
    private int idPais;
    private String nombre;
    

    public Pais() {
    }

    public Pais(int idPais, String nombre) {
        this.idPais = idPais;
        this.nombre = nombre;
    }

    public int getIdPais() {
        return idPais;
    }

    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
}
