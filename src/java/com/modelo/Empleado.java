
package com.modelo;

/**
 * Nombre de la clase: Empleado
 * Fecha: 08-10-2019
 * Version: 1.0
 * Copyright: Denis Valladares
 * @author Denis Valladares
 */
public class Empleado {
    private int idEmpleado;
    private String nombre;
    private String apellido;
    private String direccion;
    private String dui;
    private String afp;
    private String nit;
    private String isss;

    public Empleado() {
    }

    public Empleado(int idEmpleado, String nombre, String apellido, String direccion, String dui, String afp, String nit, String isss) {
        this.idEmpleado = idEmpleado;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.dui = dui;
        this.afp = afp;
        this.nit = nit;
        this.isss = isss;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getAfp() {
        return afp;
    }

    public void setAfp(String afp) {
        this.afp = afp;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getIsss() {
        return isss;
    }

    public void setIsss(String isss) {
        this.isss = isss;
    }    
}
