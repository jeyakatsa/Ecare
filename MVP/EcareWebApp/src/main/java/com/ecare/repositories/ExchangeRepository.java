package com.ecare.repositories;

import org.springframework.data.repository.CrudRepository;

import com.ecare.models.Exchange;

public interface ExchangeRepository extends CrudRepository<Exchange, Double> {

}
