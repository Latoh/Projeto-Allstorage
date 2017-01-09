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

import dao.DaoContato;
import dao.DaoCliente;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import model.ClientePf;
import model.Contato;
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
    
    private ClientePf cliente;
    private DataModel listaCliente;

    public DataModel getListarClientes() {          
        List<ClientePf> lista = new DaoCliente().listcliente();
        listaCliente = new ListDataModel(lista);
        return listaCliente;
    }

    public ClientePf getCliente() {
        return cliente;
    }

    public void setCliente(ClientePf cliente) {
        this.cliente = cliente;
    }

    public String prepararAdicionarCliente() {
        cliente = new ClientePf();
        return "gerenciarClientePf";
    }

    public String prepararAlterarCliente() {
        cliente = (ClientePf) (listaCliente.getRowData());
        return "gerenciarClientePf";
    }

    public String excluirCliente() {
        ClientePf clienteTemp = (ClientePf) (listaCliente.getRowData());
        DaoCliente dao = new DaoCliente();
        dao.remove(clienteTemp);
        return "index";
    }

    public String adicionarCliente() {
        DaoCliente dao = new DaoCliente();
        dao.save(cliente);
        return "index";
    }

    public String alterarCliente() {
        DaoCliente dao = new DaoCliente();
        dao.update(cliente);
        return "index";
    }
    
}


