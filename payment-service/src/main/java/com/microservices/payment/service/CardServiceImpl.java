package com.microservices.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.microservices.payment.client.CustomerClient;
import com.microservices.payment.entity.Card;
import com.microservices.payment.service.interfaces.CardService;


public class CardServiceImpl implements CardService {
	
    @Autowired
    CustomerClient customerClient;

	@Override
	public List<Card> findCardAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Card createCard(Card card) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Card updateCard(Card card) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Card deleteCard(Card card) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Card getCard(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Card> getClientCards(Long idClient) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
