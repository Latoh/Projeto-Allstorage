package model;
// Generated Jan 6, 2017 6:14:38 PM by Hibernate Tools 4.3.1



/**
 * Contato generated by hbm2java
 */
public class Contato  implements java.io.Serializable {


     private int idContato;
     private Pessoa pessoa;
     private char tipoContato;
     private String ddd;
     private String contato;

    public Contato() {
    }

	
    public Contato(int idContato, Pessoa pessoa, char tipoContato) {
        this.idContato = idContato;
        this.pessoa = pessoa;
        this.tipoContato = tipoContato;
    }
    public Contato(int idContato, Pessoa pessoa, char tipoContato, String ddd, String contato) {
       this.idContato = idContato;
       this.pessoa = pessoa;
       this.tipoContato = tipoContato;
       this.ddd = ddd;
       this.contato = contato;
    }
   
    public int getIdContato() {
        return this.idContato;
    }
    
    public void setIdContato(int idContato) {
        this.idContato = idContato;
    }
    public Pessoa getPessoa() {
        return this.pessoa;
    }
    
    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }
    public char getTipoContato() {
        return this.tipoContato;
    }
    
    public void setTipoContato(char tipoContato) {
        this.tipoContato = tipoContato;
    }
    public String getDdd() {
        return this.ddd;
    }
    
    public void setDdd(String ddd) {
        this.ddd = ddd;
    }
    public String getContato() {
        return this.contato;
    }
    
    public void setContato(String contato) {
        this.contato = contato;
    }




}


