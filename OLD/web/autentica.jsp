<%@page import="usuario.usuario"%>
<%
    String login;
    String senha;

    login = request.getParameter("login");
    senha = request.getParameter("senha");   
    
    session.setAttribute("logado", false);
    
    String msg = "false";
    
    try {
        if (usuario.autentica(login, senha)) {
            session.setAttribute("logado", true);
            msg = "true";
        }
    } catch (Exception error) {
        msg = "false";
    }

%>
<%="|"+msg%>