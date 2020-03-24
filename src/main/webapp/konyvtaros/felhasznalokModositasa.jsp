<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(function () {
        $("#header").load("../headfooter/konyvtarosheader.html");
        $("#footer").load("../headfooter/footer.html");
    });
</script>



<div id="header"></div>
<div class="container">
    <h2>Felhasználók módosítása</h2>
    <%
        request.setCharacterEncoding("UTF-8");

    %>

    <form method="POST" action="felhasznalotModosit.jsp">
        <input type="hidden" name="id" value="<%out.print(request.getParameter("id"));%>" />
        <div class="form-group">
            <label  class="col-sm-2 col-form-label">Név</label>
            <div class="col-sm-10">
                <input class="form-control mr-sm-2" type="text" name="nev" value="<%out.print(request.getParameter("nev")); %>">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 col-form-label">Cím</label>
            <div class="col-sm-10">
                <input class="form-control mr-sm-2" type="text" name="cim" value="<%out.print(request.getParameter("cim"));%>">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 col-form-label">Beosztás</label>
            <div class="col-sm-10">
                <input class="form-control mr-sm-2" type="text" name="beosztas" value="<%out.print(request.getParameter("beosztas"));%>">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 col-form-label">Felhasznalonev</label>
            <div class="col-sm-10">
                <input class="form-control mr-sm-2" type="text" name="felhasznalonev" value="<%out.print(request.getParameter("felhasznalonev"));%>">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 col-form-label">Jelszo</label>
            <div class="col-sm-10">               
                <input class="form-control mr-sm-2" type="text" name="jelszo" value="<%out.print(request.getParameter("jelszo"));%>">
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Módosítás</button>
        <a href="felhasznalokListaja.jsp" class="btn btn-info">Elvetés</a>




    </form>

</div>
<div id="footer"></div>

