<%@page import="produtoDAO.atributo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="seguranca.seguranca"%>


<%
//Declaração de variáveis
    String msg = "";
    int id_tipo;

    boolean sucessocadastro;
//Requisição de parametros

   
    id_tipo = Integer.parseInt(request.getParameter("id_tipo"));

    try {
// Criado os métodos para chamar as classes de DAO 
        atributo atributo_new = new atributo();

//Chamando a função para selecionar o tipo
        atributo_new.listaAtributo(id_tipo);

//Criando ArrayList (tem que ser depois da chamada do método por causa do clearList)
        ArrayList<atributo> listaAtributo = atributo.getListaAtributo();

//Retornando os valores
        for (int i = 0; i < listaAtributo.size(); i++) {
                msg += "<div class=\"custom-card-spec__new mdl-card mdl-shadow--3dp mdl-cell--12-col\" style=\"min-height: 30px;\">"
                        + "<div class=\"mdl-card__title mdl-card--expand mdl-grid\">"
                        + "<div class=\"mdl-cell--10-col mdl-textfield mdl-js-textfield\">"
                        + "<input class=\"mdl-textfield__input\" type=\"text\" id=" + listaAtributo.get(i).getId_atributo() + " value=" + listaAtributo.get(i).getNome_atributo() + ">"
                        + "<label class=\"mdl-textfield__label\" for=" + listaAtributo.get(i).getId_atributo() + "><div></div></label>"
                        + " </div>"
                        + "<div class=\"mdl-cell--2-col custom-card-spec__close\">"
                        + " <button class=\"mdl-button mdl-js-button mdl-button--icon mdl-button--primary\">"
                        + " <i class=\"material-icons\">close</i>"
                        + "</button>"
                        + "</div>"
                        + "</div>"
                        + "</div>";
        }

//Erro
    } catch (Exception error) {
        String errorMsg = error.getMessage();

        msg = "Erro ao cadastrar contato! <br> " + errorMsg;
        sucessocadastro = false;

    }
%>
<%=msg%>

