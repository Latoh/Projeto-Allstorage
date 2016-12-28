<%@page import="seguranca.seguranca"%>
<%@page import="contatoDAO.contato"%>
<%@page import="enderecoDAO.endereco"%>
<%@page import="clienteDAO.cliente"%>

<%
//Declaração de variáveis
    String nome, sobrenome, sexo, cpf, nome_rua, bairro,
            estado, cidade, pais, complemento, email, location, destino, msg;
    int cep, numero_endereco, id_cliente_pf, id_endereco_pf, ddd;
    Long numero_contato;


//Requisição de parametros
    nome = request.getParameter("cliente-dados-nome");
    sobrenome = request.getParameter("cliente-dados-razao-sobrenome");
    sexo = request.getParameter("M");
    cpf = request.getParameter("cliente-dados-cpf-cnpj");
    nome_rua = request.getParameter("cliente-endereco-logradouro");
    bairro = request.getParameter("cliente-endereco-bairro");
    estado = request.getParameter("cliente-endereco-estado");
    cidade = request.getParameter("cliente-endereco-cidade");
    pais = request.getParameter("cliente-endereco-pais");
    complemento = request.getParameter("cliente-endereco-complemento");
    email = request.getParameter("cliente-contato-email");

    // Corrigir Parse INT ( esse é o problema do cadastro para retorno de NumberFormat Null!)
    cep = Integer.parseInt(request.getParameter("cliente-endereco-cep"));
    System.out.println("Testando CEP " + cep);
    numero_endereco = Integer.parseInt(request.getParameter("cliente-endereco-numero"));
    System.out.println("Testando Numero: " + numero_endereco);
    numero_contato = Long.parseLong(request.getParameter("cliente-contato-telefone"));
    System.out.println("Testando numero contato " + numero_contato);
    ddd = Integer.parseInt(request.getParameter("cliente-contato-ddd"));

    try {
// Criado os métodos para chamar as classes de DAO 
        cliente cliente_pessoa_fisica = new cliente();
        endereco endereco_pessoa_fisica = new endereco();
        contato contato_pessoa_fisica = new contato();

//Criando e setando as informações para endereço
        endereco_pessoa_fisica.setNome_rua(nome_rua);
        endereco_pessoa_fisica.setNumero(numero_endereco);
        endereco_pessoa_fisica.setCep(cep);
        endereco_pessoa_fisica.setComplemento(complemento);
        endereco_pessoa_fisica.setBairro(bairro);
        endereco_pessoa_fisica.setCidade(cidade);
        endereco_pessoa_fisica.setEstado(estado);
        endereco_pessoa_fisica.setPais(pais);
        endereco.cadastroendereco(endereco_pessoa_fisica);
        id_endereco_pf = endereco_pessoa_fisica.getId_endereco();

//Criando e setando as informações para cliente
        cliente_pessoa_fisica.setNome(nome);
        cliente_pessoa_fisica.setSobrenome(sobrenome);
        cliente_pessoa_fisica.setSexo(sexo);
        cliente_pessoa_fisica.setCpf(cpf);
        cliente_pessoa_fisica.setId_endereco(id_endereco_pf);
        cliente_pessoa_fisica.cadastraPF(cliente_pessoa_fisica);
        id_cliente_pf = cliente_pessoa_fisica.getId_clientepf();

//Criando e setando as informações para contato
        contato_pessoa_fisica.setId_cliente_pf(id_cliente_pf);
        contato_pessoa_fisica.setDdd(ddd);
        contato_pessoa_fisica.setContatoNumero(numero_contato);
        contato_pessoa_fisica.setEmail(email);
        contato_pessoa_fisica.cadastroContatoPF(contato_pessoa_fisica);
        msg = "Cliente Pessoa Fisica cadastrado com sucesso!";

    } catch (Exception error) {
        
        msg = "Erro ao cadastrar contato!";

       
     
    }
%>
<%
    //seguranca.autoriza(request, response, session.getAttribute("logado"));
%>
<%=msg%>
