--SET 함수 UNION(합집합), UNIONALL(합집합, 중복포함), INTERSECT(교집합), MINUS (차집합)
SELECT * FROM EMP
WHERE deptno IN (10, 20)
UNION
SELECT * FROM EMP
WHERE deptno IN (10, 30);

SELECT * FROM EMP
WHERE deptno IN (10, 20)
UNION ALL
SELECT * FROM EMP
WHERE deptno IN (10, 30);

SELECT * FROM EMP
WHERE deptno IN (10, 20)
INTERSECT
SELECT * FROM EMP
WHERE deptno IN (10, 30);

SELECT * FROM EMP
WHERE deptno IN (10, 20)
MINUS
SELECT * FROM EMP
WHERE deptno IN (10, 30);

--CREATE TABLE [테이블명] AS (SUBQUERY)
--예1) 
CREATE TABLE EMP2 AS (SELECT * FROM EMP);

CREATE TABLE SALGRADE2 AS (SELECT * FROM SALGRADE);

CREATE TABLE DEPT2 AS (SELECT * FROM DEPT);

INSERT INTO EMP2 VALUES (1111, 'MINJE', 'CLERK', 7839, SYSDATE, 1500,200,10);

--[UPDATE] 
--UPDATE [테이블명] SET [값 할당]  WHERE[조건]
--예2) 손의 sal을 30000으로 변경하시오.
UPDATE T_EMP
SET SAL = 30000
WHERE ENAME = 'SON';



--------------------------------
--문1) 전기전자과인 학생들과 컴퓨터정보과인 학생들의 전체정보를 나타내시오.
SELECT *
FROM STUDENT
WHERE stu_dept = '전기전자'
UNION 
SELECT *
FROM STUDENT
WHERE stu_dept = '컴퓨터정보';

--문2) 전체 학생 정보에서 1학년 학생 정보를 제외하고 전체정보를 출력하시오.
SELECT *
FROM STUDENT
MINUS
SELECT *
FROM STUDENT
WHERE stu_grade = 1;

--문3) 전체 학생정보에서 기계과이면서 1학년생인 정보를 출력하시오.
SELECT *
FROM STUDENT
WHERE stu_dept = '기계'
INTERSECT
SELECT *
FROM STUDENT
WHERE stu_grade = '1';

--문4) SALESMAN이지만, 보너스를 받지 않는 사원의 정보를 모두 출력하시오.
SELECT *
FROM EMP
WHERE job = 'SALESMAN'
AND COMM IS NULL;

SELECT * FROM EMP WHERE JOB = 'SALESMAN'
INTERSECT
SELECT * FROM EMP WHERE COMM IS NULL;

SELECT * FROM EMP WHERE JOB = 'SALESMAN'
MINUS
SELECT * FROM EMP WHERE COMM IS NOT NULL;

--문5) 컴퓨터정보과의 최소 신장과 각 학과 최소신장을 가진 학생을 비교하여,
--     컴퓨터정보과 최소신장보다 큰 학과의 학과명, 최소신장을 출력하시오.
SELECT stu_dept, MIN(stu_height)
FROM STUDENT
GROUP BY stu_dept
HAVING MIN(stu_height) > (SELECT MIN(stu_height)
                          FROM STUDENT 
                          GROUP BY stu_dept
                          HAVING stu_dept = '컴퓨터정보');
                          
--문6) 학번, 학과명, 키, 학생이 소속된 과의 평균키를 출력하시오.
SELECT stu_no, stu_dept, stu_height, 학과평균키
FROM STUDENT NATURAL JOIN (SELECT stu_dept, ROUND(AVG(stu_height))AS 학과평균키
                           FROM STUDENT
                           GROUP BY stu_dept);

SELECT STUDENT.stu_no, STUDENT.stu_dept, STUDENT.stu_height, DEPT_AVG_HEIGHT.학과평균키
FROM STUDENT, (SELECT stu_dept, ROUND(AVG(stu_height))AS 학과평균키
               FROM STUDENT
               GROUP BY stu_dept) DEPT_AVG_HEIGHT
WHERE STUDENT.stu_dept = DEPT_AVG_HEIGHT.stu_dept;
               
--문7) 컴퓨터 개론과 시스템 분석설계 과목을 동시에 수강하는 학번, 이름을 학번순으로 검색하시오.
SELECT stu_no, stu_name
FROM ENROL JOIN STUDENT USING (stu_no)  --(101) 20131001ㅡ20131025
           JOIN SUBJECT USING (sub_no)
WHERE sub_name = '컴퓨터개론'
INTERSECT 
SELECT stu_no, stu_name
FROM ENROL JOIN STUDENT USING (stu_no)  --(104) 20131001ㅡ20131025
           JOIN SUBJECT USING (sub_no)
WHERE sub_name = '시스템분석설계';

--문8) T_EMP 테이블을 만들고, 'SMITH'를 제외한 모든 사원의 정보를 입력하시오.
CREATE TABLE T_EMP AS (SELECT * FROM EMP WHERE ename != 'SMITH');
CREATE TABLE T_EMP AS (SELECT * FROM EMP WHERE 1=0);
INSERT INTO T_EMP SELECT * FROM EMP WHERE ename != 'SMITH';

--문9)T_EMP 테이블에 아래 정보를 입력하시오. 이름: SON, 월급: 20000, 보너스: 20%, 사원번호 777 
INSERT INTO T_EMP(ename, sal, comm, empno)  
VALUES ('SON', 20000, (20000*0.2),777);

--문10) T_EMP 테이블에 사원번호 9999, 사원이름 KITRI를 입력하시오.
INSERT INTO T_EMP(empno, ename) 
VALUES (9999, 'KITRI');

--문11) 사원번호 7323, 사원이름 MICHAEL, 부서번호 30, 월급은 사원번호 7499와 동일한 조건으로 새로운 사원이 입사하였따.
INSERT INTO T_EMP(empno, ename, sal, deptno)
VALUES (7323, 'MICHAEL', (SELECT sal
                          FROM T_EMP
                          WHERE empno = 7499),  30); 

--문12) SON의 보너스를 10%인상하시오. 그리고, 입사일을 오늘로 변경하시오.
UPDATE T_EMP
SET comm = comm + (comm*0.1), hiredate = SYSDATE
WHERE ename = 'SON';

--문13) SON보다 적게 월급을 받는 사원의 월급을 10% 인상하시오.
UPDATE T_EMP
SET sal = sal + (sal*0.1)
WHERE sal < (SELECT sal
             FROM T_EMP
             WHERE ename = 'SON');

--문14) COMM이 NULL값인 모든 사원의 COMM을 0으로 변경하시오.
UPDATE T_EMP
SET comm = 0
WHERE comm IS NULL;

--문15) 월급 등급이 3인 직원의 월급을 15%인상하여 저장하시오.
--문16) DALLAS에서 일하는 직원들의 COMM을 100씩 추가하시오.
--문17) SCOTT의 상급자를 BLAKE로 변경하시오.
