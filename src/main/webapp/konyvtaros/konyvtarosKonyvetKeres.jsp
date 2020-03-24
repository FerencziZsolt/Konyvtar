<%@page import="com.mycompany.konyvtar.service.Konyv"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekImplements"%>
<%@page import="com.mycompany.konyvtar.persistence.LekerdezesekInterface"%>
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
    <form method="POST" action="konyvtarosKonyvetKeres.jsp" >
        <fieldset>
            <legend>Keresés</legend>
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
    <%--  keresés eredményének kiírása: --%>

    <table  class="col-sm-10 table table-hover">
        <thead>
            <tr>
                <th >Cím</th>
                <th >Szerző</th>
                <th >Műfaj</th>
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

                    for (Konyv k : lista) {
            %>
            <tr class="table-gray">                                                
                <td><% out.println(k.getCim());%></td>
                <td><%out.println(k.getSzerzo());%></td>
                <td><%out.println(k.getMufaj());%></td>
                <% }
                   }%>
            </tr>

        </tbody>
    </table> 
</div>







<div id="footer"></div>