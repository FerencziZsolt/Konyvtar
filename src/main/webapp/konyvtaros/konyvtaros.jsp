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
<div id="konyvtarosheader"></div>

<div class="container">

    <form method="POST" action="konyvtaros.jsp">
        <fieldset>
            <legend>Új könyv felvitele</legend>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Cím</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Cím" name="cim">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Szerző</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Szerző" name="szerzo">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Műfaj</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Műfaj" name="mufaj">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Felvitel</button>
            <a href="xmlfeldolgozas.jsp" class="btn btn-info">Felvitel XML-ből</a>
        </fieldset>
    </form>

    <%
        request.setCharacterEncoding("UTF-8");
        String cim = "";
        String szerzo = "";
        String mufaj = "";
        if (request.getParameter("cim") != null) {
            cim = request.getParameter("cim");
        }
        if (request.getParameter("szerzo") != null) {
            szerzo = request.getParameter("szerzo");
        }
        if (request.getParameter("mufaj") != null) {
            mufaj = request.getParameter("mufaj");
        }
        if (!cim.equals("") || !szerzo.equals("") || !mufaj.equals("")) {
            LekerdezesekInterface lekerdezesek = new LekerdezesekImplements();
            lekerdezesek.ujKonyvFelvitel(cim, szerzo, mufaj);
        }

    %>

</div>
<div id="footer"></div>
