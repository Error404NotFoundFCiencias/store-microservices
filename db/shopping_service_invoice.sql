create table invoice
(
    id             bigint auto_increment
        primary key,
    create_at      date         null,
    customer_id    bigint       null,
    description    varchar(255) null,
    number_invoice varchar(255) null,
    state          varchar(255) null,
    payment        varchar(255) null
);

INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (1, '2021-02-03', 1, 'Factura electronica (con terminal de liverpool)', '12345678', 'CREATED', 'CARD', 1);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (6, '2021-02-06', 3, 'Celulares', 'ABCDEF12453213', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (7, '2021-02-07', 3, 'Mucho Helado', 'ABCDEF124532143', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (8, '2021-02-07', 3, 'Mucho Helado', 'ABCDEF12453214421', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (9, '2021-02-08', 1, 'aa', 'LBEKFKCEFLGL', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (10, '2021-02-08', 1, 'ss
', 'LEBKBEIFJCJH', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (11, '2021-02-08', 1, 'Fooo', 'BFCADIHKBAEA', 'CREATED', 'CARD', 1);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (12, '2021-02-08', 4, 'Celular', 'ABCDEF12453214HOLA', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (17, '2021-02-09', 1, 'Mucho heldo', 'LHAILLFFAFFG', 'CREATED', 'CARD', 1);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (18, '2021-02-09', 1, 'Mucho heldo', 'ALKBHIDKCDHA', 'CREATED', 'CARD', 1);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (19, '2021-02-09', 1, 'exfoliante de limooooooooooon', 'BHIKAJCDADII', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (20, '2021-02-09', 1, 'limooooon', 'CCABJCLGCLLB', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (21, '2021-02-09', 4, 'Celular', 'ABCDEF1245321fdsFOFOFddd', 'CREATED', 'CARD', 12);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (22, '2021-02-09', 1, 'ds', 'EDJHKGHFGIKK', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (23, '2021-02-09', 1, 'Agrega', 'CBGBGGKAABFD', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (24, '2021-02-09', 1, 'TEMP', 'LGCFDJCFAHCL', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (25, '2021-02-09', 1, 'FOFOFOFO', 'FFFDCGLFIAJL', 'CREATED', 'CARD', 1);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (26, '2021-02-09', 1, 'LOMMMMMMMMMM', 'ICLFLJAKIKHD', 'CREATED', 'CARD', 1);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (27, '2021-02-09', 4, 'HELADOOOOO', 'CEICEGAEKHLH', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (28, '2021-02-09', 1, 'HELADO SUAVEEEEEE', 'FBKFLFDEFDJJ', 'CREATED', 'CARD', 1);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (29, '2021-02-09', 3, 'Cartera rojaaaaaaaaaaa', 'KKLBEHGLAJBG', 'CREATED', 'CASH', null);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (30, '2021-02-09', 1, 'HELADO FRIO Y SABROSOOOO', 'HDKLLECGBDDD', 'CREATED', 'CARD', 1);
INSERT INTO `shopping-service`.invoice (id, create_at, customer_id, description, number_invoice, state, payment, card_id) VALUES (31, '2021-02-09', 4, 'Mi cartera ROJAAAAA', 'BEAFFEIHHHKJ', 'CREATED', 'CASH', null);