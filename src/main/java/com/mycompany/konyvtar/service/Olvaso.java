/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.konyvtar.service;

import java.util.Date;

/**
 *
 * @author Zsolt
 */
public class Olvaso {

    private int id;
    private String nev;
    private Date szulido;
    private String cim;
    private String felhasznalonev;
    private String jelszo;
    private String beosztas;

    public Olvaso(int id, String nev, Date szulido, String cim, String beosztas, String felhasznalonev, String jelszo) {
        this.id = id;
        this.nev = nev;
        this.szulido = szulido;
        this.cim = cim;
        this.felhasznalonev = felhasznalonev;
        this.jelszo = jelszo;
        this.beosztas = beosztas;
    }

    public Olvaso(int id, String nev, String cim, String felhasznalonev, String beosztas) {
        this.id = id;
        this.nev = nev;
        this.cim = cim;
        this.felhasznalonev = felhasznalonev;
        this.beosztas = beosztas;
    }
    

    public Olvaso(String nev, String felhasznalonev, String jelszo, String beosztas) {
        this.nev = nev;
        this.felhasznalonev = felhasznalonev;
        this.jelszo = jelszo;
        this.beosztas = beosztas;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNev() {
        return nev;
    }

    public void setNev(String nev) {
        this.nev = nev;
    }

    public Date getSzulido() {
        return szulido;
    }

    public void setSzulido(Date szulido) {
        this.szulido = szulido;
    }

    public String getCim() {
        return cim;
    }

    public void setCim(String cim) {
        this.cim = cim;
    }

    public String getFelhasznalonev() {
        return felhasznalonev;
    }

    public void setFelhasznalonev(String felhasznalonev) {
        this.felhasznalonev = felhasznalonev;
    }

    public String getJelszo() {
        return jelszo;
    }

    public void setJelszo(String jelszo) {
        this.jelszo = jelszo;
    }

    public String getBeosztas() {
        return beosztas;
    }

    public void setBeosztas(String beosztas) {
        this.beosztas = beosztas;
    }

}
