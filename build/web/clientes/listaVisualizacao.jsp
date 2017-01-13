<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage | Novo Cliente</title>
        <%@include file="../patterns/bibliotecas.jsp"%>       
    </head>
    <body>
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        
            <%@include file="../patterns/header.jsp"%>
            
            <%@include file="../patterns/menu.jsp" %>
            
            <main class="mdl-layout__content">
                <div class="mdl-grid">
                    
                    <div class="mdl-cell mdl-cell--12-col custom-box-page__title"><h4 class="title">Clientes</h4></div>
                        <div class="mdl-cell mdl-cell--12-col custom-box-breadcrumbs"><a class="custom-breadcrumbs__link" href="index.jsp">Clientes</a> <b class="custom-breadcrumbs__separator">></b> <a class="custom-breadcrumbs">Novo Cliente</a></div>
                        
                        <div class="mdl-grid">					
					
                            <div class="custom-card-cliente__new mdl-card mdl-shadow--3dp mdl-cell--4-col">
                                <div class="mdl-card__title mdl-card--expand">
                                
                                    <!-- Cadastro dos DADOS do cliente -->
                                    <!-- Opções do cadastro dos Dados do cliente -->
                                    <div class="mdl-grid">
                                        <!-- Title do cadastro dos Dados do cliente -->
                                        <div class="mdl-cell--12-col">
                                            <h5>Dados</h5>
                                        </div>
                                            <!-- Opções do tipo de cliente -->
                                        <div class="mdl-cell--12-col">
                                            <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="cliente-dados-tipo-juridica">
                                                <input type="radio" id="cliente-dados-tipo-juridica" onclick="alteraCamposTipoCliente('cliente-dados-tipo-juridica', 'cliente-tipo-campo-nome', 'cliente-tipo-campo-sobrenome', 'cliente-tipo-campo-cpf');" class="mdl-radio__button" name="tipo" value="1" checked>
                                                <span class="mdl-radio__label">Jurídica</span>
                                            </label>
                                            <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="cliente-dados-tipo-fisica">
                                                <input type="radio" id="cliente-dados-tipo-fisica" onclick="alteraCamposTipoCliente('cliente-dados-tipo-fisica', 'cliente-tipo-campo-nome', 'cliente-tipo-campo-sobrenome', 'cliente-tipo-campo-cpf');" class="mdl-radio__button" name="tipo" value="2">
                                                <span class="mdl-radio__label">Física</span>
                                            </label>
                                        </div>
                                          
                                        <!-- Inputs dos dados do cliente -->
                                        <div class="mdl-cell--12-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="cliente-dados-nome">
                                                <label class="mdl-textfield__label" for="cliente-dados-nome"><div id="cliente-tipo-campo-nome">Nome fantasia</div></label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell--12-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="cliente-dados-razao-social">
                                                <label class="mdl-textfield__label" for="cliente-dados-razao-social"><div id="cliente-tipo-campo-sobrenome">Razão social</div></label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell--12-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="number" id="cliente-dados-cpf-cnpj">
                                                <label class="mdl-textfield__label" for="cliente-dados-cpf-cnpj"><div id="cliente-tipo-campo-cpf">CNPJ</div></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="custom-card-cliente__new mdl-card mdl-shadow--2dp mdl-cell--4-col">
                                <div class="mdl-card__title mdl-card--expand">
                                <!-- Cadastro do Endereço do cliente -->
                                    <!-- Opções do cadastro do Endereço do cliente -->
                                    <div class="mdl-grid">
                                        <!-- Title do cadastro do Endereço do cliente -->
                                        <div class="mdl-cell--12-col">
                                            <h5>Endereço</h5>
                                        </div>					
                                            
                                        <!-- Inputs dos dados do cliente -->
                                        <div class="mdl-cell--4-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="cliente-endereco-cep">
                                                <label class="mdl-textfield__label" for="cliente-endereco-cep">CEP</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mdl-cell--8-col">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="cliente-endereco-logradouro">
                                                <label class="mdl-textfield__label" for="cliente-logradouro">Logradouro</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mdl-cell--4-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="cliente-endereco-numero">
                                                <label class="mdl-textfield__label" for="cliente-endereco-numero">Nº</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mdl-cell--8-col">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="cliente-endereco-complemento">
                                                <label class="mdl-textfield__label" for="cliente-endereco-complemento">Complemento</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mdl-cell--4-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="cliente-endereco-pais">
                                                <label class="mdl-textfield__label" for="cliente-endereco-pais">País</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mdl-cell--4-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="cliente-endereco-estado">
                                                <label class="mdl-textfield__label" for="cliente-endereco-estado">Estado</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mdl-cell--4-col">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="cliente-endereco-cidade">
                                                <label class="mdl-textfield__label" for="cliente-endereco-cidade">Cidade</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>     
                       
                            <div class="custom-card-cliente__new mdl-card mdl-shadow--2dp mdl-cell--4-col">
                                <div class="mdl-card__title mdl-card--expand">					   
                                    <!-- Cadastro do CONTATO do cliente -->
                                    <!-- Opções do cadastro do CONTATO do cliente -->
                                    <div class="mdl-grid">
                                        <!-- Title do cadastro do CONTATO do cliente -->
                                        <div class="mdl-cell--12-col">
                                                <h5>Contato</h5>
                                        </div>
                                        <!-- Inputs dos dados do cliente -->
                                        <div class="mdl-cell--12-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="cliente-contato-responsavel">
                                                <label class="mdl-textfield__label" for="cliente-contato-responsavel">Responsável</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mdl-cell--12-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="cliente-contato-email">
                                                <label class="mdl-textfield__label" for="cliente-contato-email">Email</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mdl-cell--6-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="cliente-contato-telefone">
                                                <label class="mdl-textfield__label" for="cliente-contato-telefone">Telefone</label>
                                            </div>
                                        </div>
                                        
                                        <div class="mdl-cell--6-col custom-cliente-text__input">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="cliente-contato-celular">
                                                <label class="mdl-textfield__label" for="cliente-contato-celular">Celular</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="mdl-card__actions mdl-card--border">
                                    <div class="mdl-layout-spacer"></div>
                                    <button id="botao-cancelar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" type="button">Cancelar</button>
                                    <button id="botao-cadastrar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" type="button">Cadastrar</button>
                                </div>
                            </div>
                        </div>
                        
                    <div id="toast-cadastro-cliente" class="mdl-js-snackbar mdl-snackbar">
                            <div class="mdl-snackbar__text"></div>
                            <button class="mdl-snackbar__action" type="button"></button>
                    </div>
                </div>
            </main> 
        </div>
		
        <script>
            (function(){
                'use strict';
                var snackbarContainer = document.querySelector('#toast-cadastro-cliente');
                var showToastButton = document.querySelector('#botao-cadastrar');

                showToastButton.addEventListener('click', function(){
                        'use strict';
                        var data = {message: 'Cliente cadastrado com sucesso.'};
                        snackbarContainer.MaterialSnackbar.showSnackbar(data);
                });
            }());
            
            //_________________________________________________________________________________
            
            function alteraCamposTipoCliente(objTipo, objNome, objSobrenome, objCPF){
                tipo = document.getElementById(objTipo);
                campoNome = document.getElementById(objNome);
                campoSobrenome = document.getElementById(objSobrenome);
                campoCPF = document.getElementById(objCPF);
                
                if(tipo.value == 1){
                    campoNome.innerHTML = "Nome fantasia";
                    campoSobrenome.innerHTML = "Razão social";
                    campoCPF.innerHTML = "CNPJ";
                } else{
                    campoNome.innerHTML = "Nome";
                    campoSobrenome.innerHTML = "Sobrenome";
                    campoCPF.innerHTML = "CPF";
                }
                
            }
        </script>		
    </body>
</html>
