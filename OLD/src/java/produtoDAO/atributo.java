package produtoDAO;

import database.conexaomysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class atributo {

    private int id_atributo;
    private int id_tipo;
    private int id_produto;
    private int id_valor_atributo;
    private String nome_tipo;
    private String nome_atributo;
    private String descricao_valor;
    private static ArrayList<atributo> listaAtributo = new ArrayList<atributo>();

    public atributo() {

    }

    public void cadastroatributo(atributo atributo) throws ClassNotFoundException, SQLException {
        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlatributo = "INSERT INTO atributo ("
                    + "nome_atributo, "
                    + "id_tipo"
                    + ") VALUES ("
                    + "?, ?)";
            conexao.setQuerySQL(sqlatributo);
            conexao.setPreparedStatement().setString(1, atributo.getNome_atributo());
            conexao.setPreparedStatement().setInt(2, atributo.getId_tipo());
            conexao.setPreparedStatement().execute();
            System.out.println("Dentro do DAO Atributo");
            //conexao.close();
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o atributo.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }

    public void cadastrovaloratributo(atributo valoratributo) throws ClassNotFoundException, SQLException {
        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlvaloratributo = "INSERT INTO valor_atributo ("
                    + "descricao_valor, "
                    + "id_atributo"
                    + ") VALUES ("
                    + "?, ?";
            conexao.setQuerySQL(sqlvaloratributo);
            conexao.setPreparedStatement().setString(1, valoratributo.getDescricao_valor());
            conexao.setPreparedStatement().setInt(2, valoratributo.getId_atributo());
            conexao.setPreparedStatement().execute();
            conexao.setPreparedStatement().clearParameters();
            sqlvaloratributo = "SELECT id_atributo FROM atributo ORDER BY DESC LIMIT 0 , 1";
            conexao.setQuerySQL(sqlvaloratributo);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            resultado.next();
            valoratributo.setId_produto(resultado.getInt("id_atributo"));

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o atributo.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }
    
    public static void listaAtributo (int id_tipo) throws ClassNotFoundException, SQLException {
         try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            listaAtributo.clear();
            String sqlatributo = "SELECT nome_atributo, id_atributo FROM atributo "                   
                    + "WHERE id_tipo = ?";
            conexao.setQuerySQL(sqlatributo);
            conexao.setPreparedStatement().setInt(1, id_tipo);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {            
                atributo atributo = new atributo();
                atributo.setId_atributo(resultado.getInt("id_atributo"));
                atributo.setNome_atributo(resultado.getString("nome_atributo"));
                getListaAtributo().add(atributo);
            }

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o atributo.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }
    
    public static void listavaloratributos (atributo valoratributo) throws ClassNotFoundException, SQLException {
         try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlvaloratributo = "SELECT * FROM valor_atributo";
            conexao.setQuerySQL(sqlvaloratributo);
            conexao.setPreparedStatement().setString(1, valoratributo.getDescricao_valor());
            conexao.setPreparedStatement().setInt(2, valoratributo.getId_atributo());
            conexao.setPreparedStatement().execute();
            conexao.setPreparedStatement().clearParameters();
            sqlvaloratributo = "SELECT id_atributo FROM atributo ORDER BY DESC LIMIT 0 , 1";
            conexao.setQuerySQL(sqlvaloratributo);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            resultado.next();
            valoratributo.setId_produto(resultado.getInt("id_atributo"));

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o atributo.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public static ArrayList<atributo> getListaAtributo() {
        return listaAtributo;
    }

    public static void setListaAtributo(ArrayList<atributo> listaTipo) {
        atributo.listaAtributo = listaTipo;
    }

    public int getId_atributo() {
        return id_atributo;
    }

    public void setId_atributo(int id_atributo) {
        this.id_atributo = id_atributo;
    }

    public String getNome_tipo() {
        return nome_tipo;
    }

    public void setNome_tipo(String nome_tipo) {
        this.nome_tipo = nome_tipo;
    }

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public int getId_valor_atributo() {
        return id_valor_atributo;
    }

    public void setId_valor_atributo(int id_valor_atributo) {
        this.id_valor_atributo = id_valor_atributo;
    }

    public String getNome_atributo() {
        return nome_atributo;
    }

    public void setNome_atributo(String nome_atributo) {
        this.nome_atributo = nome_atributo;
    }

    public String getDescricao_valor() {
        return descricao_valor;
    }

    public void setDescricao_valor(String descricao_valor) {
        this.descricao_valor = descricao_valor;
    }
}
