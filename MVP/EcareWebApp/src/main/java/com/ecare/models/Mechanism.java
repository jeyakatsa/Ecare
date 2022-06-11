package com.ecare.models;

import javax.validation.constraints.NotBlank;

public class Mechanism  {
	

	@NotBlank (message="Required")
	private Double exchangeTokensOne;
	@NotBlank (message="Required")
	private Double exchangeTokensTwo;
	
	
	public Mechanism() {
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
