<%@page import="java.util.Date"%>
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

    <form method="POST" action="kolcsonzestfelvisz.jsp">
        <fieldset>
            <legend>Új kölcsönzés felvitele</legend>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Olvasó neve</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Olvasó neve" name="olvasonev">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Könyv címe</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Könyv címe" name="konyvcim">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Felvitel</button>
        </fieldset>
    </form>



</div>
