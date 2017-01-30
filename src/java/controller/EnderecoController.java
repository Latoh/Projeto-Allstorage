/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DaoEndereco;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.inject.Named;
import model.Endereco;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
@Named(value = "EnderecoController")
@SessionScoped
public class EnderecoController implements Serializable{
    
    
    Session session = null;
    /**
     * Creates a new instance of EnderecoController
     */
        
    public EnderecoController() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    private Endereco endereco;
    private DataModel listaEndereco;

    public DataModel getListarEndereco() {
        List<Endereco> lista = new DaoEndereco().list();
        listaEndereco = new ListDataModel(lista);
        return listaEndereco;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public String prepararAdicionarEndereco() {
        endereco = new Endereco();
        return "gerenciarEndereco";
    }

    public String prepararAlterarEndereco() {
        endereco = (Endereco) (listaEndereco.getRowData());
        return "gerenciarEndereco";
    }

    public String excluirEndereco() {
        Endereco enderecoTemp = (Endereco) (listaEndereco.getRowData());
        DaoEndereco dao = new DaoEndereco();
        dao.remove(enderecoTemp);
        return "index";
    }

    public String adicionarEndereco() {
        DaoEndereco dao = new DaoEndereco();
        dao.save(endereco);
        return "index";
    }

    public String alterarEndereco() {
        DaoEndereco dao = new DaoEndereco();
        dao.update(endereco);
        return "index";
    }
}
