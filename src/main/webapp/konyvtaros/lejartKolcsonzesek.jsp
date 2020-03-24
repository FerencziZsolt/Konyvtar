
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page import="com.mycompany.konyvtar.service.Kolcsonzes"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekImplements"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekInterface"%>
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
    <%
        DateFormat dateformat = new SimpleDateFormat("yyyy.MM.dd");
        Calendar calendar = Calendar.getInstance();
        calendar.getTime();

    %>
    <h2>Lejárt Kölcsönzések listája </h2> 
    <h2>Mai dátum:  <%out.println(dateformat.format(calendar.getTimeInMillis())); %></h2>


    <%
        request.setCharacterEncoding("UTF-8");

        Calendar c = Calendar.getInstance();
        c.getTime();

        DataFactoryInterface dfi = new DataFactory();%>
    <table  class="col-sm-10 table table-hover">
        <thead>
            <tr>
                <th ><h3>Olvasó neve</h3></th>
                <th ><h3>Könyvcím</h3></th>
                <th ><h3>Lejárat dátuma</h3></th>
                <th ><h3>Üzenet küldése</h3></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <%
                    List<Kolcsonzes> k = dfi.getAllRents();
                    for (Kolcsonzes kolcsonzes : k) {
                        Date kolcs = kolcsonzes.getVisszahozasdatuma();
                        Date ma = c.getTime();

                        if (kolcs.before(ma)) {
                %>
                <td><% out.println(kolcsonzes.getOlvasonev()); %></td>
                <td><% out.print(kolcsonzes.getKonyvcim()); %></td>
                <td><%out.print(kolcsonzes.getVisszahozasdatuma());%></td>
                <td>
                    <form action="ujuzenetiras.jsp" method="Post">
                        <input type="submit" value="Üzenetküldés" class="btn btn-primary">
                    </form>
                </td>
            </tr><%
                    }
                }
            %>

        </tbody>
    </table>

</div>
<div id="footer"></div>
