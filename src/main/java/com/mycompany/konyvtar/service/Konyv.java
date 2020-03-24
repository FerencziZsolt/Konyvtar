/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.konyvtar.service;

/**
 *
 * @author Zsolt
 */
public class Konyv {
    private int id;
    private String cim;
    private String szerzo;
    private String mufaj;

    public Konyv(int id,String cim, String szerzo, String mufaj) {
        this.id=id;
        this.cim = cim;
        this.szerzo = szerzo;
        this.mufaj = mufaj;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCim() {
        return cim;
    }

    public void setCim(String cim) {
        this.cim = cim;
    }

    public String getSzerzo() {
        return szerzo;
    }

    public void setSzerzo(String szerzo) {
        this.szerzo = szerzo;
    }

    public String getMufaj() {
        return mufaj;
    }

    public void setMufaj(String mufaj) {
        this.mufaj = mufaj;
    }

    @Override
    public String toString() {
        return "Konyv{" + "cim=" + cim + ", szerzo=" + szerzo + ", mufaj=" + mufaj + '}';
    }
    
    
    
}
