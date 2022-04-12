package geaj.chapterthree.entity;

import java.util.Date; 

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Opportunity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String name; 
	private double amount; 
	private String stageName; 
	private int probability; 
	private Date closeDate; 
	private int orderNumber; 
	private Long accountId;
	
	/** 
	* @return the id 
	*/ 
	public Long getId() { 
		return id; 
	} 
	/** 
	* @return the name 
	*/ 
	public String getName() { 
		return name; 
	} 
	/** 
	* @param name the name to set 
	*/ 
	public void setName(String name) {
		this.name = name; 
	 } 
	 /** 
	 * @return the amount 
	 */ 
	 public double getAmount() { 
		 return amount; 
	 } 
	 /** 
	 * @param amount the amount to set 
	 */ 
	 public void setAmount(double amount) { 
		 this.amount = amount; 
	 } 
	 /** 
	 * @return the stageName 
	 */ 
	 public String getStageName() { 
		 return stageName; 
	 } 
	 /** 
	 * @param stageName the stageName to set 
	 */ 
	 public void setStageName(String stageName) { 
		 this.stageName = stageName; 
	 } 
	 /** 
	 * @return the probability 
	 */ 
	 public int getProbability() { 
		 return probability; 
	 } 
	 /** 
	 * @param probability the probability to set 
	 */ 
	 public void setProbability(int probability) { 
		 this.probability = probability; 
	 } 
	 /** 
	 * @return the closeDate 
	 */ 
	 public Date getCloseDate() {
		 return closeDate; 
	 } 
	 /** 
	 * @param closeDate the closeDate to set 
	 */ 
	 public void setCloseDate(Date closeDate) { 
		 this.closeDate = closeDate; 
	 } 
	 /** 
	 * @return the orderNumber 
	 */ 
	 public int getOrderNumber() { 
		 return orderNumber; 
	 } 
	 /** 
	 * @param orderNumber the orderNumber to set 
	 */ 
	 public void setOrderNumber(int orderNumber) { 
		 this.orderNumber = orderNumber; 
	 } 
	 /** 
	 * @return the accountId 
	 */ 
	 public Long getAccountId() { 
		 return accountId; 
	 } 
	 /** 
	 * @param accountId the accountId to set 
	 */ 
	 public void setAccountId(Long accountId) { 
		 this.accountId = accountId; 
	 }
}
