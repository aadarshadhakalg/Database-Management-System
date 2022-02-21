-- Adding Random Author Data

INSERT INTO Author (name,bio,photo,address,phone) VALUES 
(
	'Aayush Paudel',
	'Good Writer.',
	'https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg',
	'Kathmandu',
	'9876543210'
),
(
	'Aayush Aryal',
	'Hero Writer',
	'https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg',
	'Footpath',
	'0123456789'
),
(
	'Sushant Adhikari',
	'Chill Writer',
	'https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg',
	'Pokhara',
	'0123498765'
),
(
	'Aayush Marasini',
	'Hot Writer',
	'https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg',
	'Kathmandu',
	'0912345678'
)


-- Insert random book data

INSERT INTO Publishments (price,pages,stock,publisher,title,printed_date,cover) VALUES 
(
	600.00,
	100,
	1000,
	'Manjari Publications',
	'Bagwat Gita',
	 NOW(),
	'https://pbs.twimg.com/profile_images/1202979137184354305/yKvAZsT3_400x400.jpg'
),

INSERT INTO Book (publishment_id,edition,ISBN) VALUES 
(
	LAST_INSERT_ID(),
	1,
	'1234567'
)

INSERT INTO Publishments (price,pages,stock,publisher,title,printed_date,cover) VALUES 
(
	12050.00,
	100,
	1000,
	'Manjari Publications',
	'University Physics',
	 NOW(),
	'https://pbs.twimg.com/profile_images/1202979137184354305/yKvAZsT3_400x400.jpg'
)

INSERT INTO Book (publishment_id,edition,ISBN) VALUES 
(
	LAST_INSERT_ID(),
	3,
	'6585645'
)


-- Insert Magazine Data

-- Insert random book data

INSERT INTO Publishments (price,pages,stock,publisher,title,printed_date,cover) VALUES 
(
	100.00,
	10,
	1000,
	'Manjari Publications',
	'Time Magazine',
	 NOW(),
	'https://pbs.twimg.com/profile_images/1202979137184354305/yKvAZsT3_400x400.jpg'
)

INSERT INTO Magazine (publishment_id,issue) VALUES 
(
	LAST_INSERT_ID(),
	2
)

INSERT INTO Publishments (price,pages,stock,publisher,title,printed_date,cover) VALUES 
(
	120.00,
	20,
	5000,
	'Manjari Publications',
	'Times India Magazine',
	 NOW(),
	'https://pbs.twimg.com/profile_images/1202979137184354305/yKvAZsT3_400x400.jpg'
)

INSERT INTO Magazine (publishment_id,issue,period) VALUES 
(
	LAST_INSERT_ID(),
	2,
	'Annual'
)


-- Adding Data in Distributor Tables 

INSERT INTO Distributor (name,email,address_country,address_city,address_street,bank_name,account_name,account_number) VALUES 
(
	'Mero Link Pvt Ltd',
	'merolink@gmail.com',
	'Nepal',
	'Dhulikhel',
	'Vandol',
	'NIC Asia Bank',
	'Mero Link Pvt Ltd',
	'110020094023403'
)

INSERT INTO Distributor (name,email,address_country,address_city,address_street,bank_name,account_name,account_number) VALUES 
(
	'Tech Himalaya Pvt Ltd',
	'techhimalaya28@gmail.com',
	'Nepal',
	'Bharatpur',
	'Shamichowk',
	'Everest Asia Bank',
	'Tech Himalaya Software Solutions Pvt Ltd',
	'110020094023567'
)

-- Inserting Distributor  Phone Numbers in PhoneNumberDist Tables 

INSERT INTO PhoneNumberDist VALUES 
(
	2,
	'9869698962'
),
(
	2,
	'9865383233'
),
(
	1,
	'9845144428'
),
(
	1,
	'9865383246'
)

-- Assignning Authors to a book 
INSERT INTO author_book VALUES (1,1)
INSERT INTO author_book VALUES (1,2)
INSERT INTO author_book VALUES (2,3)
INSERT INTO author_book VALUES (2,4)

-- Creating Orders

order_id int NOT NULL UNIQUE auto_increment,
	total_amount double NOT NULL,
	status varchar(50) DEFAULT 'Placed',
	quantity int NOT NULL,
	is_preorder bool DEFAULT FALSE,
	distributor_id int NOT NULL,
	publishment_id

INSERT INTO orders(total_amount,status,quantity,is_preorder,distributor_id,publishment_id,order_date) VALUES 
(
	2000,
	'Paid',
	4,
	TRUE,
	1,
	1,	
	'1980-12-17'
)

INSERT INTO orders(total_amount,status,quantity,is_preorder,distributor_id,publishment_id,order_date) VALUES 
(
	12050,
	'Unpaid',
	1,
	FALSE,
	2,
	2,	
	NOW()
)

-- Doing Payments
tx_id varchar(50) NOT NULL UNIQUE,
	amount double NOT NULL,
	medium varchar(50) NOT NULL,
	order_id int,

INSERT INTO payment VALUES 
(
	'ds656uhajdh',
	2000.00,
	'Bank Transfer',
	1
)


