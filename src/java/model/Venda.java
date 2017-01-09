package model;
// Generated Jan 6, 2017 6:14:38 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Venda generated by hbm2java
 */
public class Venda  implements java.io.Serializable {


     private Integer idVenda;
     private Cliente cliente;
     private Date dtVenda;
     private Character stVenda;
     private Date dtStatus;
     private BigDecimal vlrTotal;
     private Date dtPrevista;
     private Set<VendaItem> vendaItems = new HashSet<VendaItem>(0);

    public Venda() {
    }

	
    public Venda(Cliente cliente, Date dtVenda) {
        this.cliente = cliente;
        this.dtVenda = dtVenda;
    }
    public Venda(Cliente cliente, Date dtVenda, Character stVenda, Date dtStatus, BigDecimal vlrTotal, Date dtPrevista, Set<VendaItem> vendaItems) {
       this.cliente = cliente;
       this.dtVenda = dtVenda;
       this.stVenda = stVenda;
       this.dtStatus = dtStatus;
       this.vlrTotal = vlrTotal;
       this.dtPrevista = dtPrevista;
       this.vendaItems = vendaItems;
    }
   
    public Integer getIdVenda() {
        return this.idVenda;
    }
    
    public void setIdVenda(Integer idVenda) {
        this.idVenda = idVenda;
    }
    public Cliente getCliente() {
        return this.cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public Date getDtVenda() {
        return this.dtVenda;
    }
    
    public void setDtVenda(Date dtVenda) {
        this.dtVenda = dtVenda;
    }
    public Character getStVenda() {
        return this.stVenda;
    }
    
    public void setStVenda(Character stVenda) {
        this.stVenda = stVenda;
    }
    public Date getDtStatus() {
        return this.dtStatus;
    }
    
    public void setDtStatus(Date dtStatus) {
        this.dtStatus = dtStatus;
    }
    public BigDecimal getVlrTotal() {
        return this.vlrTotal;
    }
    
    public void setVlrTotal(BigDecimal vlrTotal) {
        this.vlrTotal = vlrTotal;
    }
    public Date getDtPrevista() {
        return this.dtPrevista;
    }
    
    public void setDtPrevista(Date dtPrevista) {
        this.dtPrevista = dtPrevista;
    }
    public Set<VendaItem> getVendaItems() {
        return this.vendaItems;
    }
    
    public void setVendaItems(Set<VendaItem> vendaItems) {
        this.vendaItems = vendaItems;
    }




}


