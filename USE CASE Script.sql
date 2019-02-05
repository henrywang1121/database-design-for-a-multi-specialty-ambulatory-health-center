/* USE CASE 1A */

CREATE OR REPLACE PROCEDURE Book_appointment(
    physician_id_arg IN DECIMAL,
    patient_id_arg IN DECIMAL,
    appt_date IN DATE)
IS
BEGIN
    INSERT INTO Appointment
    (appointment_id, physician_id, patient_id, appt_date)
    VALUES(appointment_seq.NEXTVAL, physician_id_arg, patient_id_arg, TO_DATE(appt_date, 'DD-MM-YY'));
END;


BEGIN
	Book_appointment(1,1, '01-JUL-2017');
	Book_appointment(2,1, '02-JUL-2017');
END;
/


SELECT *
FROM Appointment;

SELECT a.appointment_id, p.physician_first, p.physician_last, patient.patient_first, patient.patient_last, a.appt_date
FROM Appointment a
JOIN Physician p ON a.physician_id = p.physician_id
JOIN Patient  ON a.patient_id = patient.patient_id
ORDER BY a.appointment_id;



/* USE CASE 1B */

SELECT p.physician_first, p.physician_last
FROM Physician p
JOIN Visit v ON p.physician_id = v.physician_id
JOIN Building b ON p.building_id = b.building_id
WHERE (b.building_name = 'Agnes' OR b.building_name = 'Palladuis') AND v.patient_id = 1;



/* USE CASE 2A */

CREATE OR REPLACE PROCEDURE Be_waitlist(
physician_id_arg IN DECIMAL,
patient_id_arg IN DECIMAL)
IS
BEGIN
    UPDATE Waitlist
    SET waitlist_priority = waitlist_priority + 1;
    INSERT INTO Waitlist (waitlist_id, physician_id, waitlist_priority) VALUES(waitlist_seq.NEXTVAL, physician_id_arg, 1);
    INSERT INTO Has (waitlist_id, patient_id) VALUES (waitlist_seq.CURRVAL, patient_id_arg);
END;


BEGIN
Be_waitlist(1,10);
END;
/


SELECT *
FROM Waitlist
ORDER BY waitlist_priority;

SELECT  w.waitlist_priority, p.patient_first, p.patient_last, Physician.physician_first, Physician.physician_last
FROM  Waitlist w
JOIN Physician ON w.physician_id = Physician.physician_id
JOIN Has h ON w.waitlist_id = h.waitlist_id
JOIN Patient p ON h.patient_id = p.patient_id
ORDER BY w.waitlist_priority;



/* USE CASE 2B */

SELECT *
FROM (SELECT p.patient_first, p.patient_last
        FROM Waitlist w
        JOIN Has h ON w.waitlist_id = h.waitlist_id
        JOIN Patient p ON h.patient_id = p.patient_id
        WHERE physician_id = 1
        ORDER BY waitlist_priority)
WHERE ROWNUM < 4;



/* USE CASE 3A */

CREATE OR REPLACE PROCEDURE Add_patient(
patient_first_arg IN VARCHAR,
patient_last_arg IN VARCHAR,
insurance_id_arg IN DECIMAL,
ethnicity_id_arg IN DECIMAL,
date_of_birth_arg IN DATE)
IS
BEGIN
    INSERT INTO Patient (patient_id, patient_first, patient_last, insurance_id, ethnicity_id, date_of_birth)
                VALUES(patient_seq.NEXTVAL, patient_first_arg, patient_last_arg,
                       insurance_id_arg, ethnicity_id_arg, TO_DATE(date_of_birth_arg, 'DD-MM-YY'));
END;


BEGIN
Add_patient('Will', 'Lee', 1, 1, '21-NOV-1989');
END;
/

SELECT *
FROM Patient p
JOIN Insurance_plan i ON p.insurance_id = i.insurance_id;



/* USE CASE 3B */

SELECT DISTINCT p.patient_first, p.patient_last
FROM Patient p
JOIN Insurance_plan i ON p.insurance_id = i.insurance_id
JOIN Appointment a ON p.patient_id = a.patient_id
WHERE i.insurance_name = 'Empire Plan' AND a.appt_date > ADD_MONTHS(SYSDATE, -24);



/* USE CASE 4A */

CREATE OR REPLACE PROCEDURE Change_physician_work_hours(
physician_id_arg IN DECIMAL,
physician_work_hours_arg IN DECIMAL)
IS
BEGIN
      UPDATE Physician
      SET physician_work_hours = physician_work_hours_arg
      WHERE physician_id = physician_id_arg;
END;

BEGIN
Change_physician_work_hours(3, 2);
END;
/


SELECT physician_id, physician_first, physician_last, physician_work_hours
FROM Physician;


/* USE CASE 4B */

SELECT p.physician_first, p.physician_last
FROM Physician p
WHERE (p.physician_work_hours * 2 = (SELECT COUNT(a.appointment_id)
                                     FROM Appointment a
                                     WHERE a.appt_date = TO_DATE((SYSDATE+1),'DD-MM-YY')))
AND
      (p.physician_work_hours * 2 = (SELECT COUNT(a.appointment_id)
                                     FROM Appointment a
                                     WHERE a.appt_date = TO_DATE((SYSDATE+2),'DD-MM-YY')));



/* USE CASE 5A */

CREATE OR REPLACE PROCEDURE Add_physician_and_department(
dept_name_arg IN VARCHAR,
building_id_arg IN DECIMAL,
physican_first_arg IN VARCHAR,
physician_last_arg IN VARCHAR,
ethnicity_id_arg IN DECIMAL,
physician_work_hours_arg IN DECIMAL)
IS
BEGIN
      INSERT INTO Department(department_id, dept_name)
                  VALUES (department_seq.NEXTVAL, dept_name_arg);
      INSERT INTO Physician (physician_id, building_id, physician_first, physician_last,
                            department_id, ethnicity_id, physician_work_hours)
                  VALUES (physician_seq.NEXTVAL, building_id_arg, physican_first_arg, physician_last_arg,
                            department_seq.CURRVAL, ethnicity_id_arg, physician_work_hours_arg);
END;


BEGIN
Add_physician_and_department('Dermatology', 3, 'Henry', 'Wang', 4, 1);
Add_physician_and_department('Radiation', 3, 'Ayumi', 'Murata', 4, 1);
END;
/


SELECT * FROM Physician;

SELECT * FROM Department;


/* USE CASE 5B */

SELECT (
(SELECT DISTINCT COUNT(physician_id)
FROM Physician p
JOIN Ethnicity e ON p.ethnicity_id = e.ethnicity_id
WHERE e.ethnicity_name = 'Asian')
+
(SELECT DISTINCT COUNT(Patient.patient_id)
FROM Patient
JOIN Ethnicity e ON Patient.ethnicity_id = e.ethnicity_id
JOIN Bill b ON Patient.patient_id = b.patient_id
JOIN Payment_status ON b.payment_status_id = Payment_status.payment_status_id
WHERE e.ethnicity_name = 'Asian' AND pay_status = 'Paid')
)
AS Total_number_asians
FROM Dual;
