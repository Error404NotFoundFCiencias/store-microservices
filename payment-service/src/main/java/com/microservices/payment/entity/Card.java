package com.microservices.payment.entity;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.microservices.payment.model.Customer;

import lombok.Data;

import java.util.Date;

@Data
@Entity
public class Card {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@Column(name = "number" , unique = true , nullable = false)
	private String number;
	
	@Column(name = "exp_date")
    @Temporal(TemporalType.TIMESTAMP)
	private Date expDate;
	 
	@Column(name="cvv")
	private String cvv;
	
	@NotNull(message = "El banco no puede estar vacio")
    @ManyToOne
    @JoinColumn(name = "bank_id")
	private Bank bank;
	
	@Column(name ="customer_id")
	private Long customerId;
	
	
	@Transient
	private Customer customer;
	
	private String state;
	


}
