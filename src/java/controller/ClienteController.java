/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author felip
 */

import dao.DaoCliente;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import model.Cliente;
import org.hibernate.Session;
import util.HibernateUtil;
    
@Named(value = "ClienteController")
@SessionScoped
public class ClienteController implements Serializable {
    
    Session session = null;
    /**
     * Creates a new instance f ContatoController
     */
        
    public ClienteController() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    private Cliente cliente;
    private DataModel listaCliente;

    public DataModel getListarClientes() {          
        List<Cliente> lista = new DaoCliente().listcliente();
        listaCliente = new ListDataModel(lista);
        return listaCliente;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String prepararAdicionarCliente() {
        cliente = new Cliente();
        return "gerenciarCliente";
    }

    public String prepararAlterarCliente() {
        cliente = (Cliente) (listaCliente.getRowData());
        return "gerenciarCliente";
    }

    public String excluirCliente() {
        Cliente clienteTemp = (Cliente) (listaCliente.getRowData());
        DaoCliente dao = new DaoCliente();
        dao.remove(clienteTemp);
        return "Index";
    }

    public String adicionarCliente() {
        DaoCliente dao = new DaoCliente();
        dao.save(cliente);
        return "Index";
    }

    public String alterarCliente() {
        DaoCliente dao = new DaoCliente();
        dao.update(cliente);
        return "Index";
    }
    
}


