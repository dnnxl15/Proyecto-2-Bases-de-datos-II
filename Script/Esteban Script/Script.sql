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
	name VARCHAR2(100),
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
CREATE PROCEDURE updateDepartment(pFaculty IN VARCHAR2, pOldName IN VARCHAR2, pNewName IN VARCHAR2, pHead IN VARCHAR2) AS
BEGIN
	UPDATE
	TABLE(SELECT faculty_table.department_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	SET name = pNewName,
	head = pHead
	WHERE name = pOldName;
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
CREATE PROCEDURE updateSchool(pFaculty IN VARCHAR2, pOldName IN VARCHAR2, pNewName IN VARCHAR2, pHead IN VARCHAR2) AS
BEGIN
	UPDATE
	TABLE(SELECT faculty_table.school_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	SET name = pNewName,
	head = pHead
	WHERE name = pOldName;
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
CREATE PROCEDURE updateRC(pFaculty IN VARCHAR2, pOldName IN VARCHAR2, pNewName IN VARCHAR2, pHead IN VARCHAR2) AS
BEGIN
	UPDATE
	TABLE(SELECT faculty_table.rc_List
	FROM faculty_table
	WHERE faculty_table.name = pFaculty)
	SET name = pNewName,
	head = pHead
	WHERE name = pOldName;
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

