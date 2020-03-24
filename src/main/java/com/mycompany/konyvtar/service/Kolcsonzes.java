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
public class Kolcsonzes {

    int kolcsonzesid;
    String olvasonev;
    String konyvcim;
    Date kolcsonzesdatuma;
    Date visszahozasdatuma;

    public Kolcsonzes(int kolcsonzesid, String olvasonev, String konyvcim, Date kolcsonzesdatuma, Date visszahozasdatuma) {
        this.kolcsonzesid = kolcsonzesid;
        this.olvasonev = olvasonev;
        this.konyvcim = konyvcim;
        this.kolcsonzesdatuma = kolcsonzesdatuma;
        this.visszahozasdatuma = visszahozasdatuma;
    }

    public int getKolcsonzesid() {
        return kolcsonzesid;
    }

    public void setKolcsonzesid(int kolcsonzesid) {
        this.kolcsonzesid = kolcsonzesid;
    }

    public String getOlvasonev() {
        return olvasonev;
    }

    public void setOlvasonev(String olvasonev) {
        this.olvasonev = olvasonev;
    }

    public String getKonyvcim() {
        return konyvcim;
    }

    public void setKonyvcim(String konyvcim) {
        this.konyvcim = konyvcim;
    }

    public Date getKolcsonzesdatuma() {
        return kolcsonzesdatuma;
    }

    public void setKolcsonzesdatuma(Date kolcsonzesdatuma) {
        this.kolcsonzesdatuma = kolcsonzesdatuma;
    }

    public Date getVisszahozasdatuma() {
        return visszahozasdatuma;
    }

    public void setVisszahozasdatuma(Date visszahozasdatuma) {
        this.visszahozasdatuma = visszahozasdatuma;
    }

    @Override
    public String toString() {
        return "Kolcsonzes{" + "kolcsonzesid=" + kolcsonzesid + ", olvasonev=" + olvasonev + ", konyvcim=" + konyvcim + ", kolcsonzesdatuma=" + kolcsonzesdatuma + ", visszahozasdatuma=" + visszahozasdatuma + '}';
    }

 
    
}
