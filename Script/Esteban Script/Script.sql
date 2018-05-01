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
CREATE TYPE RC_Unit_table AS TABLE OF RC_Unit_obj;

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
	unit RC_Unit_table
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
* Type: Facluty object
* Author: Esteban Coto Alfaro
* Description: Creates the faculty object
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

CREATE TABLE Building_table OF Building_obj(PRIMARY KEY (idBuilding));

CREATE TYPE Faculty_obj AS OBJECT(
	idFaculty NUMBER,
	name VARCHAR2(100),
	dean VARCHAR2(100),
	department_list List_Department,
	school_list List_School,
	rc_list List_RC,
)NOT FINAL;

/*
* Table: Faculty table with Department, School and Research center
* Author: Esteban Coto Alfaro
* Description: Creates the table Faculty
* Created: 28/04/18
* Last modification: 28/04/18
* Last modification by: Esteban Coto Alfaro
*/
CREATE TABLE Faculty_table OF Faculty_obj(PRIMARY KEY (idFaculty),
department_list List_Department,
school_list List_School,
rc_list List_RC)
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
CREATE TABLE Department_table OF Department_obj(PRIMARY KEY (idDepartment))

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

CREATE SEQUENCE seqCampus
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

CREATE SEQUENCE seqFaculty
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

CREATE SEQUENCE seqSchool
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

CREATE SEQUENCE seqDepartment
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

CREATE SEQUENCE seqResearchCenter
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

CREATE SEQUENCE seqBuilding
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE

CREATE SEQUENCE seqOffice
START WITH 0
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 1000000
NOCACHE
NOCYCLE
