package contatoDAO;

import database.conexaomysql;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class contato {

    private int id_contato;
    private int id_cliente_pf;
    private int id_cliente_pj;
    private int ddd;
    private Long contatoNumero;
    private String email;
    private String numero_formatado;
    private static ArrayList<contato> listaContato = new ArrayList<contato>();

    public contato() {

    }

    public static void cadastroContatoPF(contato contato) throws ClassNotFoundException, SQLException {
        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlcontato = "INSERT INTO contato ("
                    + "id_cliente_pf, "
                    + "ddd, "
                    + "contato, "
                    + "email"
                    + ") VALUES ("
                    + "?, "
                    + "?, "
                    + "?, "
                    + "?)";
            conexao.setQuerySQL(sqlcontato);
            conexao.setPreparedStatement().setInt(1, contato.getId_cliente_pf());
            conexao.setPreparedStatement().setInt(2, contato.getDdd());
            conexao.setPreparedStatement().setLong(3, contato.getContatoNumero());
            conexao.setPreparedStatement().setString(4, contato.getEmail());
            conexao.setPreparedStatement().execute();
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public static void cadastroContatoPJ(contato contato) throws ClassNotFoundException, SQLException {
        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();

            String sqlcontato = "INSERT INTO contato ("
                    + "id_cliente_pj, "
                    + "ddd, "
                    + "contato, "
                    + "email"
                    + ") VALUES ("
                    + "?, "
                    + "?, "
                    + "?, "
                    + "?)";
            conexao.setQuerySQL(sqlcontato);
            conexao.setPreparedStatement().setInt(1, contato.getId_cliente_pj());
            conexao.setPreparedStatement().setInt(2, contato.getDdd());
            conexao.setPreparedStatement().setLong(3, contato.getContatoNumero());
            conexao.setPreparedStatement().setString(4, contato.getEmail());
            conexao.setPreparedStatement().execute();
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível cadastrar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public static void loadingContato() throws ClassNotFoundException, SQLException {

        try {
            listaContato.clear();
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            String sqlselecionapf = "SELECT "
                    + "id_contato, "
                    + "id_cliente_pf, "
                    + "id_cliente_pj, "
                    + "CONCAT(ddd,' ',contato) as numero_completo, "
                    + "email"
                    + " FROM contato";
            conexao.setQuerySQL(sqlselecionapf);
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
                contato contato = new contato();
                contato.setId_contato(resultado.getInt("id_contato"));
                contato.setId_cliente_pf(resultado.getInt("id_cliente_pf"));
                contato.setId_cliente_pj(resultado.getInt("id_cliente_pj"));
                contato.setNumero_formatado(resultado.getString("numero_completo"));
                contato.setEmail(resultado.getString("email"));
                getListaContato().add(contato);
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public static void loadingContatoPJ(int id_cliente_pj) throws ClassNotFoundException, SQLException {

        try {

            conexaomysql conexao = new conexaomysql();
            conexao.open();
            String sqlselecionapf = "SELECT "
                    + "id_cliente_pf, "
                    + "id_cliente_pj, "
                    + "CONCAT(ddd,' ',contato) as numero_completo, "
                    + "email"
                    + " FROM contato WHERE id_cliente_pj = ?";
            conexao.setQuerySQL(sqlselecionapf);
            conexao.setPreparedStatement().setInt(1, id_cliente_pj);
            conexao.setPreparedStatement().execute();
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
                contato contato = new contato();
                contato.setId_cliente_pf(resultado.getInt("id_cliente_pf"));
                contato.setId_cliente_pj(resultado.getInt("id_cliente_pj"));
                contato.setNumero_formatado(resultado.getString("numero_completo"));
                contato.setEmail(resultado.getString("email"));
                getListaContato().add(contato);
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public static void loadingContatoPF(int id_cliente_pf) throws ClassNotFoundException, SQLException {

        try {
            conexaomysql conexao = new conexaomysql();
            conexao.open();
            String sqlselecionapf = "SELECT "
                    + "id_cliente_pf, "
                    + "id_cliente_pj, "
                    + "CONCAT(ddd,' ',contato) as numero_completo, "
                    + "email"
                    + " FROM contato WHERE id_cliente_pf = ?";
            conexao.setQuerySQL(sqlselecionapf);
            conexao.setPreparedStatement().setInt(1, id_cliente_pf);
            conexao.setPreparedStatement().execute();
            ResultSet resultado = conexao.setPreparedStatement().executeQuery();
            while (resultado.next()) {
                contato contato = new contato();
                contato.setId_cliente_pf(resultado.getInt("id_cliente_pf"));
                contato.setId_cliente_pj(resultado.getInt("id_cliente_pj"));
                contato.setNumero_formatado(resultado.getString("numero_completo"));
                contato.setEmail(resultado.getString("email"));
                getListaContato().add(contato);
            }
        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível selecionar o cliente.\n" + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro na conexão com o banco de dados. \n" + ex.getMessage());
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public static ArrayList<contato> getListaContato() {
        return listaContato;
    }

    public static void setListaContato(ArrayList<contato> listaContato) {
        contato.listaContato = listaContato;
    }

    public String getNumero_formatado() {
        return numero_formatado;
    }

    public void setNumero_formatado(String numero_formatado) {
        this.numero_formatado = numero_formatado;
    }

    public int getId_contato() {
        return id_contato;
    }

    public void setId_contato(int id_contato) {
        this.id_contato = id_contato;
    }

    public int getId_cliente_pf() {
        return id_cliente_pf;
    }

    public void setId_cliente_pf(int id_cliente_pf) {
        this.id_cliente_pf = id_cliente_pf;
    }

    public int getId_cliente_pj() {
        return id_cliente_pj;
    }

    public void setId_cliente_pj(int id_clinete_pj) {
        this.id_cliente_pj = id_clinete_pj;
    }

    public int getDdd() {
        return ddd;
    }

    public void setDdd(int ddd) {
        this.ddd = ddd;
    }

    public Long getContatoNumero() {
        return contatoNumero;
    }

    public void setContatoNumero(Long contatoNumero) {
        this.contatoNumero = contatoNumero;
    }

}
