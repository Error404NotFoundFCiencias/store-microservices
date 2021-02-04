package com.microservices.shopping.service;

import com.microservices.shopping.client.PaymentClient;
import com.microservices.shopping.model.Card;
import com.microservices.shopping.model.Payment;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.microservices.shopping.client.CustomerClient;
import com.microservices.shopping.client.ProductClient;
//import com.microservices.shopping.client.CustomerClient;
//import com.microservices.shopping.client.ProductClient;
import com.microservices.shopping.entity.Invoice;
import com.microservices.shopping.entity.InvoiceItem;
import com.microservices.shopping.model.Customer;
import com.microservices.shopping.model.Product;
//import com.microservices.shopping.model.Customer;
//import com.microservices.shopping.model.Product;
import com.microservices.shopping.repository.InvoiceItemsRepository;
import com.microservices.shopping.repository.InvoiceRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Slf4j
@Service
public class InvoiceServiceImpl implements InvoiceService {

    @Autowired
    InvoiceRepository invoiceRepository;

    @Autowired
    InvoiceItemsRepository invoiceItemsRepository;

    @Qualifier("com.microservices.shopping.client.CustomerClient")
    @Autowired
    CustomerClient customerClient;

    @Autowired
    ProductClient productClient;

    @Qualifier("com.microservices.shopping.client.PaymentClient")
    @Autowired
    PaymentClient paymentClient;

    @Override
    public List<Invoice> findInvoiceAll() {
        return  invoiceRepository.findAll();
    }


    @Override
    public Invoice createInvoice(Invoice invoice) {
        Invoice invoiceDB = invoiceRepository.findByNumberInvoice ( invoice.getNumberInvoice () );
        if (invoiceDB !=null){
            return  invoiceDB;
        }
        invoice.setState("CREATED");
        invoiceDB = invoiceRepository.save(invoice);
        invoiceDB.getItems().forEach( invoiceItem -> {
            productClient.updateStockProduct( invoiceItem.getProductId(), invoiceItem.getQuantity() * -1);
        });

        return invoiceDB;
    }


    @Override
    public Invoice updateInvoice(Invoice invoice) {
        if (invoice.getCardId() != null) {
            invoice.setPayment(Payment.CARD);
        }

        Invoice invoiceDB = getInvoice(invoice.getId());
        if (invoiceDB == null){
            return  null;
        }

        invoiceDB.setCustomerId(invoice.getCustomerId());
        invoiceDB.setDescription(invoice.getDescription());
        invoiceDB.setNumberInvoice(invoice.getNumberInvoice());
        invoiceDB.getItems().clear();
        invoiceDB.setItems(invoice.getItems());
        invoiceDB.setPayment(invoice.getPayment());
        return invoiceRepository.save(invoiceDB);
    }


    @Override
    public Invoice deleteInvoice(Invoice invoice) {
        Invoice invoiceDB = getInvoice(invoice.getId());
        if (invoiceDB == null){
            return  null;
        }
        invoiceDB.setState("DELETED");
        return invoiceRepository.save(invoiceDB);
    }

    @Override
    public Invoice getInvoice(Long id) {

        Optional<Invoice> invoice= invoiceRepository.findById(id);
        invoice.ifPresent( inv -> {

            Customer customer = null;

            if (inv.getPayment().equals(Payment.CARD)) {
                inv.setCard( paymentClient.getCardById(inv.getCardId()).getBody() );
                if (inv.getCard().getId() != -1L && inv.getCard().getCustomer().getId() != -1L) {
                    customer = customerClient.getCustomer( inv.getCard().getCustomer().getId() ).getBody();
                }
            } else {
                customer = customerClient.getCustomer(inv.getCustomerId()).getBody();
            }


            if (customer != null && customer.getId() != null) {
                inv.setCustomer(customer);
                for (InvoiceItem item : inv.getItems()) {
                    item.setProduct(productClient.getProduct(item.getProductId()).getBody());
                }
            }
        });
        return invoice.orElse(null);
    }
}
