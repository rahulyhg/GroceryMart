-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2017 at 05:22 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocery`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE Item(
I_Id int(5) NOT NULL,
Name varchar(20) NOT NULL,
Manf_by varchar(20),
PRIMARY KEY (I_id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Users(
C_Id int(5) NOT NULL,
Name_f varchar(20) NOT NULL,
Name_l varchar(20),
Role varchar(20) NOT NULL,
A_street varchar(50),
A_city varchar(20),
A_state varchar(20),
A_PIN int(6),
Membership_type varchar(10),
Email varchar(30),
PRIMARY KEY (C_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO Users(C_Id,Name_f,Name_l,Role) VALUES
(1,Admin1,NULL,Administrator),
(2,Cust1,NULL,Customer),
(3,Cust1,NULL,Customer),
(4,Cust1,NULL,Customer),
(5,Cust1,NULL,Customer);

CREATE TABLE Cust_Ph(
C_Id int(5),
Phone_no int(10),
PRIMARY KEY (C_Id,Phone_no),
FOREIGN KEY (C_Id) REFERENCES Users(C_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Card_details(
C_Id int(5),
Card_No int(12),
Name_f varchar(20) NOT NULL,
Name_l varchar(20) NOT NULL,
Expiry_date date NOT NULL,
Type varchar(10) NOT NULL,
PRIMARY KEY (C_Id,Card_No),
FOREIGN KEY (C_Id) REFERENCES Users(C_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Store(
S_Id int(5),
Name varchar(20) NOT NULL,
Manager_f varchar(20),
Manager_l varchar(20),
A_street varchar(50),
A_city varchar(20),
A_state varchar(20),
A_PIN int(6),
Email varchar(30),
PRIMARY KEY (S_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Store_Ph(
S_Id int(5),
Phone_no int(10),
PRIMARY KEY (S_Id, Phone_no),
FOREIGN KEY (S_Id) REFERENCES Store(S_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Sold_By(
I_Id int(5),
S_Id int(5),
Cost int(7) NOT NULL,
PRIMARY KEY (I_Id,S_Id),
FOREIGN KEY (I_Id) REFERENCES Item(I_Id),
FOREIGN KEY (S_Id) REFERENCES Store(S_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Delivery_Person(
D_Id int(5),
Name_f varchar(20) NOT NULL,
Name_l varchar(20) NOT NULL,
PRIMARY KEY (D_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Delivery_Ph(
D_Id int(5),
Phone_No int(10),
PRIMARY KEY (D_Id,Phone_No),
FOREIGN KEY (D_Id) REFERENCES Delivery_Person(D_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Orders(
Order_Id int(5),
Date_time timestamp,
Amount int(7),
C_Id int(5),
Card_No int(12),
D_Id int(5),
delivery_review varchar(100),
PRIMARY KEY (Order_Id),
FOREIGN KEY (C_Id) REFERENCES Users(C_Id),
FOREIGN KEY (D_Id) REFERENCES Delivery_Person(D_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Order_details(
Order_Id int(5),
I_Id int(5),
Quantity int(3) NOT NULL,
Rating int(1),
PRIMARY KEY (Order_Id,I_Id),
FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id),
FOREIGN KEY (I_Id) REFERENCES Item(I_Id)) ENGINE=InnoDB DEFAULT CHARSET=latin1;

