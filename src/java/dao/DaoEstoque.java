/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Estoque;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoEstoque {

    Estoque estoque = new Estoque();

    public void save(Estoque estoque) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(estoque);
        t.commit();
    }

    public Estoque getEstoque(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Estoque) session.load(Estoque.class, id);
    }

    public List<Estoque> list() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Estoque").list();
        t.commit();
        return lista;
    }

    public void remove(Estoque estoque) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(estoque);
        t.commit();
    }

    public void update(Estoque estoque) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(estoque);
        t.commit();
    }

}
