package com.microservices.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    
    

}
