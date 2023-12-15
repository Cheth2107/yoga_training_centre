--CREATE AND USE DATABASE

create database yoga_training;
use yoga_training;


--CREATE TABLES

create table STUDENT(
    SID int primary key,
    name varchar(30),
    age int,
    email varchar(30),
    phone_number varchar(10),
    gender varchar(10),
    DOB DATE
    asanas_learnt int,
    attendance_status_in_percentage int);

create table TRAINER(
    TID int primary key,
    name varchar(30),
    age int,
    email varchar(30),
    phone_number varchar(10),
    gender varchar(10),
    DOB DATE,
    experience varchar(10),
    salary int);

 create table TRAINED_BY(
    SID int,
    TID int,
    primary key(SID,TID),
    foreign key(SID) references STUDENT(SID),
    foreign key(TID) references TRAINER(TID));

 create table MAINTENANCE(
    MID int primary key,
    name varchar(30),
    age int,
    phone_number varchar(10),
    gender varchar(10),
    salary int);

create table ROOM(
    RID int primary key,
    yoga_mats int,
    straps int,
    blocks int,
    bolsters int,
    max_occupancy int,
    MID int,
    primary key(RID,MID),
    foreign key(MID) references MAINTENANCE(MID));

 create table COURSE(
    CID int,
    course_name varchar(30),
    duration varchar(10),
    start_date DATE,
    end_date DATE,
    schedule varchar(50),
    asanas_taught varchar(50),
    fees int,
    RID int,
    MID int,
    primary key(CID,RID),
    foreign key(RID, MID) references ROOM(RID, MID)

 create table ENROLLS(
    SID int,
    CID int,
    primary key(SID,CID),
    foreign key(SID) references STUDENT(SID),
    foreign key(CID) references COURSE(CID));


--INSERT VALUES INTO TABLES

insert into STUDENT values
    (101,'Rohan Kumar',23,'rohan@gmail.com','9484546981','male','2000-04-06',2,85),
    (102,'Sushmitha Singh',20,'sushmitha@gmail.com','8878998562','female','2003-09-19',1,79),
    (103,'Kevin Smith',24,'kevin@gmail.com','7896541255','male','1999-05-05',3,92),
    (104,'Rock Anderson',22,'rock@gmail.com','6466898935','male','2001-01-09',1,76),
    (105,'Emily Jackson',26,'emily@gmail.com','8899412578','female','1997-10-10',3,78),
    (106,'Ashwini Kumar',34,'ashwini@gmail.com','9784565128','female','1989-12-10',2,99),
    (107,'Praveen Singh',28,'praveen@gmail.com','8899551165','male','1995-05-11',1,88),
    (108,'Bhoomika Iyer',19,'bhoomika@gmail.com','9012564698','female','2004-07-07',1,85),
    (109,'Surya Raj',22,'surya@gmail.com','9164014698','male','2001-05-30',3,91),
    (110,'Ganga Kashyap',22,'ganga@gmail.com','8812475998','female','1998-10-24',1,72);

 insert into TRAINER values
    (401,'Ben Johnson',35,'ben@gmail.com','9988456123','male','1988-02-29','3 years',10000),
    (402,'Meera Rao',24,'meera@gmail.com','6366898943','female','1999-04-20','5 years',15000),
    (403,'Nikhil Manjunath',30,'nikhil@gmail.com','8712564788','male','1993-11-26','7 years',20000);
    
 insert into TRAINED_BY values
    (101,401),
    (102,403),
    (103,401),
    (104,402),
    (105,401),
    (106,402),
    (107,402),
    (108,403),
    (109,403),
    (110,401);

 insert into MAINTENANCE values
    (501,'Bhaskar Rao',45,'9474561232','male',5000),
    (502,'Nagarathna C',53,'6366789455','female',7000),
    (503,'Jack Peterson',39,'8812975322','male',9000);

 insert into ROOM values
    (201,18,18,30,18,15,501),
    (202,15,15,25,15,12,502),
    (203,12,12,20,12,10,503);

INSERT INTO COURSE VALUES
    (301, 'Beginner', '8 weeks', '2024-01-08', '2024-03-01', 'Morning 7:00-8:00 am , Mon-fri', 'Tadasana , Vrikshasana , Trikonasana', 3000, 201, 501),
    (302, 'Intermediate', '10 weeks', '2024-01-15', '2024-03-20', 'Evening 6:00-7:00 pm , Mon-thur', 'Bakasana , Naukasana , Dhanurasana', 5000, 202, 502),
    (303, 'Advanced', '12 weeks', '2024-01-22', '2024-04-11', 'Morning 6:00-7:00 am , Mon-thur', 'Garudasana , Hanumanasana , Vrischikasana', 7000, 203, 503);

 insert into ENROLLS values
    (101,301,201),
    (102,303,203),
    (103,301,201),
    (104,302,202),
    (105,301,201),
    (106,302,202),
    (107,302,202),
    (108,303,203),
    (109,303,203),
    (110,301,201);
