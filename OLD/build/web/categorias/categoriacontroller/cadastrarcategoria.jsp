<%@page import="seguranca.seguranca"%>
<%@page import="produtoDAO.categoria"%>

<%
//Declara��o de vari�veis
    String categoria , msg;
    boolean sucessocadastro;

//Requisi��o de parametros
    categoria = request.getParameter("categoria-nome-new");

  

try{
// Criado os m�todos para chamar as classes de DAO 
        categoria nova_categoria = new categoria();


//Criando e -setando as informa��es para categoria
        nova_categoria.setNome_categoria(categoria);
        nova_categoria.cadastrocategoria(nova_categoria);
//Criando e setando as informa��es para categoria

        msg="Categoria cadastrada com sucesso!";
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