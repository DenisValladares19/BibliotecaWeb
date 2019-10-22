
package com.modelo;

/**
 * Nombre de la  clase: TipoLibro
 * Fecha: 05-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class TipoLibro {
    private int idTipoLibro;
    private String tipo;

    public TipoLibro() {
    }

    public TipoLibro(int idTipoLibro, String tipo) {
        this.idTipoLibro = idTipoLibro;
        this.tipo = tipo;
    }

    public int getIdTipoLibro() {
        return idTipoLibro;
    }

    public void setIdTipoLibro(int idTipoLibro) {
        this.idTipoLibro = idTipoLibro;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
}
