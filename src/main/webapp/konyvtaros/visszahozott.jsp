<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
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
    <h1>Visszahozott könyv: </h1>
    <%
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
       // String konyvcim = request.getParameter("konyvcim");
       // String olvasonev = request.getParameter("olvasonev");

        DataFactoryInterface df = new DataFactory();
        
        df.konyvetVisszahoz(id);
        response.sendRedirect("kolcsonzeseklistaja.jsp");


    %>

</div>