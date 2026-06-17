create table patients (patient_id serial primary key, patient_name varchar(100) not null, age int not null, city varchar(50) not null);



create table doctors (doctor_id serial primary key, doctor_name varchar(100) not null, specialization varchar(100) not null);


create table appointments (app_id serial primary key, patient_id int not null, doctor_id int not null, app_date date not null, foreign key (patient_id) references patients(patient_id), foreign key (doctor_id) references doctors(doctor_id));


create table bills (bill_id serial primary key, app_id int, amount decimal(10,2), foreign key (app_id) references appointments(app_id));



-- inserting data 
insert into  patients(patient_name,age,city)
values
('eswar',25,'Hyderabad'),
('Priya',21,'Chirala'),
('venky',21,'Chirala'),
('anil',28,'Hyderabad'),
('ramya',35,'Vizag');



insert into doctors(doctor_name,specialization)
values
('Dr. Ramesh','Cardiology'),
('Dr. Suresh','Neurology'),
('Dr. Lakshmi','Orthopedics');

insert into appointments(patient_id,doctor_id,app_date)
values
(1,1,'2026-06-01'),
(2,2,'2026-06-02'),
(3,1,'2026-06-03'),
(4,3,'2026-06-04'),
(1,2,'2026-06-05');

insert into bills(app_id,amount)
values
(1,1500),
(2,2000),
(3,2500),
(4,1800),
(5,3000);



-- sql queries
select * from patients;


select * from doctors;

select * from appointments where doctor_id = 1;

select doctor_id, count(*) as total_appointments from appointments group by doctor_id;

select sum(amount) as total_billing_amount from bills;


select * from patients p inner join appointments a on p.patient_id = a.patient_id;

select * from doctors d left join appointments a on d.doctor_id = a.doctor_id;

select patient_id, count(*) as appointment_count from appointments group by patient_id having count(*) >1;

select max(amount) as highest_bill from bills;


select doctor_id, count(*) as total_appointments from appointments group by doctor_id order by total_appointments desc limit 1;


"""


  5 rows returned
patient_id
integer
patient_name
character varying
age
integer
city
character varying
1	1	eswar	25	Hyderabad
2	2	Priya	21	Chirala
3	3	venky	21	Chirala
4	4	anil	28	Hyderabad
5	5	ramya	35	Vizag
3 rows returned
doctor_id
integer
doctor_name
character varying
specialization
character varying
1	1	Dr. Ramesh	Cardiology
2	2	Dr. Suresh	Neurology
3	3	Dr. Lakshmi	Orthopedics

  
2 rows returned
app_id
integer
patient_id
integer
doctor_id
integer
app_date
date
1	1	1	1	2026-06-01
2	3	3	1	2026-06-03


  
3 rows returned
doctor_id
integer
total_appointments
bigint
1	3	1
2	2	2
3	1	2
1 row returned
total_billing_amount
numeric
1	10800.00


  
5 rows returned
patient_id
integer
patient_name
character varying
age
integer
city
character varying
app_id
integer
patient_id
integer
doctor_id
integer
app_date
date
1	1	eswar	25	Hyderabad	1	1	1	2026-06-01
2	2	Priya	21	Chirala	2	2	2	2026-06-02
3	3	venky	21	Chirala	3	3	1	2026-06-03
4	4	anil	28	Hyderabad	4	4	3	2026-06-04
5	1	eswar	25	Hyderabad	5	1	2	2026-06-05


  
5 rows returned
doctor_id
integer
doctor_name
character varying
specialization
character varying
app_id
integer
patient_id
integer
doctor_id
integer
app_date
date
1	1	Dr. Ramesh	Cardiology	1	1	1	2026-06-01
2	2	Dr. Suresh	Neurology	2	2	2	2026-06-02
3	1	Dr. Ramesh	Cardiology	3	3	1	2026-06-03
4	3	Dr. Lakshmi	Orthopedics	4	4	3	2026-06-04
5	2	Dr. Suresh	Neurology	5	1	2	2026-06-05


  
1 row returned
patient_id
integer
appointment_count
bigint
1	1	2

  
1 row returned
highest_bill
numeric
1	3000.00


  
1 row returned
doctor_id
integer
total_appointments
bigint
1	2	2
  


  
"""


