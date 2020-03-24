<%-- 
    Document   : felhasznalotModosit
    Created on : 2020.03.01., 15:45:55
    Author     : Zsolt
--%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page import="sun.text.normalizer.ICUBinary.Authenticate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        

        <%

            request.setCharacterEncoding("UTF-8");

            // Authentication aut = new Authentication();
            DataFactoryInterface dfi = new DataFactory();

            int id = Integer.parseInt(request.getParameter("id"));
            String nev = request.getParameter("nev");
            String cim = request.getParameter("cim");
            String beosztas = request.getParameter("beosztas");
            String username = request.getParameter("felhasznalonev");
            String password = request.getParameter("jelszo");

            //String titkosit = aut.encoding(password);
            dfi.felhasznalotModosit(id, nev, cim, beosztas, username, password);

            response.sendRedirect("felhasznalokListaja.jsp");
        %>

    </body>
</html>
