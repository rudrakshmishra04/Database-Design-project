CREATE TABLE customer (
    customer_id VARCHAR2(20)NOT NULL,
    cname VARCHAR2(40) NOT NULL,
    phone_number INTEGER,
    cpassword VARCHAR2(40),
    address VARCHAR2(40),
    dob DATE,
    PRIMARY KEY(customer_id)
);

CREATE TABLE staff (
    staff_id VARCHAR2(20) NOT NULL,
    sname VARCHAR2(40) NOT NULL,
    srole VARCHAR2(40) NOT NULL,
    email_id VARCHAR2(40),
    phone_number INTEGER NOT NULL,
    spassword VARCHAR2(40) NOT NULL,
    address VARCHAR2(40)NOT NULL,
    dob DATE NOT NULL,
    PRIMARY KEY(staff_id)
);



CREATE TABLE orders (
    order_id VARCHAR2(40) PRIMARY KEY,
    status VARCHAR2(40)  ,
    item_name VARCHAR2(40),
    quantity INTEGER,
    arrival_time TIMESTAMP,
    reservation_time TIMESTAMP NOT NULL,
    item_type VARCHAR2(40),
    customer_id VARCHAR2(40) NOT NULL,
    CONSTRAINT FK_customerorders FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE sit_table (
    table_id VARCHAR2(40) NOT NULL,
    table_type VARCHAR2(40) NOT NULL,
    table_capacity INTEGER NOT NULL,
    table_shape VARCHAR2(40) NOT NULL,
    table_status  VARCHAR2(40) NOT NULL,
    order_id  VARCHAR2(40),
    PRIMARY KEY (table_id),
    CONSTRAINT FK_orderstable FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE transactions (
    transaction_id VARCHAR2(40) NOT NULL,
    gratuities INTEGER,
    total_amount INTEGER NOT NULL,
    pay_cash VARCHAR(40),
    card_number INTEGER,
    card_type VARCHAR(40),
    customer_id VARCHAR2(40) NOT NULL,
    order_id VARCHAR2(40) NOT NULL,
    staff_id VARCHAR2(40) NOT NULL,
    PRIMARY KEY (transaction_id),
    CONSTRAINT FK_customertransaction FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT FK_orderstransaction FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT FK_stafftransaction FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE schedule (
    staff_id VARCHAR2(40) NOT NULL,
    schedule_date DATE NOT NULL,
    start_time TIMESTAMP NOT NULL,
    out_time TIMESTAMP NOT NULL,
    PRIMARY KEY (staff_id, schedule_date),
    CONSTRAINT FK_staffschedule FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE menu_item (
    menu_item_id VARCHAR2(40) NOT NULL,
    menu_item_name VARCHAR2(40) NOT NULL,
    menu_item_category VARCHAR2(40) NOT NULL,
    menu_item_price INTEGER NOT NULL,
    PRIMARY KEY(menu_item_id)
);

CREATE TABLE inventory (
    inventory_item_id VARCHAR2(40) NOT NULL,
    iname VARCHAR2(20) NOT NULL,
    quantity INTEGER,
    PRIMARY KEY(inventory_item_id)
);

CREATE TABLE takes (
    staff_id VARCHAR2(40) NOT NULL,
    order_id VARCHAR2(40) NOT NULL,
    PRIMARY KEY(staff_id, order_id),
    CONSTRAINT FK_stafftakes FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    CONSTRAINT FK_ordertakes FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE depends (
    menu_item_id VARCHAR2(40) NOT NULL,
    order_id VARCHAR2(40) NOT NULL,
    PRIMARY KEY(menu_item_id, order_id),
    CONSTRAINT FK_menuitemdepends FOREIGN KEY (menu_item_id) REFERENCES menu_item(menu_item_id),
    CONSTRAINT FK_ordersdepends FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE manages (
    inventory_item_id VARCHAR2(40) NOT NULL,
    staff_id VARCHAR2(40) NOT NULL,
    PRIMARY KEY(inventory_item_id, staff_id),
    CONSTRAINT FK_inventorymanages FOREIGN KEY (inventory_item_id) REFERENCES inventory(inventory_item_id),
    CONSTRAINT FK_staffmanages FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

DROP TABLE MANAGES;
DROP TABLE DEPENDS;
DROP TABLE TAKES;
DROP TABLE INVENTORY;
DROP TABLE MENU_ITEM;
DROP TABLE SCHEDULE;
DROP TABLE TRANSACTIONS;
DROP TABLE SIT_TABLE;
DROP TABLE ORDERS;
DROP TABLE STAFF;
DROP TABLE CUSTOMER;




insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C60681-5405', 'Hortensia Piercy', '0361413130', '6kDY7jWhSfC', '6276 Thierer Parkway', '15-Jan-2001');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C41163-168', 'Kinny Laight', null, 'jKn1xkeTfh', null, '07-Apr-2004');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C0363-4004', 'Marven Quigley', '4804208461', 'lBmNI3Su', '5 Green Drive', '10-Feb-1998');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C50268-696', 'Clywd Preist', '6102869737', 'UQo6mPI7', '87 Homewood Lane', null);
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C0781-3344', 'Roth Di Lucia', '5446440374', 'dLcayNVhN', '19330 Northwestern Parkway', '11-Feb-1970');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C0185-0064', 'Pierre Brugsma', '4770007507', 'ozxm2B', '01 Holy Cross Pass', null);
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C0699-5740', 'Pryce Merrington', '4365786202', 'UiZAJsvbP', '68 Mockingbird Hill', '11-Jul-1968');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C54569-5273', 'Carly Blaymires', '8925685604', 'JUde5Tdt', '4047 Clove Plaza', '14-Nov-1968');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C0942-6307', 'Hartwell Hoggetts', '0300398077', 'uRILUo650X9Z', '4 Dennis Trail', '27-Sep-1964');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C0245-0215', 'Cynthie Whitemarsh', '6174313433', 'S4cZ82', '54724 Artisan Trail', '18-Sep-1970');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C0178-0620', 'Ivette Passe', '4774735876', 'mqNGmIMVr0X', '2 Gateway Center', null);
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C24658-291', 'Merrel D''eye', '1067241191', 'toucFIuFYh', '595 Tony Alley', '16-Nov-1979');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C62144-5510', 'Marie-jeanne Bamforth', '3100841786', 'M2RZ4DYAF', '8002 Algoma Court', '20-Apr-2001');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C49897-161', 'Robbin Klausen', null, '97GhboAPv5mx', null, null);
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C37012-296', 'Raffaello Hebburn', '9659111533', null, '3 Raven Court', '13-May-1998');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C33261-376', 'Tiebold Glyde', null, 'dsOAXqp422', null, '25-Feb-1964');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C65044-2508', 'Shirleen Bollon', '0848562224', '2ttMNBKl1yX', '8 Lillian Alley', null);
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C0781-4003', 'Joell Stubbin', '2895476543', null, '32552 Merchant Place', '26-Jul-1965');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C61657-0970', 'Filip Cunnington', '4248369478', 'tGZxDG4yN', '8 Corry Court', '25-Jan-1970');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C63629-3092', 'Adrien Watson-Brown', '2373399784', '2Tfb7noO', '9657 Northfield Street', null);
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C42254-162', 'Wynne Moppett', '9515413699', 'rwCiX4Wv', '9 Eastlawn Park', null);
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C21695-184', 'Hermy Wortman', '0711003491', null, '4 Doe Crossing Hill', null);
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C67512-224', 'Seline Oldknow', '8492503076', 'M9XzOozUCldE', '66 Merrick Center', '04-May-1990');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C67253-102', 'Markos Westfield', null, 'cvbxUAxR5pMO', null, '13-Mar-1964');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C33342-102', 'Findlay Laidler', '8894167372', 'fWlyZs', '4 Ludington Point', '08-Jul-1980');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C41163-693', 'Jaime Goacher', '2031544985', '7IxzYTrXCg', '990 Elka Terrace', '31-Jul-1983');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C24236-284', 'Yancey Medlicott', '7683635448', 'dVGxj8SD', '40120 Killdeer Hill', '19-Nov-1996');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C57664-166', 'Sabina Sugden', null, 'W46UnwMU', null, null);
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C49288-0839', 'Sebastiano Silverthorne', null, 'yzKsouseO', null, '15-Aug-1968');
insert into customer (customer_id, cname, phone_number, cpassword, address, dob) values ('C63629-3178', 'Barrett Webling', '8636305969', 'VH7Hkru', '8 Esker Drive', '03-Nov-1971');



insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S41-393-3687', 'James Glasgow', 'Server', 'jglasgow0@theatlantic.com', '3097147551', 'edZgLuH1', '1 Fordem Hill', '15-Apr-1978');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S54-829-0076', 'Wadsworth Havenhand', 'Server', 'whavenhand1@dyndns.org', '3052756265', 'iaCJqlXJ', '84736 Magdeline Lane', '24-Jun-1982');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S72-440-3112', 'Maire Carnegy', 'Hostess', 'mcarnegy2@addthis.com', '0218890745', '1QQ9Ec', '9 Fulton Hill', '04-Aug-2001');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S96-650-2040', 'Kellyann Ingolotti', 'Restaurant Manager', 'kingolotti3@redcross.org', '4929941008', 'Ra36MA4iOD2', '16 Spenser Crossing', '07-Sep-1993');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S81-568-6109', 'Codie Biggs', 'Server', 'cbiggs4@example.com', '1576882527', 'wUh0Uzo53R', '548 Clarendon Trail', '07-Apr-1975');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S84-478-7030', 'Conant Casillas', 'Server', 'ccasillas5@toplist.cz', '1576889165', 'KURdlfv', '3742 Green Point', '27-Aug-1973');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S90-253-0218', 'Danica Sloss', 'Hostess', 'dsloss6@shop-pro.jp', '9865052784', '0YUzQpf0', '3 Vermont Circle', '19-May-1983');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S40-431-4394', 'Priscilla Alessandrini', 'Server', 'palessandrini7@sogou.com', '0864708742', '85kdw2R6w', '49 Anzinger Alley', '27-Apr-1964');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S23-234-8073', 'Chane O''Halligan', 'Server', 'cohalligan8@opensource.org', '4434442074', 'Wbzumfbmm', '91 Mockingbird Junction', '17-Dec-1963');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S50-384-9615', 'Urbano Pulman', 'Server', 'upulman9@yahoo.co.jp', '6023555195', 'SHqaeIu9mu6N', '34 Mcbride Crossing', '09-Dec-1982');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S20-016-9986', 'Vlad Flacke', 'Server', 'vflackea@ustream.tv', '5680050595', 'MY9gatMyR6w', '3 Graedel Crossing', '15-Feb-1964');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S77-220-8603', 'Amalie Jagger', 'Server', 'ajaggerb@issuu.com', '4944540221', 'EOJjBj', '6953 Buena Vista Lane', '25-Jan-1979');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S46-341-8787', 'Cornela Stuck', 'Server', 'cstuckc@blogs.com', '7835694840', 'UreRE6sKjmfG', '7 Eggendart Drive', '14-Apr-1999');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S30-103-7593', 'Bibbie McCarrell', 'Server', 'bmccarrelld@oracle.com', '0520868250', 'nN56BBqyfjlu', '78 Farmco Parkway', '24-Jan-1964');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S58-608-5847', 'Valentine Beall', 'Server', 'vbealle@wordpress.org', '3600483137', 'G2SQYYRz7', '216 Porter Alley', '03-Dec-1963');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S86-281-7740', 'Eleen Hullyer', 'Kitchen staff', 'ehullyerf@zdnet.com', '1593741448', 'zQHJBQCHB', '1738 Thierer Trail', '23-Jun-2004');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S94-828-3547', 'Idaline Rankcom', 'Kitchen staff', 'irankcomg@ehow.com', '9293855305', '2RCgNbA', '4352 Walton Center', '15-Jul-1962');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S63-051-7732', 'Aprilette Brecknock', 'Server', 'abrecknockh@flickr.com', '9519505113', 'KMQmcdpruq8', '901 8th Circle', '11-Sep-1991');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S28-190-5236', 'Tomi McCrystal', 'Executive Team', 'tmccrystali@wufoo.com', '0214029166', 'LJO2xQZg', '76736 Truax Park', '17-Jun-1990');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S38-030-3370', 'Lucita Sanday', 'Server', 'lsandayj@hubpages.com', '3007486440', 'xWCT7J3fR', '9807 Messerschmidt Center', '06-Apr-1968');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S99-178-4669', 'Beulah Tilson', 'Chief', 'btilsonk@moonfruit.com', '4491635889', 'xGkYhK', '0 Aberg Parkway', '16-May-1974');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S49-116-0132', 'Fulton Shepperd', 'Chief', 'fshepperdl@google.it', '6201137491', 'yIHFuecU', '28534 Independence Pass', '03-Nov-1967');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S92-680-8722', 'Moria Rawlinson', 'Chief', 'mrawlinsonm@godaddy.com', '9972679357', 'ho6sB6O3vWtX', '9 Glendale Pass', '29-Mar-1973');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S06-377-2956', 'Chris Ibbotson', 'Host', 'cibbotsonn@auda.org.au', '3355376124', 'yvWKuLsDfnTI', '76 Westport Pass', '30-May-1999');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S73-355-8673', 'Sibeal Dronsfield', 'Server', 'sdronsfieldo@army.mil', '6728509429', '9N86dAf', '782 Canary Trail', '22-Nov-2002');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S23-541-2014', 'Tamra Preece', 'Server', 'tpreecep@lycos.com', '8701801619', 'OU7QWa', '6841 Mesta Drive', '24-Sep-1961');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S90-850-6384', 'Donaugh Jollands', 'Server', 'djollandsq@google.co.jp', '3241424758', 'XHepoYg3WdyA', '2 Katie Circle', '26-Sep-2001');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S71-931-4657', 'Chelsae Gravatt', 'Executive Team', 'cgravattr@plala.or.jp', '4808388359', 'xNyPNr0H', '85607 Ryan Court', '06-Apr-2004');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S11-462-3354', 'Mario Willimont', 'Host', 'mwillimonts@sciencedaily.com', '4830914890', 'jKVTcPXO3p', '29 Arrowood Pass', '03-Jan-1987');
insert into staff (staff_id, sname, srole, email_id, phone_number, spassword, address, dob) values ('S14-144-1762', 'Charlton Treske', 'Server', 'ctresket@fda.gov', '5682540387', 'T3HBKd', '57 Del Sol Hill', '13-Dec-1996');


insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O59-643-1518', 'Completed', 'Pepperoni Pizza', 9, '01-JAN-03 02.00.00.000000000 AM', '01-JAN-03 02.00.00.000000000 AM', 'Main Course', 'C0781-4003');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O51-304-0108', 'Served', 'Chicken Stirfry', 4, '13-MAR-99 09.00.50.120000000 AM', '13-MAR-99 06.56.40.120000000 AM', 'Main Course', 'C0185-0064');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O70-252-2136', 'Preparing', 'Ice cream', 8, '14-FEB-21 09.00.50.120000000 AM', '12-FEB-21 04.45.50.130000000 AM', 'Desserts', 'C41163-168');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O70-004-8768', 'Cancelled', 'Jug of Beer', 4, '05-NOV-01 01.36.50.120000000 AM', '29-OCT-01 09.36.50.120000000 AM', 'Bar', 'C67253-102');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O41-605-9293', 'Confirmed', 'Hot Wings', 10, '08-SEP-04 04.45.50.130000000 AM', '01-SEP-04 06.17.30.010000000 AM', 'Desserts', 'C0245-0215');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O73-943-4184', 'Confirmed', 'Banana Split', 6, '14-FEB-21 09.00.50.120000000 AM', '12-FEB-21 04.45.50.130000000 AM', 'Desserts', 'C37012-296');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O02-101-8986', 'Served', 'Jug of Beer', 9, '05-NOV-01 01.36.50.120000000 AM', '29-OCT-01 09.36.50.120000000 AM', 'Bar', 'C0942-6307');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O96-679-4295', 'Served', 'Milk', 10, '14-FEB-21 09.00.50.120000000 AM', '12-FEB-21 04.45.50.130000000 AM', 'Beverages', 'C0942-6307');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O13-175-7648', 'Confirmed', 'Grilled Veggies', 3, '05-NOV-01 01.36.50.120000000 AM', '29-OCT-01 09.36.50.120000000 AM', 'Sides', 'C67512-224');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O13-137-5648', 'Served', 'Banana Split', 8, '14-FEB-21 09.00.50.120000000 AM', '12-FEB-21 04.45.50.130000000 AM', 'Desserts', 'C49897-161');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O24-933-4098', 'Completed', 'Ice cream', 7, '08-SEP-04 04.45.50.130000000 AM', '01-SEP-04 06.17.30.010000000 AM', 'Desserts', 'C0185-0064');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O75-215-4832', 'Served', 'House Wine', 10, '14-FEB-21 09.00.50.120000000 AM', '12-FEB-21 04.45.50.130000000 AM', 'Bar', 'C21695-184');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O91-608-0360', 'Cancelled', 'Cake', 6, '05-NOV-01 01.36.50.120000000 AM', '29-OCT-01 09.36.50.120000000 AM', 'Desserts', 'C0942-6307');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O01-549-0261', 'Confirmed', 'Coca Cola', 4, '14-FEB-21 09.00.50.120000000 AM', '12-FEB-21 04.45.50.130000000 AM', 'Beverages', 'C49288-0839');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O12-108-5617', 'Served', 'Juice', 9, '08-SEP-04 04.45.50.130000000 AM', '01-SEP-04 06.17.30.010000000 AM', 'Beverages', 'C54569-5273');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O71-234-0972', 'Served', 'Mojito', 10, '01-JAN-03 02.00.00.000000000 AM', '01-JAN-03 02.00.00.000000000 AM', 'Beverages', 'C37012-296');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O01-746-7957', 'Cancelled', 'Hot Wings', 3, '05-NOV-01 01.36.50.120000000 AM', '29-OCT-01 09.36.50.120000000 AM', 'Desserts', 'C0178-0620');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O43-390-1472', 'Confirmed', 'Juice', 3, '08-SEP-04 04.45.50.130000000 AM', '01-SEP-04 06.17.30.010000000 AM', 'Beverages', 'C24658-291');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O19-546-6196', 'Cancelled', 'Mocha Cheesecake', 1, '14-FEB-21 09.00.50.120000000 AM', '12-FEB-21 04.45.50.130000000 AM', 'Desserts', 'C37012-296');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O59-196-8946', 'Confirmed', 'French Fries', 4, '13-MAR-99 09.00.50.120000000 AM', '13-MAR-99 06.56.40.120000000 AM', 'Sides', 'C67253-102');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O10-625-1670', 'Confirmed', 'Coca Cola', 1, '05-NOV-01 01.36.50.120000000 AM', '29-OCT-01 09.36.50.120000000 AM', 'Beverages', 'C0781-4003');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O54-359-0296', 'Confirmed', 'Spaghetti', 8, '01-JAN-03 02.00.00.000000000 AM', '01-JAN-03 02.00.00.000000000 AM', 'Main Course', 'C63629-3178');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O75-634-9501', 'Preparing', 'Spaghetti', 5, '05-NOV-01 01.36.50.120000000 AM', '29-OCT-01 09.36.50.120000000 AM', 'Main Course', 'C41163-693');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O41-324-0223', 'Cancelled', 'Hot Wings', 5, '13-MAR-99 09.00.50.120000000 AM', '13-MAR-99 06.56.40.120000000 AM', 'Desserts', 'C33342-102');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O93-846-0284', 'Cancelled', 'Soda Pop', 2, '08-SEP-04 04.45.50.130000000 AM', '01-SEP-04 06.17.30.010000000 AM', 'Beverages', 'C0185-0064');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O60-673-5116', 'Confirmed', 'Vodka', 4, '05-NOV-01 01.36.50.120000000 AM', '29-OCT-01 09.36.50.120000000 AM', 'Bar', 'C21695-184');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O17-447-7125', 'Served', 'Vodka', 8, '14-FEB-21 09.00.50.120000000 AM', '12-FEB-21 04.45.50.130000000 AM', 'Bar', 'C60681-5405');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O41-578-6659', 'Confirmed', 'Mocha Cheesecake', 9, '13-MAR-99 09.00.50.120000000 AM', '13-MAR-99 06.56.40.120000000 AM', 'Desserts', 'C0781-3344');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O82-684-9256', 'Completed', 'BBQ Ribs', 3, '01-JAN-03 02.00.00.000000000 AM', '01-JAN-03 02.00.00.000000000 AM', 'Sides', 'C24236-284');
insert into orders (order_id, status, item_name, quantity, arrival_time, reservation_time, item_type, customer_id) values ('O44-895-4744', 'Cancelled', 'Jug of Beer', 5, '01-JAN-03 02.00.00.000000000 AM', '01-JAN-03 02.00.00.000000000 AM', 'Bar', 'C21695-184');


insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T78-931-4027', 'Small', 4, 'Oval', 'Reserved', 'O59-643-1518');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T43-167-0767', 'Large', 10, 'Oval', 'Occupied', 'O51-304-0108');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T04-443-4466', 'Medium', 6, 'Rectangle', 'Available', 'O70-252-2136');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T44-042-2461', 'Small', 4, 'Rectangle', 'Available', 'O70-004-8768');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T60-835-1739', 'Large', 12, 'Square', 'Reserved', 'O41-605-9293');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T10-478-6874', 'Medium', 6, 'Rectangle', 'Occupied', 'O73-943-4184');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T84-466-5350', 'Small', 4, 'Oval', 'Reserved', 'O02-101-8986');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T56-124-4353', 'Small', 4, 'Square', 'Available', 'O96-679-4295');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T87-424-9993', 'Large', 10, 'Rectangle', 'Occupied', 'O13-175-7648');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T48-324-4126', 'Small', 4, 'Oval', 'Occupied', 'O13-137-5648');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T63-159-5897', 'Medium', 6, 'Rectangle', 'Occupied', 'O24-933-4098');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T38-027-0336', 'Large', 10, 'Rectangle', 'Available', 'O75-215-4832');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T60-966-9584', 'Large', 12, 'Rectangle', 'Available', 'O91-608-0360');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T20-739-5270', 'Small', 4, 'Rectangle', 'Occupied', 'O01-549-0261');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T62-567-3648', 'Medium', 6, 'Oval', 'Available', 'O12-108-5617');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T73-662-7344', 'Small', 4, 'Rectangle', 'Reserved', 'O71-234-0972');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T57-969-2499', 'Medium', 6, 'Oval', 'Available', 'O01-746-7957');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T55-772-0070', 'Medium', 8, 'Oval', 'Reserved', 'O43-390-1472');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T54-381-3684', 'Medium', 6, 'Square', 'Available', 'O19-546-6196');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T48-310-6272', 'Large', 12, 'Oval', 'Reserved', 'O59-196-8946');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T90-664-8615', 'Large', 12, 'Rectangle', 'Occupied', 'O10-625-1670');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T43-051-2173', 'Small', 2, 'Oval', 'Available', 'O54-359-0296');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T20-704-2709', 'Large', 12, 'Rectangle', 'Available', 'O75-634-9501');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T56-372-8349', 'Small', 4, 'Square', 'Reserved', 'O41-324-0223');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T90-595-1885', 'Medium', 6, 'Oval', 'Available', 'O93-846-0284');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T66-227-3524', 'Small', 2, 'Oval', 'Reserved', 'O60-673-5116');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T96-487-0399', 'Small', 4, 'Oval', 'Available', 'O17-447-7125');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T72-578-9231', 'Medium', 8, 'Rectangle', 'Occupied', 'O41-578-6659');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T26-849-2693', 'Large', 12, 'Rectangle', 'Reserved', 'O82-684-9256');
insert into sit_table (table_id, table_type, table_capacity, table_shape, table_status, order_id) values ('T07-642-3594', 'Small', 4, 'Oval', 'Available', 'O44-895-4744');



insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR26-850-7314', null, 22.3, 'yes', null, null, 'C0781-4003', 'O59-643-1518', 'S41-393-3687');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR88-106-0488', 11.7, 40.5, null, '5602215955526681', 'bankcard', 'C0185-0064', 'O51-304-0108', 'S54-829-0076');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR91-243-9734', 1.9, 24.2, null, '5602230730098096', 'bankcard', 'C41163-168', 'O70-252-2136', 'S81-568-6109');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR61-855-2523', 14.9, 47.7, null, '5048372517125361', 'mastercard', 'C67253-102', 'O70-004-8768', 'S84-478-7030');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR30-803-5964', 29.8, 42.5, null, '4405098717367046', 'visa-electron', 'C0245-0215', 'O41-605-9293', 'S40-431-4394');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR57-322-3903', 22.4, 37.7, null, '5010128214691426', 'mastercard', 'C37012-296', 'O73-943-4184', 'S23-234-8073');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR34-851-6438', 24.2, 43.3, null, '4508813655505910', 'visa-electron', 'C0942-6307', 'O02-101-8986', 'S50-384-9615');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR21-537-1426', null, 38.3, null, '5602251911411163', 'bankcard', 'C0942-6307', 'O96-679-4295', 'S20-016-9986');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR12-141-7009', 19.5, 43.7, null, '30097481993665', 'diners-club-carte-blanche', 'C67512-224', 'O13-175-7648', 'S77-220-8603');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR18-467-2772', null, 34.8, null, '3562916765745154', 'jcb', 'C49897-161', 'O13-137-5648', 'S46-341-8787');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR02-552-1473', 22.5, 41.7, null, '5296605610215277', 'mastercard', 'C0185-0064', 'O24-933-4098', 'S30-103-7593');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR75-869-2031', 12.6, 21.4, null, '4017951419904450', 'visa', 'C21695-184', 'O75-215-4832', 'S58-608-5847');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR30-441-9746', 8.6, 33.7, null, '374622921133624', 'americanexpress', 'C0942-6307', 'O91-608-0360', 'S63-051-7732');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR12-093-3528', 39.7, 28.3, 'yes', null, null, 'C49288-0839', 'O01-549-0261', 'S38-030-3370');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR51-055-7147', 1.2, 25.7, null, '4026835463080748', 'visa-electron', 'C54569-5273', 'O12-108-5617', 'S73-355-8673');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR41-744-5438', null, 20.8, null, '3534078406854237', 'jcb', 'C37012-296', 'O71-234-0972', 'S23-541-2014');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR17-161-4288', 29.6, 27.3, 'yes', null, null, 'C0178-0620', 'O01-746-7957', 'S90-850-6384');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR35-053-0148', 11.7, 35.8, 'yes', null, null, 'C24658-291', 'O43-390-1472', 'S14-144-1762');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR34-979-8526', 38.8, 48.9, null, '3563025033614686', 'jcb', 'C37012-296', 'O19-546-6196', 'S41-393-3687');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR33-536-5992', 32.7, 23.4, null, '6304304141018650767', 'maestro', 'C67253-102', 'O59-196-8946', 'S54-829-0076');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR37-936-5906', 27.9, 46.7, null, '3540435724005615', 'jcb', 'C0781-4003', 'O10-625-1670', 'S81-568-6109');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR42-545-6502', 8.3, 33.9, null, '4953128855159255', 'visa', 'C63629-3178', 'O54-359-0296', 'S84-478-7030');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR03-536-8469', 13.1, 47.9, null, '50388201371779951', 'maestro', 'C41163-693', 'O75-634-9501', 'S40-431-4394');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR94-620-9133', 9.8, 42.2, null, '3534089341424143', 'jcb', 'C33342-102', 'O41-324-0223', 'S23-234-8073');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR84-064-2918', 8.4, 22.1, null, '3539577667512215', 'jcb', 'C0185-0064', 'O93-846-0284', 'S50-384-9615');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR05-091-8355', 7.3, 48.9, null, '341991815960842', 'americanexpress', 'C21695-184', 'O60-673-5116', 'S20-016-9986');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR97-762-2902', null, 48.1, null, '5007663383917496', 'mastercard', 'C60681-5405', 'O17-447-7125', 'S77-220-8603');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR45-565-6574', null, 35.2, 'yes', null, null, 'C0781-3344', 'O41-578-6659', 'S46-341-8787');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR73-362-8042', 18.8, 34.9, 'yes', null, null, 'C24236-284', 'O82-684-9256', 'S30-103-7593');
insert into transactions (transaction_id, gratuities, total_amount, pay_cash, card_number, card_type, customer_id, order_id, staff_id) values ('TR52-508-3931', 33.1, 27.7, 'yes', null, null, 'C21695-184', 'O44-895-4744', 'S58-608-5847');



insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S41-393-3687', '13-Mar-2021', '13-Mar-2021 09:00:00 AM', '13-Mar-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S54-829-0076', '13-Mar-2021', '13-Mar-2021 09:00:00 AM', '13-Mar-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S72-440-3112', '13-Mar-2021', '13-Mar-2021 09:00:00 AM', '13-Mar-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S96-650-2040', '13-Mar-2021', '13-Mar-2021 09:00:00 AM', '13-Mar-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S81-568-6109', '13-Mar-2021', '13-Mar-2021 09:00:00 AM', '13-Mar-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S84-478-7030', '13-Mar-2021', '13-Mar-2021 09:00:00 AM', '13-Mar-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S90-253-0218', '13-Mar-2021', '13-Mar-2021 09:00:00 AM', '13-Mar-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S40-431-4394', '13-Mar-2021', '13-Mar-2021 01:00:00 PM', '13-Mar-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S23-234-8073', '13-Mar-2021', '13-Mar-2021 01:00:00 PM', '13-Mar-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S50-384-9615', '13-Mar-2021', '13-Mar-2021 01:00:00 PM', '13-Mar-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S20-016-9986', '13-Mar-2021', '13-Mar-2021 01:00:00 PM', '13-Mar-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S77-220-8603', '13-Mar-2021', '13-Mar-2021 01:00:00 PM', '13-Mar-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S46-341-8787', '13-Mar-2021', '13-Mar-2021 01:00:00 PM', '13-Mar-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S30-103-7593', '13-Mar-2021', '13-Mar-2021 01:00:00 PM', '13-Mar-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S58-608-5847', '01-Nov-2021', '01-Nov-2021 09:00:00 AM', '01-Nov-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S86-281-7740', '01-Nov-2021', '01-Nov-2021 09:00:00 AM', '01-Nov-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S94-828-3547', '01-Nov-2021', '01-Nov-2021 09:00:00 AM', '01-Nov-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S63-051-7732', '01-Nov-2021', '01-Nov-2021 09:00:00 AM', '01-Nov-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S28-190-5236', '01-Nov-2021', '01-Nov-2021 09:00:00 AM', '01-Nov-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S38-030-3370', '01-Nov-2021', '01-Nov-2021 09:00:00 AM', '01-Nov-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S99-178-4669', '01-Nov-2021', '01-Nov-2021 09:00:00 AM', '01-Nov-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S49-116-0132', '01-Nov-2021', '01-Nov-2021 09:00:00 AM', '01-Nov-2021 12:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S92-680-8722', '01-Nov-2021', '01-Nov-2021 01:00:00 PM', '01-Nov-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S06-377-2956', '01-Nov-2021', '01-Nov-2021 01:00:00 PM', '01-Nov-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S73-355-8673', '01-Nov-2021', '01-Nov-2021 01:00:00 PM', '01-Nov-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S23-541-2014', '01-Nov-2021', '01-Nov-2021 01:00:00 PM', '01-Nov-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S90-850-6384', '01-Nov-2021', '01-Nov-2021 01:00:00 PM', '01-Nov-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S71-931-4657', '01-Nov-2021', '01-Nov-2021 01:00:00 PM', '01-Nov-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S11-462-3354', '01-Nov-2021', '01-Nov-2021 01:00:00 PM', '01-Nov-2021 09:00:00 PM');
insert into schedule (staff_id, schedule_date, start_time, out_time) values ('S14-144-1762', '01-Nov-2021', '01-Nov-2021 01:00:00 PM', '01-Nov-2021 09:00:00 PM');


insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M32-635-5347', 'Garlic Bread', 'Appetizers', 24.05);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M70-404-8090', 'Cheese Plate', 'Appetizers', 10.42);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M89-420-8827', 'Nachos', 'Appetizers', 18.52);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M98-483-9676', 'Tossed Salad', 'Appetizers', 29.54);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M07-952-1091', 'Caesar Salad', 'Appetizers', 17.34);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M74-170-0779', 'Soup of the Day', 'Appetizers', 17.39);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M94-912-9088', 'Spaghetti', 'Main Course', 23.91);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M52-065-5924', 'Pepperoni Pizza', 'Main Course', 14.69);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M78-364-5614', 'Fettucini', 'Main Course', 24.99);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M83-621-0825', 'New York Steak', 'Main Course', 11.24);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M96-677-1054', 'Chicken Stirfry', 'Main Course', 18.49);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M68-467-9859', 'Hearty Stew', 'Main Course', 20.74);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M79-061-1888', 'French Fries', 'Sides', 24.05);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M54-020-6135', 'Rice', 'Sides', 26.51);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M24-870-7939', 'Grilled Veggies', 'Sides', 13.25);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M25-239-7071', 'Fajitas', 'Sides', 25.14);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M91-012-6687', 'Nachos', 'Appetizers', 15.63);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M66-585-7062', 'Enchilladas', 'Sides', 28.49);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M02-050-2642', 'BBQ Ribs', 'Sides', 21.2);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M03-707-7044', 'Hot Wings', 'Sides', 12.31);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M53-569-6502', 'Chicken Cordon Bleu', 'Sides', 27.33);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M89-667-8508', 'Apple Pie', 'Desserts', 15.81);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M77-131-5911', 'Mocha Cheesecake', 'Desserts', 10.06);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M66-435-9731', 'Banana Split', 'Desserts', 16.45);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M46-318-1676', 'Soda Pop', 'Beverages', 22.19);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M26-677-5953', 'Juice', 'Beverages', 19.09);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M18-539-6545', 'Milk', 'Beverages', 29.69);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M32-863-9595', 'Coca Cola', 'Beverages', 23.16);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M37-345-9802', 'Mojito', 'Beverages', 26.18);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M48-389-9286', 'House Wine', 'Bar', 21.06);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M79-826-4351', 'Jug of Beer', 'Bar', 17.29);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M22-578-6143', 'Peach Cider', 'Bar', 16.92);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M05-987-3807', 'Vodka', 'Bar', 25.43);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M26-644-2566', 'Ice Cream', 'Desserts', 16.94);
insert into menu_item (menu_item_id, menu_item_name, menu_item_category, menu_item_price) values ('M47-723-6873', 'Cake', 'Desserts', 10.17);

insert into inventory (inventory_item_id, iname, quantity) values ('I06-148-4801', 'Apples', 2);
insert into inventory (inventory_item_id, iname, quantity) values ('I19-632-1004', 'Bananas', 19);
insert into inventory (inventory_item_id, iname, quantity) values ('I95-730-1833', 'Pears', 2);
insert into inventory (inventory_item_id, iname, quantity) values ('I27-581-8026', 'Apricots', 12);
insert into inventory (inventory_item_id, iname, quantity) values ('I18-523-1712', 'Peaches', 16);
insert into inventory (inventory_item_id, iname, quantity) values ('I30-892-1696', 'Plums', 18);
insert into inventory (inventory_item_id, iname, quantity) values ('I59-091-5050', 'Avocados', null);
insert into inventory (inventory_item_id, iname, quantity) values ('I89-063-9771', 'Asparagus', 17);
insert into inventory (inventory_item_id, iname, quantity) values ('I82-669-5608', 'Eggplant', 2);
insert into inventory (inventory_item_id, iname, quantity) values ('I19-119-2311', 'Spinach', 13);
insert into inventory (inventory_item_id, iname, quantity) values ('I40-560-2319', 'Kale', 9);
insert into inventory (inventory_item_id, iname, quantity) values ('I98-543-6026', 'Broccoli', 20);
insert into inventory (inventory_item_id, iname, quantity) values ('I80-559-5778', 'Wheat', 11);
insert into inventory (inventory_item_id, iname, quantity) values ('I77-203-3728', 'Rice', 20);
insert into inventory (inventory_item_id, iname, quantity) values ('I87-704-9996', 'Buckwheat', 3);
insert into inventory (inventory_item_id, iname, quantity) values ('I59-258-4699', 'Quinoa', 5);
insert into inventory (inventory_item_id, iname, quantity) values ('I22-724-0414', 'Oats', 17);
insert into inventory (inventory_item_id, iname, quantity) values ('I26-140-4088', 'Amaranth', 8);
insert into inventory (inventory_item_id, iname, quantity) values ('I75-059-7784', 'Apples', 1);
insert into inventory (inventory_item_id, iname, quantity) values ('I05-215-6356', 'Bananas', 4);
insert into inventory (inventory_item_id, iname, quantity) values ('I08-675-1159', 'Pears', 15);
insert into inventory (inventory_item_id, iname, quantity) values ('I84-718-3746', 'Apricots', 13);
insert into inventory (inventory_item_id, iname, quantity) values ('I42-079-7968', 'Peaches', 19);
insert into inventory (inventory_item_id, iname, quantity) values ('I60-831-3424', 'Plums', 5);
insert into inventory (inventory_item_id, iname, quantity) values ('I77-668-0398', 'Avocados', 3);
insert into inventory (inventory_item_id, iname, quantity) values ('I83-705-0986', 'Asparagus', 1);
insert into inventory (inventory_item_id, iname, quantity) values ('I39-219-4883', 'Eggplant', null);
insert into inventory (inventory_item_id, iname, quantity) values ('I08-296-1106', 'Spinach', 9);
insert into inventory (inventory_item_id, iname, quantity) values ('I43-933-2597', 'Kale', 6);
insert into inventory (inventory_item_id, iname, quantity) values ('I97-158-6819', 'Broccoli', 14);



