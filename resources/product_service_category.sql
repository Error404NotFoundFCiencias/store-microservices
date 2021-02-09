create table category
(
    id   bigint auto_increment
        primary key,
    name varchar(255) null
);

INSERT INTO `product-service`.category (id, name) VALUES (1, 'Skin care');
INSERT INTO `product-service`.category (id, name) VALUES (2, 'Phones');