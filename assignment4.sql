-- Script for Assignment 4

-- Creating database with full name

CREATE DATABASE laxmikant_kabra;

-- Connecting to database 
\c laxmikant_kabra

-- Relation schemas and instances for assignment 2

CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));



INSERT INTO Person VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);


INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);

\qecho 'Problem 1'
/*Find each pair (c, p) where c is the city and p is the pid of the person
that lives in c, and earns the lowest salary among all persons living in c. You must not use set 
predicates in this query*/
WITH CITYMAXSALARY AS
	(SELECT P.CITY AS CITY,
			MAX(W.SALARY) AS MAXSALARY
		FROM PERSON P
		JOIN WORKSFOR W ON P.PID = W.PID
		GROUP BY (P.CITY))
SELECT DISTINCT P.CITY AS C,
	P.PNAME AS PN
FROM PERSON P
JOIN CITYMAXSALARY CMS ON CMS.CITY = P.CITY
JOIN WORKSFOR W ON W.SALARY = CMS.MAXSALARY
AND P.PID = W.PID;

\qecho 'Problem 2'
/*Find the pid and name of each person who has fewer than 2 of the com-
bined set of job skills of persons who work for Netflix. By combined set
of jobskills we mean the set
{s | s is a jobskill of an employee of Netflix }*/
WITH GETNETFLIXSKILLS AS
	(SELECT PS.SKILL AS SKILL
		FROM PERSON P
		JOIN
			(SELECT W.PID
				FROM WORKSFOR W
				WHERE W.CNAME = 'Netflix') W ON P.PID = W.PID
		JOIN PERSONSKILL PS ON P.PID = PS.PID)
SELECT DISTINCT P.PID AS PID,
	P.PNAME AS NAME
FROM PERSON P
JOIN PERSONSKILL PS ON P.PID = PS.PID
WHERE
		(SELECT COUNT(PS.SKILL)
			FROM PERSONSKILL PS
			WHERE PS.PID = P.PID
				AND PS.SKILL IN
					(SELECT SKILL
						FROM GETNETFLIXSKILLS)) < 2
UNION
SELECT DISTINCT P.PID AS PID,
	P.PNAME AS NAME
FROM PERSON P
WHERE P.PID NOT IN
		(SELECT PS.PID
			FROM PERSONSKILL PS)
ORDER BY PID;

\qecho 'Problem 3'
/*Find each pairs (s1; s2) of skills such that the set of persons with skill s1
is the same as the set of persons with skill s2.*/
CREATE FUNCTION PERSONSWITHSKILL(SKILLNAME text) RETURNS TABLE(PID integer) AS $$
SELECT P.PID AS PID
FROM PERSON P
JOIN PERSONSKILL PS ON P.PID = PS.PID
WHERE PS.SKILL = SKILLNAME;
$$ LANGUAGE SQL;


SELECT S1.SKILL AS S1,
	S2.SKILL AS S2
FROM SKILL S1
CROSS JOIN SKILL S2
WHERE NOT EXISTS
		(SELECT *
			FROM PERSONSWITHSKILL(S1.SKILL)
			EXCEPT SELECT *
			FROM PERSONSWITHSKILL(S2.SKILL))
	AND NOT EXISTS
		(SELECT *
			FROM PERSONSWITHSKILL(S2.SKILL)
			EXCEPT SELECT *
			FROM PERSONSWITHSKILL(S1.SKILL))
ORDER BY (S1,S2);

\qecho 'Problem 4'
/*Find each pid of a person who knows at least two people who (a) work for
Apple and (b) who make less than 55000.
You must not use set predicates in this query.*/
SELECT P.PID
FROM PERSON P
JOIN KNOWS K ON P.PID = K.PID1
JOIN WORKSFOR W ON W.PID = K.PID2
WHERE W.CNAME = 'Apple'
	AND W.SALARY < 60000
GROUP BY P.PID
HAVING COUNT(K.PID2) >= 3;

