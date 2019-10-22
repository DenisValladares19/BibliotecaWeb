
package com.modelo;

/**
 * Nombre de la clase: Club
 * Fecha: 08-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Club {
    private int idClub;
    private String nombre;
    private int idEmpleado;
    public Club() {
    }

    public Club(int idClub, String nombre, int idEmpleado) {
        this.idClub = idClub;
        this.nombre = nombre;
        this.idEmpleado = idEmpleado;
    }

    public int getIdClub() {
        return idClub;
    }

    public void setIdClub(int idClub) {
        this.idClub = idClub;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    
}
