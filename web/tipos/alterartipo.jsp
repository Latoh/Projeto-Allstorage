<%@page import="seguranca.seguranca"%>
<%@page import="produtoDAO.tipo"%>

<%
//Declaração de variáveis
    String descricao_tipo, msg;
    int id_tipo;
    boolean sucessocadastro;

//Requisição de parametros
    id_tipo = Integer.parseInt(request.getParameter("id_tipo"));
    descricao_tipo = request.getParameter("descricao_tipo");

try{
// Criado os métodos para chamar as classes de DAO 
        tipo alterar_tipo = new tipo();


//Criando e -setando as informações para categoria
        alterar_tipo.setId_tipo(id_tipo);
        alterar_tipo.setNome_tipo(descricao_tipo);
        alterar_tipo.alterartipo(alterar_tipo);
//Criando e setando as informações para categoria

        msg="Categoria alterada com sucesso!";
        sucessocadastro = true;


       } catch (Exception error) {
            String errorMsg = error.getMessage();
            //location = "../../error.jsp";
            //destino = "index.jsp";
            msg = "Erro ao cadastrar contato! <br> " + errorMsg;

           // session.setAttribute("msg", msg);
           // session.setAttribute("destino", destino);
            sucessocadastro = false;

            //RequestDispatcher view = request.getRequestDispatcher(location);
            //view.forward(request, response);
        } 
%>
<%
    //seguranca.autoriza(request, response, session.getAttribute("logado"));
%>
<%=msg%>