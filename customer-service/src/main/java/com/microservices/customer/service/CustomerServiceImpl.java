package com.microservices.customer.service;

import com.microservices.customer.client.CardClient;
import com.microservices.customer.model.Card;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.microservices.customer.repository.CustomerRepository;
import com.microservices.customer.entity.Customer;
import com.microservices.customer.entity.Region;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class CustomerServiceImpl  implements CustomerService {

    @Autowired
    CustomerRepository customerRepository;

    @Qualifier("com.microservices.customer.client.CardClient")
    @Autowired
    CardClient cardClient;

    @Override
    public List<Customer> findCustomerAll() {
        List<Customer> customers = customerRepository.findAll();
        customers.forEach(this::setCardsUsingClient);
        return customers;
    }

    @Override
    public List<Customer> findCustomersByRegion(Region region) {
        return customerRepository.findByRegion(region);
    }

    @Override
    public Customer createCustomer(Customer customer) {

        Customer customerDB = customerRepository.findByNumberID ( customer.getNumberID () );
        if (customerDB != null && customer.getId() != null){
            return  customerDB;
        }

        customer.setState("CREATED");
        customerDB = customerRepository.save ( customer );
        return customerDB;
    }

    @Override
    public Customer updateCustomer(Customer customer) {
        Customer customerDB = getCustomer(customer.getId());
        if (customerDB == null){
            return  null;
        }
        customerDB.setFirstName(customer.getFirstName());
        customerDB.setLastName(customer.getLastName());
        customerDB.setEmail(customer.getEmail());
        customerDB.setPhotoUrl(customer.getPhotoUrl());

        return  customerRepository.save(customerDB);
    }

    @Override
    public Customer deleteCustomer(Customer customer) {
        Customer customerDB = getCustomer(customer.getId());
        if (customerDB ==null){
            return  null;
        }
        customer.setState("DELETED");
        return customerRepository.save(customer);
    }

    @Override
    public Customer getCustomer(Long id) {
        Optional<Customer> customer = customerRepository.findById(id);
        customer.ifPresent(this::setCardsUsingClient);
        return customer.orElse(null);
    }

    private void setCardsUsingClient(Customer customer) {
        customer.setCards(cardClient.listAllInvoicesByCustomerId(customer.getId()).getBody());
    }
}
