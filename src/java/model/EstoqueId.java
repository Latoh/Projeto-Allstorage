package model;
// Generated Jan 6, 2017 6:14:38 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * EstoqueId generated by hbm2java
 */
public class EstoqueId  implements java.io.Serializable {

     private int idProduto;
     private Date dtInicio;

    public EstoqueId() {
    }

    public EstoqueId(int idProduto, Date dtInicio) {
       this.idProduto = idProduto;
       this.dtInicio = dtInicio;
    }
   
    public int getIdProduto() {
        return this.idProduto;
    }
    
    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }
    public Date getDtInicio() {
        return this.dtInicio;
    }
    
    public void setDtInicio(Date dtInicio) {
        this.dtInicio = dtInicio;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof EstoqueId) ) return false;
		 EstoqueId castOther = ( EstoqueId ) other; 
         
		 return (this.getIdProduto()==castOther.getIdProduto())
 && ( (this.getDtInicio()==castOther.getDtInicio()) || ( this.getDtInicio()!=null && castOther.getDtInicio()!=null && this.getDtInicio().equals(castOther.getDtInicio()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getIdProduto();
         result = 37 * result + ( getDtInicio() == null ? 0 : this.getDtInicio().hashCode() );
         return result;
   }   


}


