<%@page import="com.mycompany.konyvtar.service.Hirek"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekImplements"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekInterface"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(function () {
        $("#olvasoheader").load("../headfooter/olvasoheader.html");
        $("#footer").load("../headfooter/footer.html");
    });
</script>
<div id="olvasoheader"></div>


<div class="container">   


    <% request.setCharacterEncoding("UTF-8"); %>
    <%
        HttpSession s = request.getSession(true);

        out.print("<h2>Üdvözöllek a könyvtárban kedves " + (String) session.getAttribute("user") + " </h2>");
    %><h3>Új hírek:</h3><%
        LekerdezesekInterface li = new LekerdezesekImplements();

        List<Hirek> hirlista = li.getAllNews();
        for (Hirek h : hirlista) {
    %>

    <div class="card border-dark mb-3" style="max-width: 20rem;">
        <div class="card-header"><%out.print(h.getKiirasdatuma());%></div>
        <div class="card-body">
            <h4 class="card-title"><%out.print(h.getTema());%></h4>
            <p class="card-text"><%out.print(h.getSzoveg());%></p>
        </div>
    </div>

    <%}%>


    <div id="footer"></div>
</div>

