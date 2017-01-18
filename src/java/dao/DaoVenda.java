/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Venda;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoVenda {
    
    Venda venda = new Venda();

    public void save(Venda venda) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(venda);
        t.commit();
    }

    public Venda getVenda(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Venda) session.load(Venda.class, id);
    }

    public List<Venda> list() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Venda").list();
        t.commit();
        return lista;
    }

    public void remove(Venda venda) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(venda);
        t.commit();
    }

    public void update(Venda venda) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(venda);
        t.commit();
    } 
}
