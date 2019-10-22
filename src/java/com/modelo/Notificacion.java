
package com.modelo;

/**
 * Nombre de la clase: Notificacion
 * Fecha: 09-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Notificacion {
    private int idNotificacion;
    private boolean estado;
    private Oferta oferta;
    private Club club;
    

    public Notificacion() {
    }

    public Notificacion(int idNotificacion, boolean estado, Oferta oferta, Club club) {
        this.idNotificacion = idNotificacion;
        this.estado = estado;
        this.oferta = oferta;
        this.club = club;
    }

    public int getIdNotificacion() {
        return idNotificacion;
    }

    public void setIdNotificacion(int idNotificacion) {
        this.idNotificacion = idNotificacion;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Oferta getOferta() {
        return oferta;
    }

    public void setOferta(Oferta oferta) {
        this.oferta = oferta;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }
}
