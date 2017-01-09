/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DaoProduto;
import java.io.Serializable;
import java.util.List;
import javax.enterprise.context.SessionScoped;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import javax.inject.Named;
import model.Produto;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
@Named(value = "ProdutoController")
@SessionScoped
public class ProdutoController implements Serializable{

    Session session = null;
    /**
     * Creates a new instance of ProdutoController
     */
    public ProdutoController() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    private Produto produto;
    private DataModel listaProduto;

    public DataModel getListarProdutos() {
        List<Produto> lista = new DaoProduto().list();
        listaProduto = new ListDataModel(lista);
        return listaProduto;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public String prepararAdicionarProduto() {
        produto = new Produto();
        return "gerenciarProduto";
    }

    public String prepararAlterarProduto() {
        produto = (Produto) (listaProduto.getRowData());
        return "gerenciarProduto";
    }

    public String excluirProduto() {
        Produto produtoTemp = (Produto) (listaProduto.getRowData());
        DaoProduto dao = new DaoProduto();
        dao.remove(produtoTemp);
        return "index";
    }

    public String adicionarProduto() {
        DaoProduto dao = new DaoProduto();
        dao.save(produto);
        return "index";
    }

    public String alterarProduto() {
        DaoProduto dao = new DaoProduto();
        dao.update(produto);
        return "index";
    }
}
