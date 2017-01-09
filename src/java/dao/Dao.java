/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Contato;
import java.util.List;
import model.ClientePf;
/**
 *
 * @author Daan
 */
public interface Dao {
    
    public void save(Contato contato);
    public Contato getContato(long id);
    public List<Contato> list();
    public void remove(Contato contato);
    public void update(Contato contato);

    
    public void save(ClientePf cliente);
    public ClientePf getClientePf(long id);
    public List<ClientePf> listcliente();
    public void remove(ClientePf cliente);
    public void update(ClientePf cliente);

}