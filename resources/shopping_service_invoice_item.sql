create table invoice_item
(
    id         bigint auto_increment
        primary key,
    price      double null,
    product_id bigint null,
    quantity   double null,
    invoice_id bigint null,
    constraint FKbu6tmpd0mtgu9wrw5bj5uv09v
        foreign key (invoice_id) references invoice (id)
);

INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (4, 2000, 2, 3, 6);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (5, 20000, 4, 30, 7);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (6, 20000, 4, 3, 8);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (7, 300, 1, 1, 9);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (8, 300, 1, 1, 10);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (9, 20000, 4, 3, 12);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (24, 6000, 2, 2, 17);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (25, 6000, 2, 2, 18);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (26, 300, 1, 2, 19);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (27, 300, 1, 2, 20);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (28, 1000, 4, 1, 21);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (29, 300, 1, 1, 22);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (30, 6000, 2, 8, 23);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (31, 6000, 2, 3, 24);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (32, 6000, 2, 1, 25);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (33, 6000, 2, 1, 26);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (34, 200, 4, 2, 27);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (35, 200, 4, 2, 28);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (36, 6000, 3, 1, 29);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (37, 200, 4, 10, 30);
INSERT INTO `shopping-service`.invoice_item (id, price, product_id, quantity, invoice_id) VALUES (38, 6000, 3, 5, 31);