insert into takes (staff_id, order_id) values ('S41-393-3687', 'O59-643-1518');
insert into takes (staff_id, order_id) values ('S54-829-0076', 'O51-304-0108');
insert into takes (staff_id, order_id) values ('S81-568-6109', 'O70-252-2136');
insert into takes (staff_id, order_id) values ('S84-478-7030', 'O70-004-8768');
insert into takes (staff_id, order_id) values ('S40-431-4394', 'O41-605-9293');
insert into takes (staff_id, order_id) values ('S23-234-8073', 'O73-943-4184');
insert into takes (staff_id, order_id) values ('S50-384-9615', 'O02-101-8986');
insert into takes (staff_id, order_id) values ('S20-016-9986', 'O96-679-4295');
insert into takes (staff_id, order_id) values ('S77-220-8603', 'O13-175-7648');
insert into takes (staff_id, order_id) values ('S46-341-8787', 'O13-137-5648');
insert into takes (staff_id, order_id) values ('S30-103-7593', 'O24-933-4098');
insert into takes (staff_id, order_id) values ('S58-608-5847', 'O75-215-4832');
insert into takes (staff_id, order_id) values ('S63-051-7732', 'O91-608-0360');
insert into takes (staff_id, order_id) values ('S38-030-3370', 'O01-549-0261');
insert into takes (staff_id, order_id) values ('S73-355-8673', 'O12-108-5617');
insert into takes (staff_id, order_id) values ('S23-541-2014', 'O71-234-0972');
insert into takes (staff_id, order_id) values ('S90-850-6384', 'O01-746-7957');
insert into takes (staff_id, order_id) values ('S14-144-1762', 'O43-390-1472');
insert into takes (staff_id, order_id) values ('S41-393-3687', 'O19-546-6196');
insert into takes (staff_id, order_id) values ('S54-829-0076', 'O59-196-8946');
insert into takes (staff_id, order_id) values ('S81-568-6109', 'O10-625-1670');
insert into takes (staff_id, order_id) values ('S84-478-7030', 'O54-359-0296');
insert into takes (staff_id, order_id) values ('S40-431-4394', 'O75-634-9501');
insert into takes (staff_id, order_id) values ('S23-234-8073', 'O41-324-0223');
insert into takes (staff_id, order_id) values ('S50-384-9615', 'O93-846-0284');
insert into takes (staff_id, order_id) values ('S20-016-9986', 'O60-673-5116');
insert into takes (staff_id, order_id) values ('S77-220-8603', 'O17-447-7125');
insert into takes (staff_id, order_id) values ('S46-341-8787', 'O41-578-6659');
insert into takes (staff_id, order_id) values ('S30-103-7593', 'O82-684-9256');
insert into takes (staff_id, order_id) values ('S58-608-5847', 'O44-895-4744');


insert into depends (menu_item_id, order_id) values ('M52-065-5924', 'O59-643-1518');
insert into depends (menu_item_id, order_id) values ('M96-677-1054', 'O51-304-0108');
insert into depends (menu_item_id, order_id) values ('M26-644-2566', 'O70-252-2136');
insert into depends (menu_item_id, order_id) values ('M79-826-4351', 'O70-004-8768');
insert into depends (menu_item_id, order_id) values ('M03-707-7044', 'O41-605-9293');
insert into depends (menu_item_id, order_id) values ('M66-435-9731', 'O73-943-4184');
insert into depends (menu_item_id, order_id) values ('M79-826-4351', 'O02-101-8986');
insert into depends (menu_item_id, order_id) values ('M18-539-6545', 'O96-679-4295');
insert into depends (menu_item_id, order_id) values ('M24-870-7939', 'O13-175-7648');
insert into depends (menu_item_id, order_id) values ('M66-435-9731', 'O13-137-5648');
insert into depends (menu_item_id, order_id) values ('M26-644-2566', 'O24-933-4098');
insert into depends (menu_item_id, order_id) values ('M48-389-9286', 'O75-215-4832');
insert into depends (menu_item_id, order_id) values ('M47-723-6873', 'O91-608-0360');
insert into depends (menu_item_id, order_id) values ('M32-863-9595', 'O01-549-0261');
insert into depends (menu_item_id, order_id) values ('M26-677-5953', 'O12-108-5617');
insert into depends (menu_item_id, order_id) values ('M37-345-9802', 'O71-234-0972');
insert into depends (menu_item_id, order_id) values ('M03-707-7044', 'O01-746-7957');
insert into depends (menu_item_id, order_id) values ('M26-677-5953', 'O43-390-1472');
insert into depends (menu_item_id, order_id) values ('M77-131-5911', 'O19-546-6196');
insert into depends (menu_item_id, order_id) values ('M79-061-1888', 'O59-196-8946');
insert into depends (menu_item_id, order_id) values ('M32-863-9595', 'O10-625-1670');
insert into depends (menu_item_id, order_id) values ('M94-912-9088', 'O54-359-0296');
insert into depends (menu_item_id, order_id) values ('M94-912-9088', 'O75-634-9501');
insert into depends (menu_item_id, order_id) values ('M03-707-7044', 'O41-324-0223');
insert into depends (menu_item_id, order_id) values ('M46-318-1676', 'O93-846-0284');
insert into depends (menu_item_id, order_id) values ('M05-987-3807', 'O60-673-5116');
insert into depends (menu_item_id, order_id) values ('M05-987-3807', 'O17-447-7125');
insert into depends (menu_item_id, order_id) values ('M77-131-5911', 'O41-578-6659');
insert into depends (menu_item_id, order_id) values ('M02-050-2642', 'O82-684-9256');
insert into depends (menu_item_id, order_id) values ('M79-826-4351', 'O44-895-4744');


