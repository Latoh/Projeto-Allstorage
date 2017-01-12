<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage | Novo Produto</title>
        <%@include file="../patterns/bibliotecas.jsp"%>       
    </head>
    <body>
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        
            <%@include file="../patterns/header.jsp"%>
            
            <%@include file="../patterns/menu.jsp" %>
            
            <main class="mdl-layout__content">
                <div class="mdl-grid">
                    
                    <div class="mdl-cell mdl-cell--12-col custom-box-page__title"><h4 class="title">Produtos</h4></div>
                        <div class="mdl-cell mdl-cell--12-col custom-box-breadcrumbs"><a class="custom-breadcrumbs__link" href="index.jsp">Produtos</a> <b class="custom-breadcrumbs__separator">></b> <a class="custom-breadcrumbs">Novo Produto</a></div>
                        
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
                                          
                                        <!-- Inputs dos dados do produto -->
                                        <div class="mdl-cell--12-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="produto-dados-nome">
                                                <label class="mdl-textfield__label" for="produto-dados-nome"><div>Nome do produto</div></label>
                                            </div>
                                        </div>
                                        
                                        <!-- Select da CATEGORIA -->
                                        <div class="mdl-cell--12-col custom-cliente-text__input">
                                            <div class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label" style="width:100%;">
                                                <select id="produto-dados-categoria" class="mdl-selectfield__select">
                                                    <option value=""></option>
                                                    <option value="cat-1">Categoria 1</option>
                                                    <option value="cat-2">Categoria 2</option>
                                                </select>
                                                <label class="mdl-selectfield__label" for="produto-dados-categoria">Categoria</label>
                                            </div>  
                                        </div>
                                        
                                        <!-- Select do TIPO -->
                                        <div class="mdl-cell--12-col custom-cliente-text__input">
                                            <div class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label" style="width:100%;">
                                                <select id="produto-dados-tipo" class="mdl-selectfield__select">
                                                    <option value=""></option>
                                                    <option value="cat-1">Monitores</option>
                                                    <option value="cat-2">Projetores</option>
                                                </select>
                                                <label class="mdl-selectfield__label" for="produto-dados-tipo">Tipo</label>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Card de CADASTRO do produto -->
                            <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--8-col">
                                <div class="mdl-card__title mdl-card--expand mdl-grid">
                                    
                                    <!-- Title do cadastro dos produto -->
                                    <div class="mdl-cell--12-col">
                                        <h5>Cadastro</h5>
                                    </div>

                                    <!-- Inputs da MARCA do produto -->
                                    <div class="mdl-cell--12-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="produto-cadastro-marca">
                                            <label class="mdl-textfield__label" for="produto-cadastro-marca"><div>Marca</div></label>
                                        </div>
                                    </div>
                                    
                                    <!-- Inputs do PREÇO do produto -->
                                    <div class="mdl-cell--12-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="produto-cadastro-preco">
                                            <label class="mdl-textfield__label" for="produto-cadastro-preco"><div>Preço</div></label>
                                        </div>
                                    </div>

                                    <!-- Inputs da FORNECEDOR do produto -->
                                    <div class="mdl-cell--12-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" id="produto-cadastro-fornecedor">
                                            <label class="mdl-textfield__label" for="produto-cadastro-fornecedor"><div>Fornecedor</div></label>
                                        </div>
                                    </div>    
                                </div>
                            </div>

                            <!-- Card de cadastro das ESPECIFICAÇÕES -->
                            <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--12-col">
                                <div class="mdl-card__title mdl-card--expand mdl-grid">

                                    <!-- Title do cadastro das ESPECIFICAÇÕES do produto -->
                                    <div class="mdl-cell--12-col">
                                        <h5>Especificações</h5>
                                    </div>

                                    
                                    <!-- Laço de repetição para criar campos de atributo do produto de acordo com o tipo -->
                                    <%for(int i = 1; i<=10; i++){%>
                                        <div class="mdl-cell--6-col mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="margin-left: 1em;">
                                            <input class="mdl-textfield__input" type="text" id="produto-spec-1" value="">
                                            <label class="mdl-textfield__label" for="produto-spec-1"><div>Atributo 1</div></label>
                                        </div>
                                    <%}%>
                                    
                                </div>
                                    
                                <!-- Botões para SALVAR ou CANCELAR o cadastro -->
                                <div class="mdl-card__actions mdl-card--border">
                                    <div class="mdl-layout-spacer"></div>
                                    <button id="botao-cancelar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" type="button">Cancelar</button>
                                    <button id="botao-salvar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" type="button">Salvar</button>
                                </div>
                            </div>              
                        </div>
                        
                                    
                    <!-- Snackbar quando clicado em SALVAR -->
                    <div id="toast-cadastro-produto" class="mdl-js-snackbar mdl-snackbar">
                            <div class="mdl-snackbar__text"></div>
                            <button class="mdl-snackbar__action" type="button"></button>
                    </div>
                </div>
            </main> 
        </div>
		
        <script>
            // Função para mostrar a snackbar quando clicar no botão SALVAR
            (function(){
                'use strict';
                var snackbarContainer = document.querySelector('#toast-cadastro-produto');
                var showToastButton = document.querySelector('#botao-salvar');

                showToastButton.addEventListener('click', function(){
                        'use strict';
                        var data = {message: 'Produto cadastrado com sucesso.'};
                        snackbarContainer.MaterialSnackbar.showSnackbar(data);
                });
            }());
            
            //_________________________________________________________________________________
            
        </script>		
    </body>
</html>
