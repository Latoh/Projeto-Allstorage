<%@page import="java.util.ArrayList"%>
<%@page import="produtoDAO.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage | Produtos</title>
        <%@include file="../pattherns/bibliotecas.jsp"%>       
    </head>
    <body onload="writeCookie('sessionBox','false',3)">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        
            <%@include file="../pattherns/header.jsp"%>
            
            <%@include file="../pattherns/menu.jsp" %>
            
            <main class="mdl-layout__content">
                
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--12-col"><h4 class="title">Produtos</h4></div>
                </div>
                
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--6-col">
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" id="addCliente" onclick="window.location('formularioCadastro.jsp')">
                            Novo produto
                        </button>
                    </div>
                    
                    <div class="mdl-tooltip mdl-tooltip--large" for="addCliente">Novo produto</div>
                    <div class="mdl-cell mdl-cell--6-col">
                        <button class="custom-button--small_icon mdl-button mdl-js-button mdl-js-ripple-effect" id="visibility" onclick="visualizacao('boxVisualizacao')">
                            <i class="material-icons">visibility</i>
                        </button>
                        <div class="mdl-tooltip mdl-tooltip--large" for="visibility">Visualização</div>
                        <button class="custom-button--small_icon mdl-button mdl-js-button mdl-js-ripple-effect" id="filter">
                            <i class="material-icons">filter_list</i>
                        </button>
                        <div class="mdl-tooltip mdl-tooltip--large" for="filter">Filtro</div>
                        <button class="custom-button--small_icon mdl-button mdl-js-button mdl-js-ripple-effect" id="export">
                            <i class="material-icons">cloud_download</i>
                        </button>
                        <div class="mdl-tooltip mdl-tooltip--large" for="export">Exportar</div>
                    </div>
                    
                    <span id="boxVisualizacao">
                    </span>
                    
                    <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp mdl-cell--12-col">
                        <thead class="custom-table--head">
                            <tr>
                                <th class="mdl-data-table__cell--non-numeric">Código</th>
                                <th class="mdl-data-table__cell--non-numeric">Nome</th>
                                <th class="mdl-data-table__cell--non-numeric">Categoria</th>
                                <th class="mdl-data-table__cell--non-numeric">Tipo</th>
                                <th class="mdl-data-table__cell--non-numeric">Marca</th>
                                <th class="mdl-data-table__cell--non-numeric">Preço</th>
                                <th class="mdl-data-table__cell--non-numeric">Quantidade</th>

                            </tr>
                        </thead>
                        
                        <tbody>
                                        <%
                                          System.out.println("COMECOU");
                                            produto.loadingProduto();
                                            ArrayList<produto> listaProduto = produto.getListaProduto();
                                            
                                            //categoria.getListaCategoria().clear();
                                            //tipo.getListaTipo().clear();
                                           // if (listaProduto.isEmpty() == false) {
                                                
                                                for (int i = 0; i < 1; i++) {
                                                    System.out.println("DENTRO DO FOR");%>
                                        <tr>
                                            <% System.out.println("TESTE "+listaProduto.get(0).getNome_produto());%>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaProduto.get(i).getId_produto()%></td>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaProduto.get(i).getNome_produto()%></td>                                            
                                            <td class="mdl-data-table__cell--non-numeric"><%=categoria.getListaCategoria().get(i).getNome_categoria()%></td>
                                            <td class="mdl-data-table__cell--non-numeric"><%=tipo.getListaTipo().get(i).getNome_tipo()%></td>
                                            <%//
                                                //endereco.loadingEnderecoUnicoClientePF(listaClienteFisico.get(i).getId_endereco());
                                                //ArrayList<endereco> listaEndereco = endereco.getListaEndereco();
                                            %>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaProduto.get(i).getMarca()%></td>
                                            <%
                                             //   contato.loadingContatoPF(listaClienteFisico.get(i).getId_clientepf());
                                              //  ArrayList<contato> listaContato = contato.getListaContato();
                                            %>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaProduto.get(i).getPreco()%></td>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaProduto.get(i).getQuantidade()%>


                                            </td>
          
                                        </tr>
                                        <%}
                                           %>
                                    </tbody>
                       
                    </table>
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

