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
	location VARCHAR2(100),
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
CREATE PROCEDURE insertCampus(pLocation IN VARCHAR2, pAddress IN VARCHAR2,
pPhone IN NUMBER, pFax IN NUMBER, pHead IN VARCHAR2) AS
BEGIN
	INSERT INTO Campus_table 
	VALUES(Campus_obj(seqCampus.Nextval, pLocation, pAddress, pPhone, pFax, pHead));
	COMMIT;
END insertCampus;

CALL insertCampus('Albury/Wodonga', 'Parkers Road Wodonga VIC 3690', 61260583700, 6202583700, 'John Hill');

/*
* Procedure: updateCampus
* Author: Esteban Coto Alfaro
* Description: Procedure to update a campus into the table Campus_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateCampus(pCampusID IN NUMBER, pLocation IN VARCHAR2, pAddress IN VARCHAR2,
pPhone IN NUMBER, pFax IN NUMBER, pHead IN VARCHAR2) AS
BEGIN
	UPDATE Campus_table campus
	SET campus.location = pLocation,
	campus.address = pAddress,
	campus.phone = pPhone,
	campus.fax = pFax,
	campus.head = pHead
	WHERE campus.idCampus = pCampusID;
END updateCampus;

/*
* Procedure: deleteCampus
* Author: Esteban Coto Alfaro
* Description: Procedure to delete a campus into the table Campus_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE deleteCampus(pCampusID IN NUMBER) AS
BEGIN
	DELETE FROM Campus_table campus
	WHERE campus.idCampus = pCampusID;
	COMMIT;
END deleteCampus;

/*
* Procedure: insertOffice
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a office into the table Office_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertOffice(pBuildingCode IN VARCHAR2(100), pOfficeNum IN VARCHAR2(100),
pOfficePhone IN NUMBER) AS
BEGIN
	INSERT INTO Office_table 
	VALUES(Office_obj(seqOffice.Nextval, pBuildingCode, pOfficeNum, pOfficePhone));
	COMMIT;
END insertOffice;

/*
* Procedure: updateOffice
* Author: Esteban Coto Alfaro
* Description: Procedure to update a office into the table Office_table
* Created: 29/04/18
* Last modification: 29/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateOffice(pOldNum IN VARCHAR2(100), pBuildingCode IN VARCHAR2(100), 
	pNewNum IN VARCHAR2(100), pOfficePhone IN NUMBER) AS
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
CREATE PROCEDURE deleteOffice(pOfficeNum IN VARCHAR2(100)) AS
BEGIN
	DELETE FROM Office_table office
	WHERE office.officeNumber = pOfficeNum;
	COMMIT;
END deleteOffice;

/*
* Procedure: insertBuilding
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a building into the table Building_table
* Created: 01/05/18
* Last modification: 01/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertBuilding(pBuildingCode IN VARCHAR2(100), pBuildingName IN VARCHAR2(100),
pBuildingLocation IN VARCHAR2(100), pBuildingLevel IN NUMBER, pCampusLocation IN VARCHAR2(100),
pFacultyID IN NUMBER) AS
BEGIN
	INSERT INTO Building_table 
	VALUES(Building_obj(seqBuilding.Nextval, pBuildingCode, pBuildingName, pBuildingLocation, pBuildingLevel, pCampusLocation, pFacultyID));
	COMMIT;
END insertBuilding;

/*
* Procedure: updateBuilding
* Author: Esteban Coto Alfaro
* Description: Procedure to update a building into the table Building_table
* Created: 01/05/18
* Last modification: 01/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE updateBuilding(pOldCode IN VARCHAR2(100), pNewCode IN VARCHAR2(100), pBuildingName IN VARCHAR2(100),
	pBuildingLocation IN VARCHAR2(100), pBuildingLevel IN VARCHAR2(100), pCampusLocation IN VARCHAR2(100), pFacultyID IN NUMBER) AS
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
CREATE PROCEDURE deleteBuilding(pBuildingCode IN VARCHAR2(100)) AS
BEGIN
	DELETE FROM Building_table building
	WHERE building.buildingCode = pBuildingCode;
	COMMIT;
END deleteBuilding;

/*
* Procedure: insertFaculty
* Author: Esteban Coto Alfaro
* Description: Procedure to insert a faculty into the table Faculty_table
* Created: 01/05/18
* Last modification: 01/05/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE PROCEDURE insertFaculty(pFacultyName IN VARCHAR2(100), pFacultyDean IN VARCHAR2(100)) AS
BEGIN
	INSERT INTO Faculty_table 
	VALUES(Faculty_obj(seqFaculty.Nextval, pFacultyName, pFacultyDean, NULL, NULL, NULL));
	COMMIT;
END insertFaculty;

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


insert into faculty_table
VALUES(0, 'fac', 'dean', List_Department(
Department_obj(0, 'dept1', 'head', DeptProf_array(DeptProf_obj('Nombre1', 12345), DeptProf_obj('Nombre2', 54321))), 
Department_obj(1, 'dept2', 'head2', DeptProf_array(DeptProf_obj('Nombre3', 12345), DeptProf_obj('Nombre4', 54321))) ), List_School(
School_obj(0, 'school1', 'Schoolhead', SchoolProf_array(SchoolProf_obj('Nombre1', 12345), SchoolProf_obj('Nombre2', 54321))), 
School_obj(1, 'school2', 'head2', SchoolProf_array(SchoolProf_obj('Nombre3', 12345), SchoolProf_obj('Nombre4', 54321))) ), List_RC(
Research_Center_obj(0, 'rc1', 'head1', RC_Unit_array(RC_Unit_obj('unit1'),RC_Unit_obj('unit2'))), 
Research_Center_obj(1, 'rc2', 'head2', RC_Unit_array(RC_Unit_obj('unit3'),RC_Unit_obj('unit4'))))
);