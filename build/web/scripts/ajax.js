function XHConn()
{
    var xmlhttp, bComplete = false;
    
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
      xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE
      try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
      } 
      catch (e) {
        try {
          xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } 
        catch (e) {}
      }
    }
    /*try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {
            try {
                xmlhttp = new XMLHttpRequest();
            } catch (e) {
                xmlhttp = false;
            }
        }
    }
*/
    if (!xmlhttp)
        return null;
    this.connect = function (sURL, sMethod, sVars, fnDone) {
        if (!xmlhttp)
            return false;
        bComplete = false;
        sMethod = sMethod.toUpperCase();
        try {
            if (sMethod == "GET") {
                xmlhttp.open(sMethod, sURL + "?" + sVars, true);
                sVars = "";
            } else {
                xmlhttp.open(sMethod, sURL, true);
                xmlhttp.setRequestHeader("Method", "POST " + sURL + " HTTP/1.1");

                xmlhttp.setRequestHeader("Cache-Control", "no-store, no-cache, must-revalidate");
                xmlhttp.setRequestHeader("Cache-Control", "post-check=0, pre-check=0");
                xmlhttp.setRequestHeader("Pragma", "no-cache");

                xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            }

            xmlhttp.onReadyStateChange() = function () {
                
                if (xmlhttp.readyState == 4 && !bComplete) {
                    bComplete = true;
                    fnDone(xmlhttp);
                }
            }; // Fim da função
            xmlhttp.send(sVars);
        } catch (z) {
            return false;
        }

        return true;
    };
    return this;
}
//_____________________________________________________________

function WSCep(url, par, include, bairro, cidade, estado, endereco)
{

    var myConn = new XHConn();
    if (!myConn)
        alert("Não foi possível executar o pedido.");
    var inclusao = function (oXML) {


        //var WSResultado = oXML.responseText;

        //WSResultado = WSResultado.split("#")
        //document.getElementById(bairro).value = WSResultado[0];
        //document.getElementById(cidade).value = WSResultado[1];
        //document.getElementById(estado).value = WSResultado[2];
        //document.getElementById(endereco).value = WSResultado[3];

        var xmldoc = oXML.responseXML;
        document.getElementById(bairro).value = xmldoc.getElementsByTagName("cep")[0].childNodes[0].childNodes[0].nodeValue;
        document.getElementById(cidade).value = xmldoc.getElementsByTagName("cep")[0].childNodes[1].childNodes[0].nodeValue
        document.getElementById(estado).value = xmldoc.getElementsByTagName("cep")[0].childNodes[5].childNodes[0].nodeValue
        document.getElementById(endereco).value = xmldoc.getElementsByTagName("cep")[0].childNodes[4].childNodes[0].nodeValue


        //alert(xmldoc.getElementsByTagName("cep")[0].childNodes[0].childNodes[0].nodeValue);
        //alert(xmldoc.getElementsByTagName("cep")[0].childNodes[1].childNodes[0].nodeValue);
        //alert(xmldoc.getElementsByTagName("complemento2")[0].childNodes[0].nodeValue);

        document.getElementById(include).innerHTML = "";

        //alert("cep encontrado");
    };
    document.getElementById(include).innerHTML = "<img src='http://localhost:8080/ConsultaCEP/loading.gif' width='16' height='16' align='middle'/>";
    myConn.connect(url, "POST", par, inclusao);
}

function visualizacao(objBoxVisualizacao) {

    obj1 = document.getElementById(objBoxVisualizacao);
    var boxEstado = readCookie("sessionBox");
    if (boxEstado === "true") {
        obj1.innerHTML = "";
        writeCookie("sessionBox", "false", 3);
    } else {
        obj1.innerHTML = "<div class=\"boxVisualizacao mdl-shadow--4dp\">\n\
                                <div class=\"custom-card__title-small\">\n\
                                    <p>Selecione os campos para visuzalização:</p>\n\
                                    <ul class=\"listaVisualizacao mdl-list\">\n\
                                        <li class=\"mdl-list__item\">\n\
                                            <label class=\"mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect\" for=\"codigo\">\n\
                                                <input type=\"checkbox\" id=\"codigo\" class=\"mdl-checkbox__input\">\n\
                                                <span class=\"mdl-checkbox__label\">Codigo</span>\n\
                                            </label>\n\
                                        </li>\n\
                                        <li class=\"mdl-list__item\">\n\
                                            <label class=\"mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect\" for=\"nome\">\n\
                                                <input type=\"checkbox\" id=\"nome\" class=\"mdl-checkbox__input\">\n\
                                                <span class=\"mdl-checkbox__label\">Nome</span>\n\
                                            </label>\n\
                                        </li>\n\
                                        <li class=\"mdl-list__item\">\n\
                                            <label class=\"mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect\" for=\"endereco\">\n\
                                                <input type=\"checkbox\" id=\"endereco\" class=\"mdl-checkbox__input\">\n\
                                                <span class=\"mdl-checkbox__label\">Endereco</span>\n\
                                            </label>\n\
                                        </li>\n\
                                    </ul>\n\
                                </div>\n\
                            </div>";
        writeCookie("sessionBox", "true", 3);
    }
}

