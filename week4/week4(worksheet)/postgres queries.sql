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
