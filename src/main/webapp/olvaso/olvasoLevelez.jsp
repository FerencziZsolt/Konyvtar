<%@page import="com.mycompany.konyvtar.service.Levelezes"%>
<%@page import="com.mycompany.konyvtar.service.Olvaso"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.konyvtar.service.Kolcsonzes"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactory"%>
<%@page import="com.mycompany.konyvtar.persistence.DataFactoryInterface"%>
<%@page import="com.mycompany.konyvtar.presentation.Authentication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    $(function () {
        $("#olvasoheader").load("../headfooter/olvasoheader.html");
        $("#footer").load("../headfooter/footer.html");
    });
</script>
<div id="olvasoheader"></div>

<div class="container">   
    <h3>Beérkezett üzeneteid</h3>

    
        <%

        request.setCharacterEncoding("UTF-8");
        

        String olvasonev = (String) session.getAttribute("user");
        String olvasojelszo = (String) session.getAttribute("passw");

        Authentication a = new Authentication();
        DataFactoryInterface di = new DataFactory();      
                
        List<Levelezes> lista = di.getAllletter();

        Olvaso o = di.olvasotVisszaad(olvasonev, a.encoding(olvasojelszo));
        String olvasoneve = o.getNev();
        
        int id= di.olvasoid(olvasoneve);
        

            
  


  %>      
     
        
       

    <table class="col-sm-10 table table-hover">
        <thead>
            <tr>
                <td><h3>Üzenet tárgya</h3></td>
                <td><h3>Szöveg</h3></td>
                <td><h3>Létrehozva</h3></td>
                
            </tr>
        </thead>
        <tbody>
            <tr>                
                <% for (Levelezes l : lista) {
                        if(l.getOlvasoid() == id) {%>
                <td><% out.print(l.getTargy()); %></td>
                <td><% out.print(l.getSzoveg());%></td>
                <td><% out.print(l.getLetrehozva());%></td>    
                
        </tr>
                <%}
                    }
                %> 
        </tbody>
    </table>
    
    

</div>


<div id="footer"></div>