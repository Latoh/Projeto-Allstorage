<%@page import="seguranca.seguranca"%>
<%@page import="produtoDAO.atributo"%>

<%
//Declaração de variáveis
    System.out.println("Entrando no JSP atributo");
    String atributo , msg;
    int tipo_id;
    boolean sucessocadastro;

//Requisição de parametros
    atributo = request.getParameter("specsNomeNew");
    tipo_id = Integer.parseInt(request.getParameter("id_tipo"));

  

try{
// Criado os métodos para chamar as classes de DAO 
        atributo novo_atributo = new atributo();


//Criando e -setando as informações para categoria
        novo_atributo.setNome_atributo(atributo);
        novo_atributo.setId_tipo(tipo_id);
        novo_atributo.cadastroatributo(novo_atributo);
//Criando e setando as informações para categoria

        msg="Atributo cadastrado com sucesso!";
        sucessocadastro = true;


       } catch (Exception error) {
            String errorMsg = error.getMessage();
            //location = "../../error.jsp";
            //destino = "index.jsp";
            msg = "Erro ao cadastrar atributo! <br> " + errorMsg;

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

