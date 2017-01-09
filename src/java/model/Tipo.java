package model;
// Generated Jan 6, 2017 6:14:38 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Tipo generated by hbm2java
 */
public class Tipo  implements java.io.Serializable {


     private Integer idTipo;
     private Categoria categoria;
     private String nomeTipo;
     private Set<Produto> produtos = new HashSet<Produto>(0);
     private Set<Atributo> atributos = new HashSet<Atributo>(0);

    public Tipo() {
    }

    public Tipo(Categoria categoria, String nomeTipo, Set<Produto> produtos, Set<Atributo> atributos) {
       this.categoria = categoria;
       this.nomeTipo = nomeTipo;
       this.produtos = produtos;
       this.atributos = atributos;
    }
   
    public Integer getIdTipo() {
        return this.idTipo;
    }
    
    public void setIdTipo(Integer idTipo) {
        this.idTipo = idTipo;
    }
    public Categoria getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    public String getNomeTipo() {
        return this.nomeTipo;
    }
    
    public void setNomeTipo(String nomeTipo) {
        this.nomeTipo = nomeTipo;
    }
    public Set<Produto> getProdutos() {
        return this.produtos;
    }
    
    public void setProdutos(Set<Produto> produtos) {
        this.produtos = produtos;
    }
    public Set<Atributo> getAtributos() {
        return this.atributos;
    }
    
    public void setAtributos(Set<Atributo> atributos) {
        this.atributos = atributos;
    }




}


