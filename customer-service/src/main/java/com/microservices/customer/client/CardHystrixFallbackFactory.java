package com.microservices.customer.client;

import com.microservices.customer.model.Card;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CardHystrixFallbackFactory implements CardClient {

    @Override
    public ResponseEntity<List<Card>> listAllInvoicesByCustomerId(Long id) {
        Card card = Card.builder()
                .cvv("none")
                .number("")
                .id((long) -1)
                .build();
        ArrayList<Card> cards = new ArrayList<>(1);
        cards.add(card);
        return ResponseEntity.ok(cards);
    }
}
