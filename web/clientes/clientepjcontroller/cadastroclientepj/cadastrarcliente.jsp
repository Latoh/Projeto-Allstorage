<%@page import="seguranca.seguranca"%>
<%@page import="contatoDAO.contato"%>
<%@page import="enderecoDAO.endereco"%>
<%@page import="clienteDAO.cliente"%>

<%
//Declaração de variáveis
    String nome_fantasia, razao_social, cnpj, nome_rua, bairro,
            estado, cidade, pais, complemento, email, inscricao_estadual, msg;
    int cep, numero_endereco, id_cliente_pj, id_endereco_pj, ddd;
    Long numero_contato;

//Requisição de parametros
    nome_fantasia = request.getParameter("cliente-dados-nome");
    razao_social = request.getParameter("cliente-dados-razao-sobrenome");
    cnpj = request.getParameter("cliente-dados-cpf-cnpj");
    nome_rua = request.getParameter("cliente-endereco-logradouro");
    bairro = request.getParameter("cliente-endereco-bairro");
    estado = request.getParameter("cliente-endereco-estado");
    cidade = request.getParameter("cliente-endereco-cidade");
    pais = request.getParameter("cliente-endereco-pais");
    complemento = request.getParameter("cliente-endereco-complemento");
    email = request.getParameter("cliente-contato-email");
    inscricao_estadual = "11"; // request.getParameter("cliente-dados-inscricao");

    cep = Integer.parseInt(request.getParameter("cliente-endereco-cep"));
    numero_endereco = Integer.parseInt(request.getParameter("cliente-endereco-numero"));
    numero_contato = Long.parseLong(request.getParameter("cliente-contato-telefone"));
    ddd = Integer.parseInt(request.getParameter("cliente-contato-ddd"));

    try {
// Criado os métodos para chamar as classes de DAO 
        cliente cliente_pessoa_juridica = new cliente();
        endereco endereco_pessoa_juridica = new endereco();
        contato contato_pessoa_juridica = new contato();

//Criando e setando as informações para endereço
        endereco_pessoa_juridica.setNome_rua(nome_rua);
        endereco_pessoa_juridica.setNumero(numero_endereco);
        endereco_pessoa_juridica.setCep(cep);
        endereco_pessoa_juridica.setComplemento(complemento);
        endereco_pessoa_juridica.setBairro(bairro);
        endereco_pessoa_juridica.setCidade(cidade);
        endereco_pessoa_juridica.setEstado(estado);
        endereco_pessoa_juridica.setPais(pais);
        endereco.cadastroendereco(endereco_pessoa_juridica);
        id_endereco_pj = endereco_pessoa_juridica.getId_endereco();

//Criando e setando as informações para cliente
        System.out.println("testando id_endereco juridico "+id_endereco_pj);
        cliente_pessoa_juridica.setNome_fantasia(nome_fantasia);
        cliente_pessoa_juridica.setRazao_social(razao_social);
        cliente_pessoa_juridica.setCnpj(cnpj);
        cliente_pessoa_juridica.setId_endereco(id_endereco_pj);
        cliente_pessoa_juridica.setInscricao_estadual(inscricao_estadual);
        cliente_pessoa_juridica.cadastraPJ(cliente_pessoa_juridica);
        id_cliente_pj = cliente_pessoa_juridica.getId_clientepj();

//Criando e setando as informações para contato
        System.out.println("testando id cliente PJ "+id_cliente_pj);
        contato_pessoa_juridica.setId_cliente_pj(id_cliente_pj);
        contato_pessoa_juridica.setDdd(ddd);
        contato_pessoa_juridica.setContatoNumero(numero_contato);
        contato_pessoa_juridica.setEmail(email);
        contato_pessoa_juridica.cadastroContatoPJ(contato_pessoa_juridica);
        msg = "Cliente Juridico cadastrado com sucesso!";

    } catch (Exception error) {

        msg = "Erro ao cadastrar Cliente Juridico!";

    }
%>

<%=msg%>
