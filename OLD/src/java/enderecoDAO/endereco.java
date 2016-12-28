package enderecoDAO;

import database.conexaomysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import clienteDAO.cliente;
import contatoDAO.contato;
import java.util.ArrayList;

public class endereco {

    private int id_endereco;
    private int numero;
    private String cep;
    private String nome_rua;
    private String bairro;
    private String cidade;
    private String pais;
    private String complemento;
    private String estado;
    private static ArrayList<endereco> listaEndereco = new ArrayList<endereco>();

    public static void cadastroendereco(endereco endereco) throws ClassNotFoundException, SQLException {

        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlendereco = "INSERT INTO endereco ("
                    + "cep, "
                    + "nome_rua, "
                    + "numero, "
                    + "complemento, "
                    + "bairro, "
                    + "cidade, "
                    + "estado, "
                    + "pais"
                    + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

            conexao.setQuerySQL(sqlendereco);
            conexao.setPreparedStatement().setString(1, endereco.getCep());
            conexao.setPreparedStatement().setString(2, endereco.getNome_rua());
            conexao.setPreparedStatement().setInt(3, endereco.getNumero());
            conexao.setPreparedStatement().setString(4, endereco.getComplemento());
            conexao.setPreparedStatement().setString(5, endereco.getBairro());
            conexao.setPreparedStatement().setString(6, endereco.getCidade());
            conexao.setPreparedStatement().setString(7, endereco.getEstado());
            conexao.setPreparedStatement().setString(8, endereco.getPais());
            conexao.setPreparedStatement().execute();
            conexao.setPreparedStatement().clearParameters();
            sqlendereco = "SELECT id_endereco FROM endereco ORDER BY id_endereco DESC LIMIT 0 , 1";
            conexao.setQuerySQL(sqlendereco);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            resultado.next();
            // Utilizar o endereco passado para recuperar o id_endereco 
            // registrado e setar no endereco id ao cadastrar um novo usuário
            endereco.setId_endereco(resultado.getInt("id_endereco"));

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o endereço.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public static void loadingEndereco() throws ClassNotFoundException, SQLException {

        try {
            listaEndereco.clear();
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            String sqlselecionapf = "SELECT "
                    + "id_endereco, "
                    + "cep, "
                    + "nome_rua, "
                    + "numero, "
                    + "complemento, "
                    + "bairro, "
                    + "cidade, "
                    + "estado, "
                    + "pais"
                    + " FROM endereco";
            conexao.setQuerySQL(sqlselecionapf);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
            endereco endereco = new endereco();
            endereco.setId_endereco(resultado.getInt("id_endereco"));
            endereco.setCep(resultado.getString("cep"));
            endereco.setNome_rua(resultado.getString("nome_rua"));
            endereco.setNumero(resultado.getInt("numero"));
            endereco.setComplemento(resultado.getString("complemento"));
            endereco.setBairro(resultado.getString("bairro"));
            endereco.setCidade(resultado.getString("cidade"));
            endereco.setEstado(resultado.getString("estado"));
            endereco.setPais(resultado.getString("pais"));
            getListaEndereco().add(endereco);
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }
    
    public static void loadingEnderecoUnicoClientePJ(int endereco_id) throws ClassNotFoundException, SQLException {

        try {
            
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            String sqlselecionapf = "SELECT "
                    + "cep, "
                    + "nome_rua, "
                    + "numero, "
                    + "complemento, "
                    + "bairro, "
                    + "cidade, "
                    + "estado, "
                    + "pais"
                    + " FROM endereco WHERE id_endereco = ?";
            conexao.setQuerySQL(sqlselecionapf);
            conexao.setPreparedStatement().setInt(1, endereco_id);
            conexao.setPreparedStatement().execute();
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            
            while(resultado.next()){
            endereco endereco = new endereco();
            endereco.setCep(resultado.getString("cep"));
            endereco.setNome_rua(resultado.getString("nome_rua"));
            endereco.setNumero(resultado.getInt("numero"));
            endereco.setComplemento(resultado.getString("complemento"));
            endereco.setBairro(resultado.getString("bairro"));
            endereco.setCidade(resultado.getString("cidade"));
            endereco.setEstado(resultado.getString("estado"));
            endereco.setPais(resultado.getString("pais"));
            getListaEndereco().add(endereco);
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }
    
    public static void loadingEnderecoUnicoClientePF(int endereco_id) throws ClassNotFoundException, SQLException {

        try {
            
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            String sqlselecionapf = "SELECT "
                    + "cep, "
                    + "nome_rua, "
                    + "numero, "
                    + "complemento, "
                    + "bairro, "
                    + "cidade, "
                    + "estado, "
                    + "pais"
                    + " FROM endereco WHERE id_endereco = ?";
            conexao.setQuerySQL(sqlselecionapf);
            conexao.setPreparedStatement().setInt(1, endereco_id);
            conexao.setPreparedStatement().execute();
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            
            while(resultado.next()){
            endereco endereco = new endereco();
            endereco.setCep(resultado.getString("cep"));
            endereco.setNome_rua(resultado.getString("nome_rua"));
            endereco.setNumero(resultado.getInt("numero"));
            endereco.setComplemento(resultado.getString("complemento"));
            endereco.setBairro(resultado.getString("bairro"));
            endereco.setCidade(resultado.getString("cidade"));
            endereco.setEstado(resultado.getString("estado"));
            endereco.setPais(resultado.getString("pais"));
            getListaEndereco().add(endereco);
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public int getNumero() {
        return numero;
    }

    public static ArrayList<endereco> getListaEndereco() {
        return listaEndereco;
    }

    public static void setListaEndereco(ArrayList<endereco> listaEndereco) {
        endereco.listaEndereco = listaEndereco;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_endereco() {
        return id_endereco;
    }

    public void setId_endereco(int id_endereco) {
        this.id_endereco = id_endereco;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getNome_rua() {
        return nome_rua;
    }

    public void setNome_rua(String nome_rua) {
        this.nome_rua = nome_rua;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

}
