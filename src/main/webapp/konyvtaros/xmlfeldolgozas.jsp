<%@page import="javafx.stage.FileChooser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(function () {
        $("#konyvtarosheader").load("../headfooter/konyvtarosheader.html");
        $("#footer").load("../headfooter/footer.html");
    });
</script>
<div id="konyvtarosheader"></div>


<div class="container">


    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="submit" value="Feltöltés">
    </form>

    <%
        

    %>





</div>
