/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Tipo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoTipo {

    Tipo tipo = new Tipo();

    public void save(Tipo tipo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(tipo);
        t.commit();
    }

    public Tipo getTipo(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Tipo) session.load(Tipo.class, id);
    }

    public List<Tipo> list() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Tipo").list();
        t.commit();
        return lista;
    }

    public void remove(Tipo tipo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(tipo);
        t.commit();
    }

    public void update(Tipo tipo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(tipo);
        t.commit();
    }
    
    public Tipo getTipoByIdCategoria(long idCategoria) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Tipo) session.load(Tipo.class, idCategoria);
    }
}
