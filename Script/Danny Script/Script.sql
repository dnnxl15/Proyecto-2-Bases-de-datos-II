/*
* Type: Person
* Author: Danny Xie Li
* Description: This is the object Person, that conteins the follow atributes
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
create or replace TYPE Person_obj AS OBJECT ( 
	idPerson NUMBER,
	surname VARCHAR2(100),
	firstName VARCHAR2(100),
	title VARCHAR2(100),
	address VARCHAR2(100),
	phone NUMBER,
	postcode NUMBER,
	campusLocation VARCHAR2(100)
)NOT FINAL;

/*
* Type: Student
* Author: Danny Xie Li
* Description: This is the object Student, that herence from Person
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE Student_obj UNDER Person_obj ( 
	year NUMBER
)NOT FINAL;

/*
* Table: Student_table
* Author: Danny Xie Li
* Description: This is the table Student, that conteins Student_obj and the primary key is from the person id
* Created: 22/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE TABLE Student_table OF Student_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
* Type: Staff
* Author: Danny Xie Li
* Description: This is the object Staff, that herence from Person
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE Staff_obj UNDER Person_obj ( 
	idBuilding VARCHAR2(100),
	numberOffice VARCHAR2(100),
	staffType VARCHAR2(100)
)NOT FINAL;

/*
* Table: Staff
* Author: Danny Xie Li
* Description: This is the table staff that conetins object of Staff and the primary key is from person id.
* Created: 22/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE TABLE Staff_table OF Staff_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
* Type: TutorStudent
* Author: Danny Xie Li
* Description: This is the object TutorStudent, that herence from Student
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE TutorStudent_obj UNDER Student_obj ( 
	numberHours NUMBER,
	rate FLOAT
);

/*
* Table: Tutor Student
* Author: Danny Xie Li
* Description: This is the table student Tutor, use the primary key from person id.
* Created: 22/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE TABLE TutorStudent_table OF TutorStudent_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY
/*
* Type: TutorStaff
* Author: Danny Xie Li
* Description: This is the object TutorStaff, that herence from Staff
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE TutorStaff_obj UNDER Staff_obj ( 
	numberHours NUMBER,
	rate FLOAT
);

/*
* Table: Tutor Staff
* Author: Danny Xie Li
* Description: This is the table staff Tutor, use the primary key from person id.
* Created: 22/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE TABLE TutorStaff_table OF TutorStaff_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
* Type: Technician
* Author: Danny Xie Li
* Description: This is the object Technician, that herence from Staff
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE Technician_obj UNDER Staff_obj( 
	techTitle VARCHAR2(100),
	techSkill VARCHAR2(100)
);

/*
* Table: Techinician 
* Author: Danny Xie Li
* Description: This is the table Techinician, use the primary key from person id.
* Created: 22/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE TABLE Technician_table OF Technician_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
* Type: Lecturer
* Author: Danny Xie Li
* Description: This is the object Lecturer, that herence from Staff
* Created: 22/04/18
* Last modification: 07/05/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE TYPE Lecturer_obj UNDER Staff_obj ( 
	area VARCHAR2(100),
	lectureType VARCHAR2(100),
	MEMBER PROCEDURE display_details ( SELF IN OUT NOCOPY person_typ )
) NOT FINAL;

CREATE TYPE BODY Lecturer_obj AS
  MEMBER PROCEDURE display_details ( SELF IN OUT NOCOPY person_typ ) IS
  BEGIN
    -- use the PUT_LINE procedure of the DBMS_OUTPUT package to display details
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(idPerson) || ' ' || firstName || ' ' || surname || ' ' || title || ' ' || address || ' ' || TO_CHAR(phone) 
    	|| ' ' || TO_CHAR(postcode) || ' ' || campusLocation || ' ' || idBuilding || ' ' || numberOffice || ' ' || staffType);
    DBMS_OUTPUT.PUT_LINE(area || ' '  || lectureType);
  END;
END;

/*TEST display_details*/
/*FALTA DE PRUEBA*/
DECLARE
  lecturer Lecturer_obj;
BEGIN -- PL/SQL block for selecting a person and displaying details
  SELECT VALUE(lec) INTO lecturer FROM Lecturer_table lec;
  lecturer.display_details();
END;

/*
* Table: Administrator 
* Author: Danny Xie Li
* Description: This is the table lecturer, use the primary key from person id.
* Created: 07/05/18
* Last modification: 07/05/18
* Last modification by: Danny Xie Li
*/
CREATE TABLE Lecturer_table OF Lecturer_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
* Type: Admin
* Author: Danny Xie Li
* Description: This is the object Admin, that herence from Staff
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE Admin_obj UNDER Staff_obj ( 
	admiTitle VARCHAR2(100),
	computerSkill VARCHAR2(100) NULL,
	officeSkill VARCHAR2(100)
);

/*
* Table: Administrator 
* Author: Danny Xie Li
* Description: This is the table administrator, use the primary key from person id.
* Created: 22/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE TABLE Admin_table OF Admin_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY
/*
* Type: AssociateLecturer
* Author: Danny Xie Li
* Description: This is the object AssociateLecturer, that herence from Lecturer
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE AssociateLecturer_obj UNDER Lecturer_obj ( 
	numberHonours NUMBER NULL,
	yearJoin NUMBER
);

/*
* Table: Associate Lecturer 
* Author: Danny Xie Li
* Description: This is the table Associate Lecturer , use the primary key from person id.
* Created: 22/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE TABLE AssociateLecturer_table OF AssociateLecturer_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
*-------------
*  PROCEDURES
*-------------
*/

/*
* Procedure: insertStudent
* Author: Danny Xie Li
* Description: This procedure insert student in the table Student_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE insertStudent(pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pYear IN NUMBER) AS
BEGIN
	INSERT INTO Student_table 
	VALUES(Student_obj(sequenceStudentID.Nextval, pSurname, pFirstName, pTitle, pAddress, pPhone, pPostcode, pCampusLocation, pYear));
	COMMIT;
END insertStudent;

/* PRUEBA DE INSERT STUDENT*/

