/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Contato;
import java.util.List;
import model.Categoria;
import model.Cliente;
/**
 *
 * @author Daan
 */
public interface Dao {
    
    public void save();
    public List<Contato> list();
    public void remove();
    public void update();

    
    public void save(Cliente cliente);
    public Cliente getCliente(long id);
    public List<Cliente> listcliente();
    public void remove(Cliente cliente);
    public void update(Cliente cliente);

    
    public void save(Categoria categoria);
    public Categoria getCategoria(long id);
    public List<Categoria> listCategoria();
    public void remove(Categoria categoria);
    public void update(Categoria categoria);

}