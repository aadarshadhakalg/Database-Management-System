CREATE TABLE Author 
(
	id int UNIQUE NOT NULL auto_increment,
	name varchar(30),
	bio varchar(255),
	photo varchar(255),
	address varchar(255),
	phone varchar(255) UNIQUE ,
	primary key (id)
)


-- Create supertype table publishment. Magazine and Book to be the weak entity to inherit
-- publishments.
CREATE TABLE Publishments 
(
	id int NOT NULL UNIQUE AUTO_INCREMENT,
	price double,
	pages int,
	stock int,
	publisher varchar(255),
	title varchar(255),
	printed_date date,
	cover varchar(255),
	primary key (id)
)


-- Since book and magazine are the weak entiry, they don't have primary key
-- rather they depend on the id or publishment.
CREATE TABLE Book 
(
	publishment_id int UNIQUE,
	edition double,
	ISBN varchar(50) NOT NULL UNIQUE,
	foreign key (publishment_id) REFERENCES Publishments (id) ON DELETE CASCADE 
)

CREATE TABLE Magazine 
(
	publishment_id int UNIQUE,
	issue double NOT NULL,
	period varchar(20) default 'Monthly',
	foreign key (publishment_id) references Publishments (id) ON DELETE CASCADE 
)

-- Creating table for distributor.
-- Since we have one multi valued attribute, ie phone number. We have no they than
-- creating a separate table to store phone number. 
CREATE TABLE Distributor 
(
	id int NOT NULL UNIQUE auto_increment,
	name varchar(50) NOT NULL,
	email varchar(50) NOT NULL UNIQUE,
	address_country varchar(50) NOT NULL,
	address_city varchar(50) NOT NULL,
	address_street varchar(100) NOT NULL,
	bank_name varchar(100),
	account_name varchar(50),
	account_number varchar(50) UNIQUE,
	primary key (id)
)

CREATE TABLE PhoneNumberDist
(
	id int,
	phone_number varchar(10) NOT NULL UNIQUE,
	FOREIGN KEY (id) REFERENCES Distributor(id) ON DELETE CASCADE 
)

-- now the relation entity
CREATE TABLE orders 
(
	order_id int NOT NULL UNIQUE auto_increment,
	total_amount double NOT NULL,
	status varchar(50) DEFAULT 'Placed',
	quantity int NOT NULL,
	is_preorder bool DEFAULT FALSE,
	distributor_id int NOT NULL,
	publishment_id int NOT NULL,
	PRIMARY KEY(order_id),
	FOREIGN KEY(distributor_id) REFERENCES Distributor(id),
	FOREIGN KEY(publishment_id) REFERENCES Publishments(id)
)

ALTER TABLE orders ADD order_date date;

-- Spearate table for payment which is a composite attribute for order
CREATE TABLE payment
(
	tx_id varchar(50) NOT NULL UNIQUE,
	amount double NOT NULL,
	medium varchar(50) NOT NULL,
	order_id int,
	PRIMARY KEY(tx_id),
	FOREIGN KEY(order_id) REFERENCES orders(order_id)
)


CREATE TABLE author_book
(
	book_id int NOT NULL,
	author_id int NOT NULL,
	FOREIGN KEY(book_id) REFERENCES Publishments(id),
	FOREIGN KEY(author_id) REFERENCES Author(id)
)

