package com.microservices.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.microservices.payment.client.CustomerClient;
import com.microservices.payment.entity.Card;
import com.microservices.payment.model.Customer;
import com.microservices.payment.repository.CardRepository;
import com.microservices.payment.service.interfaces.CardService;


@Service
public class CardServiceImpl implements CardService {
	
    @Autowired
    CustomerClient customerClient;
    
    @Autowired
    CardRepository cardRepository;
    
    @Autowired
	private PasswordEncoder encoder;

	@Override
	public List<Card> findCardAll() {
		return cardRepository.findAll();
	}

	@Override
	public Card createCard(Card card) {
		 Customer customer = customerClient.getCustomer(card.getCustomerId()).getBody();
	    if (customer == null){
            return  null;
        }
	    card.setCvv(encoder.encode(card.getCvv()));
	    card.setState("CREATED");
	    return cardRepository.save(card);
	    
	 
	}

	@Override
	public Card updateCard(Card card) {
		Card cardDB = cardRepository.findById(card.getId()).orElse(null);;
        if (cardDB == null){
            return  null;
        }
        return cardRepository.save(card);
	}

	@Override
	public Card deleteCard(Card card) {
		Card cardDB = cardRepository.findById(card.getId()).orElse(null);;
        if (cardDB == null){
            return  null;
        }
        card.setState("DELETED");
        return cardRepository.save(card);
		
	}

	@Override
	public Card getCard(Long id) {
		return cardRepository.findById(id).orElse(null);
	}

	@Override
	public List<Card> getClientCards(Long idClient) {
		return cardRepository.findByCustomerId(idClient);
	}

}
