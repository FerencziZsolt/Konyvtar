

<%@page import="com.mycompany.konyvtar.service.Konyv"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekImplements"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekInterface"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(function () {
        $("#header").load("headfooter/header.html");
        $("#footer").load("headfooter/footer.html");
    });
</script>



<div id="header"></div>
<div class="container">
    <h2>Kölcsönözhető könyvek</h2>
    <%
        LekerdezesekInterface lekerdez = new LekerdezesekImplements();
        %>


    <table  class="col-sm-10 table table-light">
        <thead>
            <tr>
                <th ><h3>Cím</h3></th>
                <th ><h3>Szerző</h3></th>
                <th ><h3>Műfaj</h3></th>
            </tr>
        </thead>
        <tbody>
            <%
                request.setCharacterEncoding("UTF-8");

                List<Konyv> k = lekerdez.getAllBooks();
                for (Konyv konyv : k) { %>
            <tr class="table-light">                                                
                <td><% out.println(konyv.getCim());%></td>
                <td><%out.println(konyv.getSzerzo());%></td>
                <td><%out.println(konyv.getMufaj());%></td>
            </tr>
            <%}%>     
        </tbody>
    </table>
</div>
<div id="footer"></div>
