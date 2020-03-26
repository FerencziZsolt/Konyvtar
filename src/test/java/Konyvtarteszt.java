/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mycompany.konyvtar.persistence.DataFactory;
import com.mycompany.konyvtar.persistence.DataFactoryInterface;
import com.mycompany.konyvtar.presentation.Authentication;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Zsolt
 */
public class Konyvtarteszt {

    public Konyvtarteszt() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test
    public void tesztel() {
        DataFactoryInterface d = new DataFactory();
        String olvasonev = "Markos Valéria";
        int i = d.olvasoid(olvasonev);
        //assertEquals(i, null);
        assertTrue(i == 5);
    }

    @Test
    public void datumteszt() {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.getTime();
        System.out.println(df.format(c.getTimeInMillis()));
    }

    @Test
    public void felhasznaloUzenet() {
        
        Authentication aut = new Authentication();
        String jelszo = aut.encoding("valcsi01");
        System.out.println(jelszo);
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
