
package pedidoDAO;

import clienteDAO.cliente;
import contatoDAO.contato;
import database.conexaomysql;
import enderecoDAO.endereco;
import estoqueDAO.estoque;
import static estoqueDAO.estoque.getListaEstoque;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class pedido {
    
    cliente ClientePedido = new cliente ();
    endereco EnderecoPedido = new endereco ();
    contato ContatoPedido = new contato();
    private String desconto;
    private int quantidade;
    private String data_criacao;
    private String nome;
    private String nome_rua;
    private String numero;
    private String bairro;
    private String cep;
    private String cidade;
    private String nome_produto;
    private String data_devolucao;
    private static ArrayList <pedido> listapedidos =  new ArrayList<> ();
    
    public static void selecionaPedido()throws SQLException, ClassNotFoundException{
        
        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();
        
       String sqlpedido = "SELECT " +
                "pedido.data_criacao," +
                "cliente_pf.nome," +
                "endereco.nome_rua," +
                "endereco.numero," +
                "endereco.bairro," +
                "endereco.cep," +
                "endereco.cidade," +
                "produto.nome_produto,"
               + "produtos_pedido.quantidade," +
                "pedido.data_devolucao " +
                "FROM cliente_pf " +
                "INNER JOIN endereco on cliente_pf.id_endereco = endereco.id_endereco " +
                "INNER JOIN pedido on cliente_pf.id_cliente_pf = pedido.id_cliente_pf " +
                "INNER JOIN produtos_pedido on pedido.id_pedido = produtos_pedido.id_pedido " +
                "INNER JOIN estoque on estoque.id_estoque = produtos_pedido.id_estoque " +
                "INNER JOIN produto on produto.id_produto = estoque.id_produto " +
                "GROUP BY estoque.id_estoque;";
            conexao.setQuerySQL(sqlpedido);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            getListapedidos().clear();
            while(resultado.next()){
            pedido newpedido = new pedido();
            newpedido.setQuantidade(Integer.parseInt(resultado.getString("quantidade")));
            newpedido.setBairro(resultado.getString("bairro"));
            newpedido.setCep(resultado.getString("cep"));
            newpedido.setCidade(resultado.getString("cidade"));
            newpedido.setData_criacao(resultado.getString("data_criacao"));
            newpedido.setData_devolucao(resultado.getString("data_devolucao"));
            newpedido.setNome(resultado.getString("nome"));
            newpedido.setNome_produto(resultado.getString("nome_produto"));
            newpedido.setNome_rua(resultado.getString("nome_rua"));
            newpedido.setNumero(resultado.getString("numero"));
            getListapedidos().add(newpedido);
            }
            conexao.close();
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível localizar o pedido.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public cliente getClientePedido() {
        return ClientePedido;
    }
    public void setClientePedido(cliente ClientePedido) {
        this.ClientePedido = ClientePedido;
    }
    public endereco getEnderecoPedido() {
        return EnderecoPedido;
    }
    public void setEnderecoPedido(endereco EnderecoPedido) {
        this.EnderecoPedido = EnderecoPedido;
    }
    public contato getContatoPedido() {
        return ContatoPedido;
    }
    public void setContatoPedido(contato ContatoPedido) {
        this.ContatoPedido = ContatoPedido;
    }
    public String getDesconto() {
        return desconto;
    }
    public void setDesconto(String desconto) {
        this.desconto = desconto;
    }
    public int getQuantidade() {
        return quantidade;
    }
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    public String getData_criacao() {
        return data_criacao;
    }
    public void setData_criacao(String data_criacao) {
        this.data_criacao = data_criacao;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getNome_rua() {
        return nome_rua;
    }
    public void setNome_rua(String nome_rua) {
        this.nome_rua = nome_rua;
    }
    public String getNumero() {
        return numero;
    }
    public void setNumero(String numero) {
        this.numero = numero;
    }
    public String getBairro() {
        return bairro;
    }
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }
    public String getCep() {
        return cep;
    }
    public void setCep(String cep) {
        this.cep = cep;
    }
    public String getCidade() {
        return cidade;
    }
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
    public String getNome_produto() {
        return nome_produto;
    }
    public void setNome_produto(String nome_produto) {
        this.nome_produto = nome_produto;
    }
    public String getData_devolucao() {
        return data_devolucao;
    }
    public void setData_devolucao(String data_devolucao) {
        this.data_devolucao = data_devolucao;
    }
    public static ArrayList<pedido> getListapedidos() {
        return listapedidos;
    }
    public static void setListapedidos(ArrayList<pedido> listapedidos) {
        pedido.listapedidos = listapedidos;
    }
}
