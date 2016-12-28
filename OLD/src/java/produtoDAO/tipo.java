package produtoDAO;

import database.conexaomysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class tipo {

    private int id_tipo;
    private String nome_tipo;
    private int id_categoria;
    private static ArrayList<tipo> listaTipo = new ArrayList<tipo>();
    
    public tipo() {

    }

    public void cadastrotipo (tipo tipo) throws ClassNotFoundException, SQLException {
        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            
            String sqltipo = "INSERT INTO tipo ("
                    + "nome_tipo, "
                    + "id_categoria"
                    + ") VALUES ("
                    + "?, ?)";
            conexao.setQuerySQL(sqltipo);
            conexao.setPreparedStatement().setString(1, tipo.getNome_tipo());
            conexao.setPreparedStatement().setInt(2, tipo.getId_categoria());
            conexao.setPreparedStatement().execute();
            
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o tipo.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }
    
    public void selecionatipo (int id_categoria) throws ClassNotFoundException, SQLException {
        try {
            listaTipo.clear();
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            
            String sqltipo = "SELECT "
                    + "id_tipo, "
                    + "nome_tipo "
                    + "FROM tipo "
                    + "WHERE id_categoria = ?";
            conexao.setQuerySQL(sqltipo);
            conexao.setPreparedStatement().setInt(1, id_categoria);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
            tipo tipo = new tipo();
            tipo.setId_tipo(resultado.getInt("id_tipo"));
            tipo.setNome_tipo(resultado.getString("nome_tipo"));
            getListaTipo().add(tipo);
            
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o tipo.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }
    
 public static void loadingTipo() throws ClassNotFoundException, SQLException {

        try {
            listaTipo.clear();
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlselecionaTipo = "SELECT id_tipo,"
                            +"nome_tipo FROM tipo";
            
            conexao.setQuerySQL(sqlselecionaTipo);
            conexao.setPreparedStatement().execute();
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
                
                tipo novotipo = new tipo();
                novotipo.setId_tipo(resultado.getInt("id_tipo"));
                novotipo.setNome_tipo(resultado.getString("nome_tipo"));
                getListaTipo().add(novotipo);
            }

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }
 
 
 
   public static void alterartipo (tipo tipo) throws ClassNotFoundException, SQLException {
        try{
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            
            String sqlexibirtipo = "UPDATE tipo "
                    + "SET nome_tipo = ?" 
                    + "WHERE id_tipo = ?";
            conexao.setQuerySQL(sqlexibirtipo);
            conexao.setPreparedStatement().setString(1, tipo.getNome_tipo());
            conexao.setPreparedStatement().setInt(2, tipo.getId_tipo());
            conexao.setPreparedStatement().execute();
            
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar a categoria.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }
    
    
    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getNome_tipo() {
        return nome_tipo;
    }

    public void setNome_tipo(String nome_tipo) {
        this.nome_tipo = nome_tipo;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public static ArrayList<tipo> getListaTipo() {
        return listaTipo;
    }

    public static void setListaTipo(ArrayList<tipo> listaTipo) {
        tipo.listaTipo = listaTipo;
    }
    
    
}
