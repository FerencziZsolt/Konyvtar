/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.konyvtar.persistence;

import com.mycompany.konyvtar.service.Hirek;
import com.mycompany.konyvtar.service.Kolcsonzes;
import com.mycompany.konyvtar.service.Konyv;
import com.mycompany.konyvtar.service.Levelezes;
import com.mycompany.konyvtar.service.Olvaso;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Zsolt
 */
public class DataFactory implements DataFactoryInterface {

    private static final int KOLCSONZESIIDO = -4;

    private Connection connection = Database.getConnection();

    @Override
    public void beszuras(String cim, String szerzo, String mufaj) {
        try {
            String beszurSql = "insert into konyvtar.konyvek(cim,szerzo,mufaj) values(?,?,?)";
            PreparedStatement ps = connection.prepareStatement(beszurSql);
            ps.setString(1, cim);
            ps.setString(2, szerzo);
            ps.setString(3, mufaj);
            ps.execute();
        } catch (SQLException e) {
            System.out.println("Hiba történt beszúrás közben" + e);
        }
    }

    @Override
    public List<Konyv> getAllBooks() {
        List<Konyv> konyvek = new ArrayList<>();
        String sql = "Select * from konyvek order by cim asc";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int konyvid = resultset.getInt("konyvid");
                String cim = resultset.getString("cim");
                String szerzo = resultset.getString("szerzo");
                String mufaj = resultset.getString("mufaj");
                Konyv k = new Konyv(konyvid, cim, szerzo, mufaj);
                konyvek.add(k);

            }
        } catch (SQLException ex) {
            System.out.println("Hiba történt lekérdezés közben: " + ex);
        }
        return konyvek;

    }

    @Override
    public List<Konyv> getBook(String cim, String szerzo, String mufaj) {
        List<Konyv> konyvek = new ArrayList<>();
        String sql = "";
        if (cim != "") {
            sql = "Select * from konyvek where cim like '" + cim + "%'";
        }
        if (szerzo != "") {
            sql = "Select * from konyvek where szerzo like '%" + szerzo + "%'";
        }
        if (mufaj != "") {
            sql = "Select * from konyvek where mufaj ='" + mufaj + "'";
        }
        System.out.println("getbooks: " + sql);
        try {
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int idja = resultset.getInt("konyvid");
                String cime = resultset.getString("cim");
                String szerzoje = resultset.getString("szerzo");
                String mufaja = resultset.getString("mufaj");
                Konyv k = new Konyv(idja, cime, szerzoje, mufaja);
                konyvek.add(k);
            }
        } catch (SQLException ex) {
            System.out.println("Hiba történt lekérdezés közben: " + ex);
        }
        return konyvek;

    }

    @Override
    public void ujOlvasofelvitel(String nev, Date szulido, String cim, String beosztas, String username, String password) {
        try {
            String sql = "insert into konyvtar.olvaso(nev,szuldatum,cim,beosztas,felhasznalonev,jelszo) Values(?,?,?,?,?,?)";
            PreparedStatement prep = connection.prepareStatement(sql);
            prep.setString(1, nev);
            prep.setDate(2, new java.sql.Date(szulido.getTime()));
            prep.setString(3, cim);
            prep.setString(4, beosztas);
            prep.setString(5, username);
            prep.setString(6, password);
            prep.execute();
        } catch (SQLException sqlex) {
            System.out.println(sqlex);
        }
    }

    @Override
    public Olvaso olvasotVisszaad(String nev, String jelszo) {
        Olvaso olvaso = null;
        try {
            String sql = "Select nev,beosztas,felhasznalonev,jelszo from olvaso where felhasznalonev='" + nev + "' and jelszo='" + jelszo + "'";
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            if (resultset == null) {
                return null;
            }
            while (resultset.next()) {
                String olvasoNev = resultset.getString("nev");
                String olvasoFelhasznalonev = resultset.getString("felhasznalonev");
                String olvasoBeosztas = resultset.getString("beosztas");
                String olvasoJelszo = resultset.getString("jelszo");
                olvaso = new Olvaso(olvasoNev, olvasoFelhasznalonev, olvasoJelszo, olvasoBeosztas);

            }

        } catch (SQLException ex) {
            System.out.println("Nincs ilyen nevű " + ex);
        }
        return olvaso;
    }

    @Override
    public List<Olvaso> getAllUsers() {
        List<Olvaso> lista = new ArrayList<>();
        try {
            String sql = "Select * from olvaso";
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int id = resultset.getInt("olvasoid");
                String nev = resultset.getString("nev");
                Date szuldatum = resultset.getDate("szuldatum");
                String cim = resultset.getString("cim");
                String beosztas = resultset.getString("beosztas");
                String felhasznalonev = resultset.getString("felhasznalonev");
                String jelszo = resultset.getString("jelszo");

                Olvaso olvaso = new Olvaso(id, nev, szuldatum, cim, beosztas, felhasznalonev, jelszo);
                lista.add(olvaso);

            }
        } catch (SQLException ex) {
            System.out.println("Hiba történt: " + ex);
        }
        return lista;
    }

    @Override
    public void konyvetTorol(int id) {
        String torles = "delete from konyvek where konyvid='" + id + "'";
        try {
            PreparedStatement prep = connection.prepareStatement(torles);
            prep.execute();
        } catch (SQLException e) {
            System.out.println("Hiba törlés közben: " + e);
        }
    }

    @Override
    public void felhasznalotModosit(int id, String nev, String cim, String beosztas, String username, String password) {
        try {
            String sql = "update olvaso set nev=?, cim=?, beosztas=?, felhasznalonev=?, jelszo=?  where olvasoId='" + id + "' ";
            PreparedStatement prep = connection.prepareStatement(sql);
            prep.setString(1, nev);
            prep.setString(2, cim);
            prep.setString(3, beosztas);
            prep.setString(4, username);
            prep.setString(5, password);
            prep.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Hiba: " + e);
        }

    }

    @Override
    public void konyvetModosit(int id, String cim, String szerzo, String mufaj) {
        try {
            String sql = "update konyvek set cim=?, szerzo=?, mufaj=?  where konyvid='" + id + "' ";
            PreparedStatement prep = connection.prepareStatement(sql);
            prep.setString(1, cim);
            prep.setString(2, szerzo);
            prep.setString(3, mufaj);
            prep.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Hiba: " + e);
        }
    }

    @Override
    public void felhasznalotTorol(int id) {
        String sqltorles = "delete from olvaso where olvasoid='" + id + "' ";
        try {
            PreparedStatement prep = connection.prepareStatement(sqltorles);
            prep.execute();
        } catch (SQLException e) {
            System.out.println("Hiba: " + e);
        }
    }

    @Override
    public int konyvid(String konyvcim) {
        int id = 0;
        String sql = "Select konyvid from konyvek where cim='" + konyvcim + "' ";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                id = resultset.getInt("konyvid");
            }
        } catch (SQLException e) {
            System.out.println("Hiba könyvid-t visszaad: " + e);
        }
        return id;
    }

    @Override
    public int olvasoid(String olvasonev) {
        int id = 0;
        String sql = "Select olvasoid from olvaso where nev='" + olvasonev + "' ";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                id = resultset.getInt("olvasoid");
            }
        } catch (SQLException e) {
            System.out.println("Hiba olvasoid-t visszaad: " + e);
        }
        return id;
    }

    @Override
    public void kolcsonzestFelvisz(String olvasonev, String konyvcim) {

        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, KOLCSONZESIIDO);

        int konyvid = konyvid(konyvcim);
        int olvasoid = olvasoid(olvasonev);
        System.out.println("Olvasoid: " + olvasoid + " Könyvid: " + konyvid);
        try {
            String sql = "Insert into kolcsonzes(olvasoid,konyvid,kolcsonzesdatuma,visszahozasdatuma) Values(?,?,?,?)";
            PreparedStatement prep = connection.prepareStatement(sql);
            prep.setInt(1, olvasoid);
            prep.setInt(2, konyvid);
            prep.setDate(3, new java.sql.Date(System.currentTimeMillis()));
            prep.setDate(4, new java.sql.Date(c.getTimeInMillis()));
            prep.execute();
        } catch (SQLException e) {
            System.out.println("Hiba történt: " + e);
        }

    }

    @Override
    public List<Kolcsonzes> getAllRents() {
        List<Kolcsonzes> kolcsonzesek = new ArrayList<>();
        String sql = "Select kolcsonzes.kolcsonzesid,olvaso.nev,konyvek.cim,kolcsonzes.kolcsonzesdatuma,kolcsonzes.visszahozasdatuma\n"
                + "                from olvaso,konyvek,kolcsonzes \n"
                + "               where olvaso.olvasoid = kolcsonzes.olvasoid\n"
                + "               AND konyvek.konyvid = kolcsonzes.konyvid";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int kolcsonzesid = resultset.getInt("kolcsonzesid");
                String nev = resultset.getString("nev");
                String konyvcim = resultset.getString("cim");
                Date kolcsonzesdatuma = resultset.getDate("kolcsonzesdatuma");
                Date visszahozasdatuma = resultset.getDate("visszahozasdatuma");
                Kolcsonzes k = new Kolcsonzes(kolcsonzesid, nev, konyvcim, kolcsonzesdatuma, visszahozasdatuma);
                kolcsonzesek.add(k);

            }
        } catch (SQLException ex) {
            System.out.println("Hiba történt lekérdezés közben: " + ex);
        }
        return kolcsonzesek;

    }

    @Override
    public void uzenetKuldesFelhasznalonak(String olvasonev, String targy, String uzenet) {
        try {
            int olvasoid = olvasoid(olvasonev);
            System.out.println("Üzenethez olvasoID: " + olvasoid + " " + olvasonev + " " + targy);
            String sql = "insert into levelezes(olvasoid,targy,szoveg) Values(?,?,?)";
            PreparedStatement prep = connection.prepareStatement(sql);
            prep.setInt(1, olvasoid);
            prep.setString(2, targy);
            prep.setString(3, uzenet);
            prep.execute();

        } catch (SQLException e) {
            System.out.println("Hiba hírbeszúrás közben: " + e);
        }
    }

    @Override
    public void ujhirkiiras(String targy, String szoveg
    ) {
        try {
            String sql = "insert into konyvtar.hirek(tema,szoveg) Values(?,?)";
            PreparedStatement prep = connection.prepareStatement(sql);
            prep.setString(1, targy);
            prep.setString(2, szoveg);
            prep.execute();
        } catch (SQLException sqlex) {
            System.out.println("Hírkiiras hiba: " + sqlex);
        }
    }

    @Override
    public List<Hirek> getAllNews() {
        List<Hirek> hirek = new ArrayList<>();
        String sql = "Select * from hirek order by hirid desc";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int hirid = resultset.getInt("hirid");
                String tema = resultset.getString("tema");
                String szoveg = resultset.getString("szoveg");
                Date kiirasdatuma = resultset.getDate("kiirasdatuma");
                Hirek h = new Hirek(hirid, tema, szoveg, kiirasdatuma);
                hirek.add(h);

            }
        } catch (SQLException ex) {
            System.out.println("Hiba történt lekérdezés közben: " + ex);
        }
        return hirek;

    }

    @Override
    public void hirttorol(int id) {
        String sqltorles = "delete from hirek where hirid='" + id + "' ";
        try {
            PreparedStatement prep = connection.prepareStatement(sqltorles);
            prep.execute();
        } catch (SQLException e) {
            System.out.println("Hiba: " + e);
        }
    }

    @Override
    public List<Levelezes> getAllletter() {
        List<Levelezes> lista = new ArrayList<>();
        try {
            String sql = "Select * from levelezes";
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                int levelId = rs.getInt("levelid");
                int olvasoId = rs.getInt("olvasoid");
                String targy = rs.getString("targy");
                String szoveg = rs.getString("szoveg");
                Date letrehozva = rs.getDate("letrehozas");
                Levelezes l = new Levelezes(levelId, olvasoId, targy, szoveg, letrehozva);
                lista.add(l);
            }

        } catch (SQLException e) {
            System.out.println("Hiba levelek lekérdezésekor: " + e);
        }
        return lista;
    }

    @Override
    public void konyvetVisszahoz(int id) {
        try {
            String sql = "Delete from kolcsonzes where kolcsonzesid='" + id + "'; ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.execute();
        } catch (SQLException se) {
            System.out.println("Hiba visszahozott könyvnél: " + se);
        }

    }


}
