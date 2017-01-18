/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Pessoa;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoPessoa {
  
    Pessoa pessoa = new Pessoa();

    public void save(Pessoa pessoa) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(pessoa);
        t.commit();
    }

    public Pessoa getPessoa(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Pessoa) session.load(Pessoa.class, id);
    }

    public List<Pessoa> list() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Pessoa").list();
        t.commit();
        return lista;
    }

    public void remove(Pessoa pessoa) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(pessoa);
        t.commit();
    }

    public void update(Pessoa pessoa) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(pessoa);
        t.commit();
    }  
}
