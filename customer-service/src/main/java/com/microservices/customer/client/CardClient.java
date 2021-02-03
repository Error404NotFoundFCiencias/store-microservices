package com.microservices.customer.client;

import com.microservices.customer.model.Card;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@FeignClient(name = "payment-service", fallback = CardHystrixFallbackFactory.class)
@RequestMapping("/payment-card")
public interface CardClient {

    @GetMapping("/customer/{id}")
    ResponseEntity<List<Card>> listAllInvoicesByCustomerId(@PathVariable Long id);
}
