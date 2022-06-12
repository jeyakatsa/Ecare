package com.ecare.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecare.models.Exchange;
import com.ecare.models.WalletOne;
import com.ecare.models.WalletTwo;
import com.ecare.repositories.ExchangeRepository;
import com.ecare.repositories.WalletOneRepository;
import com.ecare.repositories.WalletTwoRepository;

@Service
public class ExchangeService {
	
//	@Autowired
//	private MechanismRepository mRepo;
	@Autowired
	private WalletOneRepository wOneRepo;
	@Autowired
	private WalletTwoRepository wTwoRepo;	
	
	public ExchangeService(
			WalletOneRepository wOneRepo,
			WalletTwoRepository wTwoRepo) {
		this.wOneRepo = wOneRepo;
		this.wTwoRepo = wTwoRepo;
	}
	
	public List<WalletOne> getWalletOne(){
		return wOneRepo.findAll();
	}
	
	public List<WalletTwo> getWalletTwo(){
		return wTwoRepo.findAll();
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
