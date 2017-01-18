/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.VendaItem;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoVendaItem {

    VendaItem vendaitem = new VendaItem();

    public void save(VendaItem vendaitem) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(vendaitem);
        t.commit();
    }

    public VendaItem getVendaItem(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (VendaItem) session.load(VendaItem.class, id);
    }

    public List<VendaItem> list() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from VendaItem").list();
        t.commit();
        return lista;
    }

    public void remove(VendaItem vendaitem) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(vendaitem);
        t.commit();
    }

    public void update(VendaItem vendaitem) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(vendaitem);
        t.commit();
    }    
}
