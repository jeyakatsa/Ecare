package com.ecare.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="walletTwo")
public class WalletTwo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;	
	public Double balanceTwo = 5000.000;
	public Double totalTokensTwo = 5.000;
	
	public WalletTwo() {
	}
	

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}



	public Double getBalanceTwo() {
		return balanceTwo;
	}

	public void setBalanceTwo(Double balanceTwo) {
		this.balanceTwo = balanceTwo;
	}

	public Double getTotalTokensTwo() {
		return totalTokensTwo;
	}

	public void setTotalTokensTwo(Double totalTokensTwo) {
		this.totalTokensTwo = totalTokensTwo;
	}
	
	

}
