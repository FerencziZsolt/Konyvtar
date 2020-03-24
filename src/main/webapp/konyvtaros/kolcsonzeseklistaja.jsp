
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
    <h2>Kölcsönzések listája</h2>
    <%
        LekerdezesekInterface lekerdez = new LekerdezesekImplements();
        %>


    <table  class="col-sm-10 table table-hover">
        <thead>
            <tr>
                <th ><h3>Olvasó neve</h3></th>
                <th ><h3>Könyv címe</h3></th>
                <th ><h3>Kölcsönzés dátuma</h3></th>
                <th ><h3>Visszahozás esedékessége</h3></th>
                <th ><h3>Visszahozott</h3></th>
                
            </tr>
        </thead>
        <tbody>
            <%
                request.setCharacterEncoding("UTF-8");                
                List<Kolcsonzes> k = lekerdez.getAllRents();
                for (Kolcsonzes kolcsonzes : k) { %>
            <tr class="table-hover">                                                
                <td><% out.println(kolcsonzes.getOlvasonev());%></td>
                <td><% out.println(kolcsonzes.getKonyvcim());%></td>                
                <td><% out.print(kolcsonzes.getKolcsonzesdatuma()); %></td>
                <td><% out.println(kolcsonzes.getVisszahozasdatuma());%></td>
                <td>
                    <form action="visszahozott.jsp" method="Post">
                            <%  int id = kolcsonzes.getKolcsonzesid();
                            String konyvcim = kolcsonzes.getKonyvcim();
                            String olvasonev = kolcsonzes.getOlvasonev();
                        %>

                        <input type="hidden" name="id" value="<%out.print(id);%>" />
                        <input type="hidden" name="konyvcim" value="<%out.print(konyvcim);%>" />
                        <input type="hidden" name="olvasonev" value="<%out.print(olvasonev);%>" />
                        <input type="submit" value="Visszahozott" class="btn btn-primary">
                    </form>
                </td>    
            </tr>
            <%}%>     
        </tbody>
    </table>
</div>
<div id="footer"></div>