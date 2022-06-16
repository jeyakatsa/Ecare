package com.ecare.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecare.models.WalletOne;
import com.ecare.models.WalletTwo;

@Service
public class ExchangeService {
	
	@Autowired
	private WalletOne walletOne;
	
	public ExchangeService(WalletOne walletOne) {
		this.walletOne = walletOne;
	}
	
	public Double getWalletOne() {
		if(walletOne.getBalanceOne() != 0.00) {
			return walletOne.getBalanceOne();
		}
		if (walletOne.getTotalTokensOne() != 0.00) {
			return walletOne.getTotalTokensOne();
		}
		return 0.00;
	}
	
	
	
	
	public WalletOne newBalanceOne (
			WalletOne balanceOne,
			WalletTwo balanceTwo) {
		balanceOne.getBalanceOne();
		balanceTwo.getBalanceTwo();
		
		if ((balanceOne == null && balanceTwo == null)
		    || (balanceOne == null || balanceOne == null)) {
			return null;
		}
		//Math to be added
		return null;
	}
	
	public WalletTwo newBalanceTwo (
			WalletOne balanceOne,
			WalletTwo balanceTwo) {
		balanceOne.getBalanceOne();
		balanceTwo.getBalanceTwo();
		
		if ((balanceOne == null && balanceTwo == null)
		    || (balanceOne == null || balanceOne == null)) {
			return null;
		}
		//Math to be added
		return null;
	}
	
	public WalletOne newTotalTokensOne (
			WalletOne totalTokensOne,
			WalletTwo totalTokensTwo) {
		totalTokensOne.getTotalTokensOne();
		totalTokensTwo.getTotalTokensTwo();
		
		if ((totalTokensOne == null && totalTokensTwo == null)
		    || (totalTokensOne == null || totalTokensTwo == null)) {
			return null;
		}
		//Math to be added
		return null;
	}
	
	public WalletTwo newTotalTokensTwo (
			WalletOne totalTokensOne,
			WalletTwo totalTokensTwo) {
		totalTokensOne.getTotalTokensOne();
		totalTokensTwo.getTotalTokensTwo();
		
		if ((totalTokensOne == null && totalTokensTwo == null)
		    || (totalTokensOne == null || totalTokensTwo == null)) {
			return null;
		}
		//Math to be added
		return null;
	}
	

}
