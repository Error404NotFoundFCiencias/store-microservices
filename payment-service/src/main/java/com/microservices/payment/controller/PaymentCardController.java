package com.microservices.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.microservices.payment.entity.Card;
import com.microservices.payment.service.interfaces.CardService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/payment-card")
public class PaymentCardController {


    @Autowired
    CardService cardService;

    // -------------------Retrieve All Cards--------------------------------------------
    @GetMapping
    public ResponseEntity<List<Card>> listAllInvoices() {
        List<Card> cards = cardService.findCardAll();
        if (cards.isEmpty()) {
            return  ResponseEntity.noContent().build();
        }
        return  ResponseEntity.ok(cards);
    }

    @GetMapping("/customer/{id}")
    public ResponseEntity<List<Card>> listAllInvoicesByCustomerId(@PathVariable Long id) {
        List<Card> cards = cardService.findAllByCustomerId(id);

        return cards.isEmpty() ? ResponseEntity.noContent().build() :
                                ResponseEntity.ok(cards);
    }

    @PostMapping
    public ResponseEntity<Card> createCard(@RequestBody Card card) {
        return ResponseEntity.ok(cardService.createCard(card));
    }
    
    

}
