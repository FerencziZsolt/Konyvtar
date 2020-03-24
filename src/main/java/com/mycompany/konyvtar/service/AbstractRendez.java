/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.konyvtar.service;

import java.util.List;

/**
 *
 * @author Zsolt
 */
abstract class AbstractRendez {
    
    protected void kiir(List<Konyv> lista){
        for(Konyv k : lista){
            System.out.println(k);
        }
    }
    
}
