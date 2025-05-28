--university database 


create database university_database

--Create University Database give any University name you want
alter database university_database
modify name=[RGPV]

--Under this University Create four tables college,department, professor, student
create table college_table (
college_id nvarchar(100) Primary key,
college_name nvarchar(200) not null,
college_area nvarchar(200) not null
);

create table Department_table(
Dept_id nvarchar(100) Primary Key,
Dept_name nvarchar(200),
Dept_facility nvarchar(200)
);

create table professor_table(
Prof_id nvarchar(100) Primary Key,
Prof_name nvarchar(200),
Prof_subject nvarchar(200)
);

create table student_table(
student_id nvarchar(100) Primary key,
student_name nvarchar(200),
student_stream nvarchar(200)
);

--. Apply foreign key on Department key from College_table//doubt


-- Apply foreign Key on Student_Table from Professor_Table//doubt--. Insert atleast 10 Records in each tableinsert into college_table values ('C1','UIT_GEC', 'Airport_road'),('C2','Oriental', 'Raisen'),('C3','LNCT', 'Indore'),('C4','JNCT', 'Raisen'),('C5','PEOPLE', 'Ayodhya_bypass'),('C6','TIT', 'Raisen'),('C7','SIRT', 'Neelbad'),('C8','IES', 'KOLAR'),('C9','NRI', 'Kolar'),('C10','SISTEC', 'Bawadiya_Kalan')select*from college_tableinsert into Department_tablevalues('D1', 'Mechanical Engineering', 'Workshop'),('D2', 'Computer_Science', 'Tech_Lab'),('D3', 'Business_Administration', 'BA'),('D4', 'Automobile_Engineering', 'Automotive_lab'),('D5', 'Civil_engineering', 'Structure_lab'),('D6', 'History', 'Archives'),('D7', 'Pharmacy', 'Pharma_lab'),('D8', 'Anthropology', 'evolutionary_lab'),('D9', 'Electrical Engineering', 'Power Lab'),('D10', 'Physics', 'Physics Lab')select *from Department_tableinsert into professor_tablevalues ('P1', 'Dr. Nitin Shrivastava', 'Mechanical Engineering'),('P2', 'Dr. Ankur', 'BA'),('P3', 'Dr. Neeta', 'Automobile Engineering'),('P4', 'Dr. Vipin', 'Civil'),('P5', 'Dr. Mohit', 'Anthropology'),('P6', 'Dr. Smita', 'History'),('P7', 'Dr. Sanjeev', 'Electrical enngineering'),('P8', 'Dr. Asha', 'Physics'),('P9', 'Dr. Sanjana', 'pharma_lab'),('P10', 'Dr.Swati', 'Computer')select *from professor_table  insert into student_tablevalues('S1', 'Shivani', 'Computer Engineering'),('S2', 'Aditi', 'Mechanical engineering'),('S3', 'Nilima', 'BA'),('S4', 'Vikram', 'Automobile'),('S5', 'Sudhir', 'Anthropology'),('S6', 'Subodh', 'Physics Lab'),('S7', 'Promod', 'Civil'),('S8', 'Kartik', 'Electrical'),('S9', 'Ritvick', 'Pharma'),('S10', 'Aditya', 'History')select *from student_table--Give the information of College_ID and College_name from College_Tableselect college_id, college_name from college_table-- Show Top 5 rows from Student table. select top 5 *from student_table --What is the name of professor whose ID is 5select prof_name from professor_table where Prof_id='P5'--Convert the name of the Professor into Upper case select Upper(Prof_name) as Professor_name from professor_table--Show me the names of those students whose name is start with aselect student_name from student_table where student_name like 'a%'-- Give the name of those colleges whose end with aselect College_Name from College_Table where College_Name like '%a'--Add one Salary Column in Professor_Tablealter table professor_table add Salary decimal(10,2)update professor_table set salary = 70000 where prof_id='P1'update professor_table set salary = 75000 where prof_id='P2'update professor_table set salary = 80000 where prof_id='P3'update professor_table set salary = 85000 where prof_id='P4'update professor_table set salary = 90000 where prof_id='P5'update professor_table set salary = 95000 where prof_id='P6'update professor_table set salary = 100000 where prof_id='P7'update professor_table set salary = 150000 where prof_id='P8'update professor_table set salary = 200000 where prof_id='P9'update professor_table set salary = 250000 where prof_id='P10'-- Add one Contact Column in Student_table alter table student_tableadd contact nvarchar(200)UPDATE Student_Table SET Contact = '9131993457' WHERE Student_ID = 'S1';
UPDATE Student_Table SET Contact = '9123245678'WHERE Student_ID = 'S2';
UPDATE Student_Table SET Contact = 'qwerty@gmail.com' WHERE Student_ID = 'S3';
UPDATE Student_Table SET Contact = 'asdfgh@yahoo.com' WHERE Student_ID = 'S4';
UPDATE Student_Table SET Contact = '09876543112' WHERE Student_ID = 'S5';
UPDATE Student_Table SET Contact = 'hjkllg@gmail.com' WHERE Student_ID = 'S6';
UPDATE Student_Table SET Contact = '1234567890' WHERE Student_ID = 'S7';
UPDATE Student_Table SET Contact = 'nmhkkkjl@gmail.com' WHERE Student_ID = 'S8';
UPDATE Student_Table SET Contact = 'cvbnmxz@gmail.com' WHERE Student_ID = 'S9';
UPDATE Student_Table SET Contact = '12333445678' WHERE Student_ID = 'S10';select *from student_table-- Find the total Salary of Professor select Sum(salary) as total_salary from professor_table--Change datatype of any one column of any one Table //doubt--Show first 5 records from Students table and Professor table Combineselect  top 5 st. student_id, st. student_name, st.student_stream, st.contact, pr. prof_id, pr.prof_name, pr.prof_subject, pr. salary from student_table st left join professor_table pr on st. student_stream= pr.Prof_subjectselect *from professor_tableselect *from Department_tableselect *from college_tableselect *from student_table--Apply Inner join on all 4 tables together(Syntax  is mandatory)//doubt  no table last executedselect st.*,pt.*,dt.* from Student_Table st 
inner join Professor_Table pt on st.student_stream = pt.Prof_subject
inner join Department_Table dt on pt.Prof_subject = dt.Dept_name
inner join College_Table ct on ct.college_id= st.student_id;

-- Show Some null values from Department table and Professor table. //doubt insert?

--Create a View from College Table  and give those records whose college name starts with C //doubt no table
create view CollegeTableStartsWithC  as
select College_ID, College_Name, College_Area from College_Table where College_Name like 'c%'

select * from CollegeTableStartsWithC

--Create Stored Procedure of Professor table whatever customer ID will be given by user it should show whole records of it.


-- Rename the College_Table to College_Tables_Data .
alter table college_table
rename college_table to college_tables_data

sp_rename 'College_Tables_data', 'College_Data'

select *from college_data