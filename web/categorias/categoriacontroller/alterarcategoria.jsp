<%@page import="seguranca.seguranca"%>
<%@page import="produtoDAO.categoria"%>

<%
//Declara��o de vari�veis
    String descricao_categoria, msg;
    int id_categoria;
    boolean sucessocadastro;

//Requisi��o de parametros
    id_categoria = Integer.parseInt(request.getParameter("id_categoria"));
    descricao_categoria = request.getParameter("descricao_categoria");

try{
// Criado os m�todos para chamar as classes de DAO 
        categoria alterar_categoria = new categoria();


//Criando e -setando as informa��es para categoria
        alterar_categoria.setId_categoria(id_categoria);
        alterar_categoria.setNome_categoria(descricao_categoria);
        alterar_categoria.alterarcategoria(alterar_categoria);
//Criando e setando as informa��es para categoria

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