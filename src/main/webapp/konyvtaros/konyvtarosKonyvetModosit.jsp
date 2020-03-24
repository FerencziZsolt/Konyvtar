

<%@page import="com.mycompany.konyvtar.service.Konyv"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekImplements"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekInterface"%>
<%@page import="java.util.Vector"%>
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



    <form method="POST" action="konyvtarosKonyvetModosit.jsp">
        <fieldset>
            <legend>Módosítás,Törlés</legend>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Cím</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Cím" name="cim">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Szerző</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Szerző" name="szerzo">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-form-label">Műfaj</label>
                <div class="col-sm-10">
                    <input class="form-control mr-sm-2" type="text" placeholder="Műfaj" name="mufaj">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Keresés</button>
        </fieldset>
    </form>      

    <br /><br />





    <table  class="col-sm-10 table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Cím</th>
                <th>Szerző</th>
                <th>Műfaj</th>
                <th>Módosítás</th>
                <th>Törlés</th>
            </tr>
        </thead>
        <tbody>
            <%
                request.setCharacterEncoding("UTF-8");
                LekerdezesekInterface l = new LekerdezesekImplements();

                String cim = "";
                String szerzo = "";
                String mufaj = "";

                if (request.getParameter("cim") != null || request.getParameter("szerzo") != null || request.getParameter("mufaj") != null) {
                    cim = request.getParameter("cim");
                    szerzo = request.getParameter("szerzo");
                    mufaj = request.getParameter("mufaj");
                    List<Konyv> lista = l.keresettkonyv(cim, szerzo, mufaj);
                    if (lista == null) {
                        out.print("Nincs ilyen könyv!");
                    }

                    for (Konyv k : lista) {
            %>
            <tr class="table-default">    
                <td><% out.println(k.getId());%></td>
                <td><% out.println(k.getCim());%></td>
                <td><% out.println(k.getSzerzo());%></td>
                <td><% out.println(k.getMufaj());%></td>

                <td>
                    <form action="konyvModositas.jsp" method="POST">
                        <input type="hidden" name="id" value="<%out.print(k.getId());%>" />
                        <input type="hidden" name="cim" value="<%out.print(k.getCim());%>" />
                        <input type="hidden" name="szerzo" value="<%out.print(k.getSzerzo());%>" />
                        <input type="hidden" name="mufaj" value="<%out.print(k.getMufaj());%>" />
                        <button type="submit" class="btn btn-primary">Módosítás</button>
                    </form>
                </td>

                <td>
                    <form action="delete.jsp" method="post">
                        <% int i = k.getId();%>
                        <input type="hidden" name="id" value="<%out.print(i);%>" />
                        <button type="submit" class="btn btn-danger ">Törlés</button>
                    </form>
                </td>



                <%}
                    }%>
            </tr>
        </tbody>
    </table> 


</div>
<div id="footer"></div>