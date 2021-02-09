create table customer
(
    id         bigint auto_increment
        primary key,
    email      varchar(255) not null,
    first_name varchar(255) not null,
    last_name  varchar(255) not null,
    number_id  varchar(8)   not null,
    photo_url  varchar(255) null,
    state      varchar(255) null,
    region_id  bigint       not null,
    constraint UK_1kd255931sapbwlg2qi0mm1f3
        unique (number_id),
    constraint UK_dwk6cx0afu8bs9o4t536v1j5v
        unique (email),
    constraint FKqnnfcxwwuj4cjmxitfyhvp94u
        foreign key (region_id) references region (id)
);

INSERT INTO `customer-service`.customer (id, email, first_name, last_name, number_id, photo_url, state, region_id) VALUES (1, 'example@gmail.com', 'Juan', 'Santana', '12345678', 'http://via.placeholder.com/150x200', 'CREATED', 1);
INSERT INTO `customer-service`.customer (id, email, first_name, last_name, number_id, photo_url, state, region_id) VALUES (3, 'fofo@ciencias.unam.mx', 'Predo', 'Martinez', '12345679', 'http://via.placeholder.com/150x200', 'CREATED', 2);
INSERT INTO `customer-service`.customer (id, email, first_name, last_name, number_id, photo_url, state, region_id) VALUES (4, 'pop@gmail.com', 'Alexis', 'Acuña', '56543578', 'http://via.placeholder.com/150x200', 'CREATED', 3);