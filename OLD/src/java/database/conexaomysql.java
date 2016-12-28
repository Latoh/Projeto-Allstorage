package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class conexaomysql {

    private Connection conexao;
    private Statement statement;
    public PreparedStatement preStatement;

    //--------------------------------------------------------------------------
    public void open() throws ClassNotFoundException, SQLException {
        try{
        String driver;
        String url;
        String usuario;
        String senha;

        driver = "com.mysql.fabric.jdbc.FabricMySQLDriver";
        url = "jdbc:mysql://localhost/allstorage";
        usuario = "root";
        senha = "Flavia1993+";

        DriverManager.registerDriver(new com.mysql.jdbc.Driver());

        this.conexao = DriverManager.getConnection(url, usuario, senha);
        this.statement = conexao.createStatement();
        } catch (Exception error) {
            String mensagem = "Erro ao fechar a conexão.\n";
            System.out.println(mensagem + error.getMessage());
        }
    }

    //--------------------------------------------------------------------------
    public void close() {
        String mensagem;
        try {
            if (this.statement != null) {
                this.statement.close();
            }
            if (this.conexao != null) {
                this.conexao.close();
            }
            mensagem = "Conexão com o banco de dados encerrada!";
            System.out.println(mensagem);
        } catch (Exception error) {
            mensagem = "Erro ao fechar a conexão.\n";
            System.out.println(mensagem + error.getMessage());
        }
    }

    //--------------------------------------------------------------------------
    public ResultSet query(String sql, int tipo) throws ClassNotFoundException, SQLException {

        if (this.conexao == null || this.statement == null) {
            open();
        }

        ResultSet result;
        result = null;

        try {
            if (tipo == 1) {
                result = this.statement.executeQuery(sql);
            } else {
                statement.executeUpdate(sql);
            }
        } catch (Exception error) {
            String mensagem;
            mensagem = "Erro ao realizar consulta no banco de dados.";
            System.out.println(mensagem + sql + error.getMessage());
        }

        return result;
    }
    //--------------------------------------------------------------------------

    public void setQuerySQL(String sql) throws ClassNotFoundException, SQLException {
        if (this.conexao == null || this.statement == null)  open();
        

        this.preStatement = this.conexao.prepareStatement(sql);

    }

    //--------------------------------------------------------------------------
    public PreparedStatement setPreparedStatement() {

        return this.preStatement;

    }
}
