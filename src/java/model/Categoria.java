package model;
// Generated Jan 6, 2017 6:14:38 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     private Integer idCategoria;
     private String nomeCategoria;
     private Boolean flEstoque;
     private String classe;
     private Set<Tipo> tipos = new HashSet<Tipo>(0);

    public Categoria() {
    }

    public Categoria(String nomeCategoria, Boolean flEstoque, String classe, Set<Tipo> tipos) {
       this.nomeCategoria = nomeCategoria;
       this.flEstoque = flEstoque;
       this.classe = classe;
       this.tipos = tipos;
    }
   
    public Integer getIdCategoria() {
        return this.idCategoria;
    }
    
    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }
    public String getNomeCategoria() {
        return this.nomeCategoria;
    }
    
    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }
    public Boolean getFlEstoque() {
        return this.flEstoque;
    }
    
    public void setFlEstoque(Boolean flEstoque) {
        this.flEstoque = flEstoque;
    }
    public String getClasse() {
        return this.classe;
    }
    
    public void setClasse(String classe) {
        this.classe = classe;
    }
    public Set<Tipo> getTipos() {
        return this.tipos;
    }
    
    public void setTipos(Set<Tipo> tipos) {
        this.tipos = tipos;
    }




}