\qecho 'Problem 5'
/*Find the cname of each company, such that some person that works there
knows at-least quarter of the people that work at Amazon.
You must not use set predicates in this query.*/
CREATE OR REPLACE FUNCTION COMPANYEMPCOUNT (C TEXT) RETURNS INTEGER AS $$
SELECT COUNT(W.PID)
FROM WORKSFOR W
WHERE W.CNAME = C;
$$ LANGUAGE SQL;


SELECT W.CNAME
FROM WORKSFOR W
JOIN KNOWS K ON W.PID = K.PID1
JOIN
	(SELECT *
		FROM WORKSFOR W
		WHERE W.CNAME = 'Google') W1 ON K.PID2 = W1.PID
GROUP BY W.CNAME
HAVING COUNT(K.PID2) >= COMPANYEMPCOUNT('Google') * 1 / 2;

\qecho 'Problem 6'
/*
Find each pair (c, a) where c is the cname of each company that has at
least one manager, and a is the average salary of all employees working at
the company who are not managers
You must not use set predicates in this query.*/
CREATE OR REPLACE FUNCTION LEASTONEMGCOMPANIES() RETURNS TABLE(CNAME TEXT) AS $$
SELECT DISTINCT W.CNAME AS CNAME
FROM WORKSFOR W
JOIN HASMANAGER HM ON W.PID = HM.MID;
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION MINSALARYNONMG() RETURNS TABLE(CNAME TEXT, MINSALARY TEXT) AS $$
SELECT W.CNAME AS CNAME,
	MIN(W.SALARY) AS MINSALARY
FROM
	(SELECT W1.PID,
			W1.CNAME,
			W1.SALARY
		FROM WORKSFOR W1
		EXCEPT SELECT W1.PID,
			W1.CNAME,
			W1.SALARY
		FROM WORKSFOR W1
		JOIN HASMANAGER HM ON W1.PID = HM.MID) W
GROUP BY CNAME;
$$ LANGUAGE SQL;


SELECT I1.CNAME AS C,
	I1.MINSALARY AS A
FROM
	(SELECT *
		FROM MINSALARYNONMG()) I1
JOIN
	(SELECT *
		FROM LEASTONEMGCOMPANIES()) I2 ON I1.CNAME = I2.CNAME
UNION
SELECT
	(SELECT I1.CNAME AS C
		FROM LEASTONEMGCOMPANIES() I1
		EXCEPT SELECT I2.CNAME AS C
		FROM MINSALARYNONMG() I2), '' AS A
ORDER BY C;

\qecho 'Problem 7'
-- 7a)

CREATE OR REPLACE FUNCTION NUMBEROFSKILLS(C text) 
RETURNS TABLE (PID integer, SALARY int, NUMBEROFSKILLS bigint) AS $$
SELECT W.PID AS PID,
	W.SALARY AS SALARY,
	COUNT(PS.SKILL) AS NUMBEROFSKILLS
FROM
	(SELECT W.PID AS PID,
			W.SALARY AS SALARY
		FROM WORKSFOR W
		WHERE W.CNAME = C) W
JOIN PERSONSKILL PS ON W.PID = PS.PID
GROUP BY W.PID, W.SALARY
UNION
SELECT W.PID as PID,
	W.SALARY as SALARY, 0 as NUMBEROFSKILLS
FROM
	((SELECT W.PID AS PID,
			W.SALARY AS SALARY
		FROM WORKSFOR W
		WHERE W.CNAME = C)
		EXCEPT
			(SELECT W.PID AS PID,
					W.SALARY AS SALARY
				FROM WORKSFOR W JOIN PERSONSKILL PS ON W.PID = PS.PID
				WHERE W.CNAME = C)
		) W
$$ LANGUAGE SQL;

-- 7b)

SELECT *
FROM NUMBEROFSKILLS('Apple');


SELECT *
FROM NUMBEROFSKILLS('Amazon');


SELECT *
FROM NUMBEROFSKILLS('ACM');

-- 7c)

CREATE OR REPLACE FUNCTION NUMBEROFSKILLS(C text) 
RETURNS TABLE (PID integer, SALARY int, NUMBEROFSKILLS bigint) AS $$
SELECT W.PID AS PID,
	W.SALARY AS SALARY,
	(SELECT COUNT(PS.SKILL)
		FROM PERSONSKILL PS
		WHERE PS.PID = W.PID ) AS NUMBEROFSKILLS
