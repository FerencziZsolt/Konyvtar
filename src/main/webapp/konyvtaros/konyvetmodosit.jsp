<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    String cim = request.getParameter("cim");
    String szerzo = request.getParameter("szerzo");
    String mufaj = request.getParameter("mufaj");

    DataFactoryInterface db = new DataFactory();
    db.konyvetModosit(id, cim, szerzo, mufaj);
    response.sendRedirect("konyvtarosKonyvetModosit.jsp");

%>
