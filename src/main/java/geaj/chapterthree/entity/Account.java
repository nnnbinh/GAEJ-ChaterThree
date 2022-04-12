package geaj.chapterthree.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String name; 
	private String city; 
	private String state; 
	private String phone; 
	String website; 
	
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
	 * @return the city 
	 */ 
	 public String getCity() { 
		 return city; 
	 } 
	 /** 
	 * @param city the city to set 
	 */ 
	 public void setCity(String city) { 
		 this.city = city; 
	 } 
	 /** 
	 * @return the state 
	 */ 
	 public String getState() { 
		 return state; 
	 } 
	 /** 
	 * @param state the state to set 
	 */ 
	 public void setState(String state) {
		 this.state = state; 
	 } 
	 /** 
	 * @return the phone 
	 */ 
	 public String getPhone() { 
		 return phone; 
	 } 
	 /** 
	 * @param phone the phone to set 
	 */ 
	 public void setPhone(String phone) { 
		 this.phone = phone; 
	 } 
	 /** 
	 * @return the website 
	 */ 
	 public String getWebsite() { 
		 return website; 
	 } 
	 /** 
	 * @param website the website to set 
	 */ 
	 public void setWebsite(String website) { 
		 this.website = website; 
	 }

}
