package com.microservices.shopping.client;

import com.microservices.shopping.model.Card;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

@Component
public class PaymentClientHystrixFallbackFactory implements PaymentClient {

    @Override
    public ResponseEntity<Card> getCardById(Long id) {
        Card card = Card.builder()
                .id(-1L)
                .number("")
                .state("")
                .build();
        return ResponseEntity.ok(card);
    }
}
