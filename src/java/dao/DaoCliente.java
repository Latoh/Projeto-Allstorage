/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Cliente;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author felip
 */
public class DaoCliente{

    Cliente cliente = new Cliente();
    public void save(Cliente cliente) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(cliente);
        t.commit();   
    }
    
    public Cliente getCliente(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Cliente) session.load(Cliente.class, id);
    }
    public List<Cliente> listcliente() {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Cliente").list();
        t.commit();
        return lista;
        
    }
    
    public void remove(Cliente cliente) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(cliente);
        t.commit();
    }
    
    public void update(Cliente cliente) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(cliente);
        t.commit();
    }
    
}
  

