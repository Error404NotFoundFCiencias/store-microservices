package com.microservices.payment.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.microservices.payment.entity.Card;


public  interface  CardRepository extends JpaRepository<Card, Long>  {
	
	@Transactional
	@Query(value="SELECT * FROM card WHERE customer_id = :customerId",
			nativeQuery=true)
	public List<Card> findByCustomerId(Long customerId );

}
