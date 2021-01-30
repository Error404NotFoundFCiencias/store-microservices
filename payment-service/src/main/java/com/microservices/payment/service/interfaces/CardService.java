package com.microservices.payment.service.interfaces;

import java.util.List;

import com.microservices.payment.entity.Card;



public interface CardService {

	public List<Card> findCardAll();

    public Card createCard(Card card);
    public Card updateCard(Card card);
    public Card deleteCard(Card card);
    public Card getCard(Long id);
    public List<Card> getClientCards(Long idClient);
}
