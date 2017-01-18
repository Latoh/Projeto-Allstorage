/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Endereco;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoEndereco {

Endereco endereco = new Endereco();

    public void save(Endereco endereco) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(endereco);
        t.commit();
    }

    public Endereco getEndereco(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Endereco) session.load(Endereco.class, id);
    }

    public List<Endereco> list() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Endereco").list();
        t.commit();
        return lista;
    }

    public void remove(Endereco endereco) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(endereco);
        t.commit();
    }

    public void update(Endereco endereco) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(endereco);
        t.commit();
    }
}