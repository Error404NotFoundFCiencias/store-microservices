create table card
(
    id          bigint auto_increment
        primary key,
    customer_id bigint       null,
    cvv         varchar(255) null,
    exp_date    date         null,
    number      varchar(255) not null,
    state       varchar(255) null,
    bank_id     bigint       not null,
    balance     double       null,
    constraint UK_492xmgvvn7qbnwhcvpr3yor6h
        unique (number),
    constraint FK73u1abbacqsc1lcrl3ut1e2kp
        foreign key (bank_id) references bank (id)
);

INSERT INTO `payment-service`.card (id, customer_id, cvv, exp_date, number, state, bank_id, balance) VALUES (1, 1, '$2a$10$2gLd9MCUdnQLT9nCxDuW6ORx39eL3jvIvjkz2CsDLk5aFtvs1oTli', '2050-04-05', '1234123412341234', 'CREATED', 1, 5429543);
INSERT INTO `payment-service`.card (id, customer_id, cvv, exp_date, number, state, bank_id, balance) VALUES (3, 3, '$2a$10$XXCOzNetcAVY1.MuA8SUqO00hn5dzCO3qizKliMPX/c9D2sjYDwFW', '2060-04-05', '1234123412341235', 'CREATED', 2, 4300000);
INSERT INTO `payment-service`.card (id, customer_id, cvv, exp_date, number, state, bank_id, balance) VALUES (4, 1, '$2a$10$iEGUYOM3V2RvxjMQWXoCpe1HTKiAtyxbhhu3OMo5pk77YZA4O9f4S', '2070-04-05', '1234123412341236', 'CREATED', 3, 7676567);
INSERT INTO `payment-service`.card (id, customer_id, cvv, exp_date, number, state, bank_id, balance) VALUES (5, 1, '$2a$10$5hZzeaQYVoGjhgdaKnjeOe9uwJoNx98kn9rQehRGyv2jSGQK8Aski', '2072-04-05', '1234123412341237', 'CREATED', 4, 7567657);
INSERT INTO `payment-service`.card (id, customer_id, cvv, exp_date, number, state, bank_id, balance) VALUES (11, 4, '$2a$10$8qgNGlGwc8AM5s/URkVIt.P8HDxme9EYOOV13xYNhb0Vhs5RHJUKC', '2023-10-24', '123412345547', 'CREATED', 7, 13000);
INSERT INTO `payment-service`.card (id, customer_id, cvv, exp_date, number, state, bank_id, balance) VALUES (12, 4, '$2a$10$oGieL5yPl//wstSY.QnMjewFAP5Jj6YrYRWArFvo6fKe3z7qvzA3W', '2022-03-31', '1234567812345678', 'CREATED', 7, -1001);