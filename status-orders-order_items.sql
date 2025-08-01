create table shop.status (
  status_id serial primary key,
  status text not null
);

insert into shop.status (status)
values
	('Pending'), -- заказ создан, но не отбрабтан
	('Processing'), -- заказк в обработке
	('Shipped'), -- отправлен
	('Delivered'), -- доставлен 
	('Cancelled'), -- отменен
	('Returned'); -- возврат оформлен

create table shop.orders (
  order_id serial primary key,
  user_id int not null,
  status_id int not null,
  total_amount numeric(10, 2) not null,
  shipping_address text,
  created_at timestamp default now(),
  updated_at timestamp,

  foreign key (user_id) references shop.users(id),
  foreign  key (status_id) references shop.status(status_id)
);

-- удаление ключа 
alter table shop.orders
drop constraint orders_status_id_fkey;

-- создание нового ключа для таблицы
alter table shop.orders 
add constraint fk_orders_statusesз
foreign key (status_id) references shop.statuses(status_id);

create table shop.order_items (
	order_item_id serial primary key,
	order_id int not null,
	products_id int not null,
	quantity int not null,
	price_at_time_of_order numeric (10, 2) not null,
	created_at timestamp default now(),
	updated_at timestamp,
	
	foreign key (order_id) references shop.orders(order_id),
	foreign key (products_id) references shop.products(product_id)
	);


