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
    public ResponseEntity<List<Card>> listAllCardsByCustomerId(@PathVariable Long id) {
        List<Card> cards = cardService.findAllByCustomerId(id);
        return cards == null ? ResponseEntity.notFound().build() : ResponseEntity.ok(cards);
    }

    @PostMapping
    public ResponseEntity<Card> createCard(@RequestBody Card card) {
        Card newCard = cardService.createCard(card);
        if (newCard == null) {
            return new ResponseEntity<>(card, HttpStatus.CONFLICT);
        }
        return ResponseEntity.ok(newCard);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Card> updateCard(@PathVariable Long id, @RequestBody Card card) {
        card.setId(id);
        Card cardDb = cardService.updateCard(card);
        return cardDb == null ? ResponseEntity.notFound().build() : ResponseEntity.ok(cardDb) ;
    }

    @PutMapping("/balance/{id}")
    public ResponseEntity<Card> updateBalance(@PathVariable Long id, @RequestParam Double quantity) {
        int result = cardService.updateBalance(id, quantity);
        return result == 0 ? ResponseEntity.notFound().build() : ResponseEntity.ok().build() ;
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Card> deleteCard(@PathVariable Long id) {
        Card card = cardService.deleteCard(id);
        return card == null ? ResponseEntity.notFound().build() : ResponseEntity.ok(card);
    }
    
    

}
