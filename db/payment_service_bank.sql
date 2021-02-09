create table bank
(
    id   bigint auto_increment
        primary key,
    name varchar(255) null
);

INSERT INTO `payment-service`.bank (id, name) VALUES (1, 'BBVA');
INSERT INTO `payment-service`.bank (id, name) VALUES (2, 'Banorte');
INSERT INTO `payment-service`.bank (id, name) VALUES (3, 'Citibanamex');
INSERT INTO `payment-service`.bank (id, name) VALUES (4, 'Santander');
INSERT INTO `payment-service`.bank (id, name) VALUES (5, 'HSBC');
INSERT INTO `payment-service`.bank (id, name) VALUES (6, 'Scotiabank');
INSERT INTO `payment-service`.bank (id, name) VALUES (7, 'Banco Azteca');