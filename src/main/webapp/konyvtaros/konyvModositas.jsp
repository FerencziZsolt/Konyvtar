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
    <h2>Könyvek módosítása</h2>
   
    

    <%
        request.setCharacterEncoding("UTF-8");
        

    %>

    <form method="POST" action="konyvetmodosit.jsp">
        <input type="hidden" name="id" value="<%out.print(request.getParameter("id"));%>" />
        <div class="form-group">
            <label  class="col-sm-2 col-form-label">Cím</label>
            <div class="col-sm-10">
                <input class="form-control mr-sm-2" type="text" name="cim" value="<%out.print(request.getParameter("cim")); %>">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 col-form-label">Szerző</label>
            <div class="col-sm-10">
                <input class="form-control mr-sm-2" type="text" name="szerzo" value="<%out.print(request.getParameter("szerzo"));%>">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 col-form-label">Műfaj</label>
            <div class="col-sm-10">
                <input class="form-control mr-sm-2" type="text" name="mufaj" value="<%out.print(request.getParameter("mufaj"));%>">
            </div>
        </div>        
            
            <button type="submit" class="btn btn-primary">Módosítás</button>
            <a href="konyvtarosKonyvetModosit.jsp" class="btn btn-info">Elvetés</a>



    </form>

</div>
<div id="footer"></div>

