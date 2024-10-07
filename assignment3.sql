
CREATE DATABASE laxmikantkabra;

\c laxmikantkabra;


DROP SCHEMA PUBLIC CASCADE;


CREATE SCHEMA PUBLIC;

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
   ('Databases'),
   ('WebDevelopment');

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
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1003,'WebDevelopment');

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1007, 1017),
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
 (1012,1001),
 (1014,1001),
 (1018,1001);

\qecho 'Problem 5' 
/*
Find the cname and headquarter of each company that employs
persons residing in Cupertino and earning more than 40000.

select c.cname, c.headquarter
from company c
where c.cname in (select w.cname
from worksfor w
where w.salary > 40000 and
w.pid = SOME (select p.pid
from person p
where p.city = "Cupertino"));

Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step. */
-- given query
SELECT C.CNAME,
	C.HEADQUARTER
FROM COMPANY C
WHERE C.CNAME IN
		(SELECT W.CNAME
			FROM WORKSFOR W
			WHERE W.SALARY > 40000
				AND W.PID = SOME
					(SELECT P.PID
						FROM PERSON P
						WHERE P.CITY = 'Cupertino'));


-- removing SOME
SELECT C.CNAME,
	C.HEADQUARTER
FROM COMPANY C
WHERE C.CNAME IN
	((SELECT W.CNAME
		FROM WORKSFOR W
		WHERE W.SALARY > 40000) 
 	INTERSECT
	(SELECT W.CNAME
		FROM WORKSFOR W
		WHERE W.PID IN
				(SELECT P.PID
					FROM PERSON P
					WHERE P.CITY = 'Cupertino')));
					
-- removing IN
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM
	((SELECT W.CNAME, C.HEADQUARTER 
		FROM WORKSFOR W, COMPANY C
		WHERE W.SALARY > 40000 AND W.CNAME = C.CNAME) 
 	INTERSECT
	(SELECT W.CNAME , C.HEADQUARTER
		FROM WORKSFOR W , COMPANY C , PERSON P
		WHERE W.PID = P.PID AND P.CITY = 'Cupertino')) Q;

-- replacing commas with joins
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM 
	((SELECT W.CNAME,
			C.HEADQUARTER
		FROM WORKSFOR W
		JOIN COMPANY C ON W.CNAME = C.CNAME
		WHERE W.SALARY > 40000) INTERSECT
	(SELECT W.CNAME,
			C.HEADQUARTER
		FROM COMPANY C
		JOIN WORKSFOR W ON C.CNAME = W.CNAME
		JOIN PERSON P ON W.PID = P.PID
		WHERE P.CITY = 'Cupertino' )) Q;

-- adding selections into joins
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM 
	((SELECT W.CNAME,
			C.HEADQUARTER
		FROM (SELECT W.CNAME
			 FROM WORKSFOR W
			 WHERE W.SALARY > 40000) W
		JOIN COMPANY C ON W.CNAME = C.CNAME )
	INTERSECT
	(SELECT W.CNAME,
			C.HEADQUARTER
		FROM COMPANY C
		JOIN WORKSFOR W ON C.CNAME = W.CNAME
		JOIN (SELECT P.PID
			  FROM PERSON P
			 WHERE P.CITY = 'Cupertino') P ON W.PID = P.PID
)) Q;



\qecho 'Problem 6';
/*
Find the cname and headquarter of each company (1) that has
at least one employee, and (2) doesn’t have any employees who
earn $50,000 or more but are missing either the ’Programming’
or ’Networks’ skills.

 
A possible way to write this query in Pure SQL is

select c.cname, c.headquarter
from company c
where exists (select 1
               from worksfor w
               where w.cname = c.cname)
and not exists (select 1
               from worksfor w
               where w.cname = c.cname
               and w.salary >= 50000
               and (w.pid not in (select ps.pid
                                   from personskill ps
                                   where skill = 'Programming')
               or w.pid not in (select ps.pid
                                   from personskill ps
                                   where skill = 'Networks')));

Translate the Pure SQL query to RA SQL using the trans-
lation algorithm step-by-step.
*/ 

