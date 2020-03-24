package com.mycompany.konyvtar.presentation;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.mycompany.konyvtar.persistence.DataFactory;
import com.mycompany.konyvtar.persistence.DataFactoryInterface;
import com.mycompany.konyvtar.service.Olvaso;
import java.util.Base64;

/**
 *
 * @author Zsolt
 */
public class Authentication {

    public String encoding(String szoveg) {
        String encodedString = Base64.getEncoder().encodeToString(szoveg.getBytes());
        return encodedString;
    }

    public String decoding(String szoveg) {
        byte[] decodedBytes = Base64.getDecoder().decode(szoveg);
        String decodedString = new String(decodedBytes);
        return decodedString;
    }

    public String validUser(String username, String password) {
        DataFactoryInterface db = new DataFactory();
        Olvaso olvaso = db.olvasotVisszaad(username, encoding(password));
        //System.out.println("Username: " + username + " Password: " + password + " EncodingPass: " + encoding(password));

        if (olvaso == null) {
            System.out.println("Nincs ilyen felhasználó ");
            return null;
        }
        System.out.println("Olvasó: " + olvaso.toString());
               if (olvaso.getBeosztas().equals("könyvtáros")) {
            return "könyvtáros";
        }
        return "olvaso";
    }

}
