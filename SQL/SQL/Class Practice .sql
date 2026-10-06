Create database mydb;
Use mydb;
Create Table Student (Student_Rollno Int,
                     student_Name Varchar (20),
                     Standard_id Int,
                     Student_DOB date);
                     Select * from Student;
                     Insert into Student(Student_Rollno,student_Name,Standard_id,Student_DOB)
                     values
							(1,"Nisha",05,"1993-09-02"),
                            (2,"Vaishali",06,"2020-10-08");
   Update Student
   set Stud_Name = "Seema", stud_DOB = "2020-10-08"
   Where stud_rollno =2;
   
   Update Students 
   Set Stud_dob = 1994-10-06 
   where name = "Ajay";
                       
                       
									
    Use mydb;
    Create table Studentrecord(Student_name char(10),
						 Standard_id Int);
                         Select * from Studentrecord;
Insert into Studentrecord (Student_name,Standard_id)
			values
                       ("Alisha",02),
                       ("Radhika",03);
                       
  Drop Table Student record
Drop Table if exists Student name;
  
/* ALTER database read only = 1;
drop datbase mydb1;
ALTER database read only = 0;

alter table studentrecord
add mob_no int;

alter table studentrecord 
rename column mob_no to email_id;

alter table studentrecord
Modify email_id varchar(20);
                         
alter table studentrecord
Modify email_id varchar(20)
after student_name;     

alter table studentrecord
modify email_id varchar(20)
first; */
   
 Alter table studentrecord
 Drop email_id;
 
 # STRING Function
   Select concat("Vijay"," ","Verma");
   Select concat_ws(",","Vijay","Sunil","Akshay");
   Select Lower("Vijay Verma");
   Select upper("Vijay Verma");
   Select Length("Vijay Verma");
   Select Trim ("    Vijay Verma    ");
   Select ltrim("   Vijay Verma  ");
   Select rtrim("   Vijay Verma   ");
   Select char_length("Vijay Verma");
   Select left("Vijay Verma",5);
   Select right("Vijay Verma",4);
   Select substring("Vijay Verma",2,5);
   Select reverse("Vijay Verma");
   Select replace("Vijay verma","Vijay","Sunil");
   Select locate("Ver","VijayVerma");
   
   # DATE FUNCTION
select Year ("2026-03-27");
Select MONTH("2026-03-27");
Select DAY("2026-03-27");
Select extract(year from "2026-03-27");
Select date_add("2026-08-21", interval 9 DAY);
Select date_add("2026-03-30", interval 1 MONTH);
Select dateDIFF("2026-03-27", "2025-03-27");
Select date_format("2026-03-27", "%d-%m-%Y");
Select dayname("2026-08-21");
Select monthname("2026-03-27");
Select LAST_DAY("2026-04-27");


Select Orderdate,
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
      
   
   
                     
