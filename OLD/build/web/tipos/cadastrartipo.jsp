<%@page import="seguranca.seguranca"%>
<%@page import="produtoDAO.tipo"%>

<%
//Declara��o de vari�veis
    String tipo , msg;
    int categoria_id;
    boolean sucessocadastro;

//Requisi��o de parametros
    tipo = request.getParameter("categoria_nome");
    categoria_id = Integer.parseInt(request.getParameter("id_categoria"));

  

try{
// Criado os m�todos para chamar as classes de DAO 
        tipo novo_tipo = new tipo();


//Criando e -setando as informa��es para categoria
        novo_tipo.setNome_tipo(tipo);
        novo_tipo.setId_categoria(categoria_id);
        novo_tipo.cadastrotipo(novo_tipo);
//Criando e setando as informa��es para categoria

        msg="Tipo cadastrado com sucesso!";
        sucessocadastro = true;


       } catch (Exception error) {
            String errorMsg = error.getMessage();
            //location = "../../error.jsp";
            //destino = "index.jsp";
            msg = "Erro ao cadastrar tipo! <br> " + errorMsg;

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

