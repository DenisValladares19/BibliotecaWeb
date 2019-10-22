
package com.modelo;

/**
 * Nombre de la clase: Cliente
 * Fecha: 01-10-2019
 * Version: 1.0
 * Copyright: Biblioteca Online
 * @author Edgard Palacios 
 */

public class Cliente {
    
    private int idCliente;
    private String nombre;
    private String apellido;
    private String direccion;
    private int pais;
    private String nombrePais;
    private int idUsuario;
    private int borrado;
    private String usuario;
    private String pass;
    private String correo;
    private int borradoLogicoUser;
    private String tipoUser;

    public Cliente() {
    }

    public Cliente(int idCliente, String nombre, String apellido, String direccion, int pais, int idUsuario, int borrado, String usuario, String pass, String correo, int borradoLogicoUser, String tipoUser) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.pais = pais;
        this.idUsuario = idUsuario;
        this.borrado = borrado;
        this.usuario = usuario;
        this.pass = pass;
        this.correo = correo;
        this.borradoLogicoUser = borradoLogicoUser;
        this.tipoUser = tipoUser;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
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

    public int getPais() {
        return pais;
    }

    public void setPais(int pais) {
        this.pais = pais;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombrePais() {
        return nombrePais;
    }

    public void setNombrePais(String nombrePais) {
        this.nombrePais = nombrePais;
    }

    
    
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getBorrado() {
        return borrado;
    }

    public void setBorrado(int borrado) {
        this.borrado = borrado;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getBorradoLogicoUser() {
        return borradoLogicoUser;
    }

    public void setBorradoLogicoUser(int borradoLogicoUser) {
        this.borradoLogicoUser = borradoLogicoUser;
    }

    public String getTipoUser() {
        return tipoUser;
    }

    public void setTipoUser(String tipoUser) {
        this.tipoUser = tipoUser;
    }
    
    
}
