CREATE TABLE Department (
DeptName varchar(30) primary key,
building int,
budget float)

CREATE TABLE Student (
SID int primary key,
name varchar(30),
Tot_Cred int,
Dept_Name varchar(30),
IID int)

CREATE TABLE Course (
CourseID varchar(30) primary key,
title varchar(30),
credits int,
Dept_Name varchar(30))

CREATE TABLE Section (
sec_id int primary key,
CourseID varchar(10),
semester varchar(30),
year int,
time_slot_id int,
building int,
room_number int,
capacity int,
enrollment int)

CREATE TABLE Instructor (
IID int primary key,
name varchar(30),
salary float,
Dept_Name varchar(30))

CREATE TABLE Time_slot (
time_slot_id int primary key,
day varchar(15),
start_time time(7),
endtime time(7))

CREATE TABLE Takes (
SID int,
CourseID varchar(10),
sec_id int,
semester varchar(30),
year int,
grades float)

CREATE TABLE Teaches (
IID int,
CourseID varchar(10),
sec_id int,
semester varchar(15),
year int)

CREATE TABLE Prereq (
CourseID varchar(30),
preCourseID varchar(30))

CREATE TABLE Logins (
SID int,
username varchar(15),
password varchar(15))