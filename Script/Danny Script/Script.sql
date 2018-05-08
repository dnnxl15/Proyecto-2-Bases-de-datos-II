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




















CONN SYSTEM;

GRANT CONNECT TO SYSTEM;


CREATE TABLESPACE DA_Data
	DATAFILE 'C:\Users\dnnxl\OneDrive\Documentos\GitHub\Proyecto-2-Bases-de-datos-II\Script\Danny Script\daData.dbf'
	SIZE 10M
	REUSE
	AUTOEXTEND ON
	NEXT 512K
	MAXSIZE 200M;
    

CREATE TABLESPACE DA_Ind
	DATAFILE 'C:\Users\dnnxl\OneDrive\Documentos\GitHub\Proyecto-2-Bases-de-datos-II\Script\Danny Script\daind.dbf'
	SIZE 10M
	REUSE 
	AUTOEXTEND ON
	NEXT 512K
	MAXSIZE 200M;
