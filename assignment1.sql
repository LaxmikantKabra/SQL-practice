-- Script for Assignment 1

-- Creating database with full name

CREATE DATABASE laxmikantkabra;

-- Connecting to database 
\c laxmikantkabra

-- Relation schemas and instances for assignment 1

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


CREATE TABLE hasManager1(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

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
     (1006,'Amazon', 60000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 45000),
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
 (1019,'Networks');

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
 (1014,1012);



\qecho 'Problem 1'

-- Provide 4 conceptually different examples that illustrate how the
-- presence or absence of primary and foreign keys affect insert and
-- deletes in these relations.  To solve this problem, you will need to
-- experiment with the relation schemas and instances for this
-- assignment.  For example, you should consider altering primary keys
-- and foreign key constraints and then consider various sequences of
-- insert and delete operations.  You may need to change some of the
-- relation instances to observe the desired effects.  Certain inserts
-- and deletes should succeed but other should generate error
-- conditions.  (Consider the lecture notes about keys, foreign keys,
-- and inserts and deletes as a guide to solve this problem.)

\qecho 'Problem 1 conceptual example 1'
\qecho "insert into person values(1001,'Jean','Cupertino'),(1002,'Vidya','Cupertino');"
\qecho "select * from person;"

\qecho "I removed primary key from schema of person relation and performed insertion of repeated values."
\qecho "Insertion of repeated values is allowed because primary key is absent."

\qecho 'Problem 1 conceptual example 2'
\qecho "insert into knows values(1050,1060);"
\qecho "select * from knows;"

\qecho "insertion of knows between non-existent persons happens here because foreign key constraints were removed from knows relation."

\qecho "Problem 1 conceptual example 3"
\qecho "delete from person where pid=1001"

\qecho "deletion of a person not affecting other tables having the same person creates orphaned records because foreign key"
\qecho "was absent and hence cascade upon delete does not work automatically"

\qecho 'Problem 1 conceptual example 4'
\qecho "delete from skill where skill = 'Databases'"

\qecho "this removes skill 'Databases' and in effect deletes all entrees in personSkill with skill = 'Databases' because of cascading effect"


\qecho 'Problem 2'

-- Find the pid, pname of each person who (a) lives in MountainView, (b)
-- works for a company which is headquartered in MountainView
-- , and (c) has a salary less than or equal to 60000
select p.pid, p.pname
from person p
where p.city = 'MountainView' and
p.pid in (select w.pid
		  from worksfor w
		  where w.salary <= 60000 and w.cname in (select c.cname 
												  from company c 
												  where c.headquarter = 'MountainView') );

\qecho 'Problem 3'
-- Find each company that has atleast 2 employees working for it.
select distinct w1.cname
from worksfor w1, worksfor w2
where w1.cname = w2.cname and w1.pid <> w2.pid;


\qecho 'Problem 4'
-- Find the ID of each person who knows someone living in Bloomington and having Networks skill.
SELECT DISTINCT K1.PID1 AS PID
FROM KNOWS K1
WHERE K1.PID2 = SOME
		(SELECT P.PID
			FROM PERSON P
			WHERE P.PID IN
					(SELECT PS.PID
						FROM PERSONSKILL PS
						WHERE PS.SKILL = 'Networks' )
				AND P.CITY = 'Bloomington');


\qecho 'Problem 5'
-- Find the pairs of pids (p1, p2) such that p1 and p2 both have atleast one common skill.
SELECT DISTINCT PS1.PID AS P1,
	PS2.PID AS P2
FROM PERSONSKILL PS1,
	PERSONSKILL PS2
WHERE PS1.PID < PS2.PID
	AND PS1.SKILL = PS2.SKILL;


\qecho 'Problem 6'
-- Find the ID, cname, and salary of each person who works for company which is located in Cupertino and who has the
-- next to lowest salary (i.e., the second lowest salary) at that company.
SELECT W.PID,
	W.CNAME,
	W.SALARY
FROM
	(SELECT *
		FROM WORKSFOR W
		EXCEPT SELECT *
		FROM WORKSFOR W2
		WHERE W2.SALARY <= ALL
				(SELECT W.SALARY
					FROM WORKSFOR W)) W
WHERE W.CNAME IN
		(SELECT CL.CNAME
			FROM COMPANYLOCATION CL
			WHERE CL.CITY = 'Cupertino')
	AND W.SALARY <= ALL
		(SELECT W.SALARY
			FROM WORKSFOR W
			EXCEPT SELECT W2.SALARY
			FROM WORKSFOR W2
			WHERE W2.SALARY <= ALL
					(SELECT W.SALARY
						FROM WORKSFOR W));


\qecho 'Problem 7'
-- Find the ID of managers having AI skill who is the manager for atleast 2 people
SELECT DISTINCT M1.MID
FROM
	(SELECT M.MID,
			M.EID
		FROM HASMANAGER M
		WHERE M.MID IN
				(SELECT PS.PID
					FROM PERSONSKILL PS
					WHERE PS.SKILL = 'AI')) M1,

	(SELECT M.MID,
			M.EID
		FROM HASMANAGER M
		WHERE M.MID IN
				(SELECT PS.PID
					FROM PERSONSKILL PS
					WHERE PS.SKILL = 'AI')) M2
WHERE M1.EID <> M2.EID
	AND M1.MID = M2.MID;


\qecho 'Problem 8'
-- For each company, list the company name having atleast 2 employees along with the 
-- least salary made by employees who work for it. (The query is expected to return the
-- company name and salary fields as output)
SELECT DISTINCT W1.CNAME,
	W1.SALARY
FROM WORKSFOR W1,
	WORKSFOR W2
WHERE W1.CNAME = W2.CNAME
	AND W1.PID <> W2.PID
	AND W1.SALARY <= ALL
		(SELECT W.SALARY
			FROM WORKSFOR W
			WHERE W1.CNAME = W.CNAME) ;

\qecho 'Problem 9'
-- Find the ID, name and city of each person who knows atleast one person who knows
-- another person making a salary of more than 65000
SELECT DISTINCT P.PID,
	P.PNAME,
	P.CITY
FROM PERSON P
WHERE EXISTS
		(SELECT K1.PID1
			FROM KNOWS K1
			WHERE P.PID = K1.PID1
				AND EXISTS
					(SELECT K2.PID1
						FROM KNOWS K2
						WHERE K1.PID2 = K2.PID1
							AND EXISTS
								(SELECT W.PID
									FROM WORKSFOR W
									WHERE K2.PID2 = W.PID
										AND W.SALARY > 65000 )));

\qecho 'Problem 10'
SELECT P.PID,
	P.PNAME,
	W.CNAME,
	W.SALARY
FROM PERSON P,
	WORKSFOR W,
	COMPANY C
WHERE P.PID = W.PID
	AND P.CITY = 'Bloomington'
	AND W.SALARY >= 40000
	AND W.CNAME = C.CNAME
	AND C.HEADQUARTER = 'Seattle';

\qecho 'Problem 11'
SELECT PS.PID
FROM PERSONSKILL PS,
	HASMANAGER HM,
	PERSON M
WHERE PS.SKILL = 'Programming'
	AND HM.EID = PS.PID
	AND HM.MID = M.PID
	AND M.PID IN
		(SELECT MS.PID
			FROM PERSONSKILL MS
			WHERE MS.PID = M.PID
				AND MS.SKILL <> 'Programming' );

\qecho 'Problem 12'
SELECT PS.SKILL
FROM PERSON P,
	PERSONSKILL PS
WHERE P.PID = PS.PID
	AND P.CITY <> 'Bloomington'
	AND P.PID IN
		(SELECT HM.EID
			FROM PERSON M,
				HASMANAGER HM
			WHERE HM.EID = P.PID
				AND HM.MID = M.PID
				AND M.CITY = 'Bloomington');

\qecho 'Problem 13'
SELECT M.PID,
	M.PNAME
FROM PERSON M
WHERE NOT EXISTS
		(SELECT 1
			FROM HASMANAGER HM
			WHERE HM.MID = M.PID
				AND NOT EXISTS
					(SELECT 1
						FROM PERSON E
						WHERE HM.EID = E.PID
							AND E.CITY = M.CITY));


\qecho 'Problem 18'
SELECT NOT EXISTS
	(SELECT 1
		FROM HASMANAGER M1,
			HASMANAGER M2
		WHERE M1.MID = M2.MID
			AND M1.EID = M2.EID ) AS managesatleast2;

\qecho 'Problem 19'
SELECT EXISTS
	(SELECT 1
		FROM PERSON P, WORKSFOR W
		WHERE P.PID = W.PID
			AND NOT EXISTS
				(SELECT 1
					FROM HASMANAGER M1, WORKSFOR W1
					WHERE M1.EID = P.PID
						AND M1.MID = W1.PID
						AND W1.SALARY <= W.SALARY )) AS constaintSatisfied;


\qecho 'Problem 20'
SELECT NOT EXISTS
	(SELECT 1
		FROM WORKSFOR W1,
			HASMANAGER M1,
			WORKSFOR W2
		WHERE W1.PID = M1.EID
			AND M1.MID = W2.PID
			AND W1.CNAME <> W2.CNAME) AS constaintSatisfied;


-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE laxmikantkabra;



