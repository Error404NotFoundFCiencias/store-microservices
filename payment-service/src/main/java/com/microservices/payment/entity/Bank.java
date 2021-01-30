package com.microservices.payment.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;




import lombok.Data;

@Data
@Entity
public class Bank implements Serializable{
	
	private static final long serialVersionUID = 4803151066196346900L;
	
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	private String name;

	
}