function writeCookie(name, value, days) {
    var date, expires;
    if (days) {
        date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toGMTString();
    } else {
        expires = "";
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var i, c, ca, nameEQ = name + "=";
    ca = document.cookie.split(';');
    for (i = 0; i < ca.length; i++) {
        c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1, c.length);
        }
        if (c.indexOf(nameEQ) === 0) {
            return c.substring(nameEQ.length, c.length);
        }
    }
    return '';
}

function cadastraCC(url, clienteNomeEmpresa, clienteSobrenomeRazao, clienteCpfCnpj, clienteInscricao) {

    obj1 = document.getElementById(clienteNomeEmpresa);
    obj2 = document.getElementById(clienteSobrenomeRazao);
    obj3 = document.getElementById(clienteCpfCnpj);
    obj4 = document.getElementById("clienteEnderecoLogradouro");
    obj5 = document.getElementById("clienteEnderecoEstado");
    obj6 = document.getElementById("clienteEnderecoCidade");
    obj7 = document.getElementById("clienteEnderecoPais");
    obj8 = document.getElementById("clienteEnderecoComplemento");
    obj9 = document.getElementById("clienteContatoEmail");
    obj10 = document.getElementById("clienteEnderecoCep");
    obj11 = document.getElementById("clienteEnderecoNumero");
    obj12 = document.getElementById("clienteContatoTelefone");
    obj13 = document.getElementById("clienteEnderecoBairro");
    obj14 = document.getElementById("clienteContatoDDD");
    obj15 = document.getElementById(clienteInscricao);


    var myConn = new XHConn();
    if (!myConn) {
        alert("NÃ£o foi possivel executar o pedido.");
    }
    var inclusao = function (oXML) {
        var textResultado;

        textResultado = oXML.responseText;
        // Tratar retorno do AJAX!
        window.location("http://localhost:8080/allStorage/clientes/index.jsp");

    };

    myConn.connect(url,
            "POST",
            "cliente-dados-nome=" + obj1.value +
            "&cliente-dados-razao-sobrenome=" + obj2.value +
            "&cliente-dados-cpf-cnpj=" + limparMascara(clienteCpfCnpj) +
            "&cliente-endereco-logradouro=" + obj4.value +
            "&cliente-endereco-estado=" + obj5.value +
            "&cliente-endereco-cidade=" + obj6.value +
            "&cliente-endereco-pais=" + obj7.value +
            "&cliente-endereco-complemento=" + obj8.value +
            "&cliente-contato-email=" + obj9.value +
            "&cliente-endereco-cep=" + limparMascara("clienteEnderecoCep") +
            "&cliente-endereco-numero=" + obj11.value +
            "&cliente-contato-telefone=" + limparMascara("clienteContatoTelefone") +
            "&cliente-endereco-bairro=" + obj13.value +
            "&cliente-contato-ddd=" + limparMascara("clienteContatoDDD")
            , inclusao);

}

function cadastraCategoria(nova_categoria) {
    var textResultado;
    obj1 = document.getElementById(nova_categoria);

    var myConn = new XHConn();
    if (!myConn) {
        alert("Não foi possivel executar o pedido.");
    }
    var inclusao = function (oXML) {
        textResultado = oXML.responseText;

        // tratar retorno AJAX
        alert(textResultado);
        location.reload();

    };

    myConn.connect("http://localhost:8080/allStorage/categorias/categoriacontroller/cadastrarcategoria.jsp?",
            "POST", "categoria-nome-new=" + obj1.value, inclusao);

}

function alterarCategoria() {
    var textResultado;
    obj1 = document.getElementById("idCategoriaAlterar");
    obj2 = document.getElementById("descricaoCategoriaAlterar");

    var myConn = new XHConn();
    if (!myConn) {
        alert("Não foi possivel executar o pedido.");
    }
    var inclusao = function (oXML) {
        textResultado = oXML.responseText;


        // tratar retorno AJAX
        alert('Categoria alterada com sucesso!');

    };


    myConn.connect("http://localhost:8080/allStorage/categorias/categoriacontroller/alterarcategoria.jsp?",
            "POST",
            "id_categoria=" + obj1.value +
            "&descricao_categoria=" + obj2.value
            , inclusao);

}


function cadastraTipo() {
    var textResultado;
    obj1 = document.getElementById("tipoNomeNew");
    obj2 = document.getElementById("idCategoriaAlterar");

    var myConn = new XHConn();
    if (!myConn) {
        alert("Não foi possivel executar o pedido.");
    }
    var inclusao = function (oXML) {
        textResultado = oXML.responseText;

        alert(textResultado);

    };

    myConn.connect("http://localhost:8080/allStorage/tipos/cadastrartipo.jsp?",
            "POST",
            "categoria_nome=" + obj1.value +
            "&id_categoria=" + obj2.value
            , inclusao);

}

