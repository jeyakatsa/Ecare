package com.ecare.models;


import javax.validation.constraints.NotBlank;


public class Exchange  {
	
	@NotBlank (message="Required")
	private Double exchangeTokensOne;
	@NotBlank (message="Required")
	private Double exchangeTokensTwo;
	
	






}
