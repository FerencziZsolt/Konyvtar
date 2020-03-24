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
import java.util.List;

/**
 *
 * @author Zsolt
 */
public interface LekerdezesekInterface {

    public void ujKonyvFelvitel(String cim, String szerzo, String mufaj);

    public List<Konyv> getAllBooks();

    public List<Konyv> keresettkonyv(String cim, String szerzo, String mufaj);

    public void ujOlvasoFelvitel(String nev, String szuldatum, String cim, String beosztas, String username, String password);

    public List<Olvaso> olvasokatListaz();

    public void konyvetModosit(int id, String cim, String szerzo, String mufaj);

    public void konyvetTorol(int id);

    public List<Kolcsonzes> getAllRents();
    
    public List<Hirek> getAllNews();
    
   

}
