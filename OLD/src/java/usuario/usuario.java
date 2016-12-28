package usuario;

import database.conexaomysql;
import java.sql.ResultSet;
import java.sql.SQLException;

public class usuario {    

    public usuario() {
    }

    public static boolean autentica(String login, String senha) throws ClassNotFoundException, SQLException{
        boolean retorno = false;
        ResultSet resultAutentica;

        conexaomysql myCon = new conexaomysql();
        myCon.open();
        String sql = "SELECT id_usuario FROM usuario where login = ? AND senha = MD5(?)";

        myCon.setQuerySQL(sql);
        myCon.setPreparedStatement().setString(1, login);
        myCon.setPreparedStatement().setString(2, senha);

        resultAutentica = myCon.setPreparedStatement().executeQuery();

        if (resultAutentica.next()) {
            retorno = true;
        }
        return retorno;
        
    }
}
