package com.ecare.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ecare.models.Exchange;

@Repository
public interface ExchangeRepository extends CrudRepository<Exchange, Long> {

}
