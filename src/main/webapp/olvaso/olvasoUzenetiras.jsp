<%@page import="com.mycompany.konyvtar.presentation.Authentication"%>
<%@page import="com.mycompany.konyvtar.service.Olvaso"%>
<%@page import="com.mycompany.konyvtar.service.Hirek"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekImplements"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekInterface"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
<script>
    $(function () {
        $("#olvasoheader").load("../headfooter/olvasoheader.html");
        $("#footer").load("../headfooter/footer.html");
    });
</script>
<div id="olvasoheader"></div>


<div class="container">   


    <form method="POST" action="olvasoUzenetiras.jsp">
        <fieldset>
            <legend>Üzenet küldése a könyvtárosnak</legend>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Tárgy</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Tárgy" name="targy">
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
        DataFactoryInterface dfi = new DataFactory();
        Authentication aut = new Authentication();
                
        
        String usernev = (String) session.getAttribute("user");
        String jelszo = aut.encoding((String) session.getAttribute("passw"));
        
        Olvaso olvaso = dfi.olvasotVisszaad(usernev, jelszo);
        //out.print(olvaso.toString());

        String targy = "";
        String szoveg = "";
        String olvasoneve = olvaso.getNev();
        
    if (request.getParameter("targy") != null) {
        targy = request.getParameter("targy");
    }
    if (request.getParameter("editor1") != null) {
        szoveg = request.getParameter("editor1");
    }
    if (!targy.equals("") || !szoveg.equals("")) {
        dfi.uzenetKonyvtarosnak(olvasoneve, targy, szoveg);
            
    }
    %>







</div>
<div id="footer"></div>