insert into manages (inventory_item_id, staff_id) values ('I06-148-4801', 'S96-650-2040');
insert into manages (inventory_item_id, staff_id) values ('I19-632-1004', 'S86-281-7740');
insert into manages (inventory_item_id, staff_id) values ('I95-730-1833', 'S94-828-3547');
insert into manages (inventory_item_id, staff_id) values ('I27-581-8026', 'S99-178-4669');
insert into manages (inventory_item_id, staff_id) values ('I18-523-1712', 'S49-116-0132');
insert into manages (inventory_item_id, staff_id) values ('I30-892-1696', 'S92-680-8722');
insert into manages (inventory_item_id, staff_id) values ('I59-091-5050', 'S71-931-4657');
insert into manages (inventory_item_id, staff_id) values ('I89-063-9771', 'S96-650-2040');
insert into manages (inventory_item_id, staff_id) values ('I82-669-5608', 'S86-281-7740');
insert into manages (inventory_item_id, staff_id) values ('I19-119-2311', 'S94-828-3547');
insert into manages (inventory_item_id, staff_id) values ('I40-560-2319', 'S99-178-4669');
insert into manages (inventory_item_id, staff_id) values ('I98-543-6026', 'S49-116-0132');
insert into manages (inventory_item_id, staff_id) values ('I80-559-5778', 'S92-680-8722');
insert into manages (inventory_item_id, staff_id) values ('I77-203-3728', 'S71-931-4657');
insert into manages (inventory_item_id, staff_id) values ('I87-704-9996', 'S96-650-2040');
insert into manages (inventory_item_id, staff_id) values ('I59-258-4699', 'S86-281-7740');
insert into manages (inventory_item_id, staff_id) values ('I22-724-0414', 'S94-828-3547');
insert into manages (inventory_item_id, staff_id) values ('I26-140-4088', 'S99-178-4669');
insert into manages (inventory_item_id, staff_id) values ('I75-059-7784', 'S49-116-0132');
insert into manages (inventory_item_id, staff_id) values ('I05-215-6356', 'S92-680-8722');
insert into manages (inventory_item_id, staff_id) values ('I08-675-1159', 'S71-931-4657');
insert into manages (inventory_item_id, staff_id) values ('I84-718-3746', 'S96-650-2040');
insert into manages (inventory_item_id, staff_id) values ('I42-079-7968', 'S86-281-7740');
insert into manages (inventory_item_id, staff_id) values ('I60-831-3424', 'S94-828-3547');
insert into manages (inventory_item_id, staff_id) values ('I77-668-0398', 'S99-178-4669');
insert into manages (inventory_item_id, staff_id) values ('I83-705-0986', 'S49-116-0132');
insert into manages (inventory_item_id, staff_id) values ('I39-219-4883', 'S92-680-8722');
insert into manages (inventory_item_id, staff_id) values ('I08-296-1106', 'S71-931-4657');
insert into manages (inventory_item_id, staff_id) values ('I43-933-2597', 'S96-650-2040');
insert into manages (inventory_item_id, staff_id) values ('I97-158-6819', 'S86-281-7740');


/* DISPLAY ALL THE name of CUSTOMERS TO WHOM YOU CAN SEND TEXT MESSAGE*/
SELECT cname, phone_number FROM customer WHERE phone_number IS NOT NULL ;


/* Display all the staff who came to work on 1st nov 2021*/
SELECT staff.sname
FROM schedule
INNER JOIN staff ON schedule.staff_id=staff.staff_id WHERE schedule.schedule_date = '01-Nov-21' ;

/* Display the most ordered items and which category do they belong to*/
SELECT item_name, COUNT(*), item_type
FROM orders
GROUP BY item_name, item_type
HAVING COUNT(*) > 2;

/* Display the names of the customers who gave gratuities and used a card to do the payment*/
SELECT DISTINCT C.cname
FROM transactions T
RIGHT JOIN customer C ON  T.customer_id=C.customer_id WHERE gratuities IS NOT NULL AND pay_cash IS NULL;

/* Display the names and dob of the servers who took Bar orders and verfied the card payments done by jbc cards*/
SELECT DISTINCT S.sname, S.dob
FROM staff S, transactions T, orders O
WHERE S.staff_id=T.staff_id AND O.order_id=T.order_id AND T.card_type = 'jbc'

UNION

SELECT DISTINCT S.sname, S.dob
FROM staff S, transactions T, orders O
WHERE S.staff_id=T.staff_id AND O.order_id=T.order_id AND O.item_type = 'Bar';

/* Display the roles of the staff members who can edit the inventory*/
SELECT DISTINCT S.srole, S.sname
FROM staff S, inventory I, manages M
WHERE S.staff_id=M.staff_id AND I.inventory_item_id=M.inventory_item_id;

/* Display the names of the customers who cancled they orders*/

SELECT DISTINCT C.cname
FROM    customer C
WHERE  C.customer_id IN  (   SELECT  O.customer_id
                               FROM  orders O
                               WHERE  O.status='Cancelled');
                               
/* Display the id of the table whose table status is occupied and the order status is served*/
SELECT T.table_id, O.status, t.table_status
FROM sit_table T
INNER JOIN orders O ON T.order_id=o.order_id WHERE t.table_status LIKE 'O%' AND O.status LIKE 'S%' ;

/* Group and display the table based on their type and shape*/
SELECT table_type, table_shape, COUNT(*)
FROM sit_table
GROUP BY table_type, table_shape;

CREATE TABLE Faculty(
ssn VARCHAR2(20) PRIMARY KEY,
fname VARCHAR2(20), 
frank VARCHAR2(20), 
salary integer, 
phone VARCHAR2(20), 
specialties VARCHAR2(20)
);
drop table faculty;

INSERT INTO Faculty (ssn, fname, frank, salary, phone, specialties) values ('suiGQDIUQD21782', ' AMBIKA CHUDNRU', 'full proffesor', 500000, '8749812498', 'art');
INSERT INTO Faculty (ssn, fname, frank, salary, phone, specialties) values ('suiGQDIUQsd21782', ' AMBIKA fundru', 'proffesor', 800000, '8749def12498', 'sprots');
INSERT INTO faculty (ssn, fname, frank, salary, phone, specialties) values ('suiGQderUQD21782', ' AMBI CHUD', 'full proffesor', 700000, '8749812498', 'geo');


SELECT specialties

FROM Faculty

WHERE frank='full proffesor'AND salary =(select Max(salary) from Faculty);


select specialties, Max(salary) from Faculty
where frank='full proffesor';



SELECT specialties
FROM Faculty 
WHERE frank='full proffesor' AND salary IN
(SELECT salary FROM Faculty MINUS SELECT MAX(salary) 
FROM Faculty); 




SELECT specialties

FROM Faculty

WHERE salary = (SELECT MAX (salary) FROM Faculty WHERE frank='full proffesor');
