package dao;

/**
 *
 * @author Daan
 */
import java.util.List;
import model.Contato;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class DaoContato {

    Contato contato = new Contato();

    public void save(Contato contato) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.save(contato);
        t.commit();
    }

    public Contato getContato(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (Contato) session.load(Contato.class, id);
    }

    public List<Contato> list() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Contato").list();
        t.commit();
        return lista;

    }

    public void remove(Contato contato) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.delete(contato);
        t.commit();
    }

    public void update(Contato contato) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        session.update(contato);
        t.commit();
    }

}
