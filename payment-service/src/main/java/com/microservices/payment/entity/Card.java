package com.microservices.payment.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import com.microservices.payment.model.Customer;

import java.util.Date;


public class Card implements Serializable{

	private static final long serialVersionUID = -3658645447433249809L;
	
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
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bank_id")
	private Bank bank;
	
	@Column(name = "customer_id")
	private Long customerId;
	
	
	@Transient
	private Customer customer;
	


}
