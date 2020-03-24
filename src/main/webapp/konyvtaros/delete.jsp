
<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    out.print(id);

    DataFactoryInterface db = new DataFactory();
    db.konyvetTorol(Integer.parseInt(id));
    response.sendRedirect("konyvtarosKonyvetModosit.jsp");

%>