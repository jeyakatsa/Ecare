package com.ecare.models;

import org.springframework.context.annotation.Configuration;

@Configuration
public class WalletOne {
	

	public Double balanceOne = 10000.000;
	public Double totalTokensOne = 10.000;
	
	public WalletOne() {
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
