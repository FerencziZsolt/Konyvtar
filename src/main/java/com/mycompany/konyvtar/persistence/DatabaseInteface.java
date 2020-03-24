/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.konyvtar.persistence;

import java.sql.Connection;

/**
 *
 * @author Zsolt
 */
public interface DatabaseInteface {

    public Connection connect();

    public Connection getConnection();

    public void disconnect();



    

}
