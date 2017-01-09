/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import model.ClientePf;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import static util.HibernateUtil.getSessionFactory;

/**
 *
 * @author felip
 */
public class DaoCliente implements Dao{

    ClientePf cliente = new ClientePf();
    public void save(ClientePf cliente) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(cliente);
        t.commit();   
    }
    
    public ClientePf getClientePf(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (ClientePf) session.load(ClientePf.class, id);
    }
    public List<ClientePf> listcliente() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from ClientePf").list();
        t.commit();
        return lista;
        
    }
    
    public void remove(ClientePf cliente) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(cliente);
        t.commit();
    }
    
    public void update(ClientePf cliente) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(cliente);
        t.commit();
    }
    
}
  

