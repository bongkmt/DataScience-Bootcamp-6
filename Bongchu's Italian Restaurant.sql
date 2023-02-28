-- My Restaurant : Bongchu's Italian Restaurant
-- 5 Tables
-- 1x Fact, 4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery/with

CREATE TABLE customers (
  customer_id INT NOT NULL UNIQUE PRIMARY KEY,
  customer_name TEXT,
  gender TEXT,
  age INT,
  email TEXT
);

INSERT INTO customers VALUES
  (1, 'Liona', 'F', 20, 'liona.t@gmail.com'),
  (2, 'Cayla', 'F', 24, 'caylabb@yahoo.com'),
  (3, 'Anna', 'F', 45, 'anna2022@gmail.com'),
  (4, 'Robert', 'M', 52, 'robert.t@google.com'),
  (5, 'John', 'M', 33, 'johna1972@gmail.com'),
  (6, 'Iris', 'F', 23, 'iris@google.com'),
  (7, 'Patt', 'M', 17, 'pattsk1917@gmail.com'),
  (8, 'Sarah', 'F', 25, 'sarah.g@google.com'),
  (9, 'Lisa', 'F', 27, 'lisa.lala@google.com'),
  (10, 'Peat', 'M', 60, 'peat.t@gmail.com'),
  (11, 'Jisoo', 'F', 22, 'jisoo2000@google.com'),
  (12, 'Nadia', 'F', 42, 'nadia@yahoo.com'),
  (13, 'Olivia', 'F', 65, 'olivia@google.com'),
  (14, 'Toy', 'M', 38, 'toyeiei@google.com'),
  (15, 'Emma', 'F', 16, 'emma2006@gmail.com'),
  (16, 'Mark', 'M', 33, 'marku@google.com'),
  (17, 'Violet', 'F', 26, 'violett@gmail.com'),
  (18, 'Milada', 'F', 17, 'milada@gmail.com'),
  (19, 'Jenny', 'F', 39, 'jenny@google.com'),
  (20, 'Bew', 'M', 58, 'bewoo@gmail.com')
;

CREATE TABLE menu (
  menu_id INT NOT NULL UNIQUE PRIMARY KEY,
  menu_name TEXT UNIQUE,
  category TEXT,
  price REAL
);

INSERT INTO menu VALUES
  (1, 'Marghenta', 'pizza', 195),
  (2, 'Pepperoni', 'pizza', 295),
  (3, 'Hawaiian', 'pizza', 225),
  (4, 'Fettuccine carnonara', 'pasta', 185),
  (5, 'Spaghetti kee mao', 'pasta', 295),
  (6, 'Spaghetti sausage ang garlic','pasta', 155),
  (7, 'Fettuccine salmon pesto', 'pasta', 295),
  (8, 'Corn soup', 'appetizer', 115),
  (9, 'Garlic bread', 'appetizer', 65),
  (10, 'Potato fries', 'appetizer', 95),
  (11, 'Cola', 'drink', 65),
  (12, 'Milk', 'drink', 125),
  (13, 'Water', 'drink', 15),
  (14, 'Ice cream', 'dessert', 65),
  (15, 'Panna cotta', 'dessert', 95)
;

CREATE TABLE payment (
  payment_id INT NOT NULL PRIMARY KEY,
  payment_method TEXT
);

INSERT INTO payment VALUES
  (1, "cash"),
  (2, "credit card")
;

CREATE TABLE branch (
  branch_id INT NOT NULL PRIMARY KEY,
  branch_locat TEXT,
  manager_name TEXT,
  n_staff INT
);

INSERT INTO branch VALUES
  (1, 'Siam paragon',  'Marisa Pathumsuwan', 15),
  (2, 'Central world', 'Patipon Meepasert', 12),
  (3, 'Iconsiam', 'Alisara Thongthai', 14),
  (4, 'Seacon', 'Naerunchara Hongseesha', 8)
;

CREATE TABLE transactions (
    order_id INT NOT NULL PRIMARY KEY,
    order_date TEXT,
    branch_id INT,
    customer_id INT,
    menu_id INT,
    payment_id INT,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id)
);

