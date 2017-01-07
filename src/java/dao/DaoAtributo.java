/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Atributo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoAtributo {

    Atributo atributo = new Atributo();

    public void save(Atributo atributo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(atributo);
        t.commit();
    }

    public Atributo getAtributo(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Atributo) session.load(Atributo.class, id);

    }

    public List<Atributo> list() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Atributo").list();
        t.commit();
        return lista;

    }

    public void remove(Atributo atributo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(atributo);
        t.commit();
    }

    public void update(Atributo atributo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(atributo);
        t.commit();
    }
}
