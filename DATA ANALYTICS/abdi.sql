#Saturday Oct 10 2026-------------------------------------------------------------------------------------------------------------

use mydb;

drop table if exists students;
drop table if exists students1;
create table students(
roll_no int unique not null,
name varchar(10) not null,
Marks int not null default 0
);

insert into students
values (1,"Ajay",35),
	   (2,"Vijay",20),
       (3,"Sunil",21);
       
insert into students (roll_no,Name)
values (4,"Jay");

insert into students
values (5,"Jay",null);

select * from students;       

create table students1(
roll_no int unique not null,
name varchar(10) not null,
Marks int not null default 0
);

insert into students1
values (2,"Ajay",35),
	   (3,"Su",20),
       (4,"Akshay",21);
   
select * from students1; 
##UNION ALL,UNION,INTERSECT,EXCEPT

select * from students
union 
select * from students1;

select *  students

select * from students1;

select * from students
intersect
select * from students1;

select * from students
except
select * from students1;

#Monday Oct 12 2026-------------------------------------------------------------------------------------------------------------
use mydb1;
select * from products;

select
   productName,
   buyPrice
from products
order by buyPrice desc
limit 5;   

#find top 5 product vendor as per avg buyprice

select 
      productVendor as pv,
      avg(buyPrice) as ag
from products
group by pv
order by ag desc
limit 5;

#tops 10 order  as per Sales value

SELECT
    orderNumber,
    SUM(quantityOrdered * priceEach) AS sales_value
FROM orderdetails
GROUP BY orderNumber
ORDER BY sales_value DESC
LIMIT 10;

drop table emp;

create table emp(
   emp_id int primary key,
   emp_name varchar(30),
   Salary int,
   Dpt_id int,
   #primary key (emp_id),
   foreign key (Dpt_id) references departments(dep_id)
);

drop table departments;

create table departments(
dep_id int primary key,
dep_name varchar(30)
);

INSERT INTO emp
VALUES
(101, 'Amit', 45000, 1),
(102, 'Rahul', 35000, 2),
(103, 'Priya', 55000, 3),
(104, 'Sneha', 40000, 4),
(105, 'Vijay', 50000, 5),
(106, 'Neha', 30000, 6),
(107, 'Arjun', 38000, 7),
(108, 'Anjali', 60000, 8),
(109, 'Karan', 42000, 9),
(110, 'Pooja', 48000, 10);

