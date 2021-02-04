package com.microservices.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

    @GetMapping("/{id}")
    public ResponseEntity<Card> getCardById(@PathVariable Long id) {
        Card c = cardService.getCard(id);
        return ResponseEntity.ok(c);
    }

    @GetMapping("/customer/{id}")
    public ResponseEntity<List<Card>> listAllInvoicesByCustomerId(@PathVariable Long id) {
        return ResponseEntity.ok(cardService.findAllByCustomerId(id));
    }

    @PostMapping
    public ResponseEntity<Card> createCard(@RequestBody Card card) {
        return ResponseEntity.ok(cardService.createCard(card));
    }
    
    

}
