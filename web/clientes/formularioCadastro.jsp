<%@page import="seguranca.seguranca"%>
<%//seguranca.autoriza(request, response, session.getAttribute("logado"));%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Storage | Novo Cliente</title>
        <%@include file="../patterns/bibliotecas.jsp"%>    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
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
                                    <div class="mdl-cell--12-col">
                                        <h5>Dados</h5>
                                    </div>
                                    <!-- Opções do tipo de cliente -->

                                    <div class="mdl-cell--12-col">
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="clienteDadosTipoJuridica">
                                            <input type="radio" name="clientetipoCNPJ" id="clienteDadosTipoJuridica" name="clienteDadosTipoJuridica" onclick="alteraCamposTipoCliente('clienteDadosTipoJuridica');" class="mdl-radio__button" value="1" checked>
                                            <span class="mdl-radio__label">Jurídica</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="clienteDadosTipoFisica">
                                            <input type="radio" name="clientetipoCNPJ" id="clienteDadosTipoFisica" name="clienteDadosTipoFisica" onclick="alteraCamposTipoCliente('clienteDadosTipoFisica');" class="mdl-radio__button" value="2">
                                            <span class="mdl-radio__label">Física</span>
                                        </label>
                                    </div>
                                    
                                    <div class="clienteDadosContainerCNPJ mdl-cell--12-col" id="clienteDadosContainerCNPJ">
                                        <!-- Title do cadastro dos Dados do cliente -->

                                        <!-- Inputs dos dados do cliente -->
                                        <div class="mdl-cell--12-col custom-cliente-text__input" id="clienteContainerEmpresa">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="clienteDadosEmpresa" name="clienteDadosEmpresa" maxlength="60" onblur="verificaString('clienteDadosEmpresa','clienteDadosEmpresaLabel');">
                                                <label class="mdl-textfield__label" for="clienteDadosEmpresa" id="clienteDadosEmpresaLabel">Nome fantasia</label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell--12-col custom-cliente-text__input" id="clienteContainerRazaoSocial">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="clienteDadosRazaoSocial" name="clienteDadosRazaoSocial" maxlength="60" onblur="verificaString('clienteDadosRazaoSocial','clienteDadosRazaoSocialLabel');">
                                                <label class="mdl-textfield__label" for="clienteDadosRazaoSocial" id="clienteDadosRazaoSocialLabel">Razão social</label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell--12-col custom-cliente-text__input" id="clienteContainerInscricao" name="clienteInscricao">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" maxlength="20" pattern="\d*" id="clienteDadosInscricao" name="clienteDadosInscricao" onblur="verificaString('clienteDadosInscricao','clienteDadosInscricaoLabel');">
                                                <label class="mdl-textfield__label" for="clienteDadosInscricao" id="clienteDadosInscricaoLabel">Inscrição Estadual</label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell--12-col custom-cliente-text__input" id="clienteContainerCNPJ">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" id="clienteCpfCnpj">
                                                <input class="mdl-textfield__input" type="text" id="clienteDadosCNPJ" name="clienteDadosCNPJ" maxlength="20" onkeypress="MascaraCNPJ(clienteDadosCNPJ);" onblur="verificaString('clienteDadosCNPJ','clienteDadosCNPJLabel');">
                                                <label class="mdl-textfield__label" for="clienteDadosCNPJ" id="clienteDadosCNPJLabel">CNPJ</label>
                                            </div>
                                        </div>
                                    </div>
                                
                                
                                    <div class="clienteDadosContainerCPF mdl-cell--12-col" id="clienteDadosContainerCPF">

                                        <div class="mdl-cell--12-col custom-cliente-text__input" id="clienteContainerNome">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="clienteDadosNome" name="clienteDadosNome" maxlength="60" onblur="verificaString('clienteDadosNome','clienteDadosNomeLabel');">
                                                <label class="mdl-textfield__label" for="clienteDadosNome" id="clienteDadosNomeLabel">Nome</label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell--12-col custom-cliente-text__input" id="clienteContainerSobrenome">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="clienteDadosSobrenome" name="clienteDadosSobrenome" maxlength="60" onblur="verificaString('clienteDadosSobrenome','clienteDadosSobrenomeLabel');">
                                                <label class="mdl-textfield__label" for="clienteDadosSobrenome" id="clienteDadosSobrenomeLabel">Sobrenome</label>
                                            </div>
                                        </div>

                                        <div class="mdl-cell--12-col custom-cliente-text__input" id="clienteContainerCPF">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                                <input class="mdl-textfield__input" type="text" id="clienteDadosCPF" name="clienteDadosCPF" maxlength="14" onkeypress="MascaraCPF(clienteDadosCPF);" onblur="verificaString('clienteDadosCPF','clienteDadosCPFLabel');">
                                                <label class="mdl-textfield__label" for="clienteDadosCPF" id="clienteDadosCPFLabel">CPF</label>
                                            </div>
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
                                            <input class="mdl-textfield__input" type="email" maxlength="45" id="clienteContatoEmail" name="clienteContatoEmail">
                                            <label class="mdl-textfield__label" for="clienteContatoEmail">Email</label>
                                        </div>
                                    </div>

                                    <div class="mdl-cell--2-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" pattern="(+[\d*]+)" maxlength="5" name="clienteContatoDDD" id="clienteContatoDDD" onkeypress="MascaraDDD(clienteContatoDDD);" onblur="MascaraDDD(clienteContatoDDD);">
                                            <label class="mdl-textfield__label" for="clienteContatoDDD">DDD</label>
                                        </div>
                                    </div>     

                                    <div class="mdl-cell--10-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" pattern="(^\d{4}-\d{4}$)"  maxlength="9" name="clienteContatoTelefone" id="clienteContatoTelefone" onkeypress="MascaraTelefone(clienteContatoTelefone);">
                                            <label class="mdl-textfield__label" for="clienteContatoTelefone">Telefone</label>
                                        </div>
                                    </div>

                                    <div class="mdl-cell--2-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" pattern="(+[\d*]+)" maxlength="5" name="clienteContatoDDD2" id="clienteContatoDDD2" onkeypress="MascaraDDD(clienteContatoDDD2);" onblur="MascaraDDD(clienteContatoDDD2);">
                                            <label class="mdl-textfield__label" for="clienteContatoDDD2">DDD</label>
                                        </div>
                                    </div>     

                                    <div class="mdl-cell--10-col custom-cliente-text__input">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" pattern="(^\d{4}-\d{4}$)"  maxlength="9" name="clienteContatoTelefone2" id="clienteContatoTelefone2" onkeypress="MascaraTelefone(clienteContatoTelefone2);">
                                            <label class="mdl-textfield__label" for="clienteContatoTelefone2">Telefone</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mdl-card__actions mdl-card--border">
                                <div class="mdl-layout-spacer"></div>
                                <button id="botaoCancelar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect" type="button"
                                        onclick="window.location('index.jsp')">Cancelar</button>
                                <button id="botaoCadastrar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--primary mdl-js-ripple-effect" type="button" 
                                        onclick="cadastraCliente();">Cadastrar</button>
                            </div>
                        </div>
                    </div>

                    <div id="toastCadastroCliente" class="mdl-js-snackbar mdl-snackbar">
                        <div class="mdl-snackbar__text"></div>
                        <button class="mdl-snackbar__action" type="button"></button>
                    </div>
                </div>
            </main> 
        </div>
    </body>
</html>
