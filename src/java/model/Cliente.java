package model;
// Generated Jan 6, 2017 6:14:38 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Cliente generated by hbm2java
 */
public class Cliente  implements java.io.Serializable {


     private int idCliente;
     private Pessoa pessoa;
     private Set<Venda> vendas = new HashSet<Venda>(0);

    public Cliente() {
    }

	
    public Cliente(Pessoa pessoa) {
        this.pessoa = pessoa;
    }
    public Cliente(Pessoa pessoa, Set<Venda> vendas) {
       this.pessoa = pessoa;
       this.vendas = vendas;
    }
   
    public int getIdCliente() {
        return this.idCliente;
    }
    
    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }
    public Pessoa getPessoa() {
        return this.pessoa;
    }
    
    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }
    public Set<Venda> getVendas() {
        return this.vendas;
    }
    
    public void setVendas(Set<Venda> vendas) {
        this.vendas = vendas;
    }




}


