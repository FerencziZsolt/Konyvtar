<%@page import="com.mycompany.konyvtar.presentation.Authentication"%>
<%@page import="com.mycompany.konyvtar.service.Olvaso"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page import="com.mycompany.konyvtar.service.Kolcsonzes"%>
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
    <%

        request.setCharacterEncoding("UTF-8");
        

        String olvasonev = (String) session.getAttribute("user");
        String olvasojelszo = (String) session.getAttribute("passw");

        Authentication a = new Authentication();

        DataFactoryInterface di = new DataFactory();
        List<Kolcsonzes> lista = di.getAllRents();

        Olvaso o = di.olvasotVisszaad(olvasonev, a.encoding(olvasojelszo));

        String olvasoneve = o.getNev();

    %>
    <table class="col-sm-10 table table-hover">
        <thead>
            <tr>
                <td><h3>Könyv címe</h3></td>
                <td><h3>Kölcsönzés dátuma</h3></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <%            for (Kolcsonzes k : lista) {
                        if (k.getOlvasonev().equals(olvasoneve)) {%>
                <td><% out.print(k.getKonyvcim()); %></td>
                <td><% out.print(k.getKolcsonzesdatuma());%></td>            
            </tr>
                <%}
                    }
                %> 
        </tbody>
    </table>

</div>


<div id="footer"></div>
