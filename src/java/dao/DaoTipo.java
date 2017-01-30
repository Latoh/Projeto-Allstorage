/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;
import model.Categoria;
import model.Tipo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import util.HibernateUtil;

/**
 *
 * @author Daan
 */
public class DaoTipo {

    Tipo tipo = new Tipo();
    public DataModel lista;

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
    
    public List<Tipo> getTipoByIdCategoria(long idCategoria) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = session.beginTransaction();
        
        Long.toString(idCategoria);
        
        String hql = "from Tipo t INNER JOIN t.categoria where t.categoria.idCategoria = :idCat";
        Query consultarHibernate = session.createQuery(hql);
        consultarHibernate.setParameter("idCat", idCategoria);
     
        List<Object[]> objs = consultarHibernate.list();   
        // Aqui vai ser manipulado o objs que são recebidos pelo Hibernate...
        List <Tipo> listaTiposPorCategoria = new ArrayList<Tipo>();
        for (Object[] o : objs) {
             Object[] aux = o;
            /*Para cada objeto recebido é adicionado uma posição do array 
            depois é setado para cada objeto pertecentente ao retorno */
             Tipo tipo = new Tipo();
             Categoria categoria = new Categoria();
             
             tipo = ((Tipo)aux[0]);
             categoria = ((Categoria) aux[1]);
     
             listaTiposPorCategoria.add(tipo);
        }

        System.out.println("TESTE TIPO SELECIONADO 1 " + listaTiposPorCategoria.get(0).getNomeTipo());
        System.out.println("TESTE TIPO SELECIONADO 2 "+ listaTiposPorCategoria.get(0).getIdTipo());
        
        return listaTiposPorCategoria;
    }
}