INSERT INTO transactions VALUES
  (1, "2022-07-16", 1, 1, 1, 1),
  (2, "2022-07-16", 2, 2, 1, 2),
  (3, "2022-07-16", 3, 3, 2, 1),
  (4, "2022-07-22", 1, 4, 3, 1),
  (5, "2022-07-22", 1, 5, 4, 1),
  (6, "2022-08-11", 2, 6, 4, 2),
  (7, "2022-08-12", 3, 7, 5, 1),
  (8, "2022-08-17", 4, 8, 5, 1),
  (9, "2022-08-19", 1, 9, 6, 1),
  (10, "2022-08-20", 1, 10, 7, 1),
  (11, "2022-08-22", 1, 11, 8, 2),
  (12, "2022-08-23", 2, 12, 9, 1),
  (13, "2022-08-24", 2, 13, 15, 1),
  (14, "2022-08-25", 1, 14, 11, 2),
  (15, "2022-08-26", 3, 15, 12, 1),
  (16, "2022-08-27", 2, 16, 11, 1),
  (17, "2022-08-28", 3, 17, 2, 1),
  (18, "2022-08-29", 1, 18, 7, 2),
  (19, "2022-09-02", 1, 19, 5, 2),
  (20, "2022-09-04", 2, 20, 6, 1),
  (21, "2022-09-05", 1, 13, 2, 2),
  (22, "2022-09-11", 2, 7, 3, 1),
  (23, "2022-09-12", 4, 3, 5, 2),
  (24, "2022-09-18", 4, 4, 1, 1),
  (25, "2022-09-20", 1, 1, 1, 2),
  (26, "2022-09-22", 2, 9, 4, 1),
  (27, "2022-09-24", 3, 8, 1, 1),
  (28, "2022-10-01", 1, 5, 3, 1),
  (29, "2022-10-07", 4, 11, 7, 1),
  (30, "2022-10-09", 1, 12, 7, 1),
  (31, "2022-10-11", 1, 13, 2, 2),
  (32, "2022-10-12", 2, 14, 1, 1),
  (33, "2022-10-14", 1, 6, 2, 2),
  (34, "2022-10-28", 2, 4, 15, 2),
  (35, "2022-11-11", 3, 3, 12, 2),
  (36, "2022-11-16", 4, 20, 14, 2),
  (37, "2022-11-18", 3, 1, 11, 1),
  (38, "2022-11-19", 3, 7, 5, 1),
  (39, "2022-12-14", 1, 6, 6, 2),
  (40, "2022-12-17", 1, 2, 2, 1),
  (41, "2022-12-25", 2, 9, 1, 1),
  (42, "2022-12-25", 3, 15, 1, 1),
  (43, "2022-12-25", 4, 14, 2, 2),
  (44, "2022-12-25", 1, 9, 5, 2),
  (45, "2022-12-26", 1, 19, 5, 1),
  (46, "2022-12-27", 2, 20, 6, 2),
  (47, "2022-12-30", 3, 18, 8, 1),
  (48, "2022-12-31", 3, 12, 9, 2),
  (49, "2022-12-31", 3, 11, 8, 1),
  (50, "2022-12-31", 3, 5, 11, 1) 
;

-- Which branch has the highest number of orders?
SELECT 
	branch_location,
	COUNT (*) AS total_order
FROM (
  SELECT 
      tr.order_id,
      tr.branch_id,
      br.branch_locat AS branch_location,
      br.manager_name,
      br.n_staff
  FROM transactions AS tr
  JOIN branch br ON tr.branch_id = br.branch_id
  ) AS sub
GROUP BY branch_id
ORDER BY total_order DESC;

-- What is the best seller menu?
SELECT 
	menu_name,
	COUNT (*) AS total_order,
  category
FROM (
  SELECT 
      tr.order_id,
      tr.menu_id,
      menu.menu_name,
      menu.category,
      menu.price
  FROM transactions AS tr
  JOIN menu ON menu.menu_id = tr.menu_id
  ) AS sub
GROUP BY menu_id
ORDER BY total_order DESC
LIMIT 3;

-- Which month has the highest revenue? ?
WITH sub AS (
  SELECT 
    tr.order_date,
    tr.menu_id,
    menu.menu_id,
    menu.price
  FROM transactions AS tr
  JOIN menu ON tr.menu_id = menu.menu_id
)

SELECT 
  strftime('%m', order_date) AS monthly,
  sum(price) AS total_revenue
FROM sub
GROUP BY monthly
ORDER BY total_revenue DESC
LIMIT 3;
