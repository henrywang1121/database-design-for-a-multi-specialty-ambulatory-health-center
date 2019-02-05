/*INSERT statements for the entities*/


INSERT INTO Facility VALUES (facility_seq.NEXTVAL, 'BUAHC');

INSERT INTO Building VALUES (building_seq.NEXTVAL, 'Agnes', 1);
INSERT INTO Building VALUES (building_seq.NEXTVAL, 'Palladuis', 1);
INSERT INTO Building VALUES (building_seq.NEXTVAL, 'Building_C', 1);
INSERT INTO Building VALUES (building_seq.NEXTVAL, 'Building_D', 1);
INSERT INTO Building VALUES (building_seq.NEXTVAL, 'Building_E', 1);

INSERT INTO Department VALUES (department_seq.NEXTVAL,'Neurology');
INSERT INTO Department VALUES (department_seq.NEXTVAL,'Cardiology');
INSERT INTO Department VALUES (department_seq.NEXTVAL,'Oncology');
INSERT INTO Department VALUES (department_seq.NEXTVAL,'Urology');
INSERT INTO Department VALUES (department_seq.NEXTVAL,'Surgery');

INSERT INTO Ethnicity VALUES(ethnicity_seq.NEXTVAL, 'White');
INSERT INTO Ethnicity VALUES(ethnicity_seq.NEXTVAL, 'Hispanic');
INSERT INTO Ethnicity VALUES(ethnicity_seq.NEXTVAL, 'Black');
INSERT INTO Ethnicity VALUES(ethnicity_seq.NEXTVAL, 'Asian');
INSERT INTO Ethnicity VALUES(ethnicity_seq.NEXTVAL, 'Other');

INSERT INTO Physician VALUES (physician_seq.NEXTVAL, 1, 'Kathlin', 'Jones', 1, 1, 1);
INSERT INTO Physician VALUES (physician_seq.NEXTVAL, 1, 'Scottie', 'Marr', 1, 1, 1);
INSERT INTO Physician VALUES (physician_seq.NEXTVAL, 2, 'Michael', 'Jordan', 2, 2, 1);
INSERT INTO Physician VALUES (physician_seq.NEXTVAL, 3, 'Roger', 'Federer', 3, 3, 1);
INSERT INTO Physician VALUES (physician_seq.NEXTVAL, 4, 'Kate', 'Foster', 4, 4, 1);
INSERT INTO Physician VALUES (physician_seq.NEXTVAL, 5, 'Amy', 'Meng', 5, 5, 1);

INSERT INTO Insurance_plan VALUES(insurance_plan_seq.NEXTVAL, 'Empire Plan');
INSERT INTO Insurance_plan VALUES(insurance_plan_seq.NEXTVAL, 'Cheap Plan');
INSERT INTO Insurance_plan VALUES(insurance_plan_seq.NEXTVAL, 'Luxury Plan');
INSERT INTO Insurance_plan VALUES(insurance_plan_seq.NEXTVAL, 'No Plan');
INSERT INTO Insurance_plan VALUES(insurance_plan_seq.NEXTVAL, 'Unlimited Plan');

INSERT INTO Accept VALUES(1, 1);
INSERT INTO Accept VALUES(1, 2);
INSERT INTO Accept VALUES(1, 3);
INSERT INTO Accept VALUES(1, 4);
INSERT INTO Accept VALUES(1, 5);

INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'Steve', 'Kerr', 1, 1, CAST('01-JAN-70' AS DATE));
INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'Brad', 'Pitt', 1, 1, CAST('01-JAN-72' AS DATE));
INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'Dwayne', 'Johnson', 2, 2, CAST('01-JAN-75' AS DATE));
INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'John', 'Smith', 2, 2, CAST('01-JAN-77' AS DATE));
INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'Tiger', 'Wood', 3, 3, CAST('01-JAN-79' AS DATE));
INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'Peter', 'Pan', 3, 3, CAST('01-JAN-80' AS DATE));
INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'Chris', 'Ronaldo', 4, 4, CAST('01-JAN-85' AS DATE));
INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'Leo', 'Messi', 4, 4, CAST('01-JAN-86' AS DATE));
INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'Jesus', 'Christ', 5, 5, CAST('01-JAN-90' AS DATE));
INSERT INTO Patient VALUES(patient_seq.NEXTVAL, 'Rob', 'Frank', 5, 5, CAST('01-JAN-95' AS DATE));

