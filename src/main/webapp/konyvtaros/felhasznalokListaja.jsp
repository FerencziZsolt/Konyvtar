<%@page import="com.mycompany.konyvtar.service.Olvaso"%>
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
    <h2>Olvasók listája</h2>
    <%
        LekerdezesekInterface lekerdez = new LekerdezesekImplements();

    %>


    <table  class="col-sm-10 table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th >Név</th>
                <th >Születési idő</th>
                <th >Cím</th>
                <th >Beosztás</th>
                <th>Felhasználónév</th>
                <th>Jelszó</th>
                <th>Módosítás</th>
                <th>Törlés</th>
            </tr>
        </thead>
        <tbody>
            <%                request.setCharacterEncoding("UTF-8");

                List<Olvaso> lista = lekerdez.olvasokatListaz();
                for (Olvaso olvaso : lista) { %>
            <tr class="table-secondary">                                                
                <td><%out.println(olvaso.getId());%></td>
                <td><%out.println(olvaso.getNev());%></td>
                <td><%out.println(olvaso.getSzulido());%></td>
                <td><%out.println(olvaso.getCim());%></td>
                <td><%out.println(olvaso.getBeosztas());%></td>
                <td><%out.println(olvaso.getFelhasznalonev());%></td>
                <td><%out.println(olvaso.getJelszo());%></td>
                <td>
                    <form action="felhasznalokModositasa.jsp" method="post">
                        <%  int id = olvaso.getId();
                            String nev = olvaso.getNev();
                            String cim = olvaso.getCim();
                            String beosztas = olvaso.getBeosztas();
                            String felhasznalonev = olvaso.getFelhasznalonev();
                            String jelszo = olvaso.getJelszo();
                        %>

                        <input type="hidden" name="id" value="<%out.print(id);%>" />
                        <input type="hidden" name="nev" value="<%out.print(nev);%>" />
                        <input type="hidden" name="cim" value="<%out.print(cim);%>" />
                        <input type="hidden" name="beosztas" value="<%out.print(beosztas);%>" />
                        <input type="hidden" name="felhasznalonev" value="<%out.print(felhasznalonev);%>" />
                        <input type="hidden" name="jelszo" value="<%out.print(jelszo);%>" />

                        <input type="submit" value="Módosítás" class="btn btn-primary "/>                        
                    </form>
                </td>
                <td>
                    <form method="POST" action="felhasznalotTorol.jsp">
                        <input type="hidden" name="id" value="<%out.print(id);%>" />
                        <input type="submit" value="Törlés" class="btn btn-danger "/>
                    </form>
                </td>    



            </tr>
            <%}%>     
        </tbody>
    </table>
</div>
<div id="footer"></div>

