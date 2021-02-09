package com.microservices.payment.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.microservices.payment.model.Customer;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;
import java.util.Date;

@Data
@Entity
public class Card {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

	@Column(unique = true , nullable = false)
	@NotEmpty
	private String number;
	
    @Temporal(TemporalType.DATE)
	private Date expDate;

    @NotEmpty
	private String cvv;

	@NotNull(message = "El banco no puede estar vacio")
    @ManyToOne
    @JoinColumn(name = "bank_id")
	private Bank bank;

	@NotNull
	private Long customerId;

	@NotNull
	@PositiveOrZero
	private Double balance;
	
	@Transient
	private Customer customer;
	
	private String state;
	


}
