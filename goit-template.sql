create table genders (
	id serial primary key,
	 name varchar(30),
	 created_at timestamp default now());

create table users (
id serial primary key,
name varchar(30),
email varchar(40),
password varchar(40),
age smallint,
gender_id int,
created_at timestamp  default now(),
foreign key (gender_id) references genders(id)
	on delete set null
	on update cascade
	);


create table contacts (
id serial primary key,
name varchar(30),
emai varchar(40),
phone varchar(30),
favorite boolean,
user_id int,
created_at timestamp default now(),
foreign key (user_id) references users(id)
	on delete cascade
	on update cascade
	);

alter table contacts 
rename column emai to email;

insert into genders 
values
(1, 'male'),
(2, 'female');

insert into users values
(1, 'Boris', 'boris@test.com', 'password', 23, 1),
(2, 'Alina', 'alina@test.com', 'password', 32, 2),
(3, 'Maksim', 'maksim@test.com', 'password', 40, 1);

INSERT INTO contacts (id, name, email, phone, favorite, user_id)
values
(1, 'Allen Raymond', 'nulla.ante@vestibul.co.uk', '(992) 914-3792', false, 1),
(2, 'Chaim Lewis', 'dui.in@egetlacus.ca', '(294) 840-6685', true, 1),
(3, 'Kennedy Lane', 'mattis.Cras@nonenimMauris.net', '(542) 451-7038', true, 2),
(4, 'Wylie Pope', 'est@utquamvel.net', '(692) 802-2949', false, 2),
(5, 'Cyrus Jackson', 'nibh@semsempererat.com', '(501) 472-5218', false, null);
