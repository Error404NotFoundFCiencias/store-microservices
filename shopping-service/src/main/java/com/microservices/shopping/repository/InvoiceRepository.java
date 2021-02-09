package com.microservices.shopping.repository;

import com.microservices.shopping.entity.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvoiceRepository extends JpaRepository<Invoice, Long> {
    Invoice findByNumberInvoice(String numberInvoice);
}
