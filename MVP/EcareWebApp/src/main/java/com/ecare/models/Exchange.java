package com.ecare.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="exchange")
public class Exchange  {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@NotBlank (message="Required")
	private Double exchangeTokensOne;
	@NotBlank (message="Required")
	private Double exchangeTokensTwo;
	
	
	public Exchange() {
	}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
