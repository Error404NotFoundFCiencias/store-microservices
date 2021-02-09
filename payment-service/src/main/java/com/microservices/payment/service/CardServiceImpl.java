package com.microservices.payment.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.microservices.payment.client.CustomerClient;
import com.microservices.payment.entity.Card;
import com.microservices.payment.model.Customer;
import com.microservices.payment.repository.CardRepository;
import com.microservices.payment.service.interfaces.CardService;


@Service
public class CardServiceImpl implements CardService {

	@Qualifier("com.microservices.payment.client.CustomerClient")
	@Autowired
    CustomerClient customerClient;
    
    @Autowired
    CardRepository cardRepository;

    @Autowired
	private PasswordEncoder encoder;

	@Override
	public List<Card> findCardAll() {
		return cardRepository.findAllByState("CREATED");
	}

	@Override
	public Card createCard(Card card) {
		Customer customer = customerClient.getCustomer(card.getCustomerId()).getBody();

	    if (customer == null || cardRepository.existsByNumber(card.getNumber())){
            return  null;
        }

	    card.setCvv(encoder.encode(card.getCvv()));
	    card.setState("CREATED");
	    card.setId(null);
	    return cardRepository.save(card);
	}

	@Override
	public Card updateCard(Card card) {
        if (!cardRepository.existsById(card.getId())){
            return  null;
        }
		card.setCvv(encoder.encode(card.getCvv()));
        card.setState("CREATED");
        return cardRepository.save(card);
	}

	@Override
	public Card deleteCard(Long id) {
		Card cardDB = getCard(id);
        if (cardDB == null){
            return  null;
        }
        cardDB.setState("DELETED");
        return cardRepository.save(cardDB);
	}

	@Override
	public Card getCard(Long id) {
		Optional<Card> card = cardRepository.findById(id);
		card.ifPresent(c -> c.setCustomer( customerClient.getCustomer(c.getCustomerId()).getBody() ));
		return card.orElse(null);
	}

	@Override
	public List<Card> findAllByCustomerId(Long id) {
		Customer customer = customerClient.getCustomer(id).getBody();
		if (customer == null ) return null;
		List<Card> cards = cardRepository.findAllByCustomerId(id);
		for (Card card : cards) {
			card.setCustomer(customer);
		}
		return cardRepository.findAllByCustomerId(id);
	}

	@Override
	public int updateBalance(Long id, Double quantity) {
		return cardRepository.setBalance(id, quantity);
	}

}
