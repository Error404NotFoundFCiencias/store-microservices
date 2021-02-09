package com.microservices.shopping.client;

import com.microservices.shopping.model.Card;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "payment-service", fallback = PaymentClientHystrixFallbackFactory.class)
public interface PaymentClient {

    @GetMapping("/payment-card/{id}")
    ResponseEntity<Card> getCardById(@PathVariable Long id);

    @PutMapping("/payment-card/balance/{id}")
    ResponseEntity<Card> updateBalance(@PathVariable Long id, @RequestParam Double quantity);
}
