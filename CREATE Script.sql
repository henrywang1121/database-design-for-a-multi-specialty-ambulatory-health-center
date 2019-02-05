/* CREATE a new user for the term project*/


CREATE USER studentproject IDENTIFIED BY studentpassword
DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE TO studentproject;
ALTER USER studentproject QUOTA UNLIMITED ON USERS;


/* DROP statements to drop all existing tables and related constructs */


DROP TABLE Facility CASCADE CONSTRAINTS;
DROP TABLE Building CASCADE CONSTRAINTS;
DROP TABLE Department CASCADE CONSTRAINTS;
DROP TABLE Ethnicity CASCADE CONSTRAINTS;
DROP TABLE Physician CASCADE CONSTRAINTS;
DROP TABLE Insurance_plan CASCADE CONSTRAINTS;
DROP TABLE Accept CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE Payment_status CASCADE CONSTRAINTS;
DROP TABLE Bill CASCADE CONSTRAINTS;
DROP TABLE Waitlist CASCADE CONSTRAINTS;
DROP TABLE Has CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;
DROP TABLE Visit CASCADE CONSTRAINTS;

DROP SEQUENCE facility_seq;
DROP SEQUENCE building_seq;
DROP SEQUENCE department_seq;
DROP SEQUENCE ethnicity_seq;
DROP SEQUENCE physician_seq;
DROP SEQUENCE insurance_plan_seq;
DROP SEQUENCE patient_seq;
DROP SEQUENCE payment_status_seq;
DROP SEQUENCE bill_seq;
DROP SEQUENCE waitlist_seq;
DROP SEQUENCE waitlist_priority_seq;
DROP SEQUENCE appointment_seq;
DROP SEQUENCE visit_seq;

DROP PROCEDURE Book_appointment;
DROP PROCEDURE Be_waitlist;
DROP PROCEDURE Add_patient;
DROP PROCEDURE Change_physician_work_hours;
DROP PROCEDURE Add_physician_and_department;


/* CREATE tables and sequences */


CREATE TABLE Facility (
facility_id DECIMAL(20) NOT NULL,
facility_name VARCHAR(255) NOT NULL,
PRIMARY KEY (facility_id));

CREATE SEQUENCE facility_seq;


CREATE TABLE Building (
building_id DECIMAL(20) NOT NULL,
building_name VARCHAR(255) NOT NULL,
facility_id DECIMAL(20) NOT NULL,
PRIMARY KEY (building_id),
FOREIGN KEY (facility_id) REFERENCES Facility);

CREATE SEQUENCE building_seq;


CREATE TABLE Department (
department_id DECIMAL(20) NOT NULL,
dept_name VARCHAR(255) NOT NULL,
PRIMARY KEY (department_id));

CREATE SEQUENCE department_seq;


CREATE TABLE Ethnicity (
ethnicity_id DECIMAL(20) NOT NULL,
ethnicity_name VARCHAR(255) NOT NULL,
PRIMARY KEY (ethnicity_id));

CREATE SEQUENCE ethnicity_seq;


CREATE TABLE Physician (
physician_id DECIMAL(20) NOT NULL,
building_id DECIMAL(20) NOT NULL,
physician_first VARCHAR(255) NOT NULL,
physician_last VARCHAR(255) NOT NULL,
department_id DECIMAL(20) NOT NULL,
ethnicity_id DECIMAL(20) NOT NULL,
physician_work_hours DECIMAL(20) NOT NULL,
PRIMARY KEY (physician_id),
FOREIGN KEY (building_id) REFERENCES Building,
FOREIGN KEY (department_id) REFERENCES Department,
FOREIGN KEY (ethnicity_id) REFERENCES Ethnicity);

CREATE SEQUENCE physician_seq;


CREATE TABLE Insurance_plan (
insurance_id DECIMAL(20) NOT NULL,
insurance_name VARCHAR(255) NOT NULL,
PRIMARY KEY (insurance_id));

CREATE SEQUENCE insurance_plan_seq;


CREATE TABLE Accept (
facility_id DECIMAL(20) NOT NULL,
insurance_id DECIMAL(20) NOT NULL,
PRIMARY KEY (facility_id, insurance_id),
FOREIGN KEY (facility_id) REFERENCES Facility,
FOREIGN KEY (insurance_id) REFERENCES Insurance_plan);


CREATE TABLE Patient (
patient_id DECIMAL(20) NOT NULL,
patient_first VARCHAR(255) NOT NULL,
patient_last VARCHAR(255) NOT NULL,
insurance_id DECIMAL (20) NOT NULL,
ethnicity_id DECIMAL(20) NOT NULL,
date_of_birth DATE NOT NULL,
PRIMARY KEY (patient_id),
FOREIGN KEY (insurance_id) REFERENCES Insurance_plan,
FOREIGN KEY (ethnicity_id) REFERENCES Ethnicity);

CREATE SEQUENCE patient_seq;


CREATE TABLE Payment_status (
payment_status_id DECIMAL(20) NOT NULL,
pay_status VARCHAR(255) NOT NULL,
PRIMARY KEY (payment_status_id));

CREATE SEQUENCE payment_status_seq;


CREATE TABLE Bill(
bill_id DECIMAL(20) NOT NULL,
patient_id DECIMAL(20) NOT NULL,
bill_amount DECIMAL(20) NOT NULL,
payment_status_id DECIMAL(20) NOT NULL,
PRIMARY KEY (bill_id),
FOREIGN KEY (payment_status_id) REFERENCES Payment_status);

CREATE SEQUENCE bill_seq;


CREATE TABLE Waitlist (
waitlist_id DECIMAL(20) NOT NULL,
physician_id DECIMAL(20) NOT NULL,
waitlist_priority DECIMAL(20) NOT NULL,
PRIMARY KEY (waitlist_id),
FOREIGN KEY (physician_id) REFERENCES Physician);

CREATE SEQUENCE waitlist_seq;
CREATE SEQUENCE waitlist_priority_seq;

CREATE TABLE Has (
waitlist_id DECIMAL(20) NOT NULL,
patient_id DECIMAL(20) NOT NULL,
PRIMARY KEY (waitlist_id, patient_id),
FOREIGN KEY (waitlist_id) REFERENCES Waitlist,
FOREIGN KEY (patient_id) REFERENCES Patient);


CREATE TABLE Appointment (
appointment_id DECIMAL(20) NOT NULL,
physician_id DECIMAL(20) NOT NULL,
patient_id DECIMAL(20) NOT NULL,
appt_date DATE NOT NULL,
PRIMARY KEY (appointment_id),
FOREIGN KEY (physician_id) REFERENCES Physician,
FOREIGN KEY (patient_id) REFERENCES Patient);

CREATE SEQUENCE appointment_seq;


CREATE TABLE Visit (
visit_id DECIMAL(20) NOT NULL,
physician_id DECIMAL(20) NOT NULL,
patient_id DECIMAL(20) NOT NULL,
visit_date DATE NOT NULL,
PRIMARY KEY (visit_id),
FOREIGN KEY (physician_id) REFERENCES Physician,
FOREIGN KEY (patient_id) REFERENCES Patient);

CREATE SEQUENCE visit_seq;


/*CREATE an index*/

CREATE INDEX appointment_patient_id_idx
ON Appointment (patient_id);
