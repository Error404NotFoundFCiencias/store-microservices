create table region
(
    id   bigint auto_increment
        primary key,
    name varchar(255) null
);

INSERT INTO `customer-service`.region (id, name) VALUES (1, 'Noroeste');
INSERT INTO `customer-service`.region (id, name) VALUES (2, 'Noreste');
INSERT INTO `customer-service`.region (id, name) VALUES (3, 'Occidente');
INSERT INTO `customer-service`.region (id, name) VALUES (4, 'Oriente');
INSERT INTO `customer-service`.region (id, name) VALUES (5, 'Centronorte');
INSERT INTO `customer-service`.region (id, name) VALUES (6, 'Centrosur');
INSERT INTO `customer-service`.region (id, name) VALUES (7, 'Suroeste');
INSERT INTO `customer-service`.region (id, name) VALUES (8, 'Sureste');