FROM
	(SELECT W.PID AS PID,
			W.SALARY AS SALARY
		FROM WORKSFOR W
		WHERE W.CNAME = C) W
JOIN PERSONSKILL PS ON W.PID = PS.PID
GROUP BY W.PID, W.SALARY
UNION
SELECT W.PID as PID,
	W.SALARY as SALARY, 0 as NUMBEROFSKILLS
FROM
	((SELECT W.PID AS PID,
			W.SALARY AS SALARY
		FROM WORKSFOR W
		WHERE W.CNAME = C)
		EXCEPT
			(SELECT W.PID AS PID,
					W.SALARY AS SALARY
				FROM WORKSFOR W JOIN PERSONSKILL PS ON W.PID = PS.PID
				WHERE W.CNAME = C)
		) W
$$ LANGUAGE SQL;

--  7d)

SELECT *
FROM NUMBEROFSKILLS('Apple');


SELECT *
FROM NUMBEROFSKILLS('Amazon');


SELECT *
FROM NUMBEROFSKILLS('ACM');

-- 7e)

SELECT W.CNAME AS C,
	W.PID AS P
FROM WORKSFOR W
JOIN NUMBEROFSKILLS(W.CNAME) NOS ON W.PID = NOS.PID
WHERE W.SALARY > 50000
	AND NOS.NUMBEROFSKILLS =
		(SELECT MAX(NOS.NUMBEROFSKILLS)
			FROM NUMBEROFSKILLS(W.CNAME) NOS)
ORDER BY W.CNAME,W.PID;


\qecho 'Problem 8'
/*Find the pid and name of each person who knows all the
persons who (a) live in Bloomington, (b) make at least
55000, and (c) have at least one skill.*/
CREATE OR REPLACE VIEW CHECKCONDITIONS AS
SELECT P.PID AS PID
FROM PERSON P
JOIN WORKSFOR W ON P.PID = W.PID
JOIN PERSONSKILL PS ON PS.PID = W.PID
WHERE P.CITY = 'Seattle'
AND W.SALARY >= 45000;


CREATE OR REPLACE FUNCTION PERSONKNOWS(PID INTEGER)
RETURNS TABLE (PID INTEGER) AS $$
SELECT K.PID2 AS PID
FROM KNOWS K
WHERE K.PID1 = PID
$$ LANGUAGE SQL;


SELECT P.PID,
	P.PNAME AS NAME
FROM PERSON P
WHERE NOT EXISTS(
SELECT PID FROM CHECKCONDITIONS
	EXCEPT
SELECT PID FROM PERSONKNOWS(P.PID));


\qecho 'Problem 9'
/*Find the cname of each company who only employs man-
agers who make more than 50000.*/
\qecho 'THIS WILL ALSO CONTAIN THE COMPANIES WHICH DO NOT HAVE ANY MANAGERS EMPLOYED.'
CREATE OR REPLACE VIEW ONLYMANAGERS AS
SELECT DISTINCT W.CNAME AS CNAME
FROM WORKSFOR W
JOIN HASMANAGER HM ON W.PID = HM.MID
WHERE W.SALARY <= 50000;

SELECT C.CNAME AS CNAME
FROM COMPANY C
EXCEPT
SELECT OM.CNAME
FROM ONLYMANAGERS OM
ORDER BY CNAME;

\qecho 'Problem 10'
/*Find the pid and name of each person who knows at least
4 people who each have at most 2 skills.*/
CREATE OR REPLACE VIEW SKILLS_COUNT AS
SELECT PS.PID
FROM PERSONSKILL PS
GROUP BY PS.PID
HAVING COUNT(PS.SKILL) <= 2;


CREATE OR REPLACE FUNCTION GET_KNOWS (PID INTEGER) RETURNS TABLE(PID INTEGER) AS $$
SELECT K.PID2 AS PID
FROM KNOWS K
WHERE K.PID1 = PID;
$$ LANGUAGE SQL;


