package com.ecare.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.ecare.models.WalletTwo;

@Repository
public interface WalletTwoRepository extends CrudRepository<WalletTwo, Double>{
	List<WalletTwo>findAll();
}
