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
public class Levelezes {
    int id;
    int olvasoid;
    String targy;
    String szoveg;
    Date letrehozva;

    public Levelezes(int id, int olvasoid, String targy, String szoveg, Date letrehozva) {
        this.id = id;
        this.olvasoid = olvasoid;
        this.targy = targy;
        this.szoveg = szoveg;
        this.letrehozva = letrehozva;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOlvasoid() {
        return olvasoid;
    }

    public void setOlvasoid(int olvasoid) {
        this.olvasoid = olvasoid;
    }

    public String getTargy() {
        return targy;
    }

    public void setTargy(String targy) {
        this.targy = targy;
    }

    public String getSzoveg() {
        return szoveg;
    }

    public void setSzoveg(String szoveg) {
        this.szoveg = szoveg;
    }

    public Date getLetrehozva() {
        return letrehozva;
    }

    public void setLetrehozva(Date letrehozva) {
        this.letrehozva = letrehozva;
    }
    
    
    
    
            
    
}
