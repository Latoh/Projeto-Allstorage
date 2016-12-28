<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage | Novo Pedido</title>
        <%@include file="../pattherns/bibliotecas.jsp"%>       
    </head>
    <body>
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

            <%@include file="../pattherns/header.jsp"%>

            <%@include file="../pattherns/menu.jsp" %>

            <main class="mdl-layout__content">
                <div class="mdl-grid">

                    <div class="mdl-cell mdl-cell--12-col custom-box-page__title"><h4 class="title">Pedidos</h4></div>
                    <div class="mdl-cell mdl-cell--12-col custom-box-breadcrumbs"><a class="custom-breadcrumbs__link" href="index.jsp">Pedidos</a> <b class="custom-breadcrumbs__separator">></b> <a class="custom-breadcrumbs">Novo Pedido</a></div>

                    <div class="mdl-grid">					            
                        <!-- Card de Dados -->
                        <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--4-col">
                            <div class="mdl-card__title mdl-card--expand">

                                <!-- Cadastro dos DADOS do produto -->
                                <div class="mdl-grid">
                                    <!-- Title do cadastro dos Dados do produto -->
                                    <div class="mdl-cell--12-col">
                                        <h5>Dados</h5>
                                    </div>

                                    <!-- Inputs Numero pedido autoincrementavel -->
                                    <div class="mdl-cell--12-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="NumeroPedido" name="produtoDadosNome">
                                            <label class="mdl-textfield__label" for="NumeroPedido"><div>Numero do pedido</div></label>
                                        </div>
                                    </div>

                                    <!-- Select de Clientes -->
                                    <div class="mdl-cell--12-col custom-cliente-text__input">
                                        <div class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label" style="width:100%;">
                                            <select id="pedidoCliente" name="pedidoCliente" class="mdl-selectfield__select">
                                                <option value=""></option>
                                                <option value="cat-1">Cliente</option>
                                            </select>
                                            <label class="mdl-selectfield__label" for="pedidoCliente">Cliente</label>
                                        </div>  
                                    </div>

                                    <!--Contato cliente -->
                                    <div class="mdl-cell--12-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="pedidoContato" name="pedidoContato">
                                            <label class="mdl-textfield__label" for="pedidoContato"><div>Contato cliente</div></label>
                                        </div>
                                    </div>  
                                </div>
                            </div>
                        </div>

                        <!-- Card de datas do produto -->
                        <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--3-col">
                            <div class="mdl-card__title mdl-card--expand mdl-grid">

                                <!-- Title do cadastro dos produto -->
                                <div class="mdl-cell--12-col">
                                    <h5>Datas</h5>
                                </div>

                                <!-- Select data do pedido -->
                                <div class="mdl-cell--12-col custom-cliente-text__input">
                                    <div class="mdl-selectfield mdl-selectfield--floating-label" style="width:100%;">
                                        <label class="mdl-selectfield__label" for="pedidoDataSaida">Data saída pedido</label>    
                                    </div>    
                                    <div >
                                        <input type="date" name="bday">
                                    </div>
                                </div>

                                <!-- Select data devolução do pedido -->
                                <div class="mdl-cell--12-col custom-cliente-text__input">
                                    <div class="mdl-selectfield mdl-selectfield--floating-label" style="width:100%;">
                                        <label class="mdl-selectfield__label" for="pedidoDataDevolucao">Data devolução do pedido</label>    
                                    </div>    
                                    <div >
                                        <input type="date" name="bday">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card de Endereços do produto -->
                        <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--5-col">
                            <div class="mdl-card__title mdl-card--expand mdl-grid">

                                <!-- Title do cadastro dos produto -->
                                <div class="mdl-grid">
                                    <!-- Title do cadastro do Endereço do cliente -->
                                    <div class="mdl-cell--12-col">
                                        <h5>Endereço</h5>
                                    </div>					

                                    <!-- Inputs dos dados do cliente -->
                                    <div class="mdl-cell--4-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" maxlength="9" pattern="(^\d{5}-\d{3}$)" name="clienteEnderecoCep" id="clienteEnderecoCep" onkeypress="MascaraCep(clienteEnderecoCep);">
                                            <label class="mdl-textfield__label" for="clienteEnderecoCep">CEP</label>
                                        </div>
                                    </div>

                                    <div class="mdl-cell--8-col">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" maxlength="60" id="clienteEnderecoLogradouro" name="clienteEnderecoLogradouro">
                                            <label class="mdl-textfield__label" for="clienteEnderecoLogradouro">Logradouro</label>
                                        </div>
                                    </div>

                                    <div class="mdl-cell--4-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" pattern="[\d*]{1,6}" maxlength="6" id="clienteEnderecoNumero" name="clienteEnderecoNumero">
                                            <label class="mdl-textfield__label" for="clienteEnderecoNumero">Nº</label>
                                        </div>
                                    </div>

                                    <div class="mdl-cell--8-col">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" maxlength="45" id="clienteEnderecoComplemento">
                                            <label class="mdl-textfield__label" for="clienteEnderecoComplemento">Complemento</label>
                                        </div>
                                    </div>

                                    <div class="mdl-cell--6-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" maxlength="60" id="clienteEnderecoBairro" name="clienteEnderecoBairro">
                                            <label class="mdl-textfield__label" for="clienteEnderecoBairro">Bairro</label>
                                        </div>
                                    </div>

                                    <div class="mdl-cell--6-col">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="clienteEnderecoCidade" name="clienteEnderecoCidade">
                                            <label class="mdl-textfield__label" for="clienteEnderecoCidade">Cidade</label>
                                        </div>    
                                    </div>    

                                    <div class="mdl-cell--6-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="clienteEnderecoEstado" name="clienteEnderecoEstado">
                                            <label class="mdl-textfield__label" for="clienteEnderecoEstado">Estado</label>
                                        </div>
                                    </div>

                                    <div class="mdl-cell--6-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="clienteEnderecoPais" name="clienteEnderecoPais">
                                            <label class="mdl-textfield__label" for="clienteEnderecoPais">País</label>
                                        </div>
                                    </div>                                        
                                </div>
                            </div>
                        </div>

                        <!-- Card de Escolha de produtos -->
                        <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--6-col">
                            <div class="mdl-card__title mdl-card--expand mdl-grid">

                                <!-- Title do cadastro dos ATRIBUTOS para o tipo -->
                                <div class="mdl-cell--12-col">
                                    <h5>Adicionar Produtos</h5>
                                </div>

                                <div class="mdl-cell--8-col custom-cliente-text__input">
                                    <div class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label" style="width:100%;">
                                        <select id="pedidoProduto" name="pedidoProduto" class="mdl-selectfield__select">
                                            <option value=""></option>
                                            <option value="cat-1">Produto</option>
                                        </select>
                                        <label class="mdl-selectfield__label" for="pedidoProduto">Produto</label>
                                    </div>  
                                </div>

                                <!-- Botão para adicionar Produto ao pedido -->
                                <div class="mdl-cell-4-col">
                                    <div style="padding-top: 15px;">
                                        <div style="position: relative; float: right;">
                                            <button class=" mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" 
                                                    onclick="" type="button">
                                                Adicionar
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!-- Espaçamento pro layout -->
                                <div class="mdl-cell--4-col"></div>

                                <div id="atributoPorTipo" class="mdl-cell--12-col">
                                    <div class="custom-card-spec__new mdl-card mdl-shadow--3dp mdl-cell--12-col" style="min-height: 30px;">

                                        <div class="mdl-card__title mdl-card--expand mdl-grid">
                                            <!-- Input para mostrar produto adicionado -->

                                            <div class="mdl-cell--16-col mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="atributo" value="Teste">
                                                <label class="mdl-textfield__label" for="Produto"><div>Nome Produto</div></label>
                                            </div>
                                        </div>
                                    </div>     
                                </div>
                            </div>
                        </div>
                        <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--6-col">
                            <div class="mdl-card__title mdl-card--expand mdl-grid">

                                <div class="mdl-cell--12-col">
                                    <h5>Valor</h5>
                                </div>

                                <div class="mdl-cell--6-col custom-cliente-text__input">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="text" id="pedidoValor" name="pedidoValor">
                                        <label class="mdl-textfield__label" for="pedidoValor">Valor</label>
                                    </div>
                                </div>     

                                <div class="mdl-cell--4-col"></div>
                                <!-- Botões para SALVAR ou CANCELAR o cadastro -->
                                <div>
                                    <button id="botaoCancelar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" type="button" onclick="window.location('index.jsp')">Cancelar</button>
                                    <button id="botaoSalvar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" type="button"
                                            onclick="cadastraProduto()">Cadastrar</button>
                                </div>
                            </div>
                        </div>
                        <!-- Snackbar quando clicado em SALVAR -->
                        <div id="toastCadastroProduto" class="mdl-js-snackbar mdl-snackbar">
                            <div class="mdl-snackbar__text"></div>
                            <button class="mdl-snackbar__action" type="button"></button>
                        </div>
                    </div>
            </main> 
        </div>

        <script>
            // function cadastraProduto(url) {

            //   url('http://localhost:8080/allStorage/clientes/clientepjcontroller/cadastroclientepj/cadastrarproduto.jsp?');

            //  }
            //_________________________________________________________________________________

        </script>		
    </body>
</html>
