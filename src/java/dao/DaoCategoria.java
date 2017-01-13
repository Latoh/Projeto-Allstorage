/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Categoria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoCategoria {

    Categoria categoria = new Categoria();

    public void save(Categoria categoria) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(categoria);
        t.commit();
    }

    public Categoria getCategoria(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Categoria) session.load(Categoria.class, id);

    }

    public List<Categoria> listCategoria() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Categoria").list();
        t.commit();
        return lista;

    }

    public void remove(Categoria categoria) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(categoria);
        t.commit();
    }

    public void update(Categoria categoria) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(categoria);
        t.commit();
    }

}
