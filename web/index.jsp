<%@page import="seguranca.seguranca"%>
<%
    //seguranca.autoriza(request, response, session.getAttribute("logado"));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage</title>
        <link rel="shortcut icon" href="">
        <%@include file="patterns/bibliotecas.jsp"%>
    </head>
    <body>
        
        <!-- Always shows a header, even in smaller screens. -->
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            
            <%@include file="patterns/header.jsp"%>
            
            <%@include file="patterns/menu.jsp" %>

            <main class="mdl-layout__content">
                <div class="page-content">

                </div>
            </main>
            
            
            <div class="floting-action-button">
                <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" onclick="window.location('../cadastrar')">
                    <i class="material-icons">add</i>
                </button>
            </div>
  
        </div>
    </body>
</html>
            