function cadastraAtributo() {
    
    var textResultado;
    obj1 = document.getElementById("specsNomeNew");
    obj2 = document.getElementById("idTipoAlterar");
    
    var myConn = new XHConn();
    if (!myConn) {
        alert("Não foi possivel executar o pedido.");
    }
    var inclusao = function (oXML) {
        textResultado = oXML.responseText;

        alert("SAINDO DO AJAX "+obj2.value);

    };

    myConn.connect("http://localhost:8080/allStorage/atributos/cadastraratributo.jsp?",
            "POST",
            "specsNomeNew=" + obj1.value +
            "&id_tipo=" + obj2.value
            , inclusao);

}

function selecionarValorListarTipos(campo, id, descricao, resultado) {
    obj1 = campo;

    obj2 = document.getElementById(id);
    obj3 = document.getElementById(descricao);
    obj4 = document.getElementById(resultado);

    obj2.value = obj1.value;
    obj3.value = obj1.options[obj1.selectedIndex].text;

    var myConn = new XHConn();
    if (!myConn) {
        alert("Não foi possivel executar o pedido.");
    }

    var inclusao = function (oXML) {
        var textResultado;

        textResultado = oXML.responseText;

        obj4.innerHTML = textResultado;
        alert(obj2.value);
    };

    myConn.connect("http://localhost:8080/allStorage/tipos/selecionatipo.jsp?",
            "POST", "id_categoria=" + obj2.value, inclusao);

}

function selecionarTipoListarAtributos(campo, id, descricao, resultado) {
    obj1 = campo;

    obj2 = document.getElementById(id);
    obj3 = document.getElementById(descricao);
    obj4 = document.getElementById(resultado);

    obj2.value = obj1.value;
    obj3.value = obj1.options[obj1.selectedIndex].text;

    var myConn = new XHConn();
    if (!myConn) {
        alert("Não foi possivel executar o pedido.");
    }

    var inclusao = function (oXML) {
        var textResultado;

        textResultado = oXML.responseText;
        obj4.innerHTML = textResultado;
        

        alert(obj2.value);
    };

    myConn.connect("http://localhost:8080/allStorage/atributos/listaratributos.jsp?",
            "POST", "id_tipo=" + obj2.value, inclusao);

}

function cadastraProduto(url) {

    obj1 = document.getElementById("produtoDadosNome");
    obj2 = document.getElementById("produtoDadosCategoria");
    obj3 = document.getElementById("produtoDadosTipo");
    obj4 = document.getElementById("produtoCadastroMarca");
    obj5 = document.getElementById("produtoCadastroPreco");
    obj6 = document.getElementById("produtoCadastroFornecedor");


    var myConn = new XHConn();
    if (!myConn) {
        alert("Não foi possivel executar o pedido.");
    }
    var inclusao = function (oXML) {
        var textResultado;

        textResultado = oXML.responseText;

        obj1.value = "";
        obj2.value = "";
        obj3.value = "";
        obj4.value = "";
        obj5.value = "";
        obj6.value = "";

        var snackbarContainer = document.querySelector('#toastCadastroProduto');
        'use strict';
        var data = {message: textResultado};
        snackbarContainer.MaterialSnackbar.showSnackbar(data);
    };
    myConn.connect(url,
            "POST",
            "produtoDadosNome=" + obj1.value +
            "&produtoDadosCategoria=" + obj2.value +
            "&produtoDadosTipo=" + obj3.value +
            "&produtoCadastroMarca=" + obj4.value +
            "&produtoCadastroPreco=" + obj5.value +
            "&produtoCadastroFornecedor=" + obj6.value
            , inclusao);

}
function autenticaUsuario(login, senha) {
    var userLogin = document.getElementById(login);
    var userSenha = document.getElementById(senha);
    var msgAutentica = document.getElementById("msg-autentica");

    var myConn = new XHConn();
    if (!myConn) {
        alert("NÃ£o foi possivel executar o pedido.");
    }
    var inclusao = function (oXML) {
        var textResultado = oXML.responseText;
        var resultado = textResultado.split("|");

        // tratar retorno AJAX
        if (resultado[1] == "true") {
            window.location('index.jsp');
        } else {
            msgAutentica.innerHTML = "Usuario ou senha invalidos";
        }

    };

    myConn.connect("http://localhost:8080/allStorage/autentica.jsp?",
            "POST", "login=" + userLogin.value + "&senha=" + userSenha.value, inclusao);
}
function cadastraNovoProduto(nome_produto, marca, preco) {
    var textResultado;


    obj1 = document.getElementById(nome_produto);
    obj2 = document.getElementById(marca);
    obj3 = document.getElementById(preco);



    var myConn = new XHConn();
    if (!myConn) {
        alert("Não foi possivel executar o pedido.");
    }
    var inclusao = function (oXML) {

        textResultado = oXML.responseText;



    };


    myConn.connect("http://localhost:8080/allStorage/produtos/produtocontroller/cadastroproduto/cadastraproduto.jsp?",
            "POST", "produtoDadosNome=" + obj1.value + "&produtoCadastroMarca=" + obj2.value + "&produtoCadastroPreco=" + obj3.value, inclusao);

}
