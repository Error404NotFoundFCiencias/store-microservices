create table product
(
    id          bigint auto_increment
        primary key,
    create_at   datetime(6)  null,
    description varchar(255) null,
    name        varchar(255) null,
    price       double       null,
    status      varchar(255) null,
    stock       double       null,
    category_id bigint       not null,
    constraint FK1mtsbur82frn64de7balymq9s
        foreign key (category_id) references category (id)
);

INSERT INTO `product-service`.product (id, create_at, description, name, price, status, stock, category_id) VALUES (1, '2021-02-02 20:31:35.752000', 'Fabuloso exfoliante para la piel con aroma a limón', 'Gel para la piel', 300, 'CREATED', 0, 1);
INSERT INTO `product-service`.product (id, create_at, description, name, price, status, stock, category_id) VALUES (2, '2021-02-02 21:22:18.136000', '64MP camera, 120Hz display | SnapdragonTM 750G', 'Mi 10T Lite | 5G', 6000, 'DELETED', 386, 2);
INSERT INTO `product-service`.product (id, create_at, description, name, price, status, stock, category_id) VALUES (3, '2021-02-06 17:42:10.355000', 'Cartera con el diseño de Liverpool FC. Construccion de Nylon con diseño del escudo del club. Multiples ranuras para tarjetas y compartimento con cremallera. Fabricada como un gra nregalo para cualquier forofo del Liverpool FC. Este es un producto oficial.', 'Liverpool FC - Cartera/Billetera oficial Modelo Money hombre caballero - Fútbol', 6000, 'CREATED', 4, 1);
INSERT INTO `product-service`.product (id, create_at, description, name, price, status, stock, category_id) VALUES (4, '2021-02-06 17:42:54.162000', 'Helado sabor fresa con chispas', 'Helado', 200, 'CREATED', 4317, 1);