<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekImplements"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(function () {
        $("#konyvtarosheader").load("../headfooter/konyvtarosheader.html");
        $("#footer").load("../headfooter/footer.html");
    });
</script>
<script src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
<div id="konyvtarosheader"></div>


<div class="container">

    <form method="POST" action="ujuzenetiras.jsp">
        <fieldset>
            <legend>Üzenet küldése felhasználónak</legend>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Tárgy</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Tárgy" name="targy">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Olvasó neve</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Olvasó neve" name="olvasonev">
                </div>
            </div>
            <div class="form-group">                    
                <textarea name="editor1"></textarea>
                <script>CKEDITOR.replace('editor1');</script>
            </div>
            <button type="submit" class="btn btn-primary">Küldés</button>            
        </fieldset>
    </form>

    <%        request.setCharacterEncoding("UTF-8");

        String targy = "";
        String olvasonev = "";
        String szoveg = "";

        if (request.getParameter("targy") != null) {
            targy = request.getParameter("targy");
        }
        if (request.getParameter("olvasonev") != null) {
            olvasonev = request.getParameter("olvasonev");
        }
        if (request.getParameter("editor1") != null) {
            szoveg = request.getParameter("editor1");
        }
        if (!targy.equals("") || !olvasonev.equals("") || !szoveg.equals("")) {
            DataFactoryInterface dfi = new DataFactory();
            dfi.uzenetKuldesFelhasznalonak(olvasonev, targy, szoveg);
        }

    %>

</div>
<div id="footer"></div>