INSERT INTO departments (dep_id, dep_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Operations'),
(7, 'Support'),
(8, 'Research'),
(9, 'Production'),
(10, 'Administration');

select 
   emp.emp_name,
   departments.dep_name
from emp
join departments
on emp.Dpt_id = departments.dep_id;

#Tuesday Oct 13 2026-------------------------------------------------------------------------------------------------------------

use mydb1;
select * from products;
select * from productlines;

select
   products.productName,
   products.productLine,
   productlines.textDescription
from products
join productlines
on products.productLine = productlines.productLine;  

select * from customers;
select * from employees;

#customer name,uske baaju employee name 

select
   customers.customerName,
   employees.firstName
from customers
join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber;

select
   customers.customerName,
   concat(employees.firstName," ",employees.lastname) as FullName
from customers
join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber;

#customer ke naam ke according total payment

select 
   customers.customerName as cn,
   sum(payments.amount) as Payments
from customers
join payments
on customers.customerNumber = payments.customerNumber
group by cn
order by Payments desc;

#customer name ke hisaab se average payment
#employess first name,last name ke hisaab number of customers
#product name ke hisaab se total quantity order and average price each

select * from customers;
select * from payments;

select
   customers.customerName as Customer_Name,
   avg(payments.amount) as Payments
from customers
join payments
on customers.customerNumber = payments.customerNumber
group by Customer_Name;

select * from customers;
select * from employees;

select 
   concat(employees.firstName," ",employees.lastName) as FullName,
   count(*)
from customers
join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber
group by FullName;

#product name ke hisaab se total quantity order and average price each

select * from products;
select * from orderdetails;

select
  products.productName as ProductName,
  sum(orderdetails.quantityOrdered),
  avg(orderdetails.priceEach)
from products
join orderdetails
on products.productCode = orderdetails.productCode
group by ProductName;

#Wednesday Oct 14 2026-------------------------------------------------------------------------------------------------------------

select
    concat(e.firstname," ",e.lastname) as emp_name,
    count(C.customernumber) as count
from employees e
join customers C 
on e.employeeNumber = C.salesRepEmployeeNumber
group by emp_name;

#row_no and 

#product ke according sales

select
   p.productname,
   sum(od.quantityordered*od.priceeach) as sales
from products as p
left join orderdetails as od
on od.productCode = p.productCode
group by p.productName
order by sales desc;

select
  concat(e.firstname," ",e.lastname) as emp_name,
  count(o.ordernumber) as Orders
from employees as e
join customers as C
on e.employeeNumber = C.salesRepEmployeeNumber
join orders as o
on C.customerNumber = o.customerNumber
group by emp_name;

SELECT
    c.customerName,
    SUM(od.quantityOrdered * od.priceEach) AS TotalSales
FROM customers c
JOIN orders o
    ON c.customerNumber = o.customerNumber
JOIN orderdetails od
    ON o.orderNumber = od.orderNumber
GROUP BY
    c.customerNumber,
    c.customerName
ORDER BY TotalSales DESC;

#employess 
select * from employees;

select 
   concat(e.firstname," ",e.lastname) as emp_name,
   sum(ord.quantityordered*priceeach)
from employees as e
join customers as cst
on e.employeeNumber = cst.salesRepEmployeeNumber
join orders as od 
on cst.customerNumber = od.customerNumber
join orderdetails as ord
on od.orderNumber = ord.orderNumber
group by emp_name;

#office ke according total sales

select 
   off.city as Office_City,
   sum(ord.quantityordered*ord.priceeach) as totalSales
from offices as off
join employees as e
on off.officeCode = e.officeCode
join customers as cst
on e.employeeNumber = cst.salesRepEmployeeNumber
join orders as od 
on cst.customerNumber = od.customerNumber
join orderdetails as ord
on od.orderNumber = ord.orderNumber
group by Office_City;

#office ke according total sales

select 
   off.city as Office_City,
   sum(ord.quantityordered*ord.priceeach) as totalSales
from offices as off
join employees as e
on off.officeCode = e.officeCode
join customers as cst
on e.employeeNumber = cst.salesRepEmployeeNumber
join orders as od 
on cst.customerNumber = od.customerNumber
join orderdetails as ord
on od.orderNumber = ord.orderNumber
group by Office_City;

#Thursday Oct 15 2026-------------------------------------------------------------------------------------------------------------

select
   c.customername as customer,
   sum(quantityordered*priceeach) as Sales
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber
left join orderdetails as od
on od.orderNumber = o.orderNumber
group by customerName
order by Sales desc
limit 5;   

select
   c.customername as customer,
   productLine,
   sum(quantityordered*priceeach) as Sales
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber
left join orderdetails as od
on od.orderNumber = o.orderNumber
left join products as p
on p.productCode = od.productCode
where productLine="Classic Cars"
group by customerName,productLine
order by Sales desc
limit 5;   

#emp ke naam se manager ka naam
#employee ke naam ke hisaab se total payment amount,country usa
#emp ke hisaab se sales aur jisme office city paris honi chahiye
#customer ke hisaab se sale last two months ka

#emp ke naam se manager ka naam
select * from employees;

select
   e.firstname,
   e.reportsTo,
   e.lastName as Manager
from employees as e
join  ;  
   
   
 select * from payments;
 select * from payments;
 select * from employees; 
 
  
select
   concat(e.firstname,"",e.lastname) as empname,
   sum(p.amount),
   country
from employees e
join customers as c
on e.employeeNumber = c.salesRepEmployeeNumber
join payments as p
on c.customerNumber = p.customerNumber
where country = "USA"
group by empname,country;   

#emp ke hisaab se sales aur jisme office city paris honi chahiye

select * from orderdetails;
select * from employees;

select
   concat(e.firstname," ",e.lastname) as fullName,
   sum(od.quantityOrdered*od.priceeach) as Sales
from employees as e
join orderdetails as od
on 
;

#Friday Oct 16 2026-------------------------------------------------------------------------------------------------------------

#view table
drop view abi10;


#Top 10 employees as per Qty Sales
select * from employees;
select * from orderdetails;

create view abi10 as
SELECT
    e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS EmployeeName,
    SUM(od.quantityOrdered) AS TotalQtySales
FROM employees AS e
JOIN customers AS c
    ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders AS o
    ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
    ON o.orderNumber = od.orderNumber
GROUP BY
    e.employeeNumber,
    e.firstName,
    e.lastName
ORDER BY TotalQtySales DESC
LIMIT 10;

select
   concat(e.firstname," ",e.lastname),
   od.quantityOrdered
from employees as e
join orderdetails as od
on e.orderNum;
   
#store procedure
#Top 10 employees as per qty sales  
#only motorcycles

select * from abi10;

delimiter $$
create procedure hi()
begin
   select * from employees;
end $$
delimiter ;

call hi();

drop procedure hi();

select * from employees;
select * from offices;
select
   e.employeeNumber as emp_no,
   concat(e.firstname," ",e.lastname) as emp_name,
   concat(m.firstname," ",m.lastname) as mgr_name,
   offi.city as officeCity,
   offi.country as officeCountry
from employees as e
join offices as offi
on e.officeCode = offi.officeCode
join employees as m
on e.reportsTo = m.employeeNumber;

#Monday Oct 19 2026-------------------------------------------------------------------------------------------------------------

use mydb1;
drop procedure country_wise_customers;
delimiter $$
create procedure country_wise_customers(in country_name varchar(30))
begin
select * from customers where country = country_name;
end $$
delimiter ;

delimiter $$
create procedure country_wise_customers()
begin
select * from customers where country = "USA";
end $$
delimiter ;

call country_wise_customers();
call country_wise_customers("USA");

drop procedure country_wise_customers;
delimiter $$
create procedure country_wise_customers(in country_name varchar(30),in x int)
begin
select * from customers where country = country_name
order by creditlimit desc
limit x;
end $$
delimiter ;

call country_wise_customers("USA",3);

delimiter $$
create procedure country_wise_customers(in country_name varchar(30),in x int)
begin
select
   customerName,
   country,
   creditLimit
from customers 
where country = country_name
order by creditlimit desc
limit x;
end $$
delimiter ;

call country_wise_customers("USA",3);

#product wise sales,jiska productline motorcycle ho

USE mydb1;
select * from orderdetails;
select * from orders;
select * from employees;
select * from customers;
DROP PROCEDURE IF EXISTS motorcycle_product_wise_sales;

DELIMITER $$

CREATE PROCEDURE motorcycle_product_wise_sales()
BEGIN
    SELECT
        p.productCode,
        p.productName,
        p.productLine,
        SUM(od.quantityOrdered) AS TotalQtySales,
        SUM(od.quantityOrdered * od.priceEach) AS TotalSales
    FROM products AS p
    JOIN orderdetails AS od
        ON p.productCode = od.productCode
    WHERE p.productLine = 'Motorcycles'
    GROUP BY
        p.productCode,
        p.productName,
        p.productLine
    ORDER BY TotalSales DESC;
END $$

DELIMITER ;

CALL motorcycle_product_wise_sales();

#employees wise total sales,where country usa ho

USE mydb1;

DROP PROCEDURE IF EXISTS usa_employee_wise_total_sales;

DELIMITER $$

CREATE PROCEDURE usa_employee_wise_total_sales()
BEGIN
    SELECT
        e.employeeNumber,
        CONCAT(e.firstName, ' ', e.lastName) AS EmployeeName,
        SUM(od.quantityOrdered * od.priceEach) AS TotalSales
    FROM employees AS e
    JOIN customers AS c
        ON e.employeeNumber = c.salesRepEmployeeNumber
    JOIN orders AS o
        ON c.customerNumber = o.customerNumber
    JOIN orderdetails AS od
        ON o.orderNumber = od.orderNumber
    WHERE c.country = 'USA'
    GROUP BY
        e.employeeNumber,
        e.firstName,
        e.lastName
    ORDER BY TotalSales DESC;
END $$

DELIMITER ;

#total sales 10000 se zyada,highest to lowest,usa and 10000 change ho sakta hai

USE mydb1;

DROP PROCEDURE IF EXISTS employee_sales_above_amount;

DELIMITER $$

CREATE PROCEDURE employee_sales_above_amount(
    IN p_country VARCHAR(30),
    IN p_min_sales DECIMAL(10,2)
)
BEGIN
    SELECT
        e.employeeNumber,
        CONCAT(e.firstName, ' ', e.lastName) AS EmployeeName,
        SUM(od.quantityOrdered * od.priceEach) AS TotalSales
    FROM employees AS e
    JOIN customers AS c
        ON e.employeeNumber = c.salesRepEmployeeNumber
    JOIN orders AS o
        ON c.customerNumber = o.customerNumber
    JOIN orderdetails AS od
        ON o.orderNumber = od.orderNumber
    WHERE c.country = p_country
    GROUP BY
        e.employeeNumber,
        e.firstName,
        e.lastName
    HAVING SUM(od.quantityOrdered * od.priceEach) > p_min_sales
    ORDER BY TotalSales DESC;
END $$

DELIMITER ;

CALL employee_sales_above_amount('USA', 10000);

/*SQL Stored Procedure Challenge 🧠
Question: Create a stored procedure for Top X Customers by Total Payment, 
where the country and number of customers can be changed.

Requirements:
1. Display customerNumber, customerName, country and TotalPayments.
2. Show only customers from the country provided as an input parameter.
3. Calculate total payments using SUM(amount).
4. Sort total payments from highest to lowest.
5. Use an IN parameter to change the country.
6. Use another IN parameter to change the number of customers using LIMIT.*/

select * from customers;
select * from payments;

delimiter $$
create procedure customerWala(in country_name varchar(30),in x int)
begin
select 
   c.customerNumber,
   c.customerName,
   c.country,
   sum(p.amount) as amount1
from customers as c
join payments as p
on c.customerNumber = p.customerNumber
where c.country = country_name
group by c.customerNumber,c.customerName,c.country
order by amount1 desc
limit x;
end $$
delimiter ;

call customerWala("USA",5);

/*SQL Stored Procedure Challenge
Question: Customer-Wise Top X Customers by Total Sales

Create a stored procedure named top_customers_by_sales with the following requirements:
1. Display customerNumber, customerName, country and TotalSales.
2. The country should be changeable through an input parameter.
3. Calculate total sales using quantity ordered multiplied by selling price.
4. Calculate total sales separately for each customer.
5. Display only customers from the selected country.
6. Sort total sales from highest to lowest.
7. The number of customers displayed should also be changeable through an input parameter.*/
select * from customers;
select * from orderdetails;

drop procedure if exists customer_x;
delimiter $$
create procedure customer_x(in country_name varchar(15),in x int)
begin
select
   c.customerNumber,
   c.customerName,
   c.country,
   sum(od.quantityOrdered*od.priceEach) as TotalSales
from customers as c
join orders as o
on c.customerNumber = o.customerNumber
join orderdetails as od
on od.orderNumber = o.orderNumber
where c.country = country_name
group by    
   c.customerNumber,
   c.customerName,
   c.country
order by TotalSales desc
limit x;
end $$
delimiter ;

call customer_x("USA",5);

#Thurs,Oct,22-------------------------------------------------------------------------------------------------------------------
#Windows Function

select
   row_number() over(order by creditlimit desc) as row_no,
   customerName,
   creditlimit
   #sum(creditlimit) over()
from customers;   

select
   rank() over(order by creditlimit desc) as rank1,
   customerName,
   creditlimit
from customers;

select
   dense_rank() over(order by creditlimit desc) as row_no,
   customerName,
   creditlimit
from customers;

select count(*) from customers;

select
   ntile(10) over(order by creditlimit desc) as grp_no,
   customerName,
   creditlimit
from customers;

select
   rank() over(partition by country order by creditlimit desc) as rank1,
   customerName,
   country,
   creditlimit
from customers;
#------------------

select productName,buyPrice,round(buyprice) from products;

#Sat,Oct,24-------------------------------------------------------------------------------------------------------------------

select
   customerName,
   country,
   creditlimit,
   min(creditlimit) over(partition by country),
   max(creditlimit) over(partition by country)
from customers;

#product wise Qty Stock and % of overall Stock

USE mydb1;

SELECT
    productCode,
    productName,
    quantityInStock AS QtyStock,
    quantityInStock * 100.0
        / SUM(quantityInStock) OVER () AS StockPercentage
FROM products;
  
#Country wise sales and contribution % of Total Sales  
select * from orderdetails;
select * from customers;

USE mydb1;

SELECT
    c.country,
    SUM(od.quantityOrdered * od.priceEach) AS Sales,
    SUM(od.quantityOrdered * od.priceEach) * 100.0
        / SUM(SUM(od.quantityOrdered * od.priceEach)) OVER ()
        AS ContributionPercent
FROM customers AS c
JOIN orders AS o
    ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
    ON o.orderNumber = od.orderNumber
GROUP BY c.country
ORDER BY Sales DESC;

#Mon,Oct,26-------------------------------------------------------------------------------------------------------------------
#Growth = (currentValue/priviousValue) -1
select 
   date_format(o.orderdate,"%b-%y") as Month,
   (sum(od.quantityOrdered*od.priceeach)) /
   lag(sum(od.quantityOrdered*od.priceeach)) over()-1 as growth
from orders as o
join orderdetails as od
on od.orderNumber = o.orderNumber
group by Month;   

select 
   date_format(o.orderdate,"%b-%y") as Month,
   (sum(od.quantityOrdered*od.priceeach)) /
   lead(sum(od.quantityOrdered*od.priceeach)) over()-1 as growth
from orders as o
join orderdetails as od
on od.orderNumber = o.orderNumber
group by Month;   

select 
   productName,
   quantityinstock,
   first_value(quantityinstock)
   over(order by quantityInStock desc)
from products;   

select 
   productName,
   quantityinstock,
   last_value(quantityinstock)
   over(order by quantityInStock desc
   rows between unbounded preceding and unbounded following)
from products;

#customer table mein se saari column laani hai but jiski creditlimit highest ho,sirf wahi

select * from customers;

select * from customers
order by creditLimit desc
limit 1;

select * from customers
where creditLimit = (select max(creditLimit) from customers);

select * from products
where quantityInStock > (select avg(quantityInStock) from products);

#above 1 lakh payment details
select * from payments;

select * from payments
where amount > 100000;

select * from payments
where amount > (select 100000);

#Tue,Oct,27-------------------------------------------------------------------------------------------------------------------

select * from employees
where officeCode = (select officeCode from employees 
where lastName = "Bondur" and firstName = "Gerard" );

select * from employees
where reportsTo = (select reportsTo from employees
where lastName = "King" and firstName = "Tom");

#All product details who belong same product line with 
#this product code S18_1129

select * from products;

select * from products
where productLine = (select productLine from products 
where productCode = "S18_1129");

#S10_2026 this product is defective so find
#all product who send by same vendor

select * from products;
select * from employees;

select 
   o.officeCode,
   o.city,
   (select count(*) from employees as e
   where e.officeCode = o.officeCode) as no_of_emp
   from offices as o;
   
   #Customer Name and No. of Orders
   
   select * from customers;
   select * from orders;
   
   select
      c.customerName,
      o.orderNumber
    from customers as c
    where customerNumber = (select c.customerNumber from customers);
   
   

select * from products
where productVendor = (select productVendor from products
where productCode = "S10_2026" );

#country wise avg creditlimit and avg creditlimit is above 70000

select * from customers;

select 
    country,
    avg(creditlimit)
from customers
group by country    
having avg(creditlimit) > 70000;

#case statement

select
   customerName,
   creditLimit,
   case 
       when creditlimit < 1000000 then "Less then 1L"
       when creditlimit between 100000 and 200000 then "1Lakh to 2Lakh"
       when creditlimit > 200000 then "More than 2lakh"
    end as cl_group
from customers;    
#Wed,Oct,28-------------------------------------------------------------------------------------------------------------------

use mydb1;

select round(10.28);

select buyPrice,round(buyprice),ceil(buyPrice),floor(buyprice),sign(-50) from products;

select
   customerName,
   creditLimit,
   case 
       when creditlimit < 1000000 then "Less than 1L"
       when creditlimit between 100000 and 200000 then "1Lakh to 2Lakh"
       when creditlimit > 200000 then "More than 2lakh"
    end as cl_group
from customers;

select productname,
       productline,
       case
          when  productline="Motorcycles" then "M"
          when productline="Classic Cars" then "CC"
          else "Others"
        end as Group1
from products;

select productname,
       productline,
       case productline
          when "Motorcycles" then "M"
          when "Classic Cars" then "CC"
          else "Others"
        end as Group1
from products;