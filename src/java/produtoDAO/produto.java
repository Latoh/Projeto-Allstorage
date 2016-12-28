package produtoDAO;

import database.conexaomysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class produto {

    private int id_produto;
    private int id_fornecedor;
    private double preco;
    private String nome_produto;
    private String marca;
    private String cod_prod;
    private String imagem;
    private String data_cadastro;
    private int quantidade;
    categoria CategoriaProduto = new categoria();
    atributo AtributoProduto = new atributo();
    
    private static ArrayList<produto> listaProduto = new ArrayList<produto>();

    public produto() {

    }

    public void cadastroproduto(produto produto) throws ClassNotFoundException, SQLException {
        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlproduto = "INSERT INTO produto ("
                    + "nome_produto, "
                    + "marca, "
                    + "data_cadastro, "
                    + "id_fornecedor, "
                    + "preco, "
                    + "cod_prod,"
                    + "id_categoria,"
                    + "id_atributo "
                    + ") VALUES ("
                    + "?,?,?,?,?,?,?,?);";
            conexao.setQuerySQL(sqlproduto);
            conexao.setPreparedStatement().setString(1, produto.getNome_produto());
            conexao.setPreparedStatement().setString(2, produto.getMarca());
            conexao.setPreparedStatement().setString(3, produto.getData_cadastro());
            conexao.setPreparedStatement().setInt(4, produto.getId_fornecedor());
            conexao.setPreparedStatement().setDouble(5, produto.getPreco());
            conexao.setPreparedStatement().setString(6, produto.getCod_prod());
            conexao.setPreparedStatement().setInt(7, CategoriaProduto.getId_categoria());
            conexao.setPreparedStatement().setInt(7, AtributoProduto.getId_atributo());
            conexao.setPreparedStatement().execute();
            conexao.setPreparedStatement().clearParameters();
            sqlproduto = "SELECT id_produto FROM produto ORDER BY id_produto DESC LIMIT 0 , 1";
            conexao.setQuerySQL(sqlproduto);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            resultado.next();
            // Utilizar o produto para recuperar o id_produto 
            // registrado e setar no produto ID para cadastrar no estoque em sequência
            produto.setId_produto(resultado.getInt("id_produto"));
            conexao.close();
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o produto.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }
    
    
    
     public static void loadingProduto() throws ClassNotFoundException, SQLException {

        try {
            //listaProduto.clear();
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            categoria novaCategoria = new categoria();
            tipo novoTipo = new tipo();
            String sqlselecionaproduto = "SELECT "
                    + "produto.id_produto, "
                    + "nome_produto, "
                    + "nome_categoria, "
                    + "nome_tipo, "
                    + "marca, "
                    + "preco, "
                    + "qtd_produto FROM produto"
                    + " INNER JOIN "
                    + "categoria ON categoria.id_categoria = produto.id_categoria"
                    + " INNER JOIN "
                    + "tipo ON tipo.id_categoria = categoria.id_categoria"
                    + " INNER JOIN "
                    + "estoque ON produto.id_produto = estoque.id_produto";
            conexao.setQuerySQL(sqlselecionaproduto);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
                produto produto = new produto();
                produto.setId_produto(resultado.getInt("id_produto"));
                produto.setNome_produto(resultado.getString("nome_produto"));
                novaCategoria.setNome_categoria(resultado.getString("nome_categoria"));
                novoTipo.setNome_tipo(resultado.getString("nome_tipo"));
                produto.setMarca(resultado.getString("marca"));
                produto.setPreco(resultado.getDouble("preco"));
                produto.setQuantidade(resultado.getInt("qtd_produto"));
                getListaProduto().add(produto);
                tipo.getListaTipo().add(novoTipo);
                categoria.getListaCategoria().add(novaCategoria);
            }

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public categoria getCategoriaProduto() {
        return CategoriaProduto;
    }

    public void setCategoriaProduto(categoria CategoriaProduto) {
        this.CategoriaProduto = CategoriaProduto;
    }

    public atributo getAtributoProduto() {
        return AtributoProduto;
    }

    public void setAtributoProduto(atributo AtributoProduto) {
        this.AtributoProduto = AtributoProduto;
    }

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public int getId_fornecedor() {
        return id_fornecedor;
    }

    public void setId_fornecedor(int id_fornecedor) {
        this.id_fornecedor = id_fornecedor;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getNome_produto() {
        return nome_produto;
    }

    public void setNome_produto(String nome_produto) {
        this.nome_produto = nome_produto;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getCod_prod() {
        return cod_prod;
    }

    public void setCod_prod(String cod_prod) {
        this.cod_prod = cod_prod;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getData_cadastro() {
        return data_cadastro;
    }

    public void setData_cadastro(String data_cadastro) {
        this.data_cadastro = data_cadastro;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    
    public static ArrayList<produto> getListaProduto() {
        return listaProduto;
    }

    public static void setListaProduto(ArrayList<produto> listaProduto) {
        produto.listaProduto = listaProduto;
    }
    
    

}
