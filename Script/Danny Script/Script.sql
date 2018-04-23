/*
* Type: Person
* Author: Danny Xie Li
* Description: This is the object Person, that conteins the follow atributes
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE Person_obj AS OBJECT ( 
	idPerson NUMBER NOT NULL,
	surname VARCHAR2(100),
	firstName VARCHAR2(100),
	title VARCHAR2(100),
	address VARCHAR2(100),
	phone NUMBER,
	postcode NUMBER,
	campusLocation VARCHAR2(100)
);

/*
* Type: Student
* Author: Danny Xie Li
* Description: This is the object Student, that herence from Person
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE Student_obj UNDER Person ( 
	year NUMBER
);

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
CREATE TYPE Staff_obj UNDER Person ( 
	idBuilding NUMBER,
	numberOffice NUMBER,
	staffType VARCHAR2(100)
);

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
	rate NUMBER
);

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
	rate NUMBER
);

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

CREATE TABLE Technician_table OF Technician_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
* Type: Lecturer
* Author: Danny Xie Li
* Description: This is the object Lecturer, that herence from Staff
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE Lecturer_obj UNDER Staff ( 
	area VARCHAR2(100),
	lectureType VARCHAR2(100)
);

/*
* Type: Admin
* Author: Danny Xie Li
* Description: This is the object Admin, that herence from Staff
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE Admin_obj UNDER Staff ( 
	admiTitle VARCHAR2(100),
	computerSkill VARCHAR2(100) NULL,
	officeSkill VARCHAR2(100)
);

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
CREATE TYPE AssociateLecturer_obj UNDER Lecturer ( 
	numberHonours NUMBER NULL,
	yearJoin NUMBER
);

CREATE TABLE AssociateLecturer_table OF AssociateLecturer_obj (idPerson PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY


CREATE PROCEDURE insertStudent(pFirstName IN VARCHAR2, pSurname IN VARCHAR2,
pTitle IN VARCHAR2, pAddress IN VARCHAR2, pPhone IN NUMBER, pPostcode IN NUMBER,
campusLocation IN VARCHAR2, pYear IN NUMBER) AS
DECLARE 
	student_var Student_obj
BEGIN
	student_var := Student_obj(sequenceStudentID.Nextval, pSurname, pFirstName, pTitle, pAddress, pPhone, pPostcode, campusLocation, pYear);
	INSERT INTO Student_table 
	VALUES(student_var)
END;


*/
CREATE TYPE Person_obj AS OBJECT ( 
	idPerson NUMBER NOT NULL,
	surname VARCHAR2(100),
	firstName VARCHAR2(100),
	title VARCHAR2(100),
	address VARCHAR2(100),
	phone NUMBER,
	postcode NUMBER,
	campusLocation VARCHAR2(100)
);

/*
* Type: Student
* Author: Danny Xie Li
* Description: This is the object Student, that herence from Person
* Created: 22/04/18
* Last modification: 22/04/18
* Last modification by: Danny Xie Li
*/
CREATE TYPE Student_obj UNDER Person ( 
	year NUMBER
);


CREATE SEQUENCE sequenceStudentID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE;