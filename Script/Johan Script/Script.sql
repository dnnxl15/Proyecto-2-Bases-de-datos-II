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
* Type: Building_cluster
* Author: Johan Torres Creed
* Description: Cluster for all building departments, run after creating Building
* Created: 02/05/18
* Last modification: 06/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE CLUSTER Building_cluster (buildingCode VARCHAR2) SIZE 512;

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
* Last modification: 06/05/18
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
CREATE TABLE Office_table OF Office_obj(PRIMARY KEY (idOffice))
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
	idBuilding NUMBER,
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
	CLUSTER Building_cluster (idBuilding);

/*
* Type: Lab
* Author: Johan Torres Creed
* Description: This is the object Lab, that conteins the follow atributes
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Johan Torres Creed
*/

/*
DECLARE TYPE Equipment IS VARRAY(100) OF VARCHAR2(50);
BEGIN
    NULL;
END;
*/

CREATE TYPE Lab_obj AS OBJECT (
	idBuilding NUMBER,
	labNumber VARCHAR2(100),
	labCapacity NUMBER,
	labEquipment VARCHAR2(100)
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
	CLUSTER Building_cluster (idBuilding);

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
CREATE TABLE Degree_table OF Degree_obj (idDegree PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

/*
* Type: Table EnrollsIn
* Author: Johan Torres Creed
* Description: EnrollsIn, association between Student and Degree
* Created: 02/05/18
* Last modification: 02/05/18
* Last modification by: Johan Torres Creed
*/
CREATE TABLE EnrollsIn AS (
	idPerson REF Student_obj SCOPE IS Student_table,
	idDegree REF Degree_obj SCOPE IS Degree_table
);

/*
* Type: Table Takes
* Author: Johan Torres Creed
* Description: Takes, association between Student and Subject
* Created: 26/04/18
* Last modification: 02/05/18
* Last modification by: Johan Torres Creed
*/
CREATE TABLE Takes AS (
	idPerson REF Student_obj SCOPE IS Student_table,
	idSubject REF Subject_obj SCOPE IS Subject_table,
	marks NUMBER
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
CREATE TABLE Subject_table OF Subject_obj (idSubject PRIMARY KEY)
	OBJECT IDENTIFIER IS PRIMARY KEY

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
* Procedure: insertClassroom
* Author: Johan Torres Creed
* Description: This procedure inserts a classroom in the table Subject_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertClassroom(pClassNumber IN VARCHAR2, pClassCapacity IN NUMBER) AS
BEGIN
	INSERT INTO Classroom_table
	VALUES(Classroom_obj(seqClassroom.Nextval, pClassNumber, pClassCapacity));
	COMMIT;
END insertClassroom;

/* PRUEBA DE INSERT CLASSROOM*/

CALL insertClassroom('TC01', 40); 

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
	DELETE FROM Classroom_table 
	WHERE classNumber = pClassNumber;
	COMMIT;
END deleteClassroom;

/* PRUEBA DE DELETE CLASSROOM*/

CALL deleteSubject('TC01');

/*
* Procedure: getClassroom
* Author: Johan Torres Creed
* Description: This procedure get a classroom in the table Classroom_table and have a out parameter as a cursor.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getClassroom(cClassroom OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cClassroom FOR 
	SELECT Classroom_table.classNumber, Classroom_table.classCapacity
	FROM Classroom_table;
END getClassroom;

/*
* Procedure: updateClassroom
* Author: Johan Torres Creed
* Description: This procedure updates a classroom in the table Classroom_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE updateClassroom(pClassNumber IN VARCHAR2, pClassCapacity IN NUMBER) AS
BEGIN 
	UPDATE Classroom_table clsr
	SET clsr.classNumber = pClassNumber,
	clsr.classCapacity = pClassCapacity,
	WHERE clsr.classNumber = pClassNumber;
END updateClassroom;

/*
* Procedure: insertLab
* Author: Johan Torres Creed
* Description: This procedure inserts a lab in the table Lab_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertLab(pLabNumber IN VARCHAR2, pLabCapacity IN NUMBER, pLabEquipment in VARCHAR2) AS
BEGIN
	INSERT INTO Lab_table
	VALUES(Lab_obj(seqLab.Nextval, pLabNumber, pLabCapacity, pLabEquipment));
	COMMIT;
END insertLab;

/* PRUEBA DE INSERT LAB*/

CALL insertLab('BG113', 25, '25 PC'); 

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

/* PRUEBA DE DELETE LAB*/

CALL deleteSubject('BG113');

/*
* Procedure: getLab
* Author: Johan Torres Creed
* Description: This procedure get a lab in the table Lab_table and have a out parameter as a cursor.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getLab(cLab OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cLab FOR 
	SELECT Lab_table.labNumber, Lab_table.labCapacity, Lab_table.labEquipment
	FROM Lab_table;
END getLab;

/*
* Procedure: updateLab
* Author: Johan Torres Creed
* Description: This procedure updates a lab in the table Lab_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE updateLab(pLabNumber IN VARCHAR2, pLabCapacity IN NUMBER, pLabEquipment IN VARCHAR2) AS
BEGIN 
	UPDATE Lab_table lab
	SET lab.labNumber = pLabNumber,
	lab.labCapacity = pLabCapacity,
	lab.labEquipment = pLabEquipment
	WHERE lab.labNumber = pLabNumber;
END updateLab;

/*
* Procedure: insertDegree
* Author: Johan Torres Creed
* Description: This procedure inserts a degree in the table Degree_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertDegree(pDegreeName IN VARCHAR2, pLength IN NUMBER,
pDegreePrerequisites IN VARCHAR2, pIDFaculty IN NUMBER) AS
BEGIN
	INSERT INTO Degree_table
	VALUES(Degree_obj(seqDegree.Nextval, pDegreeName, pLength, pDegreePrerequisites, pIDFaculty));
	COMMIT;
END insertDegree;

/* PRUEBA DE INSERT DEGREE*/

CALL insertSubject('Bachelor of Comp. Sci', 3, 'Year 12 or equivalent', getFaculty(0)); 

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

/* PRUEBA DE DELETE DEGREE*/

CALL deleteDegree(0);

/*
* Procedure: getDegree
* Author: Johan Torres Creed
* Description: This procedure get a degree in the table Degree_table and have a out parameter as a cursor.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getDegree(cDegree OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cDegree FOR 
	SELECT Degree_table.idDegree, Degree_table.degreeName, Degree_table.length,
	Degree_table.degreePrerequisites, Degree_table.idFaculty
	FROM Degree_table;
END getDegree;

/*
* Procedure: updateDegree
* Author: Johan Torres Creed
* Description: This procedure updates a degree in the table Degree_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE updateDegree(pIDDegree IN NUMBER, pDegreeName IN VARCHAR2,
pLength IN NUMBER, pDegreePrerequisites IN VARCHAR2, pIDFaculty IN NUMBER) AS
BEGIN 
	UPDATE Degree_table deg
	SET deg.degreeName = pDegreeName,
	deg.length = pLength,
	deg.degreePrerequisites = pDegreePrerequisites,
	deg.idFaculty = pIDFaculty
	WHERE deg.idDegree = pIDDegree;
END updateDegree;

/*
* Procedure: insertTakes
* Author: Johan Torres Creed
* Description: This procedure inserts a take in the table Takes_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE insertTakes(pStudent IN NUMBER, pSubject IN NUMBER, pMarks IN NUMBER) AS
BEGIN
	INSERT INTO Takes_table
	VALUES(SELECT REF(pStd), REF(pSubj), pMarks
		FROM Student_table pStd, Subject_table pSubj
		WHERE pStd.idPerson = pStudent AND pSubj.idSubject = pSubject);
	COMMIT;
END insertTakes;

/*
* Procedure: deleteTakes
* Author: Johan Torres Creed
* Description: This procedure delete a take in the table Takes_table.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE PROCEDURE deleteTakes(pStudent IN NUMBER) AS
BEGIN
	DELETE FROM Takes_table 
	WHERE idPerson = pStudent;
	COMMIT;
END deleteTakes;

/*
* Procedure: getTakes
* Author: Johan Torres Creed
* Description: This procedure get a take in the table Takes_table and have a out parameter as a cursor.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getTakes(cTakes OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cTakes FOR 
	SELECT Takes_table.idStudent, Takes_table.idSubject, Takes_table.marks
	FROM Takes_table;
END getTakes;

/*
* Procedure: updateTakes
* Author: Johan Torres Creed
* Description: This procedure updates a take in the table Takes_table.
* Created: 28/04/18
* Last modification: 28/04/18
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

/* PRUEBA DE INSERT SUBJECT*/

CALL insertSubject('Introduccion a la Tecnologia', 3, ' ', getSeniorLecturer(0)); 

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

/* PRUEBA DE DELETE SUBJECT*/

CALL deleteSubject(0);

/*
* Procedure: getSubject
* Author: Johan Torres Creed
* Description: This procedure get a subject in the table Subject_table and have a out parameter as a cursor.
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getSubject(cSubject OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cSubject FOR 
	SELECT Subject_table.idSubject, Subject_table.subjectName, Subject_table.credit,
	Subject_table.subjectPrerequisites, Subject_table.idPerson
	FROM Subject_table;
END getSubject;

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

/* PRUEBA DE INSERT SENIOR LECTURER*/

CALL insertSeniorLecturer('Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,
'Cartago', 10, 'BCGH6', 'Secretario', 'Ingenieria', 'Asociado', 2, 5, 7);
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

/* PRUEBA DE DELETE SENIOR LECTURER*/

CALL deleteSeniorLecturer(0);

/*
* Procedure: getSeniorLecturer
* Author: Johan Torres Creed
* Description: This procedure gets a senior lecturer in the table SeniorLecturer_table and have a out parameter as a cursor.
* Created: 26/04/18
* Last modification: 26/04/18
* Last modification by: Johan Torres Creed
*/
CREATE OR REPLACE PROCEDURE getSeniorLecturer(cSeniorLecturer OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN cSeniorLecturer FOR 
	SELECT SeniorLecturer_table.idPerson, SeniorLecturer_table.surname, SeniorLecturer_table.firstName, 
	SeniorLecturer_table.title, SeniorLecturer_table.address, SeniorLecturer_table.phone, SeniorLecturer_table.postcode,
	SeniorLecturer_table.campusLocation, SeniorLecturer_table.idBuilding, SeniorLecturer_table.numberOffice,
	SeniorLecturer_table.staffType, 
	SeniorLecturer_table.area, SeniorLecturer_table.lectureType,SeniorLecturer_table.numberPhd, SeniorLecturer_table.numberMaster,
	SeniorLecturer_table.numberHonours
	FROM SeniorLecturer_table;
END getSeniorLecturer;

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

/* PRUEBA DE UPDATE SENIOR LECTURER*/

CALL updateSeniorLecturer(0, 'Billy', 'Gomez', 'Master', 'Pavas', 12365478, 1452,
'Cartago', 10, 'BCGH6', 'Secretario', 'Ingenieria', 'Asociado', 2, 5, 8);

/*
*-----------
* SEQUENCE
*-----------
*/

CREATE SEQUENCE seqClassroom
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

CREATE SEQUENCE seqLab
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

CREATE SEQUENCE seqDegree
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
 NOCYCLE;

CREATE SEQUENCE sequenceSeniorLecturerID
 START WITH     0
 INCREMENT BY   1
 MINVALUE 0
 MAXVALUE 10000000
 NOCACHE
 NOCYCLE;