SELECT P.PID,P.PNAME AS NAME
FROM PERSON P
WHERE
(SELECT COUNT(*)
FROM
 (SELECT GN.PID
  FROM GET_KNOWS(P.PID) GN
  INTERSECT
  SELECT SC.PID
  FROM SKILLS_COUNT SC) SQ) >= 4;


\qecho 'Problem 11'
/*Find the cname of each company that employs an odd number of 
persons where atleast two persons have the salary greater than or equal to 55000.*/
CREATE OR REPLACE VIEW GREAT_SALARY AS
SELECT W.CNAME AS CNAME
FROM WORKSFOR W
GROUP BY W.CNAME
HAVING COUNT(W.SALARY >= 55000) >= 2;


CREATE OR REPLACE VIEW ODD_EMP_COMPANIES AS
SELECT W.CNAME AS CNAME
FROM WORKSFOR W
GROUP BY W.CNAME
HAVING COUNT(W.PID) % 2 = 1;


SELECT R.CNAME
FROM
	(SELECT GS.CNAME
		FROM GREAT_SALARY GS INTERSECT SELECT OC.CNAME
		FROM ODD_EMP_COMPANIES OC) R;

\qecho 'Problem 12'
/*Find the pairs (p1, p2) of different person pids such that
the person with pid p1 and the person with pid p2 have the
same number of skills.*/
CREATE OR REPLACE FUNCTION GETSKILL(GID INTEGER) RETURNS INTEGER AS $$
SELECT COUNT(*) AS CNT
FROM PERSONSKILL PS
WHERE PS.PID = GID
$$ LANGUAGE SQL;


SELECT DISTINCT P1.PID AS P1,
	P2.PID AS P2
FROM PERSON P1
JOIN PERSON P2 ON P1.PID <> P2.PID
WHERE GETSKILL(P1.PID) > 0
	AND EXISTS
		(SELECT G1
			FROM GETSKILL(P1.PID) G1 INTERSECT SELECT G2
			FROM GETSKILL(P2.PID) G2);
			
-- SELECT DISTINCT P1.PID AS P1,
-- 	P2.PID AS P2
-- FROM PERSON P1
-- JOIN PERSON P2 ON P1.PID <> P2.PID
-- WHERE GETSKILL(P1.PID) = GETSKILL(P2.PID)
-- 	AND GETSKILL(P1.PID) > 0

\qecho 'Problem 13'
/*Explain how triggers can be used to implement the 
Primary key Constraint, with an example.*/
CREATE OR REPLACE FUNCTION PRIMARY_KEY_CONSTRAINT() RETURNS TRIGGER AS $$
BEGIN IF NEW.PID IN
	(SELECT PID
		FROM PERSON) THEN RAISE
EXCEPTION 'The pid already exists in person table: %',
	NEW.PID;

END IF;

RETURN NEW;

END;
$$ LANGUAGE PLPGSQL;


CREATE OR REPLACE TRIGGER ENFORCE_PRIMARY_KEY_CONSTRAINT
BEFORE
INSERT
OR
UPDATE ON PERSON
FOR EACH ROW EXECUTE FUNCTION PRIMARY_KEY_CONSTRAINT();

-- DROP TRIGGER IF EXISTS ENFORCE_PRIMARY_KEY_CONSTRAINT ON PERSON;

-- INSERT INTO PERSON VALUES(1001,'LK', 'Bloomington');

\qecho 'Problem 14'
/*Explain how triggers can be used to implement the Referential Integrity
Constraint, with an example.(You are not allowed to use postgres cascade).*/
CREATE OR REPLACE FUNCTION REFERENTIAL_INTEGRITY_CONSTRAINT() RETURNS TRIGGER AS $$
BEGIN IF EXISTS
	(SELECT 1
		FROM PERSONSKILL PS
		WHERE PS.SKILL = OLD.SKILL) THEN RAISE
EXCEPTION 'Cannot delete due to child reference to skill in personskill';

ELSE RETURN OLD;

END IF;

END;
$$ LANGUAGE PLPGSQL;


CREATE OR REPLACE TRIGGER ENFORCE_REFERENTIAL_INTEGRITY_CONSTRAINT
BEFORE
DELETE ON SKILL
FOR EACH ROW
EXECUTE FUNCTION REFERENTIAL_INTEGRITY_CONSTRAINT();

