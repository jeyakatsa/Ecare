package com.ecare.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ecare.models.WalletOne;

@Repository
public interface WalletOneRepository extends CrudRepository<WalletOne, Long>{
	List<WalletOne>findAll();
}
