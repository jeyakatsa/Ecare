package com.ecare.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecare.models.Mechanism;
import com.ecare.models.WalletOne;
import com.ecare.models.WalletTwo;
import com.ecare.repositories.MechanismRepository;
import com.ecare.repositories.WalletOneRepository;
import com.ecare.repositories.WalletTwoRepository;

@Service
public class MechanismService {
	
//	@Autowired
//	private MechanismRepository mRepo;
	@Autowired
	private WalletOneRepository wOneRepo;
	@Autowired
	private WalletTwoRepository wTwoRepo;	
	
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
		else {
			return this.wOneRepo.save(balanceOne);
			
		}
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
		else {
			return this.wTwoRepo.save(balanceTwo);
			
		}
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
		else {
			return this.wOneRepo.save(totalTokensOne);
			
		}
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
		else {
			return this.wTwoRepo.save(totalTokensTwo);
			
		}
	}
	

}