-- removing exists and not exists
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM
	(SELECT C.*
		FROM WORKSFOR W,
			COMPANY C
		WHERE W.CNAME = C.CNAME
		EXCEPT ((SELECT DISTINCT C.*
				FROM WORKSFOR W,
					COMPANY C
				WHERE W.CNAME = C.CNAME
					AND W.SALARY >= 50000)
				INTERSECT
				(SELECT DISTINCT C.*
				FROM WORKSFOR W,
					COMPANY C
				WHERE W.CNAME = C.CNAME
					AND W.PID NOT IN
						(SELECT PS.PID
							FROM PERSONSKILL PS
							WHERE SKILL = 'Programming')
				UNION
				SELECT C.*
				FROM WORKSFOR W,
					COMPANY C
				WHERE W.CNAME = C.CNAME
					AND W.PID NOT IN
						(SELECT PS.PID
						FROM PERSONSKILL PS
						WHERE SKILL = 'Networks')))) AS Q;
			
-- removing not in
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM (SELECT  C.*
			FROM WORKSFOR W ,  COMPANY C
			WHERE W.CNAME = C.CNAME 
		EXCEPT
		  ((SELECT distinct C.*
			FROM WORKSFOR W , COMPANY C
			WHERE W.CNAME = C.CNAME
				AND W.SALARY >= 50000)
INTERSECT
((SELECT DISTINCT C1.CCNAME,
		C1.HQ
	FROM
		(SELECT C.CNAME AS CCNAME,
				C.HEADQUARTER AS HQ,
				W.PID AS W1
			FROM WORKSFOR W,
				COMPANY C
			WHERE W.CNAME = C.CNAME
			EXCEPT SELECT C.CNAME AS CCNAME,
				C.HEADQUARTER AS HQ,
				PS.PID AS W1
			FROM PERSONSKILL PS,
				COMPANY C
			WHERE PS.SKILL = 'Networks') AS C1)
UNION 
(SELECT DISTINCT C1.CCNAME,
		C1.HQ
	FROM
		(SELECT C.CNAME AS CCNAME,
				C.HEADQUARTER AS HQ,
				W.PID AS W1
			FROM WORKSFOR W,
				COMPANY C
			WHERE W.CNAME = C.CNAME
			EXCEPT SELECT C.CNAME AS CCNAME,
				C.HEADQUARTER AS HQ,
				PS.PID AS W1
			FROM PERSONSKILL PS,
				COMPANY C
			WHERE PS.SKILL = 'Programming') AS C1)))) AS Q;

-- converting commas to joins and pushing selections
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM (SELECT  C.*
		FROM WORKSFOR W JOIN COMPANY C
	  	ON W.CNAME = C.CNAME 
		EXCEPT
		  ((SELECT DISTINCT C.*
			FROM (SELECT W.CNAME
				 FROM WORKSFOR W
				 WHERE W.SALARY >= 50000) W
			JOIN COMPANY C ON W.CNAME = C.CNAME
			)
		INTERSECT
		((SELECT DISTINCT C1.CCNAME,
				C1.HQ
			FROM
				(SELECT C.CNAME AS CCNAME,
						C.HEADQUARTER AS HQ,
						W.PID AS W1
				FROM WORKSFOR W JOIN COMPANY C ON W.CNAME = C.CNAME
				EXCEPT 
				 SELECT C.CNAME AS CCNAME,
						C.HEADQUARTER AS HQ,
						PS.PID AS W1
					FROM (SELECT PS.PID
						 FROM PERSONSKILL PS
						 WHERE PS.SKILL = 'Networks') PS
				 CROSS JOIN COMPANY C
					) AS C1)
		UNION 
		(SELECT DISTINCT C1.CCNAME,
				C1.HQ
			FROM
				(SELECT C.CNAME AS CCNAME,
						C.HEADQUARTER AS HQ,
						W.PID AS W1
				FROM WORKSFOR W JOIN COMPANY C
				ON W.CNAME = C.CNAME
				EXCEPT
				SELECT C.CNAME AS CCNAME,
					C.HEADQUARTER AS HQ,
					PS.PID AS W1
				FROM (SELECT PS.PID
					 FROM PERSONSKILL PS
					 WHERE PS.SKILL = 'Programming') PS CROSS JOIN
					COMPANY C) AS C1)))) AS Q;

