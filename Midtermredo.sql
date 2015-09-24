start CREATEBLMT.SQL
DESCRIBE JOB;
DESCRIBE EMPLOYEE;
DESCRIBE PROJECT;
DESCRIBE ASSIGNMENT;
START LOADTBLe.SQL
SELECT * FROM JOB;
SELECT * FROM EMPLOYEE;
SELECT * FROM PROJECT;
SELECT * FROM ASSIGNMENT;
START LOADADREC_Rivers.SQL
SELECT * FROM JOB;
SELECT * FROM EMPLOYEE;
SELECT * FROM PROJECT;
SELECT * FROM ASSIGNMENT;
  CREATE TABLE EMP_1(
    EMP_NUM CHAR(3),
    EMP_LNAME VARCHAR(15),
    EMP_FNAME VARCHAR(15),
    EMP_INITIAL CHAR(1),
    EMP_HIREDATE DATE,
    JOB_CODE CHAR(3),
    FOREIGN KEY(JOB_CODE) REFERENCES JOB,
    PRIMARY KEY(EMP_NUM));
DESCRIBE EMP_1;
INSERT INTO EMP_1
    SELECT EMP_NUM,EMP_LNAME,EMP_FNAME,EMP_INITIAL,EMP_HIREDATE,JOB_CODE
    FROM EMPLOYEE WHERE EMP_NUM <103;
SELECT * FROM EMP_1;
INSERT INTO EMP_1
    SELECT EMP_NUM,EMP_LNAME,EMP_FNAME,EMP_INITIAL,EMP_HIREDATE,JOB_CODE
    FROM EMPLOYEE WHERE EMP_NUM > 102 AND EMP_NUM < 110;
SELECT * FROM EMP_1;
SELECT * FROM EMP_1
    WHERE JOB_CODE=502;
COMMIT;
UPDATE EMP_1 SET JOB_CODE = 501 WHERE EMP_NUM = 107;
SELECT * FROM EMP_1 WHERE EMP_NUM =107;
UPDATE EMP_1 SET JOB_CODE = 500 WHERE EMP_NUM = 107;
SELECT * FROM EMP_1 WHERE EMP_NUM =107;
DELETE FROM EMP_1 WHERE EMP_LNAME = 'Smithfield' and EMP_FNAME = 'William' and EMP_HIREDATE ='22-JUN-04' and JOB_CODE = '500';
select * from EMP_1;
ROLLBACK;
SELECT * FROM EMP_1;
CREATE TABLE EMP_2 AS
    SELECT EMP_NUM,EMP_LNAME,EMP_FNAME,EMP_INITIAL,EMP_HIREDATE,JOB_CODE
    FROM EMP_1;
SELECT* FROM EMP_2;
ALTER TABLE EMP_2
    ADD EMP_PCT NUMBER(4,2)
    ADD PROJ_NUM CHAR(3);
UPDATE EMP_2 SET EMP_PCT =3.85 WHERE EMP_NUM = 103;
UPDATE EMP_2 SET EMP_PCT =5.00 WHERE EMP_NUM = 101 OR EMP_NUM = 105;
UPDATE EMP_2 SET EMP_PCT = 10.00 WHERE EMP_NUM = 104 OR EMP_NUM=108;
UPDATE EMP_2 SET EMP_PCT = 8.00 WHERE EMP_NUM = 102;
UPDATE EMP_2 SET EMP_PCT = 6.20 WHERE EMP_NUM = 106;
UPDATE EMP_2 SET EMP_PCT = 5.15 WHERE EMP_NUM = 107;
UPDATE EMP_2 SET EMP_PCT = 2.00 WHERE EMP_NUM=109;
SELECT * FROM EMP_2;
UPDATE EMP_2 SET PROJ_NUM = 18 WHERE JOB_CODE =500;
UPDATE EMP_2 SET PROJ_NUM = 25 WHERE JOB_CODE >= 502;
UPDATE EMP_2 SET PROJ_NUM =14 WHERE EMP_HIREDATE < '1-JAN-94';
SELECT * FROM EMP_2;
CREATE TABLE TEMP1 AS SELECT EMP_NUM,EMP_PCT FROM EMP_2;
SELECT * FROM TEMP1;
DROP TABLE TEMP1;
SELECT * FROM EMP_2 WHERE EMP_LNAME LIKE 'Smith%';
SELECT PROJECT.PROJ_NAME,PROJECT.PROJ_BALANCE,EMPLOYEE.EMP_NUM,EMPLOYEE.EMP_LNAME,EMPLOYEE.EMP_INITIAL,JOB.JOB_CODE,JOB.JOB_DESCRIPTION,JOB.JOB_CHG_HOUR
    from Project join EMPLOYEE on project.EMP_NUM=EMPLOYEE.EMP_NUM join JOB ON EMPLOYEE.JOB_CODE=JOB.JOB_CODE where EMPLOYEE.JOB_CODE IN (501,500);
CREATE VIEW REP_1 AS
    SELECT PROJECT.PROJ_NAME,PROJECT.PROJ_BALANCE,EMPLOYEE.EMP_NUM,EMPLOYEE.EMP_LNAME,EMPLOYEE.EMP_INITIAL,JOB.JOB_CODE,JOB.JOB_DESCRIPTION,JOB.JOB_CHG_HOUR
    from Project join EMPLOYEE on project.EMP_NUM=EMPLOYEE.EMP_NUM join JOB ON EMPLOYEE.JOB_CODE=JOB.JOB_CODE where EMPLOYEE.JOB_CODE IN (501,500);
SELECT AVG(EMP_PCT) FROstartM EMP_2;
SELECT * FROM EMP_2
    ORDER BY EMP_PCT ASC;
SELECT DISTINCT PROJ_NUM FROM EMP_2;
SELECT ASSIGN_CHG_HR,ASSIGN_HOURS,ASSIGN_HOURS*ASSIGN_CHG_HR AS ASSIGN_CHARGE
    FROM ASSIGNMENT;
SELECT EMPLOYEE.EMP_NUM, SUM(ASSIGNMENT.ASSIGN_CHARGE), EMPLOYEE.EMP_LNAME,  SUM(ASSIGNMENT.ASSIGN_HOURS) FROM ASSIGNMENT JOIN EMPLOYEE ON ASSIGNMENT.EMP_NUM=EMPLOYEE.EMP_NUM GROUP BY EMPLOYEE.EMP_NUM, EMPLOYEE.EMP_LNAME;
SELECT DISTINCT(PROJ_NUM), SUM(ASSIGN_HOURS), SUM(ASSIGN_CHG_HR) FROM ASSIGNMENT GROUP BY PROJ_NUM;
SELECT SUM(ASSIGN_HOURS) AS SUMOFASSIGN_HOURS,SUM(ASSIGN_CHARGE) AS SUMOFASSIGN_CHARGE
    FROM ASSIGNMENT;
SELECT SUM(ASSIGN_HOURS) AS SUMOFASSIGN_HOURS,SUM(ASSIGN_CHARGE) AS SUMOFASSIGN_CHARGE
    FROM ASSIGNMENT;


