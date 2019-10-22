
package com.modelo;

/**
 * Nombre de la clase: Oferta
 * Fecha: 09-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Oferta {
    private int idOferta;
    private String nombre;
    private String descuento;
    private Club club;

    public Oferta() {
    }

    public Oferta(int idOferta, String nombre, String descuento, Club club) {
        this.idOferta = idOferta;
        this.nombre = nombre;
        this.descuento = descuento;
        this.club = club;
    }

    public int getIdOferta() {
        return idOferta;
    }

    public void setIdOferta(int idOferta) {
        this.idOferta = idOferta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescuento() {
        return descuento;
    }

    public void setDescuento(String descuento) {
        this.descuento = descuento;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }
    
    
}
