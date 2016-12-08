package clienteDAO;

import database.conexaomysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class cliente {

    private int id_clientepj;
    private int id_clientepf;
    private int id_endereco;
    private int status;
    private String cpf;
    private String cnpj;
    private String razao_social;
    private String nome_fantasia;
    private String nome;
    private String sobrenome;
    private String sexo;
    private String inscricao_estadual;
    private static ArrayList<cliente> listaCliente = new ArrayList<cliente>();

    public void cadastraPF(cliente clientepf) throws ClassNotFoundException, SQLException {

        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqldadosPF = "INSERT INTO allstorage.cliente_pf ("
                    + "nome, "
                    + "sobrenome, "
                    + "cpf, "
                    + "id_endereco, "
                    + "sexo"
                    + ") VALUES ("
                    + "?, "
                    + "?, "
                    + "?, "
                    + "?, "
                    + "?)";
            conexao.setQuerySQL(sqldadosPF);
            conexao.setPreparedStatement().setString(1, clientepf.getNome());
            conexao.setPreparedStatement().setString(2, clientepf.getSobrenome());
            conexao.setPreparedStatement().setString(3, clientepf.getCpf());
            conexao.setPreparedStatement().setInt(4, clientepf.getId_endereco());
            conexao.setPreparedStatement().setString(5, clientepf.getSexo());
            conexao.setPreparedStatement().execute();
            conexao.setPreparedStatement().clearParameters();
            sqldadosPF = "SELECT id_cliente_pf FROM cliente_pf ORDER BY id_cliente_pf DESC LIMIT 0 , 1";
            conexao.setQuerySQL(sqldadosPF);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            resultado.next();
//             Utilizar o cliente passado para recuperar o id_cliente Pessoa física
//             registrado e setar no contato ID ao cadastrar um novo contato para um novo cliente!
            clientepf.setId_clientepf(resultado.getInt("id_cliente_pf"));
            //getListaCliente().add(this);
            
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }

    public void cadastraPJ(cliente clientepj) throws ClassNotFoundException, SQLException {

        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqldadosPJ = "INSERT INTO cliente_pj ("
                    + "nome_fantasia, "
                    + "razao_social, "
                    + "cnpj, "
                    + "inscricao_estadual, "
                    + "id_endereco "
                    + ") VALUES ("
                    + "?, "
                    + "?, "
                    + "?, "
                    + "?, "
                    + "? )";
            conexao.setQuerySQL(sqldadosPJ);
            conexao.setPreparedStatement().setString(1, clientepj.getNome_fantasia());
            conexao.setPreparedStatement().setString(2, clientepj.getRazao_social());
            conexao.setPreparedStatement().setString(3, clientepj.getCnpj());
            conexao.setPreparedStatement().setString(4, clientepj.getInscricao_estadual());
            conexao.setPreparedStatement().setInt(5, clientepj.getId_endereco());
            conexao.setPreparedStatement().execute();
            conexao.setPreparedStatement().clearParameters();
            sqldadosPJ = "SELECT id_cliente_pj FROM cliente_pj ORDER BY id_cliente_pj DESC LIMIT 0 , 1";
            conexao.setQuerySQL(sqldadosPJ);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            resultado.next();
            // Utilizar o cliente passado para recuperar o id_cliente Pessoa Juridica
            // registrado e setar no contato ID ao cadastrar um novo contato para um novo/existente cliente!
            clientepj.setId_clientepj(resultado.getInt("id_cliente_pj"));
            //getListaCliente().add(this);
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }

    public static void loadingPF() throws ClassNotFoundException, SQLException {

        try {
            listaCliente.clear();
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlselecionapf = "SELECT "
                    + "id_cliente_pf, "
                    + "nome, "
                    + "sobrenome, "
                    + "cpf, "
                    + "id_endereco, "
                    + "status FROM cliente_pf ORDER BY nome, sobrenome";
            conexao.setQuerySQL(sqlselecionapf);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
                cliente clientepf = new cliente();
                clientepf.setId_clientepf(resultado.getInt("id_cliente_pf"));
                clientepf.setNome(resultado.getString("nome"));
                clientepf.setSobrenome(resultado.getString("sobrenome"));
                clientepf.setCpf(resultado.getString("cpf"));
                clientepf.setId_endereco(resultado.getInt("id_endereco"));
                clientepf.setStatus(resultado.getInt("status"));
                getListaCliente().add(clientepf);
            }

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public static void loadingPJ() throws ClassNotFoundException, SQLException {

        try {
            listaCliente.clear();
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlselecionapj = "SELECT "
                    + "id_cliente_pj, "
                    + "nome_fantasia, "
                    + "razao_social, "
                    + "cnpj, "
                    + "id_endereco, "
                    + "inscricao_estadual, "
                    + "status FROM cliente_pj";
            conexao.setQuerySQL(sqlselecionapj);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
                cliente clientepj = new cliente();
                clientepj.setId_clientepj(resultado.getInt("id_cliente_pj"));
                clientepj.setNome_fantasia(resultado.getString("nome_fantasia"));
                clientepj.setRazao_social(resultado.getString("razao_social"));
                clientepj.setCnpj(resultado.getString("cnpj"));
                clientepj.setId_endereco(resultado.getInt("id_endereco"));
                clientepj.setStatus(resultado.getInt("status"));
                clientepj.setInscricao_estadual(resultado.getString("inscricao_estadual"));
                getListaCliente().add(clientepj);
            }

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }
    
    public static int contadorPF() throws ClassNotFoundException, SQLException{
        int contagem = 0;

            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlcontaPF = "SELECT COUNT(id_cliente_pf) as id_cliente_pf FROM cliente_pf";
            conexao.setQuerySQL(sqlcontaPF);
            conexao.setPreparedStatement().execute();
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while(resultado.next()) {
            contagem = resultado.getInt("id_cliente_pf");
            }

        return contagem;
    }

    public String getInscricao_estadual() {
        return inscricao_estadual;
    }

    public void setInscricao_estadual(String inscricao_estadual) {
        this.inscricao_estadual = inscricao_estadual;
    }

    public static ArrayList<cliente> getListaCliente() {
        return listaCliente;
    }

    public static void setListaCliente(ArrayList<cliente> listaCliente) {
        cliente.listaCliente = listaCliente;
    }

    public int getId_clientepj() {
        return id_clientepj;
    }

    public void setId_clientepj(int id_clientepj) {
        this.id_clientepj = id_clientepj;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getRazao_social() {
        return razao_social;
    }

    public void setRazao_social(String razao_social) {
        this.razao_social = razao_social;
    }

    public String getNome_fantasia() {
        return nome_fantasia;
    }

    public void setNome_fantasia(String nome_fantasia) {
        this.nome_fantasia = nome_fantasia;
    }

    public int getId_endereco() {
        return id_endereco;
    }

    public void setId_endereco(int id_endereco) {
        this.id_endereco = id_endereco;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public cliente() {

    }

    public int getId_clientepf() {
        return id_clientepf;
    }

    public void setId_clientepf(int id_clientepf) {
        this.id_clientepf = id_clientepf;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
}
