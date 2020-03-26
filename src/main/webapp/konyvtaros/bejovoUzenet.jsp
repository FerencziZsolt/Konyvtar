<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.konyvtar.service.Konyvtaroslevel"%>
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
    <h3>Bejövő Üzenetek</h3>
    <%
        DataFactoryInterface dfi = new DataFactory();
        List<Konyvtaroslevel> lista = dfi.konyvtaroslevelei();

        for (Konyvtaroslevel k : lista) {%>
    <div class="card border-dark mb-3" style="max-width: 20rem;">
        <div class="card-header"><%out.print(k.getOlvasonev());%></div>
        <div class="card-body">
            <h4 class="card-title"><%out.print(k.getTargy());%></h4>
            <p class="card-text"><%out.print(k.getUzenet());%></p>
        </div>
    </div><%
        }

    %>

</div>
