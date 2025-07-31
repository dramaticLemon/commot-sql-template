create table shop.category (
category_id serial primary key,
name varchar(30) not null unique,
desctiption text,
created_at timestamp default now(),
update_at timestamp
);
-- rename table name
alter table shop.category rename to categories;
-- rename fild
alter table shop.categories 
rename column desctiption to description;

create table shop.products(
product_id serial primary key,
category_id int not null,
name varchar(300) not null,
image_url text,
quantity integer not null,
is_available boolean not null,
description text,
price numeric(10, 2) not null,
created_at timestamp default now() not null,
updated_at timestamp,
foreign key (category_id) references shop.categories(category_id)
  );

create or replace function udate_timestamp()
returns trigger as $$
begin 
	new.update_at := now();
	return new;
end;
$$ language plpgsql;


INSERT INTO shop.categories (name, description)
VALUES
  ('Smartphones', 'Mobile phones, accessories, and gadgets.'),
  ('Laptops', 'Laptops for work, study, and gaming.'),
  ('Tablets', 'Tablets of various sizes and brands.'),
  ('Audio', 'Headphones, speakers, and audio systems.'),
  ('Smartwatches', 'Smartwatches and fitness trackers.'),
  ('Televisions', 'LED, OLED, and QLED TVs and accessories.'),
  ('Components', 'Hard drives, SSDs, RAM, CPUs, and more.'),
  ('Monitors', 'Computer monitors of various sizes.'),
  ('Gaming', 'Consoles, controllers, and gaming gear.'),
  ('Networking', 'Routers, modems, and network equipment.');

INSERT INTO shop.products (category_id, name, image_url, quantity, is_available, description, price)
VALUES
(1, 'iPhone 14 Pro', 'https://example.com/images/iphone14pro.jpg', 15, TRUE, 'Apple smartphone with A16 Bionic chip', 1299.99),
(1, 'Samsung Galaxy S23', 'https://example.com/images/galaxys23.jpg', 20, TRUE, 'Samsung flagship phone', 999.99),
(1, 'Google Pixel 7', 'https://example.com/images/pixel7.jpg', 12, TRUE, 'Pure Android phone by Google', 799.99),
(2, 'MacBook Pro 14"', 'https://example.com/images/macbookpro14.jpg', 10, TRUE, 'Apple M2 Pro laptop', 1999.99),
(2, 'Dell XPS 13', 'https://example.com/images/xps13.jpg', 8, TRUE, 'Compact ultrabook', 1399.99),
(2, 'ASUS ROG Strix', 'https://example.com/images/rogstrix.jpg', 7, TRUE, 'Gaming laptop with RTX 4060', 1799.00),
(3, 'iPad Air 5', 'https://example.com/images/ipadair5.jpg', 12, TRUE, 'Lightweight Apple tablet with M1 chip', 699.00),
(3, 'Samsung Galaxy Tab S8', 'https://example.com/images/tab8.jpg', 10, TRUE, 'Android tablet with stylus', 649.00),
(3, 'Lenovo Tab M10', 'https://example.com/images/lenovotab.jpg', 20, TRUE, 'Affordable 10-inch tablet', 249.99),
(4, 'Sony WH-1000XM5', 'https://example.com/images/sonyheadphones.jpg', 25, TRUE, 'Noise cancelling headphones', 399.99),
(4, 'JBL Flip 6', 'https://example.com/images/jblflip6.jpg', 30, TRUE, 'Portable Bluetooth speaker', 119.99),
(4, 'Apple AirPods Pro 2', 'https://example.com/images/airpodspro.jpg', 18, TRUE, 'Wireless earbuds with ANC', 249.00),
(5, 'Apple Watch Series 9', 'https://example.com/images/watch9.jpg', 20, TRUE, 'Smartwatch for iPhone users', 499.00),
(5, 'Samsung Galaxy Watch 6', 'https://example.com/images/galaxywatch6.jpg', 15, TRUE, 'Wear OS watch', 379.00),
(5, 'Xiaomi Mi Band 8', 'https://example.com/images/miband8.jpg', 50, TRUE, 'Affordable fitness tracker', 59.99),
(6, 'LG OLED C3 55"', 'https://example.com/images/oled55.jpg', 6, TRUE, '4K OLED Smart TV', 1599.00),
(6, 'Samsung QLED Q60B', 'https://example.com/images/qled60b.jpg', 7, TRUE, '4K QLED TV', 999.99),
(6, 'Sony Bravia X90J', 'https://example.com/images/x90j.jpg', 5, TRUE, 'Full Array LED 4K TV', 1299.00),
(7, 'Samsung 1TB NVMe SSD', 'https://example.com/images/ssd1tb.jpg', 40, TRUE, 'High-speed storage', 129.99),
(7, 'Corsair 16GB DDR5 RAM', 'https://example.com/images/ram16gb.jpg', 35, TRUE, 'Fast memory module', 89.99),
(7, 'Intel Core i7-13700K', 'https://example.com/images/i7cpu.jpg', 10, TRUE, '13th gen desktop processor', 429.00),
(8, 'Dell Ultrasharp 27"', 'https://example.com/images/dell27.jpg', 9, TRUE, 'Professional IPS monitor', 499.99),
(8, 'LG 32" 4K UHD', 'https://example.com/images/lg32.jpg', 8, TRUE, '4K productivity monitor', 549.00),
(8, 'AOC 24G2 144Hz', 'https://example.com/images/aoc24g2.jpg', 14, TRUE, 'Gaming monitor with high refresh rate', 239.99),
(9, 'PlayStation 5', 'https://example.com/images/ps5.jpg', 6, TRUE, 'Sony next-gen gaming console', 499.00),
(9, 'Xbox Series X', 'https://example.com/images/xboxx.jpg', 5, TRUE, 'Microsoft gaming console', 499.00),
(9, 'Nintendo Switch OLED', 'https://example.com/images/switch.jpg', 12, TRUE, 'Portable hybrid console', 349.00),
(10, 'TP-Link AX3000 Router', 'https://example.com/images/ax3000.jpg', 25, TRUE, 'Wi-Fi 6 router', 89.99),
(10, 'Ubiquiti UniFi Access Point', 'https://example.com/images/unifi.jpg', 10, TRUE, 'Business-class Wi-Fi', 129.99),
(10, 'Netgear 8-Port Switch', 'https://example.com/images/netgear.jpg', 20, TRUE, 'Gigabit unmanaged switch', 49.99);

