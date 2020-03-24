<%-- 
    Document   : kolcsonzestfelvisz
    Created on : 2020.03.07., 14:51:11
    Author     : Zsolt
--%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Kölcsönzés:</h1>
        <%
             request.setCharacterEncoding("UTF-8");
            String olvasonev = request.getParameter("olvasonev");
            String konyvcim = request.getParameter("konyvcim");

            DataFactoryInterface datafactory = new DataFactory();
            datafactory.kolcsonzestFelvisz(olvasonev,konyvcim);
            response.sendRedirect("ujkolcsonzes.jsp");

        %>
    </body>
</html>
