package controller;

import dao.DaoContato;
import dao.DaoContato;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import model.Contato;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
@Named(value = "ContatoController")
@SessionScoped
public class ContatoController implements Serializable {
    
    Session session = null;
    /**
     * Creates a new instance of ContatoController
     */
        
    public ContatoController() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    private Contato contato;
    private DataModel listaContato;

    public DataModel getListarContatos() {
        List<Contato> lista = new DaoContato().list();
        listaContato = new ListDataModel(lista);
        return listaContato;
    }

    public Contato getContato() {
        return contato;
    }

    public void setContato(Contato contato) {
        this.contato = contato;
    }

    public String prepararAdicionarContato() {
        contato = new Contato();
        return "gerenciarContato";
    }

    public String prepararAlterarContato() {
        contato = (Contato) (listaContato.getRowData());
        return "gerenciarContato";
    }

    public String excluirContato() {
        Contato contatoTemp = (Contato) (listaContato.getRowData());
        DaoContato dao = new DaoContato();
        dao.remove(contatoTemp);
        return "index";
    }

    public String adicionarContato() {
        DaoContato dao = new DaoContato();
        dao.save(contato);
        return "index";
    }

    public String alterarContato() {
        DaoContato dao = new DaoContato();
        dao.update(contato);
        return "index";
    }
    
}
