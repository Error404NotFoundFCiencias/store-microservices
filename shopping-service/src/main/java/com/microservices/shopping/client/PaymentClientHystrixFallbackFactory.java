package com.microservices.shopping.client;

import com.microservices.shopping.model.Card;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

@Component
public class PaymentClientHystrixFallbackFactory implements PaymentClient {

    @Override
    public ResponseEntity<Card> getCardById(Long id) {
        Card card = Card.builder()
                .number("")
                .state("")
                .build();
        return ResponseEntity.ok(card);
    }

    @Override
    public ResponseEntity<Card> updateBalance(Long id, Double quantity) {
        return ResponseEntity.notFound().build();
    }
}
