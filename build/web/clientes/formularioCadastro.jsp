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
        <script>
            /*  */
            tipoCliente = "1";
            var containerStatus ="1";
            
           /* (function () {
                'use strict';
                var snackbarContainer = document.querySelector('#toast-cadastro-cliente');
                var showToastButton = document.querySelector('#botao-cadastrar');
                showToastButton.addEventListener('click', function () {
                    'use strict';
                    var data = {message: "Cliente cadastrado com sucesso!"};
                    snackbarContainer.MaterialSnackbar.showSnackbar(data);
                });
            }); */
    
            //_________________________________________________________________________________

            function alteraCamposTipoCliente(objTipo) {
                tipo = document.getElementById(objTipo);
                
                clienteDadosContainerCNPJ = document.getElementById("clienteDadosContainerCNPJ");
                clienteDadosContainerCPF = document.getElementById("clienteDadosContainerCPF");

                clienteNome = document.getElementById("clienteContainerNome");
                clienteSobrenome = document.getElementById("clienteContainerSobrenome");
                clienteCPF = document.getElementById("clienteContainerCPF");
                
                clienteEmpresa = document.getElementById("clienteContainerEmpresa");
                clienteRazaoSocial = document.getElementById("clienteContainerRazaoSocial");
                clienteInscricao = document.getElementById("clienteContainerInscricao");
                clienteCNPJ = document.getElementById("clienteContainerCNPJ");
                               
                if (tipo.value == 1) {
                         
                    clienteNome.style.display = "none";
                    clienteSobrenome.style.display = "none";
                    clienteCPF.style.display = "none";
                              
                    clienteEmpresa.style.display = "inherit";
                    clienteRazaoSocial.style.display = "inherit";
                    clienteInscricao.style.display = "inherit";
                    clienteCNPJ.style.display = "inherit";
                    
                    tipoCliente = "1";

                } else {
      
                    clienteNome.style.display = "inherit";
                    clienteSobrenome.style.display = "inherit";
                    clienteCPF.style.display = "inherit";
                    
                    
                    clienteEmpresa.style.display = "none";
                    clienteRazaoSocial.style.display = "none";
                    clienteInscricao.style.display = "none";
                    clienteCNPJ.style.display = "none";
                    
                    tipoCliente = "2";
                }
            }
            
            //_____________________________________________________________________________
            
            function cadastraCliente() {
                
                if (tipoCliente == "2") {
                    if(validaCamposCadastro(tipoCliente))
                    cadastraCC('http://localhost:8080/allStorage/clientes/clientepfcontroller/cadastroclientepf/cadastrarcliente.jsp?', 'clienteDadosNome', 'clienteDadosSobrenome', 'clienteDadosCPF','' );
                } else {
                    if(validaCamposCadastro(tipoCliente))
                    cadastraCC('http://localhost:8080/allStorage/clientes/clientepjcontroller/cadastroclientepj/cadastrarcliente.jsp?', 'clienteDadosEmpresa', 'clienteDadosRazaoSocial', 'clienteDadosCNPJ', 'clienteDadosInscricao');
                }
            }
            
            
            //_____________________________________________________________________________
            // Nesta function é passado um valor esperado "1" ou "2" para validar os campos.
            // Se o valor passado é igual a "1", a function irá validar os campos do cadastro de cliente JÚRIDICA
            // Se o valor passado é igual a "2", validar os campos do cadastro de cliente FÍSICA
            // Se os campos estiverem em branco ou vazio a function retorna false. Se estiverem preenchidos, retorna true.
            function validaCamposCadastro(tipo){
                var resultado = true;
                
                if(tipo == "1"){
                    
                    var empresa = "clienteDadosEmpresa";
                    var empresaLabel = "clienteDadosEmpresaLabel";
                    var razaoSocial = "clienteDadosRazaoSocial";
                    var razaoSocialLabel = "clienteDadosRazaoSocialLabel";
                    var inscricao = "clienteDadosInscricao";
                    var inscricaoLabel = "clienteDadosInscricaoLabel";
                    var cnpj = "clienteDadosCNPJ";
                    var cnpjLabel = "clienteDadosCNPJLabel";
                    
                    resultado = verificaString(empresa, empresaLabel);
                    resultado = verificaString(razaoSocial, razaoSocialLabel);
                    resultado = verificaString(inscricao, inscricaoLabel);
                    resultado = verificaString(cnpj, cnpjLabel);
                    
                    if(resultado == false){ 
                        
                        // Seleciona o container do toast pelo id
                        var snackbarContainer = document.querySelector('#toastCadastroCliente');
                        // Atribui o retorno do XML pra variavel data
                        var data = {message: "Existem campos obrigatórios"};
                        // Faz a chamada do MDL para exibir o toast passando o valor da variavel data
                        snackbarContainer.MaterialSnackbar.showSnackbar(data);
                        
                    }
                    
                    return resultado;
                    
                } else{
                    
                    var nome = "clienteDadosNome";
                    var nomeLabel = "clienteDadosNomeLabel";
                    var sobrenome = "clienteDadosSobrenome";
                    var sobrenomeLabel = "clienteDadosSobrenomeLabel";
                    var cpf = "clienteDadosCPF";
                    var cpfLabel = "clienteDadosCPFLabel";
                    
                    resultado = verificaString(nome, nomeLabel);
                    resultado = verificaString(sobrenome, sobrenomeLabel);
                    resultado = verificaString(cpf, cpfLabel);
                    

                    if(resultado == false){                    
                        // Seleciona o container do toast pelo id
                        var snackbarContainer = document.querySelector('#toastCadastroCliente');
                        // Atribui o retorno do XML pra variavel data
                        var data = {message: "Existem campos obrigatórios"};
                        // Faz a chamada do MDL para exibir o toast passando o valor da variavel data
                        snackbarContainer.MaterialSnackbar.showSnackbar(data);
                        
                        
                    }
                    return resultado;
                }
            }
            
            //_________________________________________________________________________
            // Esta pequena function recebe dois valores esperados que é um id de um campo INPUT e um id de um LABEL.
            // Se caso o campo INPUT passado estiver em branco ou vazio, ele aplica a class css de required retornando um valor false.
            // Se estiver preenchido ela remove a class css e retorna true.
            function verificaString(valor, label){
                
                var objInput = document.getElementById(valor);
                var objLabel = document.getElementById(label);
                
                if (objInput.value == ""){
                    $(objLabel).addClass("custom-label-required");
                    $(objInput).addClass("custom-input-required");
                    return false;
                } else{
                    $(objLabel).removeClass("custom-label-required");
                    $(objInput).removeClass("custom-input-required");
                    return true;
                }
            }
            
            //_________________________________________________________________________
            function limparMascara(idValor){
                var valor = document.getElementById(idValor).value;
                var resultado = "";
                
                var valorSplit = valor.split(".");
                for(var i = 0; i < valorSplit.length; i++){
                    resultado += valorSplit[i];
                }
                
                valorSplit = resultado.split("-");
                resultado = "";
                for(var i = 0; i < valorSplit.length; i++){
                    resultado += valorSplit[i];
                }
                
                valorSplit = resultado.split("/");
                resultado = "";
                for(var i = 0; i < valorSplit.length; i++){
                    resultado += valorSplit[i];
                }
                
                valorSplit = resultado.split("(");
                resultado = "";
                for(var i = 0; i < valorSplit.length; i++){
                    resultado += valorSplit[i];
                }
                
                valorSplit = resultado.split(")");
                resultado = "";
                for(var i = 0; i < valorSplit.length; i++){
                    resultado += valorSplit[i];
                }
                
                return resultado;
            }
        </script>
        
    </body>
</html>
