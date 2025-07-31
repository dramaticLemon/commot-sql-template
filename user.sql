-- create table
create table shop.users (
id serial primary key,
username varchar(100) not null,
password varchar(250) not null,
email varchar (60) not null unique,
create_at timestamp default now(),
update_at timestamp
);

-- fill table random values
create extension if not exists pgcrypto;

insert into shop.users (username, password, email)
select 
	'user_' || gen_random_uuid(),
	encode(gen_random_bytes(16), 'hex'),
	'user' || trunc(random()*100000)::int || '@gmail.com'
from generate_series(1, 60);


-- example query
SELECT * FROM shop.users;
SELECT username, email FROM shop.users;
SELECT * FROM shop.users WHERE email = 'user123@mail.com';
SELECT * FROM shop.users WHERE email LIKE '%@mail.com';
SELECT * FROM shop.users WHERE create_at::date = CURRENT_DATE;
SELECT * FROM shop.users ORDER BY create_at DESC LIMIT 5;
SELECT COUNT(*) FROM shop.users;
-- group by date created
SELECT DATE(create_at) AS reg_date, COUNT(*) 
FROM shop.users
GROUP BY reg_date
ORDER BY reg_date;
-- update data
UPDATE shop.users SET email = 'newemail@mail.com' WHERE id = 1;
DELETE FROM shop.users WHERE email = 'test@mail.com';
SELECT * FROM shop.users WHERE username ILIKE '%abc%';
SELECT * FROM shop.users WHERE update_at IS NULL;

--create trigger funtion
create or replace function update_user_timespamp()
returns trigger as $$
begin 
	new.update_at := now();
	return new;
end;
$$ language plpgsql;
--create trigger on table
create trigger trg_updatep_user_timestamp
before update on shop.users 
for each row 
execute function update_user_timespamp();
