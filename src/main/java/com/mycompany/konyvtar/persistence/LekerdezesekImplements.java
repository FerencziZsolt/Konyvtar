/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.konyvtar.persistence;

import com.mycompany.konyvtar.service.Hirek;
import com.mycompany.konyvtar.service.Kolcsonzes;
import com.mycompany.konyvtar.service.Konyv;
import com.mycompany.konyvtar.service.Olvaso;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Zsolt
 */
public class LekerdezesekImplements implements LekerdezesekInterface {

    DataFactoryInterface db = new DataFactory();

    @Override
    public void ujKonyvFelvitel(String cim, String szerzo, String mufaj) {
        db.beszuras(cim, szerzo, mufaj);
    }

    @Override
    public List<Konyv> getAllBooks() {
        List<Konyv> konyvek = new ArrayList();
        konyvek = db.getAllBooks();
        return konyvek;
    }

    @Override
    public List<Konyv> keresettkonyv(String cim, String szerzo, String mufaj) {
        List<Konyv> lista = db.getBook(cim, szerzo, mufaj);
        return lista;
    }

    @Override
    public void ujOlvasoFelvitel(String nev, String szuldatum, String cim, String beosztas, String username, String password) {
        try {
            Date szuldatuma = new SimpleDateFormat("yyyy-MM-dd").parse(szuldatum);
            db.ujOlvasofelvitel(nev, szuldatuma, cim, beosztas, username, password);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Olvaso> olvasokatListaz() {
        List<Olvaso> lista = db.getAllUsers();
        return lista;
    }

    @Override
    public void konyvetModosit(int id, String cim, String szerzo, String mufaj) {
        try {
            db.konyvetModosit(id, cim, szerzo, mufaj);
        } catch (Exception e) {
            System.out.println("Hiba módosítás közben: " + e);
        }
    }

    @Override
    public void konyvetTorol(int id) {
        try {
            db.konyvetTorol(id);
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    @Override
    public List<Kolcsonzes> getAllRents() {
        List<Kolcsonzes> lista = db.getAllRents();
        return lista;
    }

    @Override
    public List<Hirek> getAllNews() {
        List<Hirek> lista = db.getAllNews();
        return lista;
    }
    
    
}
