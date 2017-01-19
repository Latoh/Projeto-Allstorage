/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DaoTipo;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.inject.Named;
import model.Tipo;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
@Named(value = "TipoController")
@SessionScoped
public class TipoController implements Serializable{
    
    Session session = null;
    /**
     * Creates a new instance of TipoController
     */
        
    public TipoController() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    private Tipo tipo;
    private DataModel listaTipo;

    public DataModel getListarTipo() {          
        List<Tipo> lista = new DaoTipo().list();
        listaTipo = new ListDataModel(lista);
        return listaTipo;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public Tipo getTipoById(long id) {
        DaoTipo daotipo = new DaoTipo();
        tipo = daotipo.getTipo(id);
        return tipo;
    }
    
    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }

    public String prepararAdicionarTipo() {
        tipo = new Tipo();
        return "gerenciarTipo";
    }

    public String prepararAlterarTipo() {
        tipo = (Tipo) (listaTipo.getRowData());
        return "gerenciarTipo";
    }

    public String excluirTipo() {
        Tipo tipoTemp = (Tipo) (listaTipo.getRowData());
        DaoTipo dao = new DaoTipo();
        dao.remove(tipoTemp);
        return "index";
    }

    public String adicionarTipo() {
        DaoTipo dao = new DaoTipo();
        dao.save(tipo);
        return "index";
    }

    public String alterarTipo() {
        DaoTipo dao = new DaoTipo();
        dao.update(tipo);
        return "index";
    }
    
}
