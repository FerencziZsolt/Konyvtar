/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.konyvtar.persistence;

import com.mycompany.konyvtar.service.Hirek;
import com.mycompany.konyvtar.service.Kolcsonzes;
import com.mycompany.konyvtar.service.Konyv;
import com.mycompany.konyvtar.service.Konyvtaroslevel;
import com.mycompany.konyvtar.service.Levelezes;
import com.mycompany.konyvtar.service.Olvaso;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Zsolt
 */
public interface DataFactoryInterface {

    public void beszuras(String cim, String szerzo, String mufaj);

    public List<Konyv> getAllBooks();

    public List<Konyv> getBook(String cim, String szerzo, String mufaj);

    public void ujOlvasofelvitel(String nev, Date szulido, String cim, String beosztas, String username, String password);

    public Olvaso olvasotVisszaad(String nev, String jelszo);

    public int olvasoid(String olvasonev);

    public int konyvid(String konyvcim);

    public List<Olvaso> getAllUsers();

    public void konyvetModosit(int id, String cim, String szerzo, String mufaj);

    public void konyvetTorol(int id);

    public void felhasznalotModosit(int id, String nev, String cim, String beosztas, String username, String password);

    public void felhasznalotTorol(int id);

    public void kolcsonzestFelvisz(String olvasonev, String konyvcim);

    public List<Kolcsonzes> getAllRents();

    public void uzenetKuldesFelhasznalonak(String felhasznalonev, String targy, String uzenet);

    public void ujhirkiiras(String targy, String szoveg);

    public List<Hirek> getAllNews();

    public void hirttorol(int id);

    public List<Levelezes> getAllletter();

    public void konyvetVisszahoz(int id);

    public void uzenetKonyvtarosnak(String olvasonev, String targy, String uzenet);

    public List<Konyvtaroslevel> konyvtaroslevelei();
    
    public void kolcsonzeshoszabbitas(int id);

}
