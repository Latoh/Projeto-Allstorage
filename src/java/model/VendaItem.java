package model;
// Generated Jan 6, 2017 6:14:38 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * VendaItem generated by hbm2java
 */
public class VendaItem  implements java.io.Serializable {


     private int idItem;
     private Produto produto;
     private Venda venda;
     private BigDecimal qtdVenda;
     private BigDecimal precoUnit;
     private Character stItem;
     private String obsItem;
     private Date dtStatus;
     private Set<VendaItemAtributo> vendaItemAtributos = new HashSet<VendaItemAtributo>(0);

    public VendaItem() {
    }

	
    public VendaItem(int idItem, Produto produto, Venda venda) {
        this.idItem = idItem;
        this.produto = produto;
        this.venda = venda;
    }
    public VendaItem(int idItem, Produto produto, Venda venda, BigDecimal qtdVenda, BigDecimal precoUnit, Character stItem, String obsItem, Date dtStatus, Set<VendaItemAtributo> vendaItemAtributos) {
       this.idItem = idItem;
       this.produto = produto;
       this.venda = venda;
       this.qtdVenda = qtdVenda;
       this.precoUnit = precoUnit;
       this.stItem = stItem;
       this.obsItem = obsItem;
       this.dtStatus = dtStatus;
       this.vendaItemAtributos = vendaItemAtributos;
    }
   
    public int getIdItem() {
        return this.idItem;
    }
    
    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }
    public Produto getProduto() {
        return this.produto;
    }
    
    public void setProduto(Produto produto) {
        this.produto = produto;
    }
    public Venda getVenda() {
        return this.venda;
    }
    
    public void setVenda(Venda venda) {
        this.venda = venda;
    }
    public BigDecimal getQtdVenda() {
        return this.qtdVenda;
    }
    
    public void setQtdVenda(BigDecimal qtdVenda) {
        this.qtdVenda = qtdVenda;
    }
    public BigDecimal getPrecoUnit() {
        return this.precoUnit;
    }
    
    public void setPrecoUnit(BigDecimal precoUnit) {
        this.precoUnit = precoUnit;
    }
    public Character getStItem() {
        return this.stItem;
    }
    
    public void setStItem(Character stItem) {
        this.stItem = stItem;
    }
    public String getObsItem() {
        return this.obsItem;
    }
    
    public void setObsItem(String obsItem) {
        this.obsItem = obsItem;
    }
    public Date getDtStatus() {
        return this.dtStatus;
    }
    
    public void setDtStatus(Date dtStatus) {
        this.dtStatus = dtStatus;
    }
    public Set<VendaItemAtributo> getVendaItemAtributos() {
        return this.vendaItemAtributos;
    }
    
    public void setVendaItemAtributos(Set<VendaItemAtributo> vendaItemAtributos) {
        this.vendaItemAtributos = vendaItemAtributos;
    }




}


