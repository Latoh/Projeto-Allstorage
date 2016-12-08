
package allStorageWebservice;

import clienteDAO.cliente;
import contatoDAO.contato;
import enderecoDAO.endereco;
import estoqueDAO.estoque;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import pedidoDAO.pedido;
import usuario.usuario;

/**
 *
 * @author Daan
 */
@WebService(serviceName = "allstorageWS")
public class allstorageWS {

    
    @WebMethod(operationName = "listarClientesFisicos")
    public ArrayList<cliente> listarClientesFisicos() {
        try {
            cliente.loadingPF();
        } catch (Exception ex) {
            System.out.println("Error no WS "+ ex.getMessage());
        } 
        return cliente.getListaCliente();
    }
    
    @WebMethod(operationName = "listarEnderecos")
    public ArrayList<endereco> listarEnderecos() {
        try {
            endereco.loadingEndereco();
        } catch (Exception ex) {
            System.out.println("Error no WS "+ ex.getMessage());
        } 
        return endereco.getListaEndereco();
    }
    
    @WebMethod(operationName = "listarContatos")
    public ArrayList<contato> listarContatos() {
        try {
            contato.loadingContato();
        } catch (Exception ex) {
            System.out.println("Error no WS "+ ex.getMessage());
        } 
        return contato.getListaContato();
    }
    
    @WebMethod(operationName = "listarEstoque")
    public ArrayList<estoque> listarEstoque() {
        try {
            estoque.selecionaestoqueApp();
        } catch (Exception ex) {
            System.out.println("Error no WS "+ ex.getMessage());
        } 
        return estoque.getListaEstoque();
    }
    
    @WebMethod(operationName = "listarPedido")
    public ArrayList<pedido> listarPedido() {
        try {
            pedido.selecionaPedido();
        } catch (Exception ex) {
            System.out.println("Error no WS "+ ex.getMessage());
        } 
        return pedido.getListapedidos();
    }
 
    @WebMethod(operationName = "loginAllstorage")
    public boolean loginAllstorage (@WebParam(name = "login")String login,
            @WebParam (name="password") String senha){
        boolean logado = false;
        try {
            if(usuario.autentica(login, senha)){
                logado = true;
            }
        } catch (Exception ex) {
            System.out.println("Exceção na classe de login: "+ex.getMessage());
        } 
        return logado;
    }
}
