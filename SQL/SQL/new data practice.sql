Use mydb1;
Select * from Customers;

Select Customername,Country,Creditlimit from Customers
where Creditlimit >100000 and creditlimit <200000;

Select customername, Country, Creditlimit from customers
where not Creditlimit >100000 and creditlimit < 200000;

Select * from Customers
where Customername Like "H%";

Select * from Customers
where creditlimit > 200000;

Select Jobtitle from employees
where jobTitle = "sales rep"; 

Select Productname, Productline, Productvendor from Products
where Quantityinstock >6000 and Quantityinstock <7000;

Select Productname, Productline from Products
Where Productline("Motorcycles" or "Classic cars") and buyprice >60;

Select Customername, Country, creditlimit from customers
Where Country ="USA" or CreditLimit between 150000 and 200000;

Select Customername from Customers
where Customername like "MLTD%";

Select Customername, Country, Creditlimit from Customers
Order by Creditlimit desc;

Select * from Products
Order by Quantityinstock desc;

Select Country, Creditlimit from Customers
Order by Country and Creditlimit desc;


Select sum(CReditlimit) from customers;
Select avg(CReditlimit) from customers;
Select min(CReditlimit) from customers;
Select max(CReditlimit) from customers;
Select Count(Creditlimit) from customers;
Select *(Creditlimit) from Customers;

Select distinct country from customers;
            OR
            
Select Country from customers
groupby Country;

Select Country, avg(creditlimit) from customers
       group by country;
       
 Select Productline, productvendor, sum(Quantityinstock) from Products
 group by Productline, Productvendor;
 
 Select Country, sum(Creditlimit) as Total_CL from Customers
group by Country
Order by Total_CL desc;

Select* from orderdetails;
Select ProductCode,
       SUM(Quantityordered * Priceeach) as Productsales from orderdetails
       group by Productcode
       Order by Productcode;
       
       elect Orderdate,
      Year(Orderdate),
      Month(Orderdate),
      Monthname(Orderdate),
      Day(Orderdate) from Orders;
      
      Select
            Orderdate,
			extract(year from Orderdate),
            dayname (Orderdate),
            Date_add(Orderdate, interval 2 day),
            date_sub(Orderdate, interval 1 month),
            datediff(Shippeddate,orderdate)
            from Orders;

Select 
	Orderdate,

      Current_date(),
      Current_time(),
      now(),
      date_format(Orderdate,"%d/%m/%Y"),
      date_format(NOW(),"%d/%m/%Y")
      FROM oRDERS;
      
      Select * from Products;
      Select * from Orders;
      
 Select
     month(orderdate) as month,
     year(Orderdate) as year,
     count(*) as No_of_orders
     from orders
     Group by month(orderdate),
              year (orderdate);      
              
   Select * from Products;  
   
     Select productname, Quanutityinstock
           from Products
   limit 5(Quantityinstock);
   
           
     
      
      
      Select Status, 
             Count(Ordernumber)
             from Orders
             group by status;
             
             
    Select * from Orders;
    
    Select productname from products
    order by quantityinstock desc
    limit 5;
    
    Select 
    concat(Monthname(orderdate)as month,"_", year(orderdate) as year,
    count(orderdate) from orders
    group by month(orderdate), year (orderdate);
    
   # select
       concat(left(monthname(paymentdate),3),"_", right(year(paymentdate),2) as month_year,
       sum(amount) as total_payment from payments
       group by month_year;#
       
       Select * from payments;
       
       Select 
	concat(LEFT(Monthname(paymentdate),3),"-",
         RIGHT(year(paymentdate),2)as month_YEAR),
         sum(amount) as total_payments from payments
         group by monthname (paymentdate),
                   year(paymentdate);
                   
select 
	Monthname(paymentdate) as month,
    year(paymentdate) as month,
    SUM(amount) as Total_Payment
from payments
group by Monthname(paymentdate),
		year(paymentdate);
        
select 
	concat(left(Monthname(paymentdate),3),"-", 
			right(year(paymentdate),2)) as month_year,
    SUM(amount) as Total_Payment
from payments
group by month_year;
        
    
    
             
             
      
      
      
   


 
      
 




 













