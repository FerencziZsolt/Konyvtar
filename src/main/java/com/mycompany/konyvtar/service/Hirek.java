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
public class Hirek {
    int id;
    String tema;
    String szoveg;
    Date kiirasdatuma;

    public Hirek(int id, String tema, String szoveg, Date kiirasdatuma) {
        this.id = id;
        this.tema = tema;
        this.szoveg = szoveg;
        this.kiirasdatuma = kiirasdatuma;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getSzoveg() {
        return szoveg;
    }

    public void setSzoveg(String szoveg) {
        this.szoveg = szoveg;
    }

    public Date getKiirasdatuma() {
        return kiirasdatuma;
    }

    public void setKiirasdatuma(Date kiirasdatuma) {
        this.kiirasdatuma = kiirasdatuma;
    }
    
    
    
}