-- DELETE FROM SKILL WHERE SKILL= 'AI';
-- DELETE FROM SKILL WHERE SKILL = 'DP';


\qecho 'Problem 15'
/*Consider two relations R(A:integer,B:integer) and S(B:integer)
and a view with the following definition:*/

-- select distinct r.A
-- from R r, S s
-- where r.A > 10 and r.B = s.B;

/*Suppose we want to maintain this view as a materialized
view called V(A:integer) upon the insertion of tuples in R
and in S. (You do not have to consider deletions in this question.)

Define SQL insert triggers and their associated trigger functions
on the relations R and S that implement this materialized view.
Write your trigger functions in the language ‘plpgsql.’

Make sure that your trigger functions act in an incremental way
and that no duplicates appear in the materialized view.*/


--TEST YOUR TRIGGERS ACROSS THE BELOW RECORDS.

/* -----------*/

CREATE TABLE IF NOT EXISTS R(A INT, B INT);
CREATE TABLE IF NOT EXISTS S(B INT);
CREATE TABLE IF NOT EXISTS V(A INT);


/* -----------*/
CREATE OR REPLACE FUNCTION INSERT_R_FUNCTION() RETURNS TRIGGER AS $$
BEGIN IF NEW.A NOT IN
	(SELECT *
		FROM V) THEN IF NEW.A > 10
AND NEW.B IN
	(SELECT *
		FROM S) THEN
INSERT INTO V
VALUES (NEW.A) ;

END IF;

END IF;

RETURN NULL;

END;
$$ LANGUAGE PLPGSQL;


CREATE OR REPLACE TRIGGER INSERT_R AFTER
INSERT ON R
FOR EACH ROW EXECUTE PROCEDURE INSERT_R_FUNCTION();


CREATE OR REPLACE FUNCTION INSERT_S_FUNCTION() RETURNS TRIGGER AS $$
BEGIN IF NEW.B IN
	(SELECT RR.B
		FROM R RR
		WHERE RR.A > 10) THEN
INSERT INTO V
VALUES ((SELECT DISTINCT RR.A FROM R RR WHERE RR.B = NEW.B)); --

END IF;

RETURN NULL;

END;
$$ LANGUAGE PLPGSQL;


CREATE TRIGGER INSERT_S AFTER
INSERT ON S
FOR EACH ROW EXECUTE PROCEDURE INSERT_S_FUNCTION();
/* -----------*/

INSERT INTO R VALUES(15,35);
INSERT INTO S VALUES(35);
SELECT * FROM V;


INSERT INTO R VALUES(4,12);
INSERT INTO S VALUES(12);
SELECT * FROM V;

INSERT INTO R VALUES(26,13);
INSERT INTO S VALUES(11);
SELECT * FROM V;


INSERT INTO R VALUES(101,106);
INSERT INTO S VALUES(106);
SELECT * FROM V;


DROP TABLE IF EXISTS R;
DROP TABLE IF EXISTS S;
DROP TABLE IF EXISTS V;

/* -----------*/



\qecho 'Problem 16'
/*Consider applying the following constraint over the relation
personSkill. ”Each skill of a person who works for Apple
should also be the skill of the person who works for Google.
Write a trigger that maintains the constraint when inserting
new pairs of (pid,skill) into the personSkill relation.(You
can ignore the constraint restriction to hold upon the al-
ready existing previous records).*/


/* SECTION 16 BEGIN */

CREATE OR REPLACE FUNCTION APPLE_GOOGLE_SKILLS() RETURNS TRIGGER AS $$
BEGIN
IF NEW.CNAME = 'Google' THEN
INSERT INTO PERSONSKILL
	(SELECT NEW.PID AS PID,ge.SKILL
		FROM
			(SELECT DISTINCT PS.SKILL
				FROM PERSONSKILL PS,WORKSFOR WF
				WHERE WF.CNAME = 'Google'
					AND WF.PID = PS.PID) ge);

END IF;
RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;


CREATE OR REPLACE TRIGGER ENFORCE_APPLE_GOOGLE_SKILLS AFTER
INSERT ON WORKSFOR
FOR EACH ROW EXECUTE PROCEDURE APPLE_GOOGLE_SKILLS();

