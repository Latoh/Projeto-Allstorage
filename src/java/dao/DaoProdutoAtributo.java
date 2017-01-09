/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.ProdutoAtributo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoProdutoAtributo {

    ProdutoAtributo produtoatributo = new ProdutoAtributo();

    public void save(ProdutoAtributo produtoatributo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(produtoatributo);
        t.commit();
    }

    public ProdutoAtributo getProdutoAtributo(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (ProdutoAtributo) session.load(ProdutoAtributo.class, id);

    }

    public List<ProdutoAtributo> list() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from ProdutoAtributo").list();
        t.commit();
        return lista;

    }

    public void remove(ProdutoAtributo produtoatributo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(produtoatributo);
        t.commit();
    }

    public void update(ProdutoAtributo produtoatributo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(produtoatributo);
        t.commit();
    }
}
