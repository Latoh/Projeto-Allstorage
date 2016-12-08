<%@page import="contatoDAO.contato"%>
<%@page import="enderecoDAO.endereco"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clienteDAO.cliente"%>
<%

    cliente.loadingPF();
    cliente.loadingPJ();
    ArrayList<cliente> listaCliente = cliente.getListaCliente();


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage | Clientes</title>
        <!-- Importa��o dos arquivos .js e .css -->
        <%@include file="../pattherns/bibliotecas.jsp"%>       
    </head>
    <body onload="writeCookie('sessionBox', 'false', 3)">

        <!-- IN�CIO do LAYOUT da tela de CLIENTES -->
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

            <!-- Importa��o do arquivo HEADER e MENU -->
            <%@include file="../pattherns/header.jsp"%>

            <%@include file="../pattherns/menu.jsp" %>

            <!-- In�cio do conte�do da tela de Clientes-->
            <main class="mdl-layout__content">

                <!-- Nome da p�gina e o Breadcrumbs (migalhas de p�o) -->
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--12-col"><h4 class="title">Clientes</h4></div>
                </div>

                <div class="mdl-grid">
                    <!-- Bot�o para cria��o de um novo cliente -->
                    <div class="mdl-cell mdl-cell--6-col">
                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" id="addCliente" onclick="window.location('formularioCadastro.jsp')">
                            Novo cliente
                        </button>
                    </div>
                    <div class="mdl-tooltip mdl-tooltip--large" for="addCliente">Novo cliente</div>


                    <!-- In�cio da grid contendo as abas (Todos, Jur�tica e F�sica), os atalhos do canto direito (Download, Filtro e Visualiza��o) -->
                    <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect mdl-cell--12-col">
                        <div class="mdl-grid">
                            <div class="mdl-tabs__tab-bar mdl-cell--12-col">

                                <!-- Abas da grid de clientes (Todos, Jur�dica e F�sica) -->
                                <div class="mdl-cell--6-col">
                                    <a href="#cliente-tab-juridica" class="mdl-tabs__tab is-active">Jur�dica</a>
                                    <a href="#cliente-tab-fisica" class="mdl-tabs__tab">F�sica</a>
                                </div>


                                <!-- Bot�es do canto superior direito (Exporta��o, Filtro e Visuzalia��o) -->
                                <div class="mdl-cell mdl-cell--6-col mdl-layout--large-screen-only"> 
                                    <div class="mdl-tooltip mdl-tooltip--large" for="visibility">Visualiza��o</div>
                                    <button class="custom-button--small_icon mdl-button mdl-js-button mdl-js-ripple-effect" id="filter">
                                        <i class="material-icons">filter_list</i>
                                    </button>
                                    <div class="mdl-tooltip mdl-tooltip--large" for="filter">Filtro</div>
                                    <button class="custom-button--small_icon mdl-button mdl-js-button mdl-js-ripple-effect" id="export">
                                        <i class="material-icons">cloud_download</i>
                                    </button>
                                    <div class="mdl-tooltip mdl-tooltip--large" for="export">Exportar</div>
                                </div>
                            </div>

                            <div id="boxVisualizacao"></div>

                            <!-- In�cio do conte�do da aba TODOS -->

                            <!-- FIM do conte�do da aba TODOS -->

                            <!-- In�cio do conte�do da aba JUR�DICA -->
                            <div class="mdl-tabs__panel mdl-cell--12-col is-active" id="cliente-tab-juridica">
                                <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp mdl-cell--12-col" >
                                    <thead class="custom-table--head">
                                        <tr>
                                            <th class="mdl-data-table__cell--non-numeric">C�digo</th>
                                            <th class="mdl-data-table__cell--non-numeric">Nome Fantasia</th>
                                            <th class="mdl-data-table__cell--non-numeric">Raz�o Social</th>
                                            <th class="mdl-data-table__cell--non-numeric">Endere�o</th>
                                            <th class="mdl-data-table__cell--non-numeric">Telefone</th>
                                            <th class="mdl-data-table__cell--non-numeric">Status</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%  
                                            cliente.loadingPJ();
                                            ArrayList<cliente> listaClienteJuridico = cliente.getListaCliente();
                                            if (listaClienteJuridico.isEmpty() == false) {
                                                for (int i = 0; i < listaClienteJuridico.size(); i++) {
                                        %>
                                        <tr>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaClienteJuridico.get(i).getId_clientepj()%></td>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaClienteJuridico.get(i).getNome_fantasia()%></td>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaClienteJuridico.get(i).getRazao_social()%></td>
                                            <%
                                                endereco.loadingEnderecoUnicoClientePJ(listaClienteJuridico.get(i).getId_endereco());
                                                ArrayList<endereco> listaEndereco = endereco.getListaEndereco();
                                            %>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaEndereco.get(i).getNome_rua()%></td>
                                            <%
                                                contato.loadingContatoPJ(listaClienteJuridico.get(i).getId_clientepj());
                                                ArrayList<contato> listaContato = contato.getListaContato();
                                            %>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaContato.get(i).getNumero_formatado()%></td>
                                            <td class="mdl-data-table__cell--non-numeric">
                                                <label for="checkbox<%=i%>" class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
                                                    <% if (listaClienteJuridico.get(i).getStatus() == 1) {%>
                                                    <input  type = "checkbox" id ="checkbox<%=i%>" class="mdl-switch__input" checked> 
                                                    <% } else {%>
                                                    <input  type = "checkbox" id ="checkbox<%=i%>" class="mdl-switch__input">
                                                    <% } %>
                                                </label>
                                            </td>
                                            <td class="mdl-data-table__cell--non-numeric">
                                                <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
                                                    <i class="material-icons">description</i>
                                                </button>
                                            </td>
                                        </tr>
                                        <%}
                                            } %>
                                    </tbody>
                                </table>
                            </div>
                            <!-- FIM do conte�do da aba JUR�DICA -->

                            <!-- In�cio do conte�do da aba F�SICA -->
                            <div class="mdl-tabs__panel mdl-cell--12-col" id="cliente-tab-fisica">
                                <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp mdl-cell--12-col" >
                                    <thead class="custom-table--head">
                                        <tr>
                                            <th class="mdl-data-table__cell--non-numeric">C�digo</th>
                                            <th class="mdl-data-table__cell--non-numeric">Nome</th>
                                            <th class="mdl-data-table__cell--non-numeric">Sobrenome</th>
                                            <th class="mdl-data-table__cell--non-numeric">Endere�o</th>
                                            <th class="mdl-data-table__cell--non-numeric">Telefone</th>
                                            <th class="mdl-data-table__cell--non-numeric">Status</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            cliente.loadingPF();
                                            ArrayList<cliente> listaClienteFisico = cliente.getListaCliente();
                                            endereco.getListaEndereco().clear();
                                            contato.getListaContato().clear();
                                            if (listaClienteJuridico.isEmpty() == false) {
                                                for (int i = 0; i < listaCliente.size(); i++) {%>
                                        <tr>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaClienteFisico.get(i).getId_clientepf()%></td>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaClienteFisico.get(i).getNome()%></td>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaClienteFisico.get(i).getSobrenome()%></td>
                                            <%
                                                endereco.loadingEnderecoUnicoClientePF(listaClienteFisico.get(i).getId_endereco());
                                                ArrayList<endereco> listaEndereco = endereco.getListaEndereco();
                                            %>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaEndereco.get(i).getNome_rua()%></td>
                                            <%
                                                contato.loadingContatoPF(listaClienteFisico.get(i).getId_clientepf());
                                                ArrayList<contato> listaContato = contato.getListaContato();
                                            %>
                                            <td class="mdl-data-table__cell--non-numeric"><%=listaContato.get(i).getNumero_formatado()%></td>
                                            <td class="mdl-data-table__cell--non-numeric">
                                                <label for="checkbox<%=i%>" class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
                                                    <% if (listaClienteFisico.get(i).getStatus() == 1) {%>
                                                    <input  type = "checkbox" id ="checkbox<%=i%>" class="mdl-switch__input" checked> 
                                                    <% } else {%>
                                                    <input  type = "checkbox" id ="checkbox<%=i%>" class="mdl-switch__input">
                                                    <% } %>
                                                </label>
                                            </td>
                                            <td class="mdl-data-table__cell--non-numeric">
                                                <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
                                                    <i class="material-icons">description</i>
                                                </button>
                                            </td>
                                        </tr>
                                        <%}
                                            }%>
                                    </tbody>
                                </table>
                            </div>
                            <!-- FIM do conte�do da aba F�SICA -->
                        </div>
                    </div>
                    <!-- FIM da grid de Abas, bot�es e tabela -->

                </div>
        </div>
        <!-- FIM da grid de Abas, bot�es e tabela -->
    </div>
</main>
<!-- FIM do conte�do da tela de Clientes-->


<!-- FLOTING ACTION BUTTON -->
<div class="floting-action-button">
    <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" onclick="window.location('../cadastrar')">
        <i class="material-icons">add</i>
    </button>
</div>

</div>
<!-- FIM do LAYOUT da tela de CLIENTES -->
</body>      
</html>

