/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.VendaItemAtributo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoVendaItemAtributo {

VendaItemAtributo vendaitematributo = new VendaItemAtributo();

    public void save(VendaItemAtributo vendaitematributo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(vendaitematributo);
        t.commit();
    }

    public VendaItemAtributo getVendaItemAtributo(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (VendaItemAtributo) session.load(VendaItemAtributo.class, id);
    }

    public List<VendaItemAtributo> list() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from VendaItemAtributo").list();
        t.commit();
        return lista;
    }

    public void remove(VendaItemAtributo vendaitematributo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(vendaitematributo);
        t.commit();
    }

    public void update(VendaItemAtributo vendaitematributo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(vendaitematributo);
        t.commit();
    }     
}
