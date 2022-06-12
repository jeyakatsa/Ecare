package com.ecare.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="walletOne")
public class WalletOne {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;	
	public Double balanceOne = 10000.000;
	public Double totalTokensOne = 10.000;
	
	public WalletOne() {
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Double getBalanceOne() {
		return balanceOne;
	}

	public void setBalanceOne(Double balanceOne) {
		this.balanceOne = balanceOne;
	}

	public Double getTotalTokensOne() {
		return totalTokensOne;
	}

	public void setTotalTokensOne(Double totalTokensOne) {
		this.totalTokensOne = totalTokensOne;
	}
	
	

}
