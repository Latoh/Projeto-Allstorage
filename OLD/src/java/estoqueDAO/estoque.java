package estoqueDAO;

import database.conexaomysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import produtoDAO.produto;

public class estoque {

    private int id_estoque;
    private int qtd_produto;
    private int id_produto;
    private String data_entrada;
    private String nome_produto;
    private String preco;
    private String marca;
    private String nome_atributo;
    private String valor_atributo;
    private static ArrayList <estoque> listaEstoque = new ArrayList<>();
    produto ProdutoEstoque = new produto();

    public void cadastraestoque(estoque estoque) throws SQLException, ClassNotFoundException {
        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlestoque = "INSERT INTO estoque ("
                    + "id_produto,"
                    + "qtd_produto"
                    + ") VALUES ("
                    + "?,?)";
            conexao.setQuerySQL(sqlestoque);
            conexao.setPreparedStatement().setInt(1, ProdutoEstoque.getId_produto());
            conexao.setPreparedStatement().setInt(2, estoque.getId_estoque());
            conexao.setPreparedStatement().execute();
            conexao.setPreparedStatement().clearParameters();
            sqlestoque = "SELECT id_produto FROM produto ORDER BY id_produto DESC LIMIT 0 , 1";
            conexao.setQuerySQL(sqlestoque);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            resultado.next();
            // Utilizar o produto para recuperar o id_produto 
            // registrado e setar no produto ID para cadastrar no estoque em sequência
            estoque.setId_estoque(resultado.getInt("id_estoque"));
            conexao.close();
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o produto.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }
    
    public static void selecionaestoqueApp() throws SQLException, ClassNotFoundException {
        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlestoque = "SELECT " +
                "estoque.id_estoque, " +
                "atributo.id_atributo, " +
                "produto.id_produto, " +
                "produto.nome_produto, " +
                "produto.preco, " +
                "estoque.qtd_produto, " +
                "produto.marca, " +
                "atributo.nome_atributo, " +
                "valor_atributo.descricao_valor, " +
                "tipo.nome_tipo, " +
                "categoria.nome_categoria " +
                "FROM valor_atributo " +
                "INNER JOIN produto on produto.id_produto = valor_atributo.id_produto " +
                "INNER JOIN atributo on valor_atributo.id_atributo = atributo.id_atributo " +
                "INNER JOIN tipo on atributo.id_tipo = tipo.id_tipo " +
                "INNER JOIN categoria on tipo.id_categoria = categoria.id_categoria " +
                "INNER JOIN estoque on estoque.id_produto = produto.id_produto";
            conexao.setQuerySQL(sqlestoque);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            getListaEstoque().clear();
            while(resultado.next()){
            estoque newestoque = new estoque();
            newestoque.setId_estoque(Integer.parseInt(resultado.getString("id_estoque")));
            newestoque.setId_produto(Integer.parseInt(resultado.getString("id_produto")));
            newestoque.setNome_produto(resultado.getString("nome_produto"));
            newestoque.setPreco(resultado.getString("preco"));
            newestoque.setQtd_produto(Integer.parseInt(resultado.getString("qtd_produto")));
            newestoque.setMarca(resultado.getString("marca"));
            newestoque.setNome_atributo(resultado.getString("nome_atributo"));
            newestoque.setValor_atributo(resultado.getString("descricao_valor"));
            getListaEstoque().add(newestoque);
            }
            conexao.close();
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível localizar o estoque.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public int getId_estoque() {
        return id_estoque;
    }
    public void setId_estoque(int id_estoque) {
        this.id_estoque = id_estoque;
    }
    public int getQtd_produto() {
        return qtd_produto;
    }
    public void setQtd_produto(int qtd_produto) {
        this.qtd_produto = qtd_produto;
    }
    public String getData_entrada() {
        return data_entrada;
    }
    public void setData_entrada(String data_entrada) {
        this.data_entrada = data_entrada;
    }
    public produto getProdutoEstoque() {
        return ProdutoEstoque;
    }
    public void setProdutoEstoque(produto ProdutoEstoque) {
        this.ProdutoEstoque = ProdutoEstoque;
    }
    public String getNome_produto() {
        return nome_produto;
    }
    public void setNome_produto(String nome_produto) {
        this.nome_produto = nome_produto;
    }
    public String getPreco() {
        return preco;
    }
    public void setPreco(String preco) {
        this.preco = preco;
    }
    public String getMarca() {
        return marca;
    }
    public void setMarca(String marca) {
        this.marca = marca;
    }
    public String getNome_atributo() {
        return nome_atributo;
    }
    public void setNome_atributo(String nome_atributo) {
        this.nome_atributo = nome_atributo;
    }
    public String getValor_atributo() {
        return valor_atributo;
    }
    public void setValor_atributo(String valor_atributo) {
        this.valor_atributo = valor_atributo;
    }
    public static ArrayList<estoque> getListaEstoque() {
        return listaEstoque;
    }
    public static void setListaEstoque(ArrayList<estoque> listaEstoque) {
        estoque.listaEstoque = listaEstoque;
    }
    public int getId_produto() {
        return id_produto;
    }
    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }
}
