# Challenge Set 9
## Part I: W3Schools SQL Lab 

*Introductory level SQL*

--

This challenge uses the [W3Schools SQL playground](http://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all). Please add solutions to this markdown file and submit.

1. Which customers are from the UK?

``` sql
SELECT * FROM Customers WHERE Country = 'UK';
```

2. What is the name of the customer who has the most orders?

``` sql
SELECT c.CustomerName, count() 
FROM customers as c
INNER JOIN orders as o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY 2 DESC
```

3. Which supplier has the highest average product price?

``` sql
SELECT s.suppliername, avg(p.price)  
FROM products as p 
INNER JOIN suppliers as s 
    ON p.supplierid = s.supplierid
GROUP BY s.suppliername
ORDER BY 2 DESC
LIMIT 1;
```

4. How many different countries are all the customers from? (*Hint:* consider [DISTINCT](http://www.w3schools.com/sql/sql_distinct.asp).)

``` sql
SELECT count(distinct country) 
FROM customers
```

5. What category appears in the most orders?

``` sql
SELECT c.categoryname, count()
FROM orderdetails as od
INNER JOIN products as p
    ON od.productid = p.productid
INNER JOIN categories as c
    ON p.categoryid = c.categoryid
GROUP BY c.categoryname
ORDER BY 2 DESC
LIMIT 1;
```

6. What was the total cost for each order?

``` sql
SELECT od.orderid, sum(od.quantity * p.price) 
FROM [OrderDetails] as od 
INNER JOIN products as p 
    ON od.productid = p.productid
GROUP BY od.orderid;
```

7. Which employee made the most sales (by total price)?

``` sql
SELECT e.employeeid, e.firstname, e.lastname, sum(od.quantity * p.price)
FROM [Orders] as o
INNER JOIN employees as e
    ON o.employeeid = e.employeeid
INNER JOIN orderdetails as od
    ON o.orderid = od.orderid
INNER JOIN products as p
    ON od.productid = p.productid
GROUP BY e.firstname, e.lastname, e.employeeid
ORDER BY 4 DESC
LIMIT 1;
```

8. Which employees have BS degrees? (*Hint:* look at the [LIKE](http://www.w3schools.com/sql/sql_like.asp) operator.)

``` sql
SELECT * FROM [Employees] WHERE notes LIKE '%BS%’
```

9. Which supplier of three or more products has the highest average product price? (*Hint:* look at the [HAVING](http://www.w3schools.com/sql/sql_having.asp) operator.)

``` sql
SELECT s.suppliername, avg(p.price)
FROM suppliers as s
INNER JOIN products as p
    ON s.supplierid = p.supplierid
GROUP BY s.suppliername
HAVING count(1) >= 3
ORDER BY 2 DESC
LIMIT 1;
```