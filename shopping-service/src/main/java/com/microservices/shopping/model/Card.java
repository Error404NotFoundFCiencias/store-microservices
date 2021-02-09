package com.microservices.shopping.model;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class Card {
    private Long id;
    private String number;
    private Date expDate;
    private String state;
    private Double balance;

    public String getNumber() {
        int len  = number.length();
        return len > 6 ? number.substring(len-4) : number;
    }
}
