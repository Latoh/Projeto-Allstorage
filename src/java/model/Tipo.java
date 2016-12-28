package model;
// Generated Dec 13, 2016 10:09:37 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Tipo generated by hbm2java
 */
public class Tipo  implements java.io.Serializable {


     private Integer idTipo;
     private Categoria categoria;
     private String nomeTipo;
     private Set<Atributo> atributos = new HashSet<Atributo>(0);

    public Tipo() {
    }

	
    public Tipo(Categoria categoria) {
        this.categoria = categoria;
    }
    public Tipo(Categoria categoria, String nomeTipo, Set<Atributo> atributos) {
       this.categoria = categoria;
       this.nomeTipo = nomeTipo;
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
    public Set<Atributo> getAtributos() {
        return this.atributos;
    }
    
    public void setAtributos(Set<Atributo> atributos) {
        this.atributos = atributos;
    }




}


