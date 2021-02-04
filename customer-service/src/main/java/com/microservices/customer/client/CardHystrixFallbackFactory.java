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
        return ResponseEntity.ok(new ArrayList<>(0));
    }
}