/* NEW RECORDS TO BE INSERTED*/


INSERT INTO Person VALUES
    (2001,'Kevin','Cupertino');
INSERT INTO worksFor VALUES
    (2001,'Apple', 65000);

INSERT INTO Person VALUES
    (2002,'Julia', 'Cupertino');
INSERT INTO worksFor VALUES
	(2002,'Google', 45000);
INSERT INTO SKILL VALUES('Devops');	
INSERT INTO personSkill VALUES
	(2002,'Devops');
     
INSERT INTO Person VALUES
    (2003,'Dora', 'Seattle');
INSERT INTO worksFor VALUES	 
	(2003,'Google', 55000);
INSERT INTO SKILL VALUES('Cloud');
INSERT INTO personSkill VALUES
	(2003,'Cloud');

INSERT INTO Person VALUES
     (2004,'Peter', 'Seattle');
INSERT INTO worksFor VALUES	 
	 (2004,'Apple', 55000);
INSERT INTO SKILL VALUES('Design');
INSERT INTO personSkill VALUES
	 (2004,'Design');


INSERT INTO Person VALUES
    (2005,'Alex','Cupertino');
INSERT INTO worksFor VALUES
    (2005,'Apple', 65000);

/* -----------*/

/* TEST YOUR RESULTS*/

SELECT * FROM PERSONSKILL WHERE PID = 2001;
SELECT * FROM PERSONSKILL WHERE PID = 2002;
SELECT * FROM PERSONSKILL WHERE PID = 2003;
SELECT * FROM PERSONSKILL WHERE PID = 2004;
SELECT * FROM PERSONSKILL WHERE PID = 2005;

/* -----------*/

/* RETAINING THE ORIGINAL DATA*/

DELETE FROM PERSONSKILL PS WHERE PS.PID IN (2002,2003,2004);
DELETE FROM SKILL S WHERE S.SKILL IN ('Devops','Cloud','Design');
DELETE FROM WORKSFOR W WHERE W.PID IN (2001,2002,2003,2004,2005);
DELETE FROM PERSON P WHERE P.PID IN (2001,2002,2003,2004,2005);

/* SECTION 16 END */



\qecho 'Problem 17'

/* SECTION Q17 BEGIN */

/* SECTION Q17 BEGIN */

CREATE TABLE KNOWS_COPY AS SELECT * FROM KNOWS;

CREATE OR REPLACE FUNCTION RETAIN_DATA(P INT, C TEXT)
RETURNS VOID AS $$
	BEGIN
        UPDATE WORKSFOR SET CNAME = C
          WHERE WORKSFOR.PID = P;
		
		TRUNCATE TABLE KNOWS;
		INSERT INTO KNOWS SELECT * FROM KNOWS_COPY;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION Knows_After_Update_Func()
RETURNS TRIGGER AS 
$$
BEGIN
INSERT INTO Knows(SELECT DISTINCT NEW.pid AS pid1, w.pid as pid2
				  FROM worksFor w JOIN hasManager m ON (m.mid = w.pid)
				  WHERE w.pid != NEW.pid 
				  AND w.cname = NEW.cname);
RETURN NULL;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER Knows_After_Update 
AFTER UPDATE ON worksFor
FOR EACH ROW 
EXECUTE PROCEDURE Knows_After_Update_Func();



UPDATE WORKSFOR SET CNAME='Apple' WHERE WORKSFOR.PID = 1005;

/* Check your trigger and return the results*/
SELECT * 
FROM Knows k
WHERE k.pid1 = 1005;

/* retaining the data */
SELECT * FROM RETAIN_DATA(1005,'Google');


UPDATE WORKSFOR SET CNAME='Google' WHERE WORKSFOR.PID = 1012;

/* Check your trigger and return the results*/
SELECT * 
FROM Knows k
WHERE k.pid1 = 1012;

/* retaining the data */
SELECT * FROM RETAIN_DATA(1012,'Apple');


DROP TABLE KNOWS_COPY;


/* SECTION Q17 END */

-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE laxmikant_kabra;

