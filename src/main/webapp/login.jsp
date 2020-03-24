
<%@page import="com.mycompany.konyvtar.presentation.Authentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>

        <div>
            <%
                
                Authentication authentication = new Authentication();

                request.setCharacterEncoding("UTF-8");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                try {
                    if (username.equals("") || password.equals("") || authentication.validUser(username, password) == null) {
                        response.sendRedirect("index.html");
                    } else if (authentication.validUser(username, password) == "könyvtáros") {
                        response.sendRedirect("konyvtaros/konyvtaros.jsp");
                    } else {
                        response.sendRedirect("olvaso/olvaso.jsp");  
                    }
                } catch (Exception e) {
                    response.sendRedirect("index.html");
                }
            %>
        </div>

    </body>

