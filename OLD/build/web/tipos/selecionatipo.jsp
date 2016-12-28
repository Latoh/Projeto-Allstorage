<%@page import="java.util.ArrayList"%>
<%@page import="seguranca.seguranca"%>
<%@page import="produtoDAO.tipo"%>

<%
//Declaração de variáveis
    String msg = "", opcoes = "";
    int categoria_id;

    boolean sucessocadastro;

//Requisição de parametros
    categoria_id = Integer.parseInt(request.getParameter("id_categoria"));

    try {
// Criado os métodos para chamar as classes de DAO 
        tipo tipo_listagem = new tipo();

//Chamando a função para selecionar o tipo
        tipo_listagem.selecionatipo(categoria_id);

//Criando ArrayList (tem que ser depois da chamada do método por causa do clearList)
        ArrayList<tipo> listaTipo = tipo.getListaTipo();

//Retornando os valores
        opcoes = "<option value=\"0\">Selecione um tipo...</option>";
        
        for (int i = 0; i < listaTipo.size(); i++) {

            opcoes += "<option value=" + listaTipo.get(i).getId_tipo() + ">" + listaTipo.get(i).getNome_tipo() + "</option>";

        }

        msg += opcoes;

//Erro
    } catch (Exception error) {
        String errorMsg = error.getMessage();

        msg = "Erro ao selecionar tipo! <br> " + errorMsg;
        sucessocadastro = false;

    }
%>
<%=msg%>

