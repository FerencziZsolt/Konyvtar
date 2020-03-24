<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekImplements"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
<script>
    $(function () {
        $("#konyvtarosheader").load("../headfooter/konyvtarosheader.html");
        $("#footer").load("../headfooter/footer.html");
    });
</script>
<div id="konyvtarosheader"></div>

<div class="container">

    <form method="POST" action="ujhirkiiras.jsp">
        <fieldset>
            <legend>Új hír kiírása</legend>
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
            <button type="submit" class="btn btn-primary">Felvitel</button>            
        </fieldset>
    </form>

    <%
        request.setCharacterEncoding("UTF-8");
        String tema = request.getParameter("targy");
        String szoveg = request.getParameter("editor1");

        DataFactoryInterface d = new DataFactory();
        d.ujhirkiiras(tema, szoveg);


    %>

</div>
<div id="footer"></div>
