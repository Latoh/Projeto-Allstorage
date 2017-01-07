/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DaoAtributo;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.inject.Named;
import model.Atributo;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
@Named(value = "AtributoController")
@SessionScoped
public class AtributoController implements Serializable {

    Session session = null;

    /**
     * Creates a new instance of AtributoController
     */

    public AtributoController() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    private Atributo atributo;
    private DataModel listaAtributo;

    public DataModel getListarAtributos() {
        List<Atributo> lista = new DaoAtributo().list();
        listaAtributo = new ListDataModel(lista);
        return listaAtributo;
    }

    public Atributo getAtributo() {
        return atributo;
    }

    public void setAtributo(Atributo atributo) {
        this.atributo = atributo;
    }

    public String prepararAdicionarAtributo() {
        atributo = new Atributo();
        return "gerenciarAtributo";
    }

    public String prepararAlterarAtributo() {
        atributo = (Atributo) (listaAtributo.getRowData());
        return "gerenciarAtributo";
    }

    public String excluirAtributo() {
        Atributo atributoTemp = (Atributo) (listaAtributo.getRowData());
        DaoAtributo dao = new DaoAtributo();
        dao.remove(atributoTemp);
        return "index";
    }

    public String adicionarAtributo() {
        DaoAtributo dao = new DaoAtributo();
        dao.save(atributo);
        return "index";
    }

    public String alterarAtributo() {
        DaoAtributo dao = new DaoAtributo();
        dao.update(atributo);
        return "index";
    }

}
