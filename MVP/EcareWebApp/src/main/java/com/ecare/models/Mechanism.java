package com.ecare.models;

import javax.validation.constraints.NotBlank;

public class Mechanism {
	private Double balance;
	private Double totalTokens;
	@NotBlank (message="Required")
	private Double exchangeTokens;
	
	public Mechanism() {
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	public Double getTotalTokens() {
		return totalTokens;
	}

	public void setTotalTokens(Double totalTokens) {
		this.totalTokens = totalTokens;
	}

	public Double getExchangeTokens() {
		return exchangeTokens;
	}

	public void setExchangeTokens(Double exchangeTokens) {
		this.exchangeTokens = exchangeTokens;
	}
	
	
}
