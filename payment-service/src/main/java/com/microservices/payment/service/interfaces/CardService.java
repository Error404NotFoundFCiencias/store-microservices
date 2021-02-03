package com.microservices.payment.service.interfaces;

import java.util.List;

import com.microservices.payment.entity.Card;



public interface CardService {
	List<Card> findCardAll();
    Card createCard(Card card);
    Card updateCard(Card card);
    Card deleteCard(Card card);
    Card getCard(Long id);
    List<Card> getClientCards(Long idClient);

    List<Card> findAllByCustomerId(Long id);
}
