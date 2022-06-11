package com.ecare.repositories;

import org.springframework.data.repository.CrudRepository;
import java.util.List;

import com.ecare.models.WalletTwo;

public interface WalletTwoRepository extends CrudRepository<WalletTwo, Double>{
	List<WalletTwo>findAll();
}
