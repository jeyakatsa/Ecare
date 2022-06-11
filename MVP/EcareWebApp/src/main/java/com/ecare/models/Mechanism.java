package com.ecare.models;

import javax.validation.constraints.NotBlank;

public class Mechanism {
	private Double balanceOne;
	private Double balanceTwo;
	private Double totalTokensOne;
	private Double totalTokensTwo;
	@NotBlank (message="Required")
	private Double exchangeTokensOne;
	@NotBlank (message="Required")
	private Double exchangeTokensTwo;
	
	
	public Mechanism() {
	}


	public Double getBalanceOne() {
		return balanceOne;
	}


	public void setBalanceOne(Double balanceOne) {
		this.balanceOne = balanceOne;
	}


	public Double getBalanceTwo() {
		return balanceTwo;
	}


	public void setBalanceTwo(Double balanceTwo) {
		this.balanceTwo = balanceTwo;
	}


	public Double getTotalTokensOne() {
		return totalTokensOne;
	}


	public void setTotalTokensOne(Double totalTokensOne) {
		this.totalTokensOne = totalTokensOne;
	}


	public Double getTotalTokensTwo() {
		return totalTokensTwo;
	}


	public void setTotalTokensTwo(Double totalTokensTwo) {
		this.totalTokensTwo = totalTokensTwo;
	}


	public Double getExchangeTokensOne() {
		return exchangeTokensOne;
	}


	public void setExchangeTokensOne(Double exchangeTokensOne) {
		this.exchangeTokensOne = exchangeTokensOne;
	}


	public Double getExchangeTokensTwo() {
		return exchangeTokensTwo;
	}


	public void setExchangeTokensTwo(Double exchangeTokensTwo) {
		this.exchangeTokensTwo = exchangeTokensTwo;
	}
	
	



	
	
	
	

	
	
	
}
