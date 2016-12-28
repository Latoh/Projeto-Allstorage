
package produtoDAO;


import database.conexaomysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class categoria {

    private int id_categoria;
    private String nome_categoria;
    
     private static ArrayList<categoria> listaCategoria = new ArrayList<categoria>();
    
    public categoria() {
    }

    public void cadastrocategoria (categoria categoria) throws ClassNotFoundException, SQLException {
        try{
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            
            String sqlcategoria = "INSERT INTO categoria ("
                    + "nome_categoria"
                    + ") VALUES ("
                    + "?)";
            conexao.setQuerySQL(sqlcategoria);
            conexao.setPreparedStatement().setString(1, categoria.getNome_categoria());
            conexao.setPreparedStatement().execute();
            conexao.close();
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar a categoria.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }

        public static void loadingCategoria() throws ClassNotFoundException, SQLException {

        try {
            listaCategoria.clear();
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlselecionacategoria = "SELECT id_categoria,"
                            +"nome_categoria FROM categoria";
            
            conexao.setQuerySQL(sqlselecionacategoria);
            conexao.setPreparedStatement().execute();
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
                
                categoria novacategoria = new categoria();
                novacategoria.setId_categoria(resultado.getInt("id_categoria"));
                novacategoria.setNome_categoria(resultado.getString("nome_categoria"));
                getListaCategoria().add(novacategoria);
            }

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

        public void exibircategoria (int id_categoria) throws ClassNotFoundException, SQLException {
        try{
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            
            String sqlexibircategoria = "SELECT id_categoria FROM categoria" 
                    + "WHERE id_categoria = "
                    + "?)";
            conexao.setQuerySQL(sqlexibircategoria);
            conexao.setPreparedStatement().setInt(1, id_categoria);;
            conexao.setPreparedStatement().execute();
            conexao.close();
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar a categoria.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }
        
         public static void alterarcategoria (categoria categoria) throws ClassNotFoundException, SQLException {
        try{
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            
            String sqlexibircategoria = "UPDATE categoria "
                    + "SET nome_categoria = ?" 
                    + "WHERE id_categoria = ?";
            conexao.setQuerySQL(sqlexibircategoria);
            conexao.setPreparedStatement().setString(1, categoria.getNome_categoria());
            conexao.setPreparedStatement().setInt(2, categoria.getId_categoria());
            conexao.setPreparedStatement().execute();
            
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar a categoria.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }

    }
    
        

    
    
    
    public static ArrayList<categoria> getListaCategoria() {
        return listaCategoria;
    }

    public static void setListaCategoria(ArrayList<categoria> listaCategoria) {
        categoria.listaCategoria = listaCategoria;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getNome_categoria() {
        return nome_categoria;
    }

    public void setNome_categoria(String nome_categoria) {
        this.nome_categoria = nome_categoria;
    }
    
}

