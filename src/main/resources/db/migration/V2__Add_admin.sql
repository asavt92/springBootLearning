insert into usr (id, active, email, password, username)
values (1, TRUE, 'admin@g.com', 'admin', 'admin');

insert INTO user_role(user_id, roles)
values (1, 'USER'),
       (1, 'ADMIN');