CALL insertStudent('Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,'Cartago', 2011); 

/*
* Procedure: getStudentsUsingSelect
* Author: Danny Xie Li
* Description: This procedure get student in the table Student_table and have a out parameter as a cursor.
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE getStudentsUsingSelect
AS
BEGIN
	SELECT *
	FROM Student_table;
END getStudentsUsingSelect;

/*
* Procedure: deleteStudent
* Author: Danny Xie Li
* Description: This procedure delete student in the table Student_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE deleteStudent(pIDPerson IN NUMBER) AS
BEGIN
	DELETE FROM Student_table 
	WHERE idPerson = pIDPerson;
	COMMIT;
END deleteStudent;

/* PRUEBA DE DELETE STUDENT*/

CALL deleteStudent(2);

/*
* Procedure: getStudents
* Author: Danny Xie Li
* Description: This procedure get student in the table Student_table and have a out parameter as a cursor.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getStudents(cStudent OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cStudent FOR 
	SELECT Student_table.idPerson, Student_table.surname, Student_table.firstName, 
	Student_table.title, Student_table.address, Student_table.phone, Student_table.postcode,
	Student_table.campusLocation, Student_table.year
	FROM Student_table;
END getStudents;

/*
* Procedure: updateStudent
* Author: Danny Xie Li
* Description: This procedure update student in the table Student_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE updateStudent(pIDPerson IN NUMBER, pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pYear IN NUMBER) AS
BEGIN 
	UPDATE Student_table stu
	SET stu.surname = pSurname,
	stu.firstName = pFirstName,
	stu.title = pTitle,
	stu.address = pAddress,
	stu.phone = pPhone,
	stu.postcode = pPostcode,
	stu.campusLocation = pCampusLocation,
	stu.year = pYear
	WHERE stu.idPerson = pIDPerson;
END updateStudent;

/* PRUEBA DE UPDATE STUDENT*/

CALL updateStudent(2, 'Bilio', 'Gomez', 'Bachillerato', 'San Jose', 89652365, 5632, 'Cartago', 2012);

/*
* Procedure: insertStaff
* Author: Danny Xie Li
* Description: This procedure insert staff in the table Staff_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE insertStaff(pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
campusLocation IN VARCHAR2, idBuilding IN VARCHAR2, numberOffice IN VARCHAR2, staffType IN VARCHAR2) AS
BEGIN
	INSERT INTO Staff_table 
	VALUES(Staff_obj(sequenceStaffID.Nextval, pSurname, pFirstName, pTitle, pAddress, pPhone, pPostcode, campusLocation, idBuilding,
		numberOffice, staffType));
	COMMIT;
END insertStaff;

/* PRUEBA DE INSERT STAFF*/

CALL insertStaff('Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,'Cartago', 1, 'BCGH6', 'Secretaria'); 

/*
* Procedure: deleteStaff
* Author: Danny Xie Li
* Description: This procedure delete staff in the table Staff_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE deleteStaff(pIDPerson IN NUMBER) AS
BEGIN
	DELETE FROM Staff_table 
	WHERE idPerson = pIDPerson;
	COMMIT;
END deleteStaff;

/* PRUEBA DE DELETE STUDENT*/

CALL deleteStaff(0);

/*
* Procedure: getStaffUsingSelect
* Author: Danny Xie Li
* Description: This procedure get staff in the table Staff_table and have a out parameter as a cursor.
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE getStaffUsingSelect AS
BEGIN
	SELECT * FROM Staff_table;
END getStaffUsingSelect;

/*
* Procedure: getStaff
* Author: Danny Xie Li
* Description: This procedure get staff in the table Staff_table and have a out parameter as a cursor.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getStaff(cStaff OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cStaff FOR 
	SELECT Staff_table.idPerson, Staff_table.surname, Staff_table.firstName, 
	Staff_table.title, Staff_table.address, Staff_table.phone, Staff_table.postcode,
	Staff_table.campusLocation, Staff_table.idBuilding, Staff_table.numberOffice , Staff_table.staffType
	FROM Staff_table;
END getStaff;

/*
* Procedure: updateStaff
* Author: Danny Xie Li
* Description: This procedure update staff in the table Staff_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE updateStaff(pIDPerson IN NUMBER, pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pIdBuilding IN VARCHAR2, pNumberOffice IN VARCHAR2, pStaffType IN VARCHAR2) AS
BEGIN 
	UPDATE Staff_table staf
	SET staf.surname = pSurname,
	staf.firstName = pFirstName,
	staf.title = pTitle,
	staf.address = pAddress,
	staf.phone = pPhone,
	staf.postcode = pPostcode,
	staf.campusLocation = pCampusLocation,
	staf.idBuilding = pIdBuilding,
	staf.numberOffice = pNumberOffice,
	staf.staffType = pStaffType
	WHERE staf.idPerson = pIDPerson;
END updateStaff;

/* PRUEBA DE UPDATE STUDENT*/

CALL updateStaff(2, 'Bilio', 'Gomez', 'Bachillerato', 'San Jose', 89652365, 5632, 'Cartago', 5, 'BDC5', 'Limpieza');

/*
* Procedure: insertTutorStudent
* Author: Danny Xie Li
* Description: This procedure insert tutor student in the table TutorStudent_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE insertTutorStudent(pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
campusLocation IN VARCHAR2, pYear IN NUMBER, pNumberHours IN NUMBER, pRate IN FLOAT) AS
BEGIN
	INSERT INTO TutorStudent_table 
	VALUES(TutorStudent_obj(sequenceTutorStudentID.Nextval, pSurname, pFirstName, pTitle, pAddress, pPhone, pPostcode, campusLocation, 
		pYear, pNumberHours, pRate));
	COMMIT;
END insertTutorStudent;

/* PRUEBA DE INSERT TUTOR STUDENT*/

CALL insertTutorStudent('Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,'Cartago', 2010, 12, 52.52); 
/*
* Procedure: deleteTutorStudent
* Author: Danny Xie Li
* Description: This procedure delete tutor student in the table TutorStudent_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE deleteTutorStudent(pIDPerson IN NUMBER) AS
BEGIN
	DELETE FROM TutorStudent_table 
	WHERE idPerson = pIDPerson;
	COMMIT;
END deleteTutorStudent;

/* PRUEBA DE DELETE TUTOR STUDENT*/

CALL deleteTutorStudent(0);

/*
* Procedure: getTutorStudentUsingSelect
* Author: Danny Xie Li
* Description: This procedure get tutor student in the table TutorStudent_table and have a out parameter as a cursor.
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getTutorStudentUsingSelect
AS
BEGIN
	SELECT *
	FROM TutorStudent_table;
END getTutorStudentUsingSelect;

/*
* Procedure: getTutorStudent
* Author: Danny Xie Li
* Description: This procedure get tutor student in the table TutorStudent_table and have a out parameter as a cursor.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getTutorStudent(cTutorStudent OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cTutorStudent FOR 
	SELECT TutorStudent_table.idPerson, TutorStudent_table.surname, TutorStudent_table.firstName, 
	TutorStudent_table.title, TutorStudent_table.address, TutorStudent_table.phone, TutorStudent_table.postcode,
	TutorStudent_table.campusLocation, TutorStudent_table.year, TutorStudent_table.numberHours, TutorStudent_table.rate
	FROM TutorStudent_table;
END getTutorStudent;

/*
* Procedure: updateTutorStudent
* Author: Danny Xie Li
* Description: This procedure update tutor student in the table TutorStudent_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE updateTutorStudent(pIDPerson IN NUMBER, pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pYear IN NUMBER, pNumberHours IN NUMBER, pRate IN FLOAT) AS
BEGIN 
	UPDATE TutorStudent_table tutorS
	SET tutorS.surname = pSurname,
	tutorS.firstName = pFirstName,
	tutorS.title = pTitle,
	tutorS.address = pAddress,
	tutorS.phone = pPhone,
	tutorS.postcode = pPostcode,
	tutorS.campusLocation = pCampusLocation,
	tutorS.year = pYear,
	tutorS.numberHours = pNumberHours,
	tutorS.rate = pRate
	WHERE tutorS.idPerson = pIDPerson;
END updateTutorStudent;

/* PRUEBA DE UPDATE TUTOR STUDENT*/

CALL updateTutorStudent(2, 'Bilio', 'Gomez', 'Bachillerato', 'San Jose', 89652365, 5632, 'Cartago', 2500, 12, 22.2);

/*
* Procedure: insertTutorStaff
* Author: Danny Xie Li
* Description: This procedure insert tutor student in the table TutorStaff_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE insertTutorStaff(pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pIdBuilding IN VARCHAR2, pNumberOffice IN VARCHAR2,
pStaffType IN VARCHAR2, pNumberHours IN NUMBER, pRate IN FLOAT) AS
BEGIN
	INSERT INTO TutorStaff_table 
	VALUES(TutorStaff_obj(sequenceTutorStaffID.Nextval, pSurname, pFirstName, pTitle, pAddress, pPhone, 
		pPostcode, pCampusLocation, pIdBuilding, pNumberOffice, pStaffType, pNumberHours, pRate));
	COMMIT;
END insertTutorStaff;

/* PRUEBA DE INSERT TUTOR STUDENT*/

CALL insertTutorStaff('Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,'Cartago', 2010, 12, 5.2);
/*
* Procedure: deleteTutorStaff
* Author: Danny Xie Li
* Description: This procedure delete tutor staff in the table TutorStaff_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE deleteTutorStaff(pIDPerson IN NUMBER) AS
BEGIN
	DELETE FROM TutorStaff_table 
	WHERE idPerson = pIDPerson;
	COMMIT;
END deleteTutorStaff;

/* PRUEBA DE DELETE TUTOR STUDENT*/

CALL deleteTutorStaff(0);

/*
* Procedure: getTutorStaffUsingSelect
* Author: Danny Xie Li
* Description: This procedure get tutor student in the table TutorStudent_table.
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getTutorStaffUsingSelect
AS
BEGIN
	SELECT *
	FROM TutorStudent_table;
END getTutorStaffUsingSelect;

/*
* Procedure: getTutorStaff
* Author: Danny Xie Li
* Description: This procedure get tutor staff in the table TutorStaff_table and have a out parameter as a cursor.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getTutorStaff(cTutorStaff OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cTutorStaff FOR 
	SELECT TutorStaff_table.idPerson, TutorStaff_table.surname, TutorStaff_table.firstName, 
	TutorStaff_table.title, TutorStaff_table.address, TutorStaff_table.phone, TutorStaff_table.postcode,
	TutorStaff_table.campusLocation, TutorStaff_table.idBuilding,TutorStaff_table.numberOffice
	TutorStaff_table.staffType, TutorStaff_table.numberHours, TutorStaff_table.rate
	FROM TutorStaff_table;
END getTutorStaff;

/*
* Procedure: updateTutorStaff
* Author: Danny Xie Li
* Description: This procedure update tutor staff in the table TutorStaff_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE updateTutorStaff(pIDPerson IN NUMBER, pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pIdBuilding IN VARCHAR2, pNumberOffice IN VARCHAR2,
pStaffType IN VARCHAR2, pNumberHours IN NUMBER, pRate IN FLOAT) AS
BEGIN 
	UPDATE TutorStaff_table tutorS
	SET tutorS.surname = pSurname,
	tutorS.firstName = pFirstName,
	tutorS.title = pTitle,
	tutorS.address = pAddress,
	tutorS.phone = pPhone,
	tutorS.postcode = pPostcode,
	tutorS.campusLocation = pCampusLocation,
	tutorS.idBuilding = pIdBuilding,
	tutorS.numberOffice = pNumberOffice,
	tutorS.staffType = pStaffType,
	tutorS.numberHours = pNumberHours,
	tutorS.rate = pRate
	WHERE tutorS.idPerson = pIDPerson;
END updateTutorStaff;

/* PRUEBA DE UPDATE TUTOR STUDENT*/

CALL updateTutorStaff(2, 'Bilio', 'Gomez', 'Bachillerato', 'San Jose', 89652365, 5632, 'Cartago', 2500, 12, 222.32);

/*
* Procedure: insertTechnician
* Author: Danny Xie Li
* Description: This procedure insert Technician in the table Technician_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE insertTechnician(pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pIdBuilding IN VARCHAR2, numberOffice IN VARCHAR2, staffType IN VARCHAR2, 
techTitle IN VARCHAR2, techSkill IN VARCHAR2) AS
BEGIN
	INSERT INTO Technician_table 
	VALUES(Technician_obj(sequenceTutorStaffID.Nextval, pSurname, pFirstName, pTitle, pAddress, pPhone, pPostcode, 
		pCampusLocation, pIdBuilding, numberOffice, staffType, techTitle, techSkill));
	COMMIT;
END insertTechnician;

/* PRUEBA DE INSERT TECHNICIAN*/

CALL insertTechnician('Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,'Cartago', 10, 'BCGH6', 'Secretario', 'Master', 'Habilidoso'); 

/*
* Procedure: deleteTechnician
* Author: Danny Xie Li
* Description: This procedure delete Technician in the table Technician_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE deleteTechnician(pIDPerson IN NUMBER) AS
BEGIN
	DELETE FROM Technician_table 
	WHERE idPerson = pIDPerson;
	COMMIT;
END deleteTechnician;

/* PRUEBA DE DELETE TUTOR STUDENT*/

CALL deleteTechnician(0);

/*
* Procedure: getTechinician
* Author: Danny Xie Li
* Description: This procedure get technician in the table Technician_table and have a out parameter as a cursor.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getTechinician(cTechnician OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cTechnician FOR 
	SELECT Technician_table.idPerson, Technician_table.surname, Technician_table.firstName, 
	Technician_table.title, Technician_table.address, Technician_table.phone, Technician_table.postcode,
	Technician_table.campusLocation, Technician_table.idBuilding, Technician_table.numberOffice,
	Technician_table.staffType, Technician_table.techTitle, Technician_table.techSkill
	FROM Technician_table;
END getTechinician;

/*
* Procedure: updateTutorTechinician
* Author: Danny Xie Li
* Description: This procedure update techinician in the table Technician_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE updateTutorTechinician(pIDPerson IN NUMBER, pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pIdBuilding IN VARCHAR2, pNumberOffice IN VARCHAR2, pStaffType IN VARCHAR2, 
pTechTitle IN VARCHAR2, pTechSkill IN VARCHAR2) AS
BEGIN 
	UPDATE Technician_table tech
	SET tech.surname = pSurname,
	tech.firstName = pFirstName,
	tech.title = pTitle,
	tech.address = pAddress,
	tech.phone = pPhone,
	tech.postcode = pPostcode,
	tech.campusLocation = pCampusLocation,
	
	tech.idBuilding = pIdBuilding,
	tech.numberOffice = pNumberOffice,
	tech.staffType = pStaffType,
	tech.techTitle = pTechTitle,
	tech.techSkill = pTechSkill
	WHERE tech.idPerson = pIDPerson;
END updateTutorTechinician;

/* PRUEBA DE UPDATE TUTOR STUDENT*/

CALL updateTutorTechinician(0, 'Juanes', 'Gomez', 'Master', 'Pavas', 12365478, 1452,'Cartago', 10, 'BCGH6', 'Secretario', 'Master', 'Habilidoso'); 

/*
* Procedure: getTechnicianUsingSelect
* Author: Danny Xie Li
* Description: This procedure get Technician in the table Technician_table.
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getTechnicianUsingSelect
AS
BEGIN
	SELECT *
	FROM Technician_table;
END getTechnicianUsingSelect;

/*
* Procedure: insertAssociateLecturer
* Author: Danny Xie Li
* Description: This procedure insert associate Lecturer in the table Technician_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE insertAssociateLecturer(pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pIdBuilding IN VARCHAR2, pNumberOffice IN VARCHAR2, pStaffType IN VARCHAR2,
 pArea IN VARCHAR2, pLecturerType IN VARCHAR2, pNumberHours IN NUMBER, 
pYearJoin IN NUMBER) AS
BEGIN
	INSERT INTO AssociateLecturer_table 
	VALUES(AssociateLecturer_obj(sequenceAssociateLecturerID.Nextval, pSurname, pFirstName, pTitle, pAddress, pPhone, pPostcode, 
		pCampusLocation, pIdBuilding, pNumberOffice, pStaffType, pArea, pLecturerType, pNumberHours, pYearJoin));
	COMMIT;
END insertAssociateLecturer;

/* PRUEBA DE INSERT ASSOCIATE LECTURER*/

CALL insertAssociateLecturer('Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,
'Cartago', 10, 'BCGH6', 'Secretario', 'Ingenieria', 'Asociado', 20, 2010);
/*
* Procedure: deleteAssociateLecturer
* Author: Danny Xie Li
* Description: This procedure delete associate lecturer in the table AssociateLecturer_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE deleteAssociateLecturer(pIDPerson IN NUMBER) AS
BEGIN
	DELETE FROM AssociateLecturer_table 
	WHERE idPerson = pIDPerson;
	COMMIT;
END deleteAssociateLecturer;

/* PRUEBA DE DELETE ASSOCIATE LECTURER*/

CALL deleteAssociateLecturer(0);

/*
* Procedure: getAssociateLecturer
* Author: Danny Xie Li
* Description: This procedure get associate lecturer in the table AssociateLecturer_table and have a out parameter as a cursor.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getAssociateLecturer(cAssociateLecturer OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cAssociateLecturer FOR 
	SELECT AssociateLecturer_table.idPerson, AssociateLecturer_table.surname, AssociateLecturer_table.firstName, 
	AssociateLecturer_table.title, AssociateLecturer_table.address, AssociateLecturer_table.phone, AssociateLecturer_table.postcode,
	AssociateLecturer_table.campusLocation, AssociateLecturer_table.idBuilding, AssociateLecturer_table.numberOffice,
	AssociateLecturer_table.staffType, 
	AssociateLecturer_table.area, AssociateLecturer_table.lectureType,AssociateLecturer_table.numberHonours, AssociateLecturer_table.yearJoin
	FROM AssociateLecturer_table;
END getAssociateLecturer;

/*
* Procedure: getAssociateLecturerUsingSelect
* Author: Danny Xie Li
* Description: This procedure get AssociateLecturer in the table AssociateLecturer_table.
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getAssociateLecturerUsingSelect
AS
BEGIN
	SELECT *
	FROM AssociateLecturer_table;
END getAssociateLecturerUsingSelect;

/*
* Procedure: updateAssociateLecturer
* Author: Danny Xie Li
* Description: This procedure update associate lecturer in the table AssociateLecturer_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE updateAssociateLecturer(pIDPerson IN NUMBER, pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER, pCampusLocation IN VARCHAR2, pIdBuilding IN VARCHAR2,
pNumberOffice IN VARCHAR2, pStaffType IN VARCHAR2, pArea IN VARCHAR2, pLecturerType IN VARCHAR2, pNumberHours IN NUMBER, pYearJoin IN NUMBER) AS
BEGIN 
	UPDATE AssociateLecturer_table lecA
	SET lecA.surname = pSurname,
	lecA.firstName = pFirstName,
	lecA.title = pTitle,
	lecA.address = pAddress,
	lecA.phone = pPhone,
	lecA.postcode = pPostcode,
	lecA.campusLocation = pCampusLocation,
	lecA.idBuilding = pIdBuilding,
	lecA.numberOffice = pNumberOffice,
	lecA.staffType = pStaffType,
	lecA.area = pArea,
	lecA.lectureType = pLecturerType,
	lecA.numberHonours = pNumberHours,
	lecA.yearJoin = pYearJoin
	WHERE lecA.idPerson = pIDPerson;
END updateAssociateLecturer;

/* PRUEBA DE UPDATE ASSOCIATE LECTURER*/

CALL updateAssociateLecturer(0, 'Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,
'Cartago', 10, 'BCGH6', 'Secretario', 'Ingenieria', 'Asociado', 20, 2010);

/*
* Procedure: insertAdmin
* Author: Danny Xie Li
* Description: This procedure insert admi in the table Technician_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE insertAdmin(pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pIdBuilding IN VARCHAR2, pNumberOffice IN VARCHAR2, pStaffType IN VARCHAR2,
pAdminTitle IN VARCHAR2, pComputerSkill IN VARCHAR2, pOfficeSkill IN VARCHAR2) AS
BEGIN
	INSERT INTO Admin_table 
	VALUES(Admin_obj(sequenceAdminID.Nextval, pSurname, pFirstName, pTitle, pAddress, pPhone, pPostcode, 
		pCampusLocation, pIdBuilding, pNumberOffice, pStaffType, pAdminTitle, pComputerSkill, pOfficeSkill));
	COMMIT;
END insertAdmin;

/* PRUEBA DE INSERT ASSOCIATE LECTURER*/

CALL insertAdmin('Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,
'Cartago', 10, 'BCGH6', 'Secretario', 'Administración en libros', 'Python', 'Teclado rápido');
/*
* Procedure: deleteAdmin
* Author: Danny Xie Li
* Description: This procedure delete admin in the table Admin_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE PROCEDURE deleteAdmin(pIDPerson IN NUMBER) AS
BEGIN
	DELETE FROM Admin_table 
	WHERE idPerson = pIDPerson;
	COMMIT;
END deleteAdmin;

/* PRUEBA DE DELETE ADMIN*/

CALL deleteAdmin(0);

/*
* Procedure: getAdmin
* Author: Danny Xie Li
* Description: This procedure get admin in the table Admin_table and have a out parameter as a cursor.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getAdmin(cAdmin OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cAdmin FOR 
	SELECT Admin_table.idPerson, Admin_table.surname, Admin_table.firstName, 
	Admin_table.title, Admin_table.address, Admin_table.phone, Admin_table.postcode,
	Admin_table.campusLocation, 

	Admin_table.idBuilding, Admin_table.numberOffice,
	Admin_table.staffType, 

	Admin_table.admiTitle, Admin_table.computerSkill,Admin_table.officeSkill
	FROM Admin_table;
END getAdmin;

/*
* Procedure: getAdminUsingSelect
* Author: Danny Xie Li
* Description: This procedure get Admin in the table Admin_table.
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE getAdminUsingSelect
AS
BEGIN
	SELECT *
	FROM Admin_table;
END getAdminUsingSelect;

/*
* Procedure: updateAdmin
* Author: Danny Xie Li
* Description: This procedure update admin in the table Admin_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE OR REPLACE PROCEDURE updateAdmin(pIDPerson IN NUMBER, pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER, pCampusLocation IN VARCHAR2, pIdBuilding IN VARCHAR2,
pNumberOffice IN VARCHAR2, pStaffType IN VARCHAR2, pAdmiTitle IN VARCHAR2, pComputerSkill IN VARCHAR2,
pOfficeSkill IN VARCHAR2) AS
BEGIN 
	UPDATE Admin_table admin
	SET admin.surname = pSurname,
	admin.firstName = pFirstName,
	admin.title = pTitle,
	admin.address = pAddress,
	admin.phone = pPhone,
	admin.postcode = pPostcode,
	admin.campusLocation = pCampusLocation,
	admin.idBuilding = pIdBuilding,
	admin.numberOffice = pNumberOffice,
	admin.staffType = pStaffType,

	admin.admiTitle = pAdmiTitle,
	admin.computerSkill = pComputerSkill,
	admin.officeSkill = pOfficeSkill
	WHERE admin.idPerson = pIDPerson;
END updateAdmin;

/* PRUEBA DE UPDATE ADMIN*/

CALL updateAdmin(0, 'Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,
'Cartago', 10, 'BCGH6', 'Secretario', 'Administración en libros', 'Python', 'Teclado rápido');

/*
*-----------
* SEQUENCE
*-----------
*/

/*
* Sequence: sequenceStudentID
* Author: Danny Xie Li
* Description: Sequence student id.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE SEQUENCE sequenceStudentID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE;

/*
* Sequence: sequenceStaffID
* Author: Danny Xie Li
* Description: Sequence staff id.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE SEQUENCE sequenceStaffID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE;

/*
* Sequence: sequenceTutorStudentID
* Author: Danny Xie Li
* Description: Sequence tutor student id.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE SEQUENCE sequenceTutorStudentID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE;

/*
* Sequence: sequenceTutorStaffID
* Author: Danny Xie Li
* Description: Sequence tutor staff id.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE SEQUENCE sequenceTutorStaffID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE;

/*
* Sequence: sequenceTechnicianID
* Author: Danny Xie Li
* Description: Sequence technician id.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE SEQUENCE sequenceTechnicianID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE;

/*
* Sequence: sequenceAssociateLecturerID
* Author: Danny Xie Li
* Description: Sequence associate lecturer id.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE SEQUENCE sequenceAssociateLecturerID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE;

/*
* Sequence: sequenceAdminID
* Author: Danny Xie Li
* Description: Sequence admin id.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Danny Xie Li
*/
CREATE SEQUENCE sequenceAdminID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE;

/*TEST CURSOR*/
/*Procedure: getStudents*/

DECLARE 
  v_cur SYS_REFCURSOR;
  vSurname   VARCHAR2(10);
  vFirstName VARCHAR2(100);
  vTitle VARCHAR2(100);
  vAddress VARCHAR2(100);
  vPhone NUMBER;
  vPost NUMBER;
  vCampus VARCHAR(100);
  vYear NUMBER;
  vId NUMBER;
  
BEGIN
  getStudents(v_cur);
 
  LOOP
    FETCH v_cur INTO vId, vSurname, vFirstName, vTitle, vAddress, vPhone, vPost, vCampus, vYear;
    EXIT WHEN v_cur%NOTFOUND;
    dbms_output.put_line(vId|| ' ' ||vSurname|| ' ' ||vFirstName|| ' ' ||vTitle|| ' ' ||vAddress|| ' ' ||vPhone|| ' ' || vPost|| ' ' || vCampus|| ' ' ||vYear);
  END LOOP;
  CLOSE v_cur;
END;

/*
* Type: Campus
* Author: Esteban Coto Alfaro
* Description: Creates the object Campus
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE OR REPLACE TYPE Campus_obj AS OBJECT ( 
	idCampus NUMBER,
	nameCampus VARCHAR2(100),
	locationCampus VARCHAR2(100),
	address VARCHAR2(100),
	phone NUMBER,
	fax NUMBER,
	head VARCHAR2(100)
)NOT FINAL;

/*
* Table: Campus
* Author: Esteban Coto Alfaro
* Description: Creates the table Campus
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE Campus_table OF Campus_obj (idCampus PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
* Type: Office
* Author: Esteban Coto Alfaro
* Description: Creates the object Office
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE Office_obj AS OBJECT(
	idOffice NUMBER,
	buildingCode VARCHAR2(100),
	officeNumber VARCHAR2(100),
	officePhone NUMBER
)NOT FINAL;

/*
* Table: Office
* Author: Esteban Coto Alfaro
* Description: Creates the table Office
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE Office_table OF Office_obj(PRIMARY KEY (officeNumber));

/*
* Type: Research center unit object
* Author: Esteban Coto Alfaro
* Description: Creates the collection of unit
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE RC_Unit_obj AS OBJECT(
	rc_unit VARCHAR2(100)
)NOT FINAL;

/*
* Table: research center table
* Author: Esteban Coto Alfaro
* Description: Creates the table unit
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE RC_Unit_array AS VARRAY(10) OF RC_Unit_obj;

/*
* Table: Research Center
* Author: Esteban Coto Alfaro
* Description: Creates the table research center
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE Research_Center_obj AS OBJECT(
	idResearchCenter NUMBER,
	name VARCHAR2(100),
	head VARCHAR2(100),
	unit RC_Unit_array
)NOT FINAL;

/*
* Table: Create List of researc center
* Author: Esteban Coto Alfaro
* Description: Creates the table of list research center
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE OR REPLACE TYPE List_RC AS TABLE OF Research_Center_obj;


/*
* Type: Object of schoole profesor
* Author: Esteban Coto Alfaro
* Description: Creates the table of school profesor
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE SchoolProf_obj AS OBJECT(
	schoolProfName VARCHAR2(100),
	schoolProfPhone NUMBER
)NOT FINAL;

/*
* VARRAY: School profesor array
* Author: Esteban Coto Alfaro
* Description: Creates the array of school profesor
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE SchoolProf_array AS VARRAY(10) OF SchoolProf_obj;

/*
* Type: Object school profesor
* Author: Esteban Coto Alfaro
* Description: Creates the object of school profesor
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE School_obj AS OBJECT(
	idSchool NUMBER,
	name VLARCHAR2(100),
	head VARCHAR2(100),
	prof_array SchoolProf_array
)NOT FINAL;

/*
* Table: Table of list of school
* Author: Esteban Coto Alfaro
* Description: Creates the table list of school
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE OR REPLACE TYPE List_School AS TABLE OF School_obj;

/*
* Type: Department profesor object
* Author: Esteban Coto Alfaro
* Description: Creates the object of department profesor
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE DeptProf_obj AS OBJECT(
	deptProfName VARCHAR2(100),
	deptProfPhone NUMBER
)NOT FINAL;

/*
* VARRAY: department profesor array
* Author: Esteban Coto Alfaro
* Description: Creates the array of deparment profesor
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE DeptProf_array AS VARRAY(10) OF DeptProf_obj;

/*
* Type: department object
* Author: Esteban Coto Alfaro
* Description: Creates the department object 
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE Department_obj AS OBJECT(
	idDepartment NUMBER,
	name VARCHAR2(100),
	head VARCHAR2(100),
	prof_array DeptProf_array
)NOT FINAL;

/*
* Table: list of deparments
* Author: Esteban Coto Alfaro
* Description: Creates the table ist of departments
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE OR REPLACE TYPE List_Department AS TABLE OF Department_obj;

/*
* Type: building object
* Author: Esteban Coto Alfaro
* Description: Creates the building object
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE Building_obj AS OBJECT(
	idBuilding NUMBER,
	buildingCode VARCHAR2(100),
	buildingName VARCHAR2(100),
	buildingLocation VARCHAR2(100),
	buildingLevel NUMBER,
	campusLocation VARCHAR2(100),
	idFaculty NUMBER
)NOT FINAL;

/*
* Table: Building_Table
* Author: Esteban Coto Alfaro
* Description: Creates the building table
* Created: 01/05/18
* Last modification: 01/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE Building_table OF Building_obj(PRIMARY KEY (idBuilding));

/*
* Type: Facluty object
* Author: Esteban Coto Alfaro
* Description: Creates the faculty object
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE Faculty_obj AS OBJECT(
	idFaculty NUMBER,
	name VARCHAR2(100),
	dean VARCHAR2(100),
	department_list List_Department,
	school_list List_School,
	rc_list List_RC
)NOT FINAL;

/*
* Table: Faculty table with Department, School and Research center
* Author: Esteban Coto Alfaro
* Description: Creates the table Faculty
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE Faculty_table OF Faculty_obj(PRIMARY KEY (idFaculty))
NESTED TABLE department_list STORE AS Table_Department
NESTED TABLE school_list STORE AS Table_School
NESTED TABLE rc_list STORE AS Table_RC;

/*
* Table: Department
* Author: Esteban Coto Alfaro
* Description: Creates the table Department
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE Department_table OF Department_obj(PRIMARY KEY (idDepartment));

/*
* Table: School
* Author: Esteban Coto Alfaro
* Description: Creates the table School
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE School_table OF School_obj(PRIMARY KEY (idSchool));

/*
* Table: Research Center
* Author: Esteban Coto Alfaro
* Description: Creates the table research center
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE Research_Center_table OF Research_Center_obj(PRIMARY KEY (idResearchCenter));

/*
---------- PROCEDURES ----------
*/

/*
* Procedure: insertCampus
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a campus into the table Campus_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertCampus(pName IN VARCHAR2, pLocation IN VARCHAR2, pAddress IN VARCHAR2,
pPhone IN NUMBER, pFax IN NUMBER, pHead IN VARCHAR2) AS
BEGIN
	INSERT INTO Campus_table 
	VALUES(Campus_obj(seqCampus.Nextval, pName, pLocation, pAddress, pPhone, pFax, pHead));
	COMMIT;
END insertCampus;

CALL insertCampus('Sede Central', 'Albury/Wodonga', 'Parkers Road Wodonga VIC 3690', 61260583700, 6202583700, 'John Hill');

/*
* Procedure: updateCampus
* Author: Esteban Coto Alfaro
* Description: Procedure to update a campus into the table Campus_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateCampus(pID IN NUMBER, pName IN VARCHAR2, pLocation IN VARCHAR2, pAddress IN VARCHAR2,
pPhone IN NUMBER, pFax IN NUMBER, pHead IN VARCHAR2) AS
BEGIN
	UPDATE Campus_table campus
	SET campus.nameCampus = pName,
	campus.locationCampus = pLocation,
	campus.address = pAddress,
	campus.phone = pPhone,
	campus.fax = pFax,
	campus.head = pHead
	WHERE campus.idCampus = pID;
END updateCampus;

CALL updateCampus('Sede Central', 'Sede Cartago','Albury/Wodonga', 'Parkers Road Wodonga VIC 3690', 61260583700, 6202583700, 'John Hill');

/*
* Procedure: deleteCampus
* Author: Esteban Coto Alfaro
* Description: Procedure to delete a campus into the table Campus_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE deleteCampus(pName IN VARCHAR2) AS
BEGIN
	DELETE FROM Campus_table campus
	WHERE campus.nameCampus = pName;
	COMMIT;
END deleteCampus;

/*
* Procedure: insertFaculty
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a faculty into the table Faculty_table
* Created: 01/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertFaculty(pFacultyName IN VARCHAR2, pFacultyDean IN VARCHAR2) AS
BEGIN
	INSERT INTO Faculty_table 
	VALUES(Faculty_obj(seqFaculty.Nextval, pFacultyName, pFacultyDean, 
		List_Department(Department_obj(NULL, NULL, NULL, NULL)),
		List_School(School_obj(NULL, NULL, NULL, NULL)), 
		List_RC(Research_Center_obj(NULL, NULL, NULL, NULL))));
	COMMIT;
END insertFaculty;

/*
* Procedure: updateFaculty
* Author: Esteban Coto Alfaro
* Description: Procedure to update a faculty into the table Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateFaculty(pFacultyID IN NUMBER, pName IN VARCHAR2, pDean IN VARCHAR2) AS
BEGIN
	UPDATE Faculty_table faculty
	SET faculty.name = pName,
	faculty.dean = pDean
	WHERE faculty.idFaculty = pFacultyID;
END updateFaculty;

/*
* Procedure: deleteFaculty
* Author: Esteban Coto Alfaro
* Description: Procedure to delete a faculty into the table Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE deleteFaculty(pName IN VARCHAR2) AS
BEGIN
	DELETE FROM Faculty_table faculty
	WHERE faculty.name = pName;
	COMMIT;
END deleteFaculty;

/*
* Procedure: insertDepartment
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a Department into the table List_Department as a nesed table of Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertDepartment(pFaculty IN VARCHAR2, pName IN VARCHAR2, pHead IN VARCHAR2, pDeptProf DeptProf_array) AS
BEGIN
	INSERT INTO
	TABLE(SELECT faculty_table.department_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	VALUES(seqDepartment.Nextval, pName, pHead, pDeptProf);
	COMMIT;
END insertDepartment;

/*
* Procedure: updateDepartment
* Author: Esteban Coto Alfaro
* Description: Procedure to update a Department into the table List_Department as a nesed table of Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateDepartment(pFaculty IN VARCHAR2, pDeptID IN NUMBER, pName IN VARCHAR2, pHead IN VARCHAR2) AS
BEGIN
	UPDATE
	TABLE(SELECT faculty_table.department_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	SET name = pName,
	head = pHead
	WHERE idDepartment = pDeptID;
	COMMIT;
END updateDepartment;

/*
* Procedure: deleteDepartment
* Author: Esteban Coto Alfaro
* Description: Procedure to delete a Department into the table List_Department as a nesed table of Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE deleteDepartment(pFaculty IN VARCHAR2, pName IN VARCHAR2) AS
BEGIN
	DELETE
	TABLE(SELECT faculty_table.department_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	WHERE name = pName;
	COMMIT;
END deleteDepartment;

/*
* Procedure: insertSchool
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a School into the table List_School as a nesed table of Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertSchool(pFaculty IN VARCHAR2, pName IN VARCHAR2, pHead IN VARCHAR2, pSchoolProf SchoolProf_array) AS
BEGIN
	INSERT INTO
	TABLE(SELECT faculty_table.school_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	VALUES(seqSchool.Nextval, pName, pHead, pSchoolProf);
	COMMIT;
END insertSchool;

CALL insertSchool('Medicina', 'Pediatria', 'Adrian Gonzales', SchoolProf_array(SchoolProf_obj('Ana Blanco', 12345), SchoolProf_obj('Juan Perez', 54321)));

/*
* Procedure: updateSchool
* Author: Esteban Coto Alfaro
* Description: Procedure to update a School into the table List_School as a nesed table of Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateSchool(pFaculty IN VARCHAR2, pSchoolID IN NUMBER, pName IN VARCHAR2, pHead IN VARCHAR2) AS
BEGIN
	UPDATE
	TABLE(SELECT faculty_table.school_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	SET name = pName,
	head = pHead
	WHERE idSchool = pSchoolID;
	COMMIT;
END updateSchool;

/*
* Procedure: deleteSchool
* Author: Esteban Coto Alfaro
* Description: Procedure to delete a School into the table List_School as a nesed table of Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE deleteSchool(pFaculty IN VARCHAR2, pName IN VARCHAR2) AS
BEGIN
	DELETE
	TABLE(SELECT faculty_table.school_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	WHERE name = pName;
	COMMIT;
END deleteSchool;

/*
* Procedure: insertRC
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a Research Center into the table List_RC as a nesed table of Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertRC(pFaculty IN VARCHAR2, pName IN VARCHAR2, pHead IN VARCHAR2, pUnit RC_Unit_array) AS
BEGIN
	INSERT INTO
	TABLE(SELECT faculty_table.rc_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	VALUES(seqResearchCenter.Nextval, pName, pHead, pUnit);
	COMMIT;
END insertRC;

/*
* Procedure: updateRC
* Author: Esteban Coto Alfaro
* Description: Procedure to update a Research Center into the table List_RC as a nesed table of Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateRC(pFaculty IN VARCHAR2, pRCID IN NUMBER, pName IN VARCHAR2, pHead IN VARCHAR2) AS
BEGIN
	UPDATE
	TABLE(SELECT faculty_table.rc_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	SET name = pName,
	head = pHead
	WHERE idResearchCenter = pRCID;
	COMMIT;
END updateRC;

/*
* Procedure: deleteRC
* Author: Esteban Coto Alfaro
* Description: Procedure to delete a Research Center into the table List_RC as a nesed table of Faculty_table
* Created: 04/05/18
* Last modification: 04/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE deleteRC(pFaculty IN VARCHAR2, pName IN VARCHAR2) AS
BEGIN
	DELETE
	TABLE(SELECT faculty_table.rc_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	WHERE name = pName;
	COMMIT;
END deleteRC;
/*
---------- SEQUENCES ----------
*/

/*
* Sequence: seqCampus
* Author: Esteban Coto Alfaro
* Description: Sequence to have control of the campus id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE SEQUENCE seqCampus
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqFaculty
* Author: Esteban Coto Alfaro
* Description: Sequence to have control of the faculty id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE SEQUENCE seqFaculty
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqSchool
* Author: Esteban Coto Alfaro
* Description: Sequence to have control of the school id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE SEQUENCE seqSchool
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqDepartment
* Author: Esteban Coto Alfaro
* Description: Sequence to have control of the department id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE SEQUENCE seqDepartment
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqResearchCenter
* Author: Esteban Coto Alfaro
* Description: Sequence to have control of the researchCenter id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE SEQUENCE seqResearchCenter
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqBuilding
* Author: Esteban Coto Alfaro
* Description: Sequence to have control of the building id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE SEQUENCE seqBuilding
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqOffice
* Author: Esteban Coto Alfaro
* Description: Sequence to have control of the office id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE SEQUENCE seqOffice
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
---------- CONSULTAS ----------
*/
/*
* Consulta: Department, School and Research Center Information
* Author: Esteban Coto Alfaro
* Description: Insormation of every Department, School and Research Center of a Faculty
* Created: 05/05/18
* Last modification: 05/05/18
* Last modification by: Esteban Coto Alfaro
*/
SELECT faculty.name, dept.*, school.*, rc.*
FROM faculty_table faculty, TABLE(faculty.department_list) dept,
TABLE(faculty.school_list) school, TABLE(faculty.rc_list) rc;

/*
* Consulta: Mostrar los ocupantes de las oficinas
* Author: Esteban Coto Alfaro
* Description: Information of every Office and the staff
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Esteban Coto Alfaro
*/
SELECT o.*, s.* FROM Office_table o, Staff_table s
WHERE o.officeNumber = s.numberOffice;

insert into faculty_table
VALUES(0, 'fac', 'dean', List_Department(
Department_obj(0, 'dept1', 'head', DeptProf_array(DeptProf_obj('Nombre1', 12345), DeptProf_obj('Nombre2', 54321))), 
Department_obj(1, 'dept2', 'head2', DeptProf_array(DeptProf_obj('Nombre3', 12345), DeptProf_obj('Nombre4', 54321))) ), List_School(
School_obj(0, 'school1', 'Schoolhead', SchoolProf_array(SchoolProf_obj('Nombre1', 12345), SchoolProf_obj('Nombre2', 54321))), 
School_obj(1, 'school2', 'head2', SchoolProf_array(SchoolProf_obj('Nombre3', 12345), SchoolProf_obj('Nombre4', 54321))) ), List_RC(
Research_Center_obj(0, 'rc1', 'head1', RC_Unit_array(RC_Unit_obj('unit1'),RC_Unit_obj('unit2'))), 
Research_Center_obj(1, 'rc2', 'head2', RC_Unit_array(RC_Unit_obj('unit3'),RC_Unit_obj('unit4'))))
);




/*
* Type: building object
* Author: Esteban Coto Alfaro
* Description: Creates the building object
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE Building_obj AS OBJECT(
	idBuilding NUMBER,
	buildingCode VARCHAR2(100),
	buildingName VARCHAR2(100),
	buildingLocation VARCHAR2(100),
	buildingLevel NUMBER,
	campusLocation VARCHAR2(100),
	idFaculty NUMBER
)NOT FINAL;

/*
* Table: Building_Table
* Author: Esteban Coto Alfaro
* Description: Creates the building table
* Created: 01/05/18
* Last modification: 01/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE Building_table OF Building_obj(
	PRIMARY KEY (idBuilding),
	CONSTRAINT fk_faculty_building
		FOREIGN KEY (idFaculty)
		REFERENCES Faculty_table(idFaculty)
		ON DELETE CASCADE
);

/*
* Type: Building_cluster
* Author: Johan Torres Creed
* Description: Cluster for all building departments, run after creating Building
* Created: 02/05/18
* Last modification: 02/05/18
* Last modification by: Johan Torres Creed
*/
CREATE CLUSTER Building_cluster (buildingCode VARCHAR2(100)) SIZE 512;

/*
* Type: idx_building_cluster
* Author: Johan Torres Creed
* Description: Needed for the indexed cluster, run after Building_cluster
* Created: 02/05/18
* Last modification: 02/05/18
* Last modification by: Johan Torres Creed
*/
CREATE INDEX idx_building_cluster ON CLUSTER Building_cluster;

/*
* Type: Office
* Author: Esteban Coto Alfaro
* Description: Creates the object Office
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TYPE Office_obj AS OBJECT(
	idOffice NUMBER,
	buildingCode VARCHAR2(100),
	officeNumber VARCHAR2(100),
	officePhone NUMBER
)NOT FINAL;

/*
* Table: Office
* Author: Esteban Coto Alfaro
* Description: Creates the table Office
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE Office_table OF Office_obj(PRIMARY KEY (officeNumber))
	CLUSTER Building_cluster (buildingCode);

/*
* Type: Classroom
* Author: Johan Torres Creed
* Description: This is the object Classroom, that conteins the follow atributes
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Johan Torres Creed
*/
CREATE TYPE Classroom_obj AS OBJECT (
	idClassroom NUMBER,
	buildingCode VARCHAR2(100),
	classNumber VARCHAR2(100),
	classCapacity NUMBER
)NOT FINAL;

/*
* Table: Classroom_table
* Author: Johan Torres Creed
* Description: This is the table Classroom, that conteins Classroom_obj and the primary key is from the building id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE TABLE Classroom_table OF Classroom_obj (PRIMARY KEY(classNumber))
	CLUSTER Building_cluster (buildingCode);

/*
* Type: Lab
* Author: Johan Torres Creed
* Description: This is the object Lab, that conteins the follow atributes
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Johan Torres Creed
*/

/* Equipment_list: Needed since labEquipment requires Collection values*/

CREATE TYPE Equipment_list AS VARRAY(20) OF VARCHAR2(50);

CREATE TYPE Lab_obj AS OBJECT (
	idLab NUMBER,
	buildingCode VARCHAR2(100),
	labNumber VARCHAR2(100),
	labCapacity NUMBER,
	labEquipment Equipment_list
)NOT FINAL;


/*
* Table: Lab_table
* Author: Johan Torres Creed
* Description: This is the table Lab, that conteins Lab_obj and the primary key is from the building id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE TABLE Lab_table OF Lab_obj (PRIMARY KEY(labNumber))
	CLUSTER Building_cluster (buildingCode);

/*
* Type: Degree
* Author: Johan Torres Creed
* Description: This is the object Degree, that conteins the follow atributes
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Johan Torres Creed
*/
CREATE TYPE Degree_obj AS OBJECT (
	idDegree NUMBER,
	degreeCode VARCHAR2(100),
	degreeName VARCHAR2(100),
	length NUMBER,
	degreePrerequisites VARCHAR2(100),
	idFaculty NUMBER
)NOT FINAL;

/*
* Table: Degree_table
* Author: Johan Torres Creed
* Description: This is the table Degree, that conteins Degree_obj and the primary key is from the degree id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE TABLE Degree_table OF Degree_obj (
	PRIMARY KEY(idDegree),
	CONSTRAINT fk_faculty_degree
		FOREIGN KEY (idFaculty) 
		REFERENCES Faculty_table(idFaculty)
		ON DELETE CASCADE
);

/*
* Type: EnrollsIn_obj
* Author: Johan Torres Creed
* Description: This is the object EnrollsIn: association between Student and Degree
* Created: 26/04/18
* Last modification: 04/05/18
* Last modification by: Johan Torres Creed
*/
CREATE TYPE EnrollsIn_obj AS OBJECT (
	idEnroll NUMBER,
	studentN REF Student_obj,
	degreeN REF Degree_obj
)NOT FINAL;

/*
* Type: EnrollsIn_table
* Author: Johan Torres Creed
* Description: Table for EnrollsIn
* Created: 02/05/18
* Last modification: 04/05/18
* Last modification by: Johan Torres Creed
*/
CREATE TABLE EnrollsIn_table OF EnrollsIn_obj (
	PRIMARY KEY (idEnroll),
	SCOPE FOR (studentN) IS Student_table,
	SCOPE FOR (degreeN) IS Degree_table
);

/*
* Type: Takes_obj
* Author: Johan Torres Creed
* Description: This is the object Takes: association between Student and Subject
* Created: 26/04/18
* Last modification: 04/05/18
* Last modification by: Johan Torres Creed
*/
CREATE TYPE Takes_obj AS OBJECT (
	idTakes NUMBER,
	studentN REF Student_obj,
	subjectN REF Subject_obj,
	marks NUMBER
)NOT FINAL;

/*
* Type: Takes_table
* Author: Johan Torres Creed
* Description: Table for Takes
* Created: 02/05/18
* Last modification: 04/05/18
* Last modification by: Johan Torres Creed
*/
CREATE TABLE Takes_table OF Takes_obj (
	PRIMARY KEY (idTakes),
	SCOPE FOR (studentN) IS Student_table,
	SCOPE FOR (subjectN) IS Subject_table
);

/*
* Type: Subject
* Author: Johan Torres Creed
* Description: This is the object Subject, that conteins the follow atributes
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Johan Torres Creed
*/
CREATE TYPE Subject_obj AS OBJECT (
	idSubject NUMBER,
	subjectName VARCHAR2(100),
	credit NUMBER,
	subjectPrerequisites VARCHAR2(100),
	idPerson NUMBER
)NOT FINAL;

/*
* Table: Subject_table
* Author: Johan Torres Creed
* Description: This is the table Subject, that conteins Subject_obj and the primary key is from the subject id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE TABLE Subject_table OF Subject_obj (
	PRIMARY KEY (idSubject),
	CONSTRAINT fk_student_subject
		FOREIGN KEY (idPerson)
		REFERENCES Student_table(idPerson)
		ON DELETE CASCADE
);

/*
* Type: SeniorLecturer
* Author: Johan Torres Creed
* Description: Object SeniorLecturer, is an herence from Lecturer
* Created: 30/04/18
* Last modification: 30/04/18
* Last modification by: Johan Torres Creed
*/
CREATE TYPE SeniorLecturer_obj UNDER Lecturer_obj ( 
	numberPhd NUMBER NULL,
	numberMaster NUMBER NULL,
	numberHonours NUMBER NULL
)NOT FINAL;

/*
* Table: SeniorLecturer 
* Author: Johan Torres Creed
* Description: Table for Senior Lecturer, uses the primary key from person id.
* Created: 30/04/18
* Last modification: 30/04/18
* Last modification by: Johan Torres Creed
*/
CREATE TABLE SeniorLecturer_table OF SeniorLecturer_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
*-------------
*  PROCEDURES
*-------------
*/

/*
* Procedure: insertBuilding
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a building into the table Building_table
* Created: 01/05/18
* Last modification: 01/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertBuilding(pBuildingCode IN VARCHAR2, pBuildingName IN VARCHAR2,
pBuildingLocation IN VARCHAR2, pBuildingLevel IN NUMBER, pCampusLocation IN VARCHAR2,
pFacultyID IN NUMBER) AS
BEGIN
	INSERT INTO Building_table 
	VALUES(Building_obj(seqBuilding.Nextval, pBuildingCode, pBuildingName, pBuildingLocation, pBuildingLevel, pCampusLocation, pFacultyID));
	COMMIT;
END insertBuilding;

/*
* Procedure: getBuildingUsingSelect
* Author: Johan Torres Creed
* Description: This procedure get a building in the table Building_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getBuildingUsingSelect AS
BEGIN
	SELECT *
	FROM Building_table;
END getBuildingUsingSelect;

/*
* Procedure: updateBuilding
* Author: Esteban Coto Alfaro
* Description: Procedure to update a building into the table Building_table
* Created: 01/05/18
* Last modification: 01/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateBuilding(pOldCode IN VARCHAR2, pNewCode IN VARCHAR2, pBuildingName IN VARCHAR2,
	pBuildingLocation IN VARCHAR2, pBuildingLevel IN VARCHAR2, pCampusLocation IN VARCHAR2, pFacultyID IN NUMBER) AS
BEGIN
	UPDATE Building_table building
	SET building.buildingCode = pNewCode,
	building.buildingName = pBuildingName,
	building.buildingLocation = pBuildingLocation,
	building.buildingLevel = pBuildingLevel,
	building.campusLocation = pCampusLocation,
	building.idFaculty = pFacultyID
	WHERE building.buildingCode = pOldCode;
END updateBuilding;

/*
* Procedure: deleteBuilding
* Author: Esteban Coto Alfaro
* Description: Procedure to delete a Building into the table Building_table
* Created: 01/05/18
* Last modification: 01/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE deleteBuilding(pBuildingCode IN VARCHAR2) AS
BEGIN
	DELETE FROM Building_table building
	WHERE building.buildingCode = pBuildingCode;
	COMMIT;
END deleteBuilding;

/*
* Procedure: insertOffice
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a office into the table Office_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertOffice(pBuildingCode IN VARCHAR2, pOfficeNum IN VARCHAR2,
pOfficePhone IN NUMBER) AS
BEGIN
	INSERT INTO Office_table 
	VALUES(Office_obj(seqOffice.Nextval, pBuildingCode, pOfficeNum, pOfficePhone));
	COMMIT;
END insertOffice;

/*
* Procedure: getOfficeUsingSelect
* Author: Johan Torres Creed
* Description: This procedure gets offices in the table Office_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getOfficeUsingSelect AS
BEGIN
	SELECT *
	FROM Office_table;
END getOfficeUsingSelect;

/*
* Procedure: updateOffice
* Author: Esteban Coto Alfaro
* Description: Procedure to update a office into the table Office_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateOffice(pOldNum IN VARCHAR2, pBuildingCode IN VARCHAR2, 
	pNewNum IN VARCHAR2, pOfficePhone IN NUMBER) AS
BEGIN
	UPDATE Office_table office
	SET office.buildingCode = pBuildingCode,
	office.officeNumber = pNewNum,
	office.officePhone = pOfficePhone
	WHERE office.officeNumber = pOldNum;
END updateOffice;

/*
* Procedure: deleteOffice
* Author: Esteban Coto Alfaro
* Description: Procedure to delete a office into the table Office_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE deleteOffice(pOfficeNum IN VARCHAR2) AS
BEGIN
	DELETE FROM Office_table office
	WHERE office.officeNumber = pOfficeNum;
	COMMIT;
END deleteOffice;

/*
* Procedure: insertClassroom
* Author: Johan Torres Creed
* Description: This procedure inserts a classroom in the table Subject_table.
* Created: 28/04/18
* Last modification: 04/05/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertClassroom(pBuildingCode IN VARCHAR2, pClassNumber IN VARCHAR2, pClassCapacity IN NUMBER) AS
BEGIN
	INSERT INTO Classroom_table
	VALUES(Classroom_obj(seqClassroom.Nextval, pBuildingCode, pClassNumber, pClassCapacity));
	COMMIT;
END insertClassroom; 

/*
* Procedure: getClassroomUsingSelect
* Author: Johan Torres Creed
* Description: This procedure get a classroom in the table Classroom_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getClassroomUsingSelect AS
BEGIN
	SELECT *
	FROM Classroom_table;
END getClassroomUsingSelect;

/*
* Procedure: updateClassroom
* Author: Johan Torres Creed
* Description: This procedure updates a classroom in the table Classroom_table.
* Created: 28/04/18
* Last modification: 04/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE updateClassroom(pOldNum IN VARCHAR2, pBuildingCode IN VARCHAR2, 
	pNewNum IN VARCHAR2, pClassCapacity IN NUMBER) AS
BEGIN 
	UPDATE Classroom_table clsr
	SET clsr.buildingCode = pBuildingCode,
	clsr.classNumber = pNewNum,
	clsr.classCapacity = pClassCapacity
	WHERE clsr.classNumber = pOldNum;
END updateClassroom;

/*
* Procedure: deleteClassroom
* Author: Johan Torres Creed
* Description: This procedure delete a classroom in the table Classroom_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE deleteClassroom(pClassNumber IN VARCHAR2) AS
BEGIN
	DELETE FROM Classroom_table clsr 
	WHERE clsr.classNumber = pClassNumber;
	COMMIT;
END deleteClassroom;

/*
* Procedure: insertLab
* Author: Johan Torres Creed
* Description: This procedure inserts a lab in the table Lab_table.
* Created: 28/04/18
* Last modification: 05/05/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertLab(pBuildingCode IN VARCHAR2, pLabNumber IN VARCHAR2, 
	pLabCapacity IN NUMBER, pLabEquipment in Equipment_list) AS
BEGIN
	INSERT INTO Lab_table
	VALUES(Lab_obj(seqLab.Nextval, pBuildingCode, pLabNumber, pLabCapacity, pLabEquipment));
	COMMIT;
END insertLab;

/*
* Procedure: getLabUsingSelect
* Author: Johan Torres Creed
* Description: This procedure get a lab in the table Lab_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getLabUsingSelect AS
BEGIN
	SELECT *
	FROM Lab_table;
END getLabUsingSelect;

/*
* Procedure: updateLab
* Author: Johan Torres Creed
* Description: This procedure updates a lab in the table Lab_table.
* Created: 28/04/18
* Last modification: 05/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE updateLab(pOldNum IN VARCHAR2, pBuildingCode IN VARCHAR, pNewNum IN VARCHAR2, 
	pLabCapacity IN NUMBER, pLabEquipment IN Equipment_list) AS
BEGIN 
	UPDATE Lab_table lab
	SET lab.buildingCode = pBuildingCode,
	lab.labNumber = pNewNum,
	lab.labCapacity = pLabCapacity,
	lab.labEquipment = pLabEquipment
	WHERE lab.labNumber = pOldNum;
END updateLab;

/*
* Procedure: deleteLab
* Author: Johan Torres Creed
* Description: This procedure delete a lab in the table Lab_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE deleteLab(pLabNumber IN VARCHAR2) AS
BEGIN
	DELETE FROM Lab_table 
	WHERE labNumber = pLabNumber;
	COMMIT;
END deleteLab;

/*
* Procedure: insertDegree
* Author: Johan Torres Creed
* Description: This procedure inserts a degree in the table Degree_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertDegree(pDegreeCode IN VARCHAR2, pDegreeName IN VARCHAR2, pLength IN NUMBER,
pDegreePrerequisites IN VARCHAR2, pIDFaculty IN NUMBER) AS
BEGIN
	INSERT INTO Degree_table
	VALUES(Degree_obj(seqDegree.Nextval, pDegreeCode, pDegreeName, pLength, pDegreePrerequisites, pIDFaculty));
	COMMIT;
END insertDegree;

/*
* Procedure: getDegreeUsingSelect
* Author: Johan Torres Creed
* Description: This procedure gets degree in the table Degree_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getDegreeUsingSelect AS
BEGIN
	SELECT *
	FROM Degree_table;
END getDegreeUsingSelect;

/*
* Procedure: updateDegree
* Author: Johan Torres Creed
* Description: This procedure updates a degree in the table Degree_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE updateDegree(pIDDegree IN NUMBER, pDegreeCode IN VARCHAR2, pDegreeName IN VARCHAR2,
pLength IN NUMBER, pDegreePrerequisites IN VARCHAR2, pIDFaculty IN NUMBER) AS
BEGIN 
	UPDATE Degree_table deg
	SET deg.degreeCode = pDegreeCode,
	deg.degreeName = pDegreeName,
	deg.length = pLength,
	deg.degreePrerequisites = pDegreePrerequisites,
	deg.idFaculty = pIDFaculty
	WHERE deg.idDegree = pIDDegree;
END updateDegree;

/*
* Procedure: deleteDegree
* Author: Johan Torres Creed
* Description: This procedure delete a degree in the table Degree_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE deleteDegree(pIDDegree IN NUMBER) AS
BEGIN
	DELETE FROM Degree_table 
	WHERE idDegree = pIDDegree;
	COMMIT;
END deleteDegree;

/*
* Procedure: insertEnrollsIn
* Author: Johan Torres Creed
* Description: Enrolls a student and inserts in EnrollsIn Table.
* Created: 28/04/18
* Last modification: 05/05/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertEnrollsIn(pStudent IN NUMBER, pDegree IN VARCHAR2) AS
BEGIN
	INSERT INTO EnrollsIn_table
	SELECT seqEnroll.Nextval, REF(std), REF(deg)
	FROM Student_table std, Degree_table deg
	WHERE std.idPerson = pStudent AND deg.degreeCode = pDegree;
	COMMIT;
END insertEnrollsIn;

/*
* Procedure: getEnrollUsingSelect
* Author: Johan Torres Creed
* Description: This procedure gets enroll in the table EnrollsIn_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getEnrollUsingSelect AS
BEGIN
	SELECT *
	FROM EnrollsIn_table;
END getEnrollUsingSelect;

/*
* Procedure: deleteEnrollsIn
* Author: Johan Torres Creed
* Description: Deletes the student's information in EnrollsIn.
* Created: 28/04/18
* Last modification: 05/05/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE deleteEnrollsIn(pStudent IN REF Student_obj) AS
BEGIN
	DELETE FROM EnrollsIn_table
	WHERE studentN = pStudent;
	COMMIT;
END deleteEnrollsIn;

/*
* Procedure: insertTakes
* Author: Johan Torres Creed
* Description: This procedure inserts a take in the table Takes_table.
* Created: 28/04/18
* Last modification: 05/05/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertTakes(pStudent IN NUMBER, pSubject IN NUMBER, pMarks IN NUMBER) AS
BEGIN
	INSERT INTO Takes_table
	SELECT seqTakes.Nextval, REF(std), REF(subj), pMarks
	FROM Student_table std, Subject_table subj
	WHERE std.idPerson = pStudent AND subj.idSubject = pSubject;
	COMMIT;
END insertTakes;

/*
* Procedure: getTakesUsingSelect
* Author: Johan Torres Creed
* Description: This procedure gets takes in the table Takes_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getTakesUsingSelect AS
BEGIN
	SELECT *
	FROM Takes_table;
END getTakesUsingSelect;

/*
* Procedure: updateTakes
* Author: Johan Torres Creed
* Description: This procedure updates a take in the table Takes_table.
* Created: 28/04/18
* Last modification: 03/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE updateTakes(pStudent IN NUMBER, pSubject IN NUMBER, pMarks IN NUMBER) AS
BEGIN 
	UPDATE Takes_table tks
	SET tks.marks = pMarks
	WHERE tks.idStudent = (SELECT REF(pStd) FROM Student_table pStd WHERE pStd.idPerson = pStudent)
		AND tks.idSubject = (SELECT REF(pSubj) FROM Subject_table pSubj WHERE pStbj.idSubject = pSubject);
END updateTakes;

/*
* Procedure: deleteTakes
* Author: Johan Torres Creed
* Description: This procedure delete a take in the table Takes_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE deleteTakes(pStudent IN REF Student_obj) AS
BEGIN
	DELETE FROM Takes_table 
	WHERE studentN = pStudent;
	COMMIT;
END deleteTakes;

/*
* Procedure: insertSubject
* Author: Johan Torres Creed
* Description: This procedure inserts a subject in the table Subject_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertSubject(pSubjectName IN VARCHAR2, pCredit IN NUMBER,
pSubjectPrerequisites IN VARCHAR2, pIDPerson IN NUMBER) AS
BEGIN
	INSERT INTO Subject_table
	VALUES(Subject_obj(sequenceSubjectID.Nextval, pSubjectName, pCredit, pSubjectPrerequisites, pIDPerson));
	COMMIT;
END insertSubject;

/*
* Procedure: getSubjectUsingSelect
* Author: Johan Torres Creed
* Description: This procedure gets subject in the table Subject_table.
* Created: 28/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getSubjectUsingSelect AS
BEGIN
	SELECT *
	FROM Subject_table;
END getSubjectUsingSelect;

/*
* Procedure: updateSubject
* Author: Johan Torres Creed
* Description: This procedure updates a subject in the table Subject_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE updateSubject(pIDSubject IN NUMBER, pSubjectName IN VARCHAR2,
pCredit IN NUMBER, pSubjectPrerequisites IN VARCHAR2, pIDPerson IN NUMBER) AS
BEGIN 
	UPDATE Subject_table subj
	SET subj.subjectName = pSubjectName,
	subj.credit = pCredit,
	subj.subjectPrerequisites = pSubjectPrerequisites,
	subj.idPerson = pIDPerson
	WHERE subj.idSubject = pIDSubject;
END updateSubject;

/*
* Procedure: deleteSubject
* Author: Johan Torres Creed
* Description: This procedure delete a subject in the table Subject_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE deleteSubject(pIDSubject IN NUMBER) AS
BEGIN
	DELETE FROM Subject_table 
	WHERE idSubject = pIDSubject;
	COMMIT;
END deleteSubject;

/*
* Procedure: insertSeniorLecturer
* Author: Johan Torres Creed
* Description: This procedure inserts a senior Lecturer in the table SeniorLecturer_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertSeniorLecturer(pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
pCampusLocation IN VARCHAR2, pIdBuilding IN NUMBER, pNumberOffice IN VARCHAR2, pStaffType IN VARCHAR2,
 pArea IN VARCHAR2, pLecturerType IN VARCHAR2, pNumberPhd IN NUMBER, 
pNumberMaster IN NUMBER, pNumberHonours IN NUMBER) AS
BEGIN
	INSERT INTO SeniorLecturer_table 
	VALUES(SeniorLecturer_obj(sequenceSeniorLecturerID.Nextval, pSurname, pFirstName, pTitle, pAddress, pPhone, pPostcode, 
		pCampusLocation, pIdBuilding, pNumberOffice, pStaffType, pArea, pLecturerType, pNumberPhd, pNumberMaster, pNumberHonours));
	COMMIT;
END insertSeniorLecturer;

/*
* Procedure: getSeniorLecturerUsingSelect
* Author: Johan Torres Creed
* Description: This procedure gets senior lecturer in the table SeniorLecturer_table.
* Created: 26/04/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getSeniorLecturerUsingSelect AS
BEGIN
	SELECT *
	FROM SeniorLecturer_table;
END getSeniorLecturerUsingSelect;

/*
* Procedure: updateSeniorLecturer
* Author: Johan Torres Creed
* Description: This procedure updates a senior lecturer in the table SeniorLecturer_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE updateSeniorLecturer(pIDPerson IN NUMBER, pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER, pCampusLocation IN VARCHAR2, pIdBuilding IN NUMBER,
pNumberOffice IN VARCHAR2, pStaffType IN VARCHAR2, pArea IN VARCHAR2, pLecturerType IN VARCHAR2, pNumberPhd IN NUMBER, pNumberMaster IN NUMBER,
pNumberHonours IN NUMBER) AS
BEGIN 
	UPDATE SeniorLecturer_table lecS
	SET lecS.surname = pSurname,
	lecS.firstName = pFirstName,
	lecS.title = pTitle,
	lecS.address = pAddress,
	lecS.phone = pPhone,
	lecS.postcode = pPostcode,
	lecS.campusLocation = pCampusLocation,
	lecS.idBuilding = pIdBuilding,
	lecS.numberOffice = pNumberOffice,
	lecS.staffType = pStaffType,
	lecS.area = pArea,
	lecS.lectureType = pLecturerType,
	lecS.numberPhd = pNumberPhd,
	lecS.numberMaster = pNumberMaster,
	lecS.numberHonours = pNumberHonours
	WHERE lecS.idPerson = pIDPerson;
END updateSeniorLecturer;

/*
* Procedure: deleteSeniorLecturer
* Author: Johan Torres Creed
* Description: This procedure deletes a senior lecturer in the table SeniorLecturer_table.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE deleteSeniorLecturer(pIDPerson IN NUMBER) AS
BEGIN
	DELETE FROM SeniorLecturer_table 
	WHERE idPerson = pIDPerson;
	COMMIT;
END deleteSeniorLecturer;

/*
*-----------
* SEQUENCE
*-----------
*/

/*
* Sequence: seqBuilding
* Author: Esteban Coto Alfaro
* Description: Sequence to have control of the building id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE SEQUENCE seqBuilding
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqOffice
* Author: Esteban Coto Alfaro
* Description: Sequence to have control of the office id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE SEQUENCE seqOffice
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqClassroom
* Author: Johan Torres Creed
* Description: Sequence to have control of the classroom id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE SEQUENCE seqClassroom
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqLab
* Author: Johan Torres Creed
* Description: Sequence to have control of the Lab id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE SEQUENCE seqLab
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqDegree
* Author: Johan Torres Creed
* Description: Sequence degree id.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE SEQUENCE seqDegree
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqEnroll
* Author: Johan Torres Creed
* Description: Sequence to have control of the EnrollIn id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE SEQUENCE seqEnroll
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: seqTakes
* Author: Johan Torres Creed
* Description: Sequence to have control of the Takes id
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE SEQUENCE seqTakes
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

/*
* Sequence: sequenceSubjectID
* Author: Johan Torres Creed
* Description: Sequence subject id.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE SEQUENCE sequenceSubjectID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE

/*
* Sequence: sequenceSeniorLecturerID
* Author: Johan Torres Creed
* Description: Sequence Senior lecturer id.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE SEQUENCE sequenceSeniorLecturerID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE

 /*
----------------- CONSULTAS ---------------------
 */

/*
* Query: Building details
* Author: Johan Torres Creed
* Description: Insert building details into a temp Building_Details table.
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/

CREATE TABLE Building_Details (
	bldCode VARCHAR2(100),
	bldName VARCHAR2(100),
	bldLocation VARCHAR2(100),
	bldLevel NUMBER,
	campusLoc VARCHAR2(100),
	facultyID NUMBER,
	officeCant NUMBER,
	classroomCant NUMBER,
	labCant NUMBER
)

INSERT INTO Building_Details
SELECT building.buildingCode, building.buildingName, building.buildingLocation, building.buildingLevel,
	building.campusLocation, building.idFaculty, COUNT(office.officeNumber) AS OfficeCount, COUNT(classroom.classNumber)
    AS ClassCount, COUNT(lab.labNumber) AS LabCount
FROM Building_table building, Office_table office, Classroom_table classroom, Lab_table lab
WHERE building.buildingCode = office.buildingCode AND building.buildingCode = classroom.buildingCode AND
	building.buildingCode = lab.buildingCode
GROUP BY building.buildingCode, building.buildingName, building.buildingLocation, building.buildingLevel,
	building.campusLocation, building.idFaculty;

/*
* Query: Degree Records
* Author: Johan Torres Creed
* Description: Insert degree details into a temp Degree_Records table.
* Created: 08/05/18
* Last modification: 08/05/18
* Last modification by: Johan Torres Creed
*/

CREATE TABLE Degree_Records (
	degCode VARCHAR2(100),
	degName VARCHAR2(100),
	degLength NUMBER,
	degPrereq VARCHAR2(100),
	facultyID NUMBER,
	studentCount NUMBER
)

INSERT INTO Degree_Records
SELECT deg.degreeCode, deg.degreeName, deg.length, deg.degreePrerequisites, deg.idFaculty, COUNT(enrl.studentN.idPerson)
FROM Degree_table deg, EnrollsIn_table enrl
WHERE enrl.degreeN.degreeCode = deg.degreeCode
GROUP BY deg.degreeCode, deg.degreeName, deg.length, deg.degreePrerequisites, deg.idFaculty;

