tipoCliente = "1";
var containerStatus ="1";

(function () {
    'use strict';
    var snackbarContainer = document.querySelector('#toast-cadastro-cliente');
    var showToastButton = document.querySelector('#botao-cadastrar');
    showToastButton.addEventListener('click', function () {
        'use strict';
        var data = {message: "Cliente cadastrado com sucesso!"};
        snackbarContainer.MaterialSnackbar.showSnackbar(data);
    });
}); 

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
