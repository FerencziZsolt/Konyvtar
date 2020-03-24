
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekImplements"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekInterface"%>
<%@page import="java.util.Base64"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(function () {
        $("#konyvtarosheader").load("../headfooter/konyvtarosheader.html");
        $("#footer").load("../headfooter/footer.html");
    });
</script>


<div id="konyvtarosheader"></div>
<div class="container">

    <form method="POST" action="olvasohozzaadas.jsp">
        <fieldset>
            <legend>Olvasó hozzáadása</legend>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Név</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Név" name="nev">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Születési idő</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="date" placeholder="Születési idő" name="szuldatum">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Cím</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Cím" name="cim">
                </div>                
            </div>

            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Beosztás</label>
                <div class="col-sm-10"> 
                    <select name="beosztas" class="custom-select">   
                        <option selected="">Jelölje meg a beosztást</option>
                        <option value="olvaso">Olvasó</option>
                        <option value="könyvtáros">Könyvtáros</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Felhasználónév</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Felhasználónév" name="felhasznalonev">
                </div>                
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Jelszo</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="password" placeholder="Jelszó" name="jelszo">
                </div>                
            </div>            

            <button type="submit" class="btn btn-primary">Felvitel</button>
        </fieldset>

    </form>
    <%
        request.setCharacterEncoding("UTF-8");
        LekerdezesekInterface l = new LekerdezesekImplements();

        String nev = request.getParameter("nev");
        String szulido = request.getParameter("szuldatum");
        String cim = request.getParameter("cim");
        String beosztas = request.getParameter("beosztas");
        String username = request.getParameter("felhasznalonev");
        String password = request.getParameter("jelszo");

        if (request.getParameter("nev") != null || request.getParameter("szuldatum") != null || request.getParameter("cim") != null) {
            String originalInput = password;
            String encodedString = Base64.getEncoder().encodeToString(originalInput.getBytes());
            nev = request.getParameter("nev");
            szulido = request.getParameter("szuldatum");
            cim = request.getParameter("cim");
            l.ujOlvasoFelvitel(nev, szulido, cim, beosztas, username, encodedString);
        }


    %>
</div>
<div id="footer"></div>




