-- ------------ Write CREATE-DATABASE-stage scripts -----------

CREATE SCHEMA IF NOT EXISTS pubs_dbo;

-- ------------ Write CREATE-DOMAIN-stage scripts -----------

CREATE DOMAIN pubs_dbo.empid AS CHAR(9) NOT NULL;

CREATE DOMAIN pubs_dbo.id AS VARCHAR(11) NOT NULL;

CREATE DOMAIN pubs_dbo.tid AS VARCHAR(6) NOT NULL;

-- ------------ Write CREATE-TABLE-stage scripts -----------

CREATE TABLE pubs_dbo."Order Details"(
    orderid INTEGER NOT NULL,
    productid INTEGER NOT NULL,
    unitprice NUMERIC(19,4) NOT NULL DEFAULT (0),
    quantity SMALLINT NOT NULL DEFAULT (1),
    discount DOUBLE PRECISION NOT NULL DEFAULT (0)
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.authors(
    au_id pubs_dbo.id NOT NULL,
    au_lname VARCHAR(40) NOT NULL,
    au_fname VARCHAR(20) NOT NULL,
    phone CHAR(12) NOT NULL DEFAULT 'UNKNOWN',
    address VARCHAR(40),
    city VARCHAR(20),
    state CHAR(2),
    zip CHAR(5),
    contract NUMERIC(1,0) NOT NULL
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.categories(
    categoryid INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
    categoryname VARCHAR(15) NOT NULL,
    description TEXT,
    picture BYTEA
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.customercustomerdemo(
    customerid CHAR(5) NOT NULL,
    customertypeid CHAR(10) NOT NULL
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.customerdemographics(
    customertypeid CHAR(10) NOT NULL,
    customerdesc TEXT
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.customers(
    customerid CHAR(5) NOT NULL,
    companyname VARCHAR(40) NOT NULL,
    contactname VARCHAR(30),
    contacttitle VARCHAR(30),
    address VARCHAR(60),
    city VARCHAR(15),
    region VARCHAR(15),
    postalcode VARCHAR(10),
    country VARCHAR(15),
    phone VARCHAR(24),
    fax VARCHAR(24)
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.discounts(
    discounttype VARCHAR(40) NOT NULL,
    stor_id CHAR(4),
    lowqty SMALLINT,
    highqty SMALLINT,
    discount NUMERIC(4,2) NOT NULL
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.employee(
    emp_id pubs_dbo.empid NOT NULL,
    fname VARCHAR(20) NOT NULL,
    minit CHAR(1),
    lname VARCHAR(30) NOT NULL,
    job_id SMALLINT NOT NULL DEFAULT (1),
    job_lvl SMALLINT DEFAULT (10),
    pub_id CHAR(4) NOT NULL DEFAULT '9952',
    hire_date TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT clock_timestamp()
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.employees(
    employeeid INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
    lastname VARCHAR(20) NOT NULL,
    firstname VARCHAR(10) NOT NULL,
    title VARCHAR(30),
    titleofcourtesy VARCHAR(25),
    birthdate TIMESTAMP WITHOUT TIME ZONE,
    hiredate TIMESTAMP WITHOUT TIME ZONE,
    address VARCHAR(60),
    city VARCHAR(15),
    region VARCHAR(15),
    postalcode VARCHAR(10),
    country VARCHAR(15),
    homephone VARCHAR(24),
    extension VARCHAR(4),
    photo BYTEA,
    notes TEXT,
    reportsto INTEGER,
    photopath VARCHAR(255)
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.employeeterritories(
    employeeid INTEGER NOT NULL,
    territoryid VARCHAR(20) NOT NULL
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.jobs(
    job_id SMALLINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    job_desc VARCHAR(50) NOT NULL DEFAULT 'New Position - title not formalized yet',
    min_lvl SMALLINT NOT NULL,
    max_lvl SMALLINT NOT NULL
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.orders(
    orderid INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
    customerid CHAR(5),
    employeeid INTEGER,
    orderdate TIMESTAMP WITHOUT TIME ZONE,
    requireddate TIMESTAMP WITHOUT TIME ZONE,
    shippeddate TIMESTAMP WITHOUT TIME ZONE,
    shipvia INTEGER,
    freight NUMERIC(19,4) DEFAULT (0),
    shipname VARCHAR(40),
    shipaddress VARCHAR(60),
    shipcity VARCHAR(15),
    shipregion VARCHAR(15),
    shippostalcode VARCHAR(10),
    shipcountry VARCHAR(15)
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.products(
    productid INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
    productname VARCHAR(40) NOT NULL,
    supplierid INTEGER,
    categoryid INTEGER,
    quantityperunit VARCHAR(20),
    unitprice NUMERIC(19,4) DEFAULT (0),
    unitsinstock SMALLINT DEFAULT (0),
    unitsonorder SMALLINT DEFAULT (0),
    reorderlevel SMALLINT DEFAULT (0),
    discontinued NUMERIC(1,0) NOT NULL DEFAULT (0)
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.pub_info(
    pub_id CHAR(4) NOT NULL,
    logo BYTEA,
    pr_info TEXT
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.publishers(
    pub_id CHAR(4) NOT NULL,
    pub_name VARCHAR(40),
    city VARCHAR(20),
    state CHAR(2),
    country VARCHAR(30) DEFAULT 'USA'
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.region(
    regionid INTEGER NOT NULL,
    regiondescription CHAR(50) NOT NULL
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.roysched(
    title_id pubs_dbo.tid NOT NULL,
    lorange INTEGER,
    hirange INTEGER,
    royalty INTEGER
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.sales(
    stor_id CHAR(4) NOT NULL,
    ord_num VARCHAR(20) NOT NULL,
    ord_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    qty SMALLINT NOT NULL,
    payterms VARCHAR(12) NOT NULL,
    title_id pubs_dbo.tid NOT NULL
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.shippers(
    shipperid INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
    companyname VARCHAR(40) NOT NULL,
    phone VARCHAR(24)
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.stores(
    stor_id CHAR(4) NOT NULL,
    stor_name VARCHAR(40),
    stor_address VARCHAR(40),
    city VARCHAR(20),
    state CHAR(2),
    zip CHAR(5)
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.suppliers(
    supplierid INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
    companyname VARCHAR(40) NOT NULL,
    contactname VARCHAR(30),
    contacttitle VARCHAR(30),
    address VARCHAR(60),
    city VARCHAR(15),
    region VARCHAR(15),
    postalcode VARCHAR(10),
    country VARCHAR(15),
    phone VARCHAR(24),
    fax VARCHAR(24),
    homepage TEXT
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.territories(
    territoryid VARCHAR(20) NOT NULL,
    territorydescription CHAR(50) NOT NULL,
    regionid INTEGER NOT NULL
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.titleauthor(
    au_id pubs_dbo.id NOT NULL,
    title_id pubs_dbo.tid NOT NULL,
    au_ord SMALLINT,
    royaltyper INTEGER
)
        WITH (
        OIDS=FALSE
        );

CREATE TABLE pubs_dbo.titles(
    title_id pubs_dbo.tid NOT NULL,
    title VARCHAR(80) NOT NULL,
    type CHAR(12) NOT NULL DEFAULT 'UNDECIDED',
    pub_id CHAR(4),
    price NUMERIC(19,4),
    advance NUMERIC(19,4),
    royalty INTEGER,
    ytd_sales INTEGER,
    notes VARCHAR(200),
    pubdate TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT clock_timestamp()
)
        WITH (
        OIDS=FALSE
        );

-- ------------ Write CREATE-VIEW-stage scripts -----------

CREATE OR REPLACE  VIEW pubs_dbo."Alphabetical list of products" (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued, categoryname) AS
SELECT
    pubs_dbo.products.*, categories.categoryname
    FROM pubs_dbo.categories
    INNER JOIN pubs_dbo.products
        ON categories.categoryid = products.ix_products_categoryid
    WHERE (((products.discontinued) = 0));

CREATE OR REPLACE  VIEW pubs_dbo."Category Sales for 1997" (categoryname, categorysales) AS
SELECT
    "Product Sales for 1997".categoryname, SUM("Product Sales for 1997".productsales) AS categorysales
    FROM pubs_dbo."Product Sales for 1997"
    GROUP BY "Product Sales for 1997".categoryname;

CREATE OR REPLACE  VIEW pubs_dbo."Current Product List" (productid, productname) AS
SELECT
    product_list.productid, product_list.productname
    FROM pubs_dbo.products AS product_list
    WHERE (((product_list.discontinued) = 0));
/* ORDER BY Product_List.ProductName */;

CREATE OR REPLACE  VIEW pubs_dbo."Customer and Suppliers by City" (city, companyname, contactname, relationship) AS
SELECT
    city, companyname, contactname, 'Customers'::TEXT AS relationship
    FROM pubs_dbo.customers
UNION
SELECT
    city, companyname, contactname, 'Suppliers'::TEXT
    FROM pubs_dbo.suppliers;
/* ORDER BY City, CompanyName */;

CREATE OR REPLACE  VIEW pubs_dbo."Order Details Extended" (orderid, productid, productname, unitprice, quantity, discount, extendedprice) AS
SELECT
    "Order Details".orderid, "Order Details".productid, products.productname, "Order Details".unitprice, "Order Details".quantity, "Order Details".discount, (CAST (("Order Details".unitprice * quantity * (1 - discount) / 100) AS NUMERIC(19, 4)) * 100) AS extendedprice
    FROM pubs_dbo.products
    INNER JOIN pubs_dbo."Order Details"
        ON products.productid = "Order Details"."IX_Order Details_ProductID";
/* ORDER BY "Order Details".OrderID */;

CREATE OR REPLACE  VIEW pubs_dbo."Order Subtotals" (orderid, subtotal) AS
SELECT
    "Order Details".orderid, SUM(CAST (("Order Details".unitprice * quantity * (1 - discount) / 100) AS NUMERIC(19, 4)) * 100) AS subtotal
    FROM pubs_dbo."Order Details"
    GROUP BY "Order Details"."IX_Order Details_OrderID";

CREATE OR REPLACE  VIEW pubs_dbo."Orders Qry" (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry, companyname, address, city, region, postalcode, country) AS
SELECT
    orders.orderid, orders.customerid, orders.employeeid, orders.orderdate, orders.requireddate, orders.shippeddate, orders.shipvia, orders.freight, orders.shipname, orders.shipaddress, orders.shipcity, orders.shipregion, orders.shippostalcode, orders.shipcountry, customers.companyname, customers.address, customers.city, customers.region, customers.postalcode, customers.country
    FROM pubs_dbo.customers
    INNER JOIN pubs_dbo.orders
        ON LOWER(customers.customerid) = LOWER(orders.ix_orders_customerid);

CREATE OR REPLACE  VIEW pubs_dbo."Product Sales for 1997" (categoryname, productname, productsales) AS
SELECT
    categories.categoryname, products.productname, SUM(CAST (("Order Details".unitprice * quantity * (1 - discount) / 100) AS NUMERIC(19, 4)) * 100) AS productsales
    FROM (pubs_dbo.categories
    INNER JOIN pubs_dbo.products
        ON categories.categoryid = products.ix_products_categoryid)
    INNER JOIN (pubs_dbo.orders
    INNER JOIN pubs_dbo."Order Details"
        ON orders.orderid = "Order Details"."IX_Order Details_OrderID")
        ON products.productid = "Order Details"."IX_Order Details_ProductID"
    WHERE (((orders.ix_orders_shippeddate) BETWEEN '19970101' AND '19971231'))
    GROUP BY categories.ix_categories_categoryname, products.ix_products_productname;

CREATE OR REPLACE  VIEW pubs_dbo."Products Above Average Price" (productname, unitprice) AS
SELECT
    products.productname, products.unitprice
    FROM pubs_dbo.products
    WHERE products.unitprice > (SELECT
        AVG(unitprice)
        FROM pubs_dbo.products);
/* ORDER BY Products.UnitPrice DESC */;

CREATE OR REPLACE  VIEW pubs_dbo."Products by Category" (categoryname, productname, quantityperunit, unitsinstock, discontinued) AS
SELECT
    categories.categoryname, products.productname, products.quantityperunit, products.unitsinstock, products.discontinued
    FROM pubs_dbo.categories
    INNER JOIN pubs_dbo.products
        ON categories.categoryid = products.ix_products_categoryid
    WHERE products.discontinued <> 1;
/* ORDER BY Categories.CategoryName, Products.ProductName */;

CREATE OR REPLACE  VIEW pubs_dbo."Quarterly Orders" (customerid, companyname, city, country) AS
SELECT DISTINCT
    customers.customerid, customers.companyname, customers.city, customers.country
    FROM pubs_dbo.customers
    RIGHT OUTER JOIN pubs_dbo.orders
        ON LOWER(customers.customerid) = LOWER(orders.ix_orders_customerid)
    WHERE orders.ix_orders_orderdate BETWEEN '19970101' AND '19971231';

CREATE OR REPLACE  VIEW pubs_dbo."Sales Totals by Amount" (saleamount, orderid, companyname, shippeddate) AS
SELECT
    "Order Subtotals".subtotal AS saleamount, orders.orderid, customers.companyname, orders.shippeddate
    FROM pubs_dbo.customers
    INNER JOIN (pubs_dbo.orders
    INNER JOIN pubs_dbo."Order Subtotals"
        ON orders.orderid = "Order Subtotals".orderid)
        ON LOWER(customers.customerid) = LOWER(orders.ix_orders_customerid)
    WHERE ("Order Subtotals".subtotal > 2500) AND (orders.ix_orders_shippeddate BETWEEN '19970101' AND '19971231');

CREATE OR REPLACE  VIEW pubs_dbo."Sales by Category" (categoryid, categoryname, productname, productsales) AS
SELECT
    categories.categoryid, categories.categoryname, products.productname, SUM("Order Details Extended".extendedprice) AS productsales
    FROM pubs_dbo.categories
    INNER JOIN (pubs_dbo.products
    INNER JOIN (pubs_dbo.orders
    INNER JOIN pubs_dbo."Order Details Extended"
        ON orders.orderid = "Order Details Extended".orderid)
        ON products.productid = "Order Details Extended".productid)
        ON categories.categoryid = products.ix_products_categoryid
    WHERE orders.ix_orders_orderdate BETWEEN '19970101' AND '19971231'
    GROUP BY categories.categoryid, categories.ix_categories_categoryname, products.ix_products_productname;
/* ORDER BY Products.ProductName */;

CREATE OR REPLACE  VIEW pubs_dbo."Summary of Sales by Quarter" (shippeddate, orderid, subtotal) AS
SELECT
    orders.shippeddate, orders.orderid, "Order Subtotals".subtotal
    FROM pubs_dbo.orders
    INNER JOIN pubs_dbo."Order Subtotals"
        ON orders.orderid = "Order Subtotals".orderid
    WHERE orders.ix_orders_shippeddate IS NOT NULL;
/* ORDER BY Orders.ShippedDate */;

CREATE OR REPLACE  VIEW pubs_dbo."Summary of Sales by Year" (shippeddate, orderid, subtotal) AS
SELECT
    orders.shippeddate, orders.orderid, "Order Subtotals".subtotal
    FROM pubs_dbo.orders
    INNER JOIN pubs_dbo."Order Subtotals"
        ON orders.orderid = "Order Subtotals".orderid
    WHERE orders.ix_orders_shippeddate IS NOT NULL;
/* ORDER BY Orders.ShippedDate */;

CREATE OR REPLACE  VIEW pubs_dbo.invoices (shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry, customerid, customername, address, city, region, postalcode, country, salesperson, orderid, orderdate, requireddate, shippeddate, shippername, productid, productname, unitprice, quantity, discount, extendedprice, freight) AS
SELECT
    orders.shipname, orders.shipaddress, orders.shipcity, orders.shipregion, orders.shippostalcode, orders.shipcountry, orders.customerid, customers.companyname AS customername, customers.address, customers.city, customers.region, customers.postalcode, customers.country, (firstname || ' ' || lastname) AS salesperson, orders.orderid, orders.orderdate, orders.requireddate, orders.shippeddate, shippers.companyname AS shippername, "Order Details".productid, products.productname, "Order Details".unitprice, "Order Details".quantity, "Order Details".discount, (CAST (("Order Details".unitprice * quantity * (1 - discount) / 100) AS NUMERIC(19, 4)) * 100) AS extendedprice, orders.freight
    FROM pubs_dbo.shippers
    INNER JOIN (pubs_dbo.products
    INNER JOIN ((pubs_dbo.employees
    INNER JOIN (pubs_dbo.customers
    INNER JOIN pubs_dbo.orders
        ON LOWER(customers.customerid) = LOWER(orders.ix_orders_customerid))
        ON employees.employeeid = orders.ix_orders_employeeid)
    INNER JOIN pubs_dbo."Order Details"
        ON orders.orderid = "Order Details"."IX_Order Details_OrderID")
        ON products.productid = "Order Details"."IX_Order Details_ProductID")
        ON shippers.shipperid = orders.shipvia;

CREATE OR REPLACE  VIEW pubs_dbo.titleview (title, au_ord, au_lname, price, ytd_sales, pub_id) AS
SELECT
    title, au_ord, au_lname, price, ytd_sales, pub_id
    FROM pubs_dbo.authors, pubs_dbo.titles, pubs_dbo.titleauthor
    WHERE authors.au_id = titleauthor.au_id AND titles.title_id = titleauthor.title_id;

-- ------------ Write CREATE-INDEX-stage scripts -----------

CREATE INDEX "IX_Order Details_OrderID"
ON pubs_dbo."Order Details"
USING BTREE (orderid ASC);

CREATE INDEX "IX_Order Details_OrdersOrder_Details"
ON pubs_dbo."Order Details"
USING BTREE (orderid ASC);

CREATE INDEX "IX_Order Details_ProductID"
ON pubs_dbo."Order Details"
USING BTREE (productid ASC);

CREATE INDEX "IX_Order Details_ProductsOrder_Details"
ON pubs_dbo."Order Details"
USING BTREE (productid ASC);

CREATE INDEX ix_authors_aunmind
ON pubs_dbo.authors
USING BTREE (au_lname ASC, au_fname ASC);

CREATE INDEX ix_categories_categoryname
ON pubs_dbo.categories
USING BTREE (categoryname ASC);

CREATE INDEX ix_customers_city
ON pubs_dbo.customers
USING BTREE (city ASC);

CREATE INDEX ix_customers_companyname
ON pubs_dbo.customers
USING BTREE (companyname ASC);

CREATE INDEX ix_customers_postalcode
ON pubs_dbo.customers
USING BTREE (postalcode ASC);

CREATE INDEX ix_customers_region
ON pubs_dbo.customers
USING BTREE (region ASC);

CREATE INDEX ix_employee_employee_ind
ON pubs_dbo.employee
USING BTREE (lname ASC, fname ASC, minit ASC);

CREATE INDEX ix_employees_lastname
ON pubs_dbo.employees
USING BTREE (lastname ASC);

CREATE INDEX ix_employees_postalcode
ON pubs_dbo.employees
USING BTREE (postalcode ASC);

CREATE INDEX ix_orders_customerid
ON pubs_dbo.orders
USING BTREE (customerid ASC);

CREATE INDEX ix_orders_customersorders
ON pubs_dbo.orders
USING BTREE (customerid ASC);

CREATE INDEX ix_orders_employeeid
ON pubs_dbo.orders
USING BTREE (employeeid ASC);

CREATE INDEX ix_orders_employeesorders
ON pubs_dbo.orders
USING BTREE (employeeid ASC);

CREATE INDEX ix_orders_orderdate
ON pubs_dbo.orders
USING BTREE (orderdate ASC);

CREATE INDEX ix_orders_shippeddate
ON pubs_dbo.orders
USING BTREE (shippeddate ASC);

CREATE INDEX ix_orders_shippersorders
ON pubs_dbo.orders
USING BTREE (shipvia ASC);

CREATE INDEX ix_orders_shippostalcode
ON pubs_dbo.orders
USING BTREE (shippostalcode ASC);

CREATE INDEX ix_products_categoriesproducts
ON pubs_dbo.products
USING BTREE (categoryid ASC);

CREATE INDEX ix_products_categoryid
ON pubs_dbo.products
USING BTREE (categoryid ASC);

CREATE INDEX ix_products_productname
ON pubs_dbo.products
USING BTREE (productname ASC);

CREATE INDEX ix_products_supplierid
ON pubs_dbo.products
USING BTREE (supplierid ASC);

CREATE INDEX ix_products_suppliersproducts
ON pubs_dbo.products
USING BTREE (supplierid ASC);

CREATE INDEX ix_roysched_titleidind
ON pubs_dbo.roysched
USING BTREE (title_id ASC);

CREATE INDEX ix_sales_titleidind
ON pubs_dbo.sales
USING BTREE (title_id ASC);

CREATE INDEX ix_suppliers_companyname
ON pubs_dbo.suppliers
USING BTREE (companyname ASC);

CREATE INDEX ix_suppliers_postalcode
ON pubs_dbo.suppliers
USING BTREE (postalcode ASC);

CREATE INDEX ix_titleauthor_auidind
ON pubs_dbo.titleauthor
USING BTREE (au_id ASC);

CREATE INDEX ix_titleauthor_titleidind
ON pubs_dbo.titleauthor
USING BTREE (title_id ASC);

CREATE INDEX ix_titles_titleind
ON pubs_dbo.titles
USING BTREE (title ASC);

-- ------------ Write CREATE-CONSTRAINT-stage scripts -----------

ALTER TABLE pubs_dbo."Order Details"
ADD CONSTRAINT ck_discount_878626173 CHECK (
(discount >= (0) AND discount <= (1)));

ALTER TABLE pubs_dbo."Order Details"
ADD CONSTRAINT ck_quantity_894626230 CHECK (
(quantity > (0)));

ALTER TABLE pubs_dbo."Order Details"
ADD CONSTRAINT ck_unitprice_910626287 CHECK (
(unitprice >= (0)));

ALTER TABLE pubs_dbo."Order Details"
ADD CONSTRAINT pk_order_details_782625831 PRIMARY KEY (orderid, productid);

ALTER TABLE pubs_dbo.authors
ADD CONSTRAINT ck__authors__au_id__160f4887 CHECK (
(LOWER(au_id) SIMILAR TO LOWER('[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]')));

ALTER TABLE pubs_dbo.authors
ADD CONSTRAINT ck__authors__zip__17f790f9 CHECK (
(LOWER(zip) SIMILAR TO LOWER('[0-9][0-9][0-9][0-9][0-9]')));

ALTER TABLE pubs_dbo.authors
ADD CONSTRAINT upkcl_auidind_354100302 PRIMARY KEY (au_id);

ALTER TABLE pubs_dbo.categories
ADD CONSTRAINT pk_categories_350624292 PRIMARY KEY (categoryid);

ALTER TABLE pubs_dbo.customercustomerdemo
ADD CONSTRAINT pk_customercustomerdemo_1374627940 PRIMARY KEY (customerid, customertypeid);

ALTER TABLE pubs_dbo.customerdemographics
ADD CONSTRAINT pk_customerdemographics_1390627997 PRIMARY KEY (customertypeid);

ALTER TABLE pubs_dbo.customers
ADD CONSTRAINT pk_customers_382624406 PRIMARY KEY (customerid);

ALTER TABLE pubs_dbo.employee
ADD CONSTRAINT ck_emp_id_946102411 CHECK (
(LOWER(emp_id) SIMILAR TO LOWER('[A-Z][A-Z][A-Z][1-9][0-9][0-9][0-9][0-9][FM]') OR LOWER(emp_id) SIMILAR TO LOWER('[A-Z]-[A-Z][1-9][0-9][0-9][0-9][0-9][FM]')));

ALTER TABLE pubs_dbo.employee
ADD CONSTRAINT pk_emp_id_930102354 PRIMARY KEY (emp_id);

ALTER TABLE pubs_dbo.employees
ADD CONSTRAINT ck_birthdate_318624178 CHECK (
(birthdate < clock_timestamp()));

ALTER TABLE pubs_dbo.employees
ADD CONSTRAINT pk_employees_286624064 PRIMARY KEY (employeeid);

ALTER TABLE pubs_dbo.employeeterritories
ADD CONSTRAINT pk_employeeterritories_1486628339 PRIMARY KEY (employeeid, territoryid);

ALTER TABLE pubs_dbo.jobs
ADD CONSTRAINT ck__jobs__max_lvl__32ab8735 CHECK (
(max_lvl <= (250)));

ALTER TABLE pubs_dbo.jobs
ADD CONSTRAINT ck__jobs__min_lvl__31b762fc CHECK (
(min_lvl >= (10)));

ALTER TABLE pubs_dbo.jobs
ADD CONSTRAINT pk__jobs__6e32b6a5f5271e71 PRIMARY KEY (job_id);

ALTER TABLE pubs_dbo.orders
ADD CONSTRAINT pk_orders_478624748 PRIMARY KEY (orderid);

ALTER TABLE pubs_dbo.products
ADD CONSTRAINT ck_products_unitprice_702625546 CHECK (
(unitprice >= (0)));

ALTER TABLE pubs_dbo.products
ADD CONSTRAINT ck_reorderlevel_718625603 CHECK (
(reorderlevel >= (0)));

ALTER TABLE pubs_dbo.products
ADD CONSTRAINT ck_unitsinstock_734625660 CHECK (
(unitsinstock >= (0)));

ALTER TABLE pubs_dbo.products
ADD CONSTRAINT ck_unitsonorder_750625717 CHECK (
(unitsonorder >= (0)));

ALTER TABLE pubs_dbo.products
ADD CONSTRAINT pk_products_574625090 PRIMARY KEY (productid);

ALTER TABLE pubs_dbo.pub_info
ADD CONSTRAINT upkcl_pubinfo_882102183 PRIMARY KEY (pub_id);

ALTER TABLE pubs_dbo.publishers
ADD CONSTRAINT ck__publisher__pub_i__1ad3fda4 CHECK (
(LOWER(pub_id) = LOWER('1756') OR LOWER(pub_id) = LOWER('1622') OR LOWER(pub_id) = LOWER('0877') OR LOWER(pub_id) = LOWER('0736') OR LOWER(pub_id) = LOWER('1389') OR LOWER(pub_id) SIMILAR TO LOWER('99[0-9][0-9]')));

ALTER TABLE pubs_dbo.publishers
ADD CONSTRAINT upkcl_pubind_434100587 PRIMARY KEY (pub_id);

ALTER TABLE pubs_dbo.region
ADD CONSTRAINT pk_region_1438628168 PRIMARY KEY (regionid);

ALTER TABLE pubs_dbo.sales
ADD CONSTRAINT upkcl_sales_674101442 PRIMARY KEY (stor_id, ord_num, title_id);

ALTER TABLE pubs_dbo.shippers
ADD CONSTRAINT pk_shippers_414624520 PRIMARY KEY (shipperid);

ALTER TABLE pubs_dbo.stores
ADD CONSTRAINT upk_storeid_642101328 PRIMARY KEY (stor_id);

ALTER TABLE pubs_dbo.suppliers
ADD CONSTRAINT pk_suppliers_446624634 PRIMARY KEY (supplierid);

ALTER TABLE pubs_dbo.territories
ADD CONSTRAINT pk_territories_1454628225 PRIMARY KEY (territoryid);

ALTER TABLE pubs_dbo.titleauthor
ADD CONSTRAINT upkcl_taind_578101100 PRIMARY KEY (au_id, title_id);

ALTER TABLE pubs_dbo.titles
ADD CONSTRAINT upkcl_titleidind_498100815 PRIMARY KEY (title_id);

-- ------------ Write CREATE-FOREIGN-KEY-CONSTRAINT-stage scripts -----------

ALTER TABLE pubs_dbo."Order Details"
ADD CONSTRAINT fk_order_details_orders_846626059 FOREIGN KEY (orderid) 
REFERENCES pubs_dbo.orders (orderid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo."Order Details"
ADD CONSTRAINT fk_order_details_products_862626116 FOREIGN KEY (productid) 
REFERENCES pubs_dbo.products (productid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.customercustomerdemo
ADD CONSTRAINT fk_customercustomerdemo_1406628054 FOREIGN KEY (customertypeid) 
REFERENCES pubs_dbo.customerdemographics (customertypeid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.customercustomerdemo
ADD CONSTRAINT fk_customercustomerdemo_customers_1422628111 FOREIGN KEY (customerid) 
REFERENCES pubs_dbo.customers (customerid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.discounts
ADD CONSTRAINT fk__discounts__stor___2de6d218 FOREIGN KEY (stor_id) 
REFERENCES pubs_dbo.stores (stor_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.employee
ADD CONSTRAINT fk__employee__job_id__3a4ca8fd FOREIGN KEY (job_id) 
REFERENCES pubs_dbo.jobs (job_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.employee
ADD CONSTRAINT fk__employee__pub_id__3d2915a8 FOREIGN KEY (pub_id) 
REFERENCES pubs_dbo.publishers (pub_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.employees
ADD CONSTRAINT fk_employees_employees_302624121 FOREIGN KEY (reportsto) 
REFERENCES pubs_dbo.employees (employeeid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.employeeterritories
ADD CONSTRAINT fk_employeeterritories_employees_1502628396 FOREIGN KEY (employeeid) 
REFERENCES pubs_dbo.employees (employeeid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.employeeterritories
ADD CONSTRAINT fk_employeeterritories_territories_1518628453 FOREIGN KEY (territoryid) 
REFERENCES pubs_dbo.territories (territoryid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.orders
ADD CONSTRAINT fk_orders_customers_510624862 FOREIGN KEY (customerid) 
REFERENCES pubs_dbo.customers (customerid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.orders
ADD CONSTRAINT fk_orders_employees_526624919 FOREIGN KEY (employeeid) 
REFERENCES pubs_dbo.employees (employeeid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.orders
ADD CONSTRAINT fk_orders_shippers_542624976 FOREIGN KEY (shipvia) 
REFERENCES pubs_dbo.shippers (shipperid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.products
ADD CONSTRAINT fk_products_categories_670625432 FOREIGN KEY (categoryid) 
REFERENCES pubs_dbo.categories (categoryid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.products
ADD CONSTRAINT fk_products_suppliers_686625489 FOREIGN KEY (supplierid) 
REFERENCES pubs_dbo.suppliers (supplierid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.pub_info
ADD CONSTRAINT fk__pub_info__pub_id__3587f3e0 FOREIGN KEY (pub_id) 
REFERENCES pubs_dbo.publishers (pub_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.roysched
ADD CONSTRAINT fk__roysched__title___2bfe89a6 FOREIGN KEY (title_id) 
REFERENCES pubs_dbo.titles (title_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.sales
ADD CONSTRAINT fk__sales__stor_id__29221cfb FOREIGN KEY (stor_id) 
REFERENCES pubs_dbo.stores (stor_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.sales
ADD CONSTRAINT fk__sales__title_id__2a164134 FOREIGN KEY (title_id) 
REFERENCES pubs_dbo.titles (title_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.territories
ADD CONSTRAINT fk_territories_region_1470628282 FOREIGN KEY (regionid) 
REFERENCES pubs_dbo.region (regionid)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.titleauthor
ADD CONSTRAINT fk__titleauth__au_id__236943a5 FOREIGN KEY (au_id) 
REFERENCES pubs_dbo.authors (au_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.titleauthor
ADD CONSTRAINT fk__titleauth__title__245d67de FOREIGN KEY (title_id) 
REFERENCES pubs_dbo.titles (title_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

ALTER TABLE pubs_dbo.titles
ADD CONSTRAINT fk__titles__pub_id__1f98b2c1 FOREIGN KEY (pub_id) 
REFERENCES pubs_dbo.publishers (pub_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION;

-- ------------ Write CREATE-FUNCTION-stage scripts -----------

CREATE OR REPLACE FUNCTION pubs_dbo.fn_employee_insupd()
RETURNS trigger
AS
$BODY$
/* Get the range of level for this job type from the jobs table. */
DECLARE
    var_min_lvl SMALLINT;
    var_max_lvl SMALLINT;
    var_emp_lvl SMALLINT;
    var_job_id SMALLINT;
BEGIN
    /* CREATING TEMPORARY TABLES */
    IF (TG_OP = 'INSERT') THEN
        CREATE TEMPORARY TABLE IF NOT EXISTS deleted$c31aa7b5
        AS
        TABLE inserted$c31aa7b5
        WITH NO DATA;
    ELSIF (TG_OP = 'DELETE') THEN
        CREATE TEMPORARY TABLE IF NOT EXISTS inserted$c31aa7b5
        AS
        TABLE deleted$c31aa7b5
        WITH NO DATA;
    END IF;
    SELECT
        min_lvl, max_lvl, i.job_lvl, i.job_id
        INTO var_min_lvl, var_max_lvl, var_emp_lvl, var_job_id
        FROM pubs_dbo.employee AS e, pubs_dbo.jobs AS j, inserted$c31aa7b5 AS i
        WHERE e.emp_id = i.emp_id AND i.job_id = j.job_id;

    IF (var_job_id = 1) AND (var_emp_lvl <> 10) THEN
        RAISE 'Error %, severity %, state % was raised. Message: %.', '50000', 16, 1, 'Job id 1 expects the default level of 10.' USING ERRCODE = '50000';
        /*
        [7807 - Severity CRITICAL - PostgreSQL does not support explicit transaction management commands such as BEGIN TRAN, SAVE TRAN in functions. Convert your source code manually.]
        ROLLBACK TRANSACTION
        */
    ELSE
        IF NOT (var_emp_lvl BETWEEN var_min_lvl AND var_max_lvl) THEN
            RAISE 'Error %, severity %, state % was raised. Message: %. Argument: %. Argument: %. Argument: %', '50000', 16, 1, 'The level for job_id:%d should be between %d and %d.', var_job_id, var_min_lvl, var_max_lvl USING ERRCODE = '50000';
            /*
            [7807 - Severity CRITICAL - PostgreSQL does not support explicit transaction management commands such as BEGIN TRAN, SAVE TRAN in functions. Convert your source code manually.]
            ROLLBACK TRANSACTION
            */
        END IF;
    END IF;
    RETURN NULL;
END;
$BODY$
LANGUAGE  plpgsql;

-- ------------ Write CREATE-PROCEDURE-stage scripts -----------

CREATE OR REPLACE PROCEDURE pubs_dbo."Employee Sales by Country"(IN par_beginning_date TIMESTAMP WITHOUT TIME ZONE, IN par_ending_date TIMESTAMP WITHOUT TIME ZONE, INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    OPEN p_refcur FOR
    SELECT
        employees.country, employees.lastname, employees.firstname, orders.shippeddate, orders.orderid, "Order Subtotals".subtotal AS saleamount
        FROM pubs_dbo.employees
        INNER JOIN (pubs_dbo.orders
        INNER JOIN pubs_dbo."Order Subtotals"
            ON orders.orderid = "Order Subtotals".orderid)
            ON employees.employeeid = orders.ix_orders_employeeid
        WHERE orders.ix_orders_shippeddate BETWEEN par_Beginning_Date AND par_Ending_Date;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo."Sales by Year"(IN par_beginning_date TIMESTAMP WITHOUT TIME ZONE, IN par_ending_date TIMESTAMP WITHOUT TIME ZONE, INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    OPEN p_refcur FOR
    SELECT
        orders.shippeddate, orders.orderid, "Order Subtotals".subtotal, to_char(shippeddate::DATE, 'YYYY') AS year
        FROM pubs_dbo.orders
        INNER JOIN pubs_dbo."Order Subtotals"
            ON orders.orderid = "Order Subtotals".orderid
        WHERE orders.ix_orders_shippeddate BETWEEN par_Beginning_Date AND par_Ending_Date;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo."Ten Most Expensive Products"(INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    /*
    [7674 - Severity CRITICAL - DMS SC can't convert the ROWCOUNT clause of the SET statement. Convert your source code manually.]
    SET ROWCOUNT 10
    */
    OPEN p_refcur FOR
    SELECT
        products.productname AS tenmostexpensiveproducts, products.unitprice
        FROM pubs_dbo.products
        ORDER BY products.unitprice DESC NULLS LAST;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo.byroyalty(IN par_percentage INTEGER, INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    OPEN p_refcur FOR
    SELECT
        au_id
        FROM pubs_dbo.titleauthor
        WHERE titleauthor.royaltyper = par_percentage;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo.custorderhist(IN par_customerid CHAR, INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    OPEN p_refcur FOR
    SELECT
        productname, SUM(quantity) AS total
        FROM pubs_dbo.products AS p, pubs_dbo."Order Details" AS od, pubs_dbo.orders AS o, pubs_dbo.customers AS c
        WHERE LOWER(c.customerid) = LOWER(par_CustomerID) AND LOWER(c.customerid) = LOWER(o.customerid) AND o.orderid = od.orderid AND od.productid = p.productid
        GROUP BY productname;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo.custordersdetail(IN par_orderid INTEGER, INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    OPEN p_refcur FOR
    SELECT
        productname, ROUND(od.unitprice, 2) AS unitprice, quantity, CAST (discount * 100 AS INTEGER) AS discount, ROUND(CAST (quantity * (1 - discount) * od.unitprice AS NUMERIC(19, 4)), 2) AS extendedprice
        FROM pubs_dbo.products AS p, pubs_dbo."Order Details" AS od
        WHERE od.productid = p.productid AND od.orderid = par_OrderID;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo.custordersorders(IN par_customerid CHAR, INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    OPEN p_refcur FOR
    SELECT
        orderid, orderdate, requireddate, shippeddate
        FROM pubs_dbo.orders
        WHERE LOWER(customerid) = LOWER(par_CustomerID)
        ORDER BY orderid NULLS FIRST;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo.reptq1(INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    OPEN p_refcur FOR
    SELECT
        CASE
            WHEN grouping(pub_id::NUMERIC(18, 0)) = 1 THEN 'ALL'
            ELSE pub_id
        END AS pub_id, AVG(price) AS avg_price
        FROM pubs_dbo.titles
        WHERE price IS NOT NULL
        GROUP BY ROLLUP (pub_id)
        ORDER BY pub_id NULLS FIRST;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo.reptq2(INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    OPEN p_refcur FOR
    SELECT
        CASE
            WHEN grouping(type::NUMERIC(18, 0)) = 1 THEN 'ALL'
            ELSE type
        END AS type,
        CASE
            WHEN grouping(pub_id::NUMERIC(18, 0)) = 1 THEN 'ALL'
            ELSE pub_id
        END AS pub_id, AVG(ytd_sales) AS avg_ytd_sales
        FROM pubs_dbo.titles
        WHERE pub_id IS NOT NULL
        GROUP BY pub_id, ROLLUP (type);
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo.reptq3(IN par_lolimit NUMERIC, IN par_hilimit NUMERIC, IN par_type CHAR, INOUT p_refcur refcursor)
AS 
$BODY$
BEGIN
    OPEN p_refcur FOR
    SELECT
        CASE
            WHEN grouping(pub_id::NUMERIC(18, 0)) = 1 THEN 'ALL'
            ELSE pub_id
        END AS pub_id,
        CASE
            WHEN grouping(type::NUMERIC(18, 0)) = 1 THEN 'ALL'
            ELSE type
        END AS type, COUNT(title_id) AS cnt
        FROM pubs_dbo.titles
        WHERE price > par_lolimit AND price < par_hilimit AND LOWER(type) = LOWER(par_type) OR LOWER(type) LIKE LOWER('%cook%')
        GROUP BY pub_id, ROLLUP (type);
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE pubs_dbo.salesbycategory(IN par_categoryname VARCHAR, IN par_ordyear VARCHAR DEFAULT '1998', INOUT p_refcur refcursor DEFAULT NULL)
AS 
$BODY$
BEGIN
    IF LOWER(par_OrdYear) != LOWER('1996') AND LOWER(par_OrdYear) != LOWER('1997') AND LOWER(par_OrdYear) != LOWER('1998') THEN
        SELECT
            '1998'
            INTO par_OrdYear;
    END IF;
    OPEN p_refcur FOR
    SELECT
        productname, ROUND(SUM(CAST (od.quantity * (1 - od.discount) * od.unitprice AS NUMERIC(14, 2))), 0) AS totalpurchase
        FROM pubs_dbo."Order Details" AS od, pubs_dbo.orders AS o, pubs_dbo.products AS p, pubs_dbo.categories AS c
        WHERE od.orderid = o.orderid AND od.productid = p.productid AND p.categoryid = c.categoryid AND LOWER(c.categoryname) = LOWER(par_CategoryName) AND LOWER(SUBSTR(aws_sqlserver_ext.conv_datetime_to_string('NVARCHAR(22)', 'DATETIME', o.orderdate, 111), 1, 4)) = LOWER(par_OrdYear)
        GROUP BY productname
        ORDER BY productname NULLS FIRST;
END;
$BODY$
LANGUAGE plpgsql;

-- ------------ Write CREATE-TRIGGER-stage scripts -----------

CREATE TRIGGER employee_insupd_after_insert
AFTER INSERT
ON pubs_dbo.employee
REFERENCING NEW TABLE AS inserted$c31aa7b5
FOR EACH STATEMENT EXECUTE PROCEDURE pubs_dbo.fn_employee_insupd();

CREATE TRIGGER employee_insupd_after_update
AFTER UPDATE
ON pubs_dbo.employee
REFERENCING OLD TABLE AS deleted$c31aa7b5 NEW TABLE AS inserted$c31aa7b5
FOR EACH STATEMENT EXECUTE PROCEDURE pubs_dbo.fn_employee_insupd();