\qecho 'Problem 7';
/*
Find the pid and city of each person who does not know anyone
working for 'Amazon'.
• Formulate this query in Pure SQL.
• Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ -- Pure SQL

-- given query
SELECT P.PID,
	P.CITY
FROM PERSON P
WHERE FALSE = ALL
		(SELECT EXISTS
				(SELECT 1
					FROM WORKSFOR W
					WHERE P1.PID = W.PID
						AND W.CNAME = 'Amazon')
			AND (P.PID,
									P1.PID) = SOME
				(SELECT K.PID1,
						K.PID2
					FROM KNOWS K)
			FROM PERSON P1);

-- removing some
SELECT P.PID,
	P.CITY
FROM PERSON P
WHERE FALSE = ALL
		(SELECT EXISTS
				(SELECT 1
					FROM WORKSFOR W,
						KNOWS K
					WHERE P1.PID = W.PID
						AND W.CNAME = 'Amazon'
						AND (P.PID,P1.PID) =(K.PID1,K.PID2))
			FROM PERSON P1);

-- removing all
select p.pid, p.city
from person p
except
select p.pid, p.city
from person p, person p1
where EXISTS
				(SELECT 1
					FROM WORKSFOR W,
						KNOWS K
					WHERE P1.PID = W.PID
						AND W.CNAME = 'Amazon'
						AND P.PID=K.PID1 AND P1.PID=K.PID2
				);

-- removing exists and converting commas to joins and pushing selections
SELECT P.PID,
	P.CITY
FROM PERSON P
EXCEPT
SELECT P.PID,
	P.CITY
FROM PERSON P
JOIN KNOWS K ON (P.PID = K.PID1)
JOIN PERSON P1 ON (P1.PID = K.PID2)
JOIN
	(SELECT W.*
		FROM WORKSFOR W
		WHERE W.CNAME = 'Amazon') W ON (P1.PID = W.PID)
ORDER BY 1;

\qecho 'Problem 8'; 
/*
Find the cname of each company that (1) is not located in Sunnyvale, (2) employs at least one person and (3) whose workers
who make strictly less 70000 neither have the programming skill
nor the AI skill.
• Formulate this query in Pure SQL.
• Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ -- Pure SQL
--eliminated the not exists 
SELECT DISTINCT C.CNAME
FROM COMPANY C,
	WORKSFOR W,
	COMPANYLOCATION CL
WHERE C.CNAME = W.CNAME
	AND W.CNAME = CL.CNAME
	AND CL.CITY <> 'Sunnyvale'
	AND TRUE = ALL
		(SELECT P.PID NOT IN
				(SELECT PS.PID
					FROM PERSONSKILL PS
					WHERE PS.SKILL = 'Programming'
						OR PS.SKILL = 'AI')
			FROM PERSON P
			WHERE P.PID IN
					(SELECT W.PID
						FROM WORKSFOR W
						WHERE W.CNAME = C.CNAME
							AND W.SALARY < 70000));
-- remove all
SELECT DISTINCT C.CNAME
FROM COMPANY C,
	WORKSFOR W,
	COMPANYLOCATION CL
WHERE W.CNAME = C.CNAME
	AND W.CNAME = CL.CNAME
	AND CL.CITY <> 'Sunnyvale'
EXCEPT
	(SELECT DISTINCT C.CNAME
		FROM COMPANY C,
			WORKSFOR W,
			PERSON P
		WHERE C.CNAME = W.CNAME
			AND P.PID = W.PID) INTERSECT
	(SELECT DISTINCT C.CNAME
		FROM COMPANY C,
			WORKSFOR W,
			PERSON P,
			PERSONSKILL PS
		WHERE P.PID = W.PID
			AND C.CNAME = W.CNAME
			AND PS.PID = P.PID
			AND PS.SKILL = 'Programming'
			OR PS.SKILL = 'AI'
			AND W.SALARY > 70000);
	
-- adding joins
SELECT DISTINCT C.CNAME
FROM COMPANY C
JOIN WORKSFOR W ON W.CNAME = C.CNAME
JOIN COMPANYLOCATION CL ON W.CNAME = CL.CNAME
WHERE CL.CITY <> 'Sunnyvale'
EXCEPT
SELECT DISTINCT C.CNAME
FROM COMPANY C
JOIN WORKSFOR W ON C.CNAME = W.CNAME
JOIN PERSON P ON P.PID = W.PID INTERSECT
SELECT DISTINCT C.CNAME
FROM COMPANY C
JOIN WORKSFOR W ON C.CNAME = W.CNAME
JOIN PERSON P ON P.PID = W.PID
JOIN PERSONSKILL PS ON PS.PID = P.PID
WHERE PS.SKILL = 'Programming'
	OR PS.SKILL = 'AI'
	AND W.SALARY > 70000;

-- PUSHING SELECTIONS TO FROM CLAUSE
SELECT DISTINCT C.CNAME
FROM COMPANY C
JOIN WORKSFOR W ON W.CNAME = C.CNAME
JOIN
	(SELECT CL.CNAME
		FROM COMPANYLOCATION CL
		WHERE CL.CITY <> 'Sunnyvale') CL ON W.CNAME = CL.CNAME
EXCEPT
SELECT DISTINCT C.CNAME
FROM COMPANY C
JOIN WORKSFOR W ON C.CNAME = W.CNAME
JOIN PERSON P ON P.PID = W.PID INTERSECT
SELECT DISTINCT C.CNAME
FROM COMPANY C
JOIN
	(SELECT W.CNAME, W.PID
		FROM WORKSFOR W
		WHERE W.SALARY > 70000) W ON C.CNAME = W.CNAME
JOIN PERSON P ON P.PID = W.PID
JOIN
	(SELECT PS.PID
		FROM PERSONSKILL PS
		WHERE PS.SKILL = 'Programming'
			OR PS.SKILL = 'AI')PS ON PS.PID = P.PID;

\qecho 'Problem 9'; 
/*
Find the ID of managers with AI skill who are managing atleast
2 people

• Formulate this query in Pure SQL.
• Translate the Pure SQL query to RA SQL using the trans-
lation algorithm step-by-step.
*/ -- Pure SQL

-- removing joins and adding commas
SELECT DISTINCT PS.PID
FROM PERSONSKILL PS
JOIN HASMANAGER HM ON PS.PID = HM.MID
JOIN HASMANAGER HM1 ON HM1.MID = HM.MID
AND HM.EID <> HM1.EID
WHERE PS.SKILL = 'AI';
		
		
-- pushing condition into from clause
SELECT DISTINCT Q.MID AS PID
FROM
	(SELECT HM.MID
	 FROM (SELECT PS.PID
		   FROM PERSONSKILL PS
		   WHERE PS.SKILL = 'AI') PS
	 JOIN HASMANAGER HM ON PS.PID = HM.MID
	 JOIN HASMANAGER HM1 ON HM1.MID = HM.MID
	 AND HM.EID <> HM1.EID) AS Q;



\c postgres;


DROP DATABASE laxmikantkabra;