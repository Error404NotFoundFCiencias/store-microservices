package com.microservices.payment.repository;

import com.microservices.payment.entity.Card;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public  interface  CardRepository extends JpaRepository<Card, Long>  {

	List<Card> findAllByCustomerId(Long customerId);

	List<Card> findAllByState(String state);

	boolean existsByNumber(String number);

	boolean existsById(Long id);

	@Modifying
	@Transactional
	@Query("update Card c set c.balance = c.balance + :balance where c.id = :id")
	int setBalance(Long id, Double balance);

}
