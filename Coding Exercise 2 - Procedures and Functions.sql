USE `electricity bill system new`;
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
QUESTION 1
Create a procedure named 'insertConnection' which has connection_name as an input parameter with varchar(100) as its datatype. 
This procedure will take the count of the existing table records(electricity_connection_type) and add 1 with that to generate the new electricity_connection_type id. 
The newly generated id along with the connection_name should be inserted into the electricity_connection_type table.
In Solution, write a procedure alone with the given specifications. The calling of the procedure with the input will be taken care of in the back end.

Hints:
Procedure name: insertConnection
Parameters: connection_name(varchar(100))

Input Format
The input tables are populated in the backend. 

Output Format
The output will display the below header if the procedure is created successfully.
id, connection_name  
*/
DELIMITER $$

CREATE PROCEDURE insertConnection(IN connection_name VARCHAR(100))
BEGIN

DECLARE id_value int;

SELECT count(id) + 1 INTO id_value FROM electricity_connection_type;

INSERT INTO electricity_connection_type
VALUES
(id_value,connection_name);
  
END;

CALL insertConnection('Industrial');
CALL insertConnection('Small Scale');

SELECT * FROM electricity_connection_type;

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
QUESTION 2
Create a procedure named 'insertMeter' which takes 2 input parameters namely, meter_number varchar(100) and building_id int. 
This procedure will take the count of the existing table records(meter) and add 1 with that to generate the new meter id. 
The newly generated id along with the meter_number and building_id should be inserted into the meter table.
In Solution, write a procedure alone with the given specifications. The calling of the procedure with the input will be taken care of in the back end.

Hints:
Procedure name: insertMeter
Parameters: meter_number(varchar(100)),building_id(int)

Input Format
The input tables are populated in the backend. 

Output Format
The output will display the below header if the procedure is created successfully.
id, meter_number, building_id
*/
DELIMITER $$

CREATE PROCEDURE insertMeter
(IN meter_number VARCHAR(100),
IN building_id int)

BEGIN

DECLARE id_value int;

SELECT count(id) + 1 INTO id_value FROM meter;

INSERT INTO meter
VALUES
(id_value,meter_number,building_id);
  
END$$

DELIMITER ;

CALL insertMeter('SG11111', 3);
CALL insertMeter('SG22222', 4);

SELECT * FROM meter;
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
QUESTION 3
Create a procedure named 'findTotalUnits' which has meter_number as an input parameter with varchar(100) as its datatype. 
This procedure should display the total_units of the electricity_reading for the meter_number passed as a parameter.
If there is more than one row for a particular meter number in the electricity_reading table for different dates, 
Output should display the sum of the total_units as total_units.
In Solution, write a procedure alone with the given specifications. The calling of the procedure with the input will be taken care of in the back end.

Hints:
Procedure name: findTotalUnits
Parameters: meter_number(varchar(100))

Input Format
The input tables are populated in the backend. 

Output Format
The output will display the below header if the procedure is created successfully.
total_units 
*/
DELIMITER $$

CREATE PROCEDURE findTotalUnits 
(IN meter_number VARCHAR(100)) 

BEGIN 

SELECT SUM(total_units) as total_units
FROM electricity_reading A 
JOIN meter B 
ON B.id = A. meter_id 
WHERE B.meter_number = meter_number; 

END$$

DELIMITER ;

CALL findTotalUnits('SG976232')

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
QUESTION 4
Create a function named 'findTotalUnits' which takes meterNumber as its input parameter and returns the total units consumed by the meter number for all the months.
In Solution, write a function alone with the given specifications. The calling of function with the input will be taken care of in the back end.

Design Rules:
If the meterNumber passed as input matches with the meter_number in the table then it returns the total units for the given input.

Hints:
Function name: findTotalUnits
Input parameter: meterNumber (varchar(255))

Input Format
The input tables are populated in the backend. 

Output Format
The output will display the below header if the function is created successfully.
total_units 
*/
DELIMITER $$

CREATE FUNCTION findTotalUnits
(meterNumber varchar(255)) 
returns int 
READS SQL DATA
BEGIN 

DECLARE g int; 

SELECT SUM(total_units) AS total_units into g 
FROM electricity_reading A 
JOIN meter B 
ON B.id = A. meter_id 
WHERE B.meter_number = meterNumber; 

RETURN g; 

END$$

DELIMITER ;

SELECT findTotalUnits('SG923564') as total_units;

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
QUESTION 5
Create a function named 'findCountofBuildingType' which has the connectionName as its input parameter and it returns the count of the building type for the given input.
In Solution, write a function alone with the given specifications. The calling of function with the input will be taken care of in the back end.

Hints:
Function Name: findCountofBuildingType
Input parameter: connection_name (varchar(255))
Return type: INT


Design Rules:
If the connectionName passed as input matches with the connection_name in the table then it returns the count of the building types for a given input.

Input Format
The input tables are populated in the backend. 

Output Format
The output will display the below header if the function is created successfully.
building_type_account
*/
DELIMITER $$

CREATE FUNCTION findCountofBuildingType
(connection_name  varchar(255)) 
returns int 
READS SQL DATA
BEGIN 

DECLARE g int; 

SELECT count(A.id) into g 
FROM building_type A 
JOIN electricity_connection_type B 
ON B.id = A. connection_Type_id 
WHERE B.connection_name = connection_name; 

RETURN g; 

END$$

DELIMITER ;

SELECT findCountofBuildingType('HOME') AS building_type_count;
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------