<%@page import="seguranca.seguranca"%>
<%@page import="produtoDAO.produto"%>
<%@page import="produtoDAO.categoria"%>
<%@page import="produtoDAO.tipo"%>

<%
//Declaração de variáveis
    String nome_produto, marca, msg;
    Double preco;



//Requisição de parametros
    nome_produto = request.getParameter("produtoDadosNome");
    marca = request.getParameter("produtoCadastroMarca");
    preco = Double.parseDouble(request.getParameter("produtoCadastroPreco"));

    try {
// Criado os métodos para chamar as classes de DAO 
        produto novo_produto = new produto();

//Criando e setando as informações para novo produto

        novo_produto.setNome_produto(nome_produto);
        novo_produto.setMarca(marca);
        novo_produto.setPreco(preco);
        novo_produto.setId_fornecedor(1);
        
        System.out.println(novo_produto.getId_fornecedor()+" teste id");

        novo_produto.cadastroproduto(novo_produto);
        
        msg = "Produto cadastrado com sucesso!";

    } catch (Exception error) {
        
        msg = "Erro ao cadastrar produto!";

       
     
    }
%>
<%
    //seguranca.autoriza(request, response, session.getAttribute("logado"));
%>
<%=msg%>
