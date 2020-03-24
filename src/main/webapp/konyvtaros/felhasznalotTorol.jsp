<%-- 
    Document   : felhasznalotTorol
    Created on : 2020.03.01., 17:22:14
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

        <%
            request.setCharacterEncoding("UTF-8");
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            DataFactoryInterface dfi = new DataFactory();
            dfi.felhasznalotTorol(id);
            
            response.sendRedirect("felhasznalokListaja.jsp");
            
        %>
    </body>
</html>
