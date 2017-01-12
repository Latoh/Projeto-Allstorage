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
import dao.DaoCategoria;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import model.Categoria;
import org.hibernate.Session;
import util.HibernateUtil;
    
@Named(value = "CategoriaController")
@SessionScoped
public class CategoriaController implements Serializable {
    
    Session session = null;
    /**
     * Creates a new instance f ContatoController
     */
        
    public CategoriaController() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    private Categoria categoria;
    private DataModel listaCategoria;

    public DataModel getListarCategoria() {          
        List<Categoria> lista = new DaoCategoria().listCategoria();
        listaCategoria = new ListDataModel(lista);
        return listaCategoria;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public String prepararAdicionarCategoria() {
        categoria = new Categoria();
        return "gerenciarCategoria";
    }

    public String prepararAlterarCategoria() {
        categoria = (Categoria) (listaCategoria.getRowData());
        return "gerenciarCategoria";
    }

    public String excluirCategoria() {
        Categoria categoriaTemp = (Categoria) (listaCategoria.getRowData());
        DaoCategoria dao = new DaoCategoria();
        dao.remove(categoriaTemp);
        return "index";
    }

    public String adicionarCategoria() {
        DaoCategoria dao = new DaoCategoria();
        dao.save(categoria);
        return "index";
    }

    public String alterarCliente() {
        DaoCategoria dao = new DaoCategoria();
        dao.update(categoria);
        return "index";
    }
    
}





    

