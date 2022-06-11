package com.ecare.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.ecare.models.WalletOne;

public interface WalletOneRepository extends CrudRepository<WalletOne, Double>{
	List<WalletOne>findAll();
}