INSERT INTO Payment_status VALUES(payment_status_seq.NEXTVAL, 'Unpaid');
INSERT INTO Payment_status VALUES(payment_status_seq.NEXTVAL, 'Paid');

INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 1, 150, 1);
INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 2, 250, 1);
INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 3, 350, 1);
INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 4, 450, 2);
INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 5, 550, 2);
INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 6, 150, 1);
INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 7, 250, 1);
INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 8, 350, 2);
INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 9, 450, 2);
INSERT INTO Bill VALUES(bill_seq.NEXTVAL, 10, 450, 2);

INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 1, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 1, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 1, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 2, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 2, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 3, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 3, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 4, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 4, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 5, waitlist_priority_seq.NEXTVAL);
INSERT INTO Waitlist VALUES(waitlist_seq.NEXTVAL, 5, waitlist_priority_seq.NEXTVAL);

INSERT INTO Has VALUES(1, 1);
INSERT INTO Has VALUES(2, 2);
INSERT INTO Has VALUES(3, 3);
INSERT INTO Has VALUES(4, 4);
INSERT INTO Has VALUES(5, 5);
INSERT INTO Has VALUES(6, 6);
INSERT INTO Has VALUES(7, 7);
INSERT INTO Has VALUES(8, 8);
INSERT INTO Has VALUES(9, 9);
INSERT INTO Has VALUES(10, 10);
INSERT INTO Has VALUES(11, 5);

INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 1, 1, CAST('01-JAN-14' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 1, 2, CAST('02-JAN-14' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 2, 3, CAST('03-FEB-15' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 2, 4, CAST('04-FEB-15' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 5, CAST('05-MAR-16' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 6, CAST('06-MAR-16' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 4, 7, CAST('07-APR-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 4, 8, CAST('08-APR-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 5, 9, CAST('10-JUN-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 6, 10, CAST('11-JUN-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 3, CAST('19-JUN-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 4, CAST('19-JUN-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 5, CAST('19-JUN-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 6, CAST('19-JUN-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 7, CAST('20-JUN-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 8, CAST('20-JUN-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 9, CAST('20-JUN-17' AS DATE));
INSERT INTO Appointment VALUES (appointment_seq.NEXTVAL, 3, 10, CAST('20-JUN-17' AS DATE));


INSERT INTO Visit VALUES(visit_seq.NEXTVAL, 1, 1, CAST('01-JAN-14' AS DATE));
INSERT INTO Visit VALUES(visit_seq.NEXTVAL, 1, 2, CAST('02-JAN-14' AS DATE));
INSERT INTO Visit VALUES(visit_seq.NEXTVAL, 2, 3, CAST('03-FEB-15' AS DATE));
INSERT INTO Visit VALUES(visit_seq.NEXTVAL, 2, 4, CAST('04-FEB-15' AS DATE));
INSERT INTO Visit VALUES(visit_seq.NEXTVAL, 3, 5, CAST('05-MAR-16' AS DATE));
INSERT INTO Visit VALUES(visit_seq.NEXTVAL, 3, 6, CAST('06-MAR-16' AS DATE));
INSERT INTO Visit VALUES(visit_seq.NEXTVAL, 4, 7, CAST('07-APR-17' AS DATE));
INSERT INTO Visit VALUES(visit_seq.NEXTVAL, 4, 8, CAST('08-APR-17' AS DATE));
