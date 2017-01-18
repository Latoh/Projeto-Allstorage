/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Fornecedor;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoFornecedor {
  
    Fornecedor fornecedor = new Fornecedor();

    public void save(Fornecedor fornecedor) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(fornecedor);
        t.commit();
    }

    public Fornecedor getFornecedor(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Fornecedor) session.load(Fornecedor.class, id);
    }

    public List<Fornecedor> list() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Fornecedor").list();
        t.commit();
        return lista;
    }

    public void remove(Fornecedor fornecedor) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(fornecedor);
        t.commit();
    }

    public void update(Fornecedor fornecedor) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(fornecedor);
        t.commit();
    }  
}
