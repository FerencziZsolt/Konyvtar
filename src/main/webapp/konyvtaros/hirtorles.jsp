<%@page import="com.mycompany.konyvtar.service.Hirek"%>
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
        request.setCharacterEncoding("UTF-8");
        LekerdezesekInterface lekerdez = new LekerdezesekImplements();

    %>


    <table  class="col-sm-10 table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th >Téma</th>
                <th >Szöveg</th>
                <th >Kiírás dátuma</th>

            </tr>
        </thead>
        <tbody>
            <%  List<Hirek> lista = lekerdez.getAllNews();
                for (Hirek hirek : lista) { %>
            <tr class="table-secondary">                                                
                <td><%out.println(hirek.getId());%></td>
                <td><%out.println(hirek.getTema());%></td>
                <td><%out.println(hirek.getSzoveg());%></td>
                <td><%out.println(hirek.getKiirasdatuma());%></td>


                <td>
                    <form method="POST" action="hirttorol.jsp">
                        <input type="hidden" name="id" value="<%out.print(hirek.getId());%>" />
                        <input type="submit" value="Törlés" class="btn btn-danger "/>
                    </form>
                </td>    



            </tr>
            <%}%>     
        </tbody>
    </table>
</div>
<div id="footer"></div>
