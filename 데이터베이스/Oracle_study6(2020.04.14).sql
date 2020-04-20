--[DELETE}: 테이블 내에 있는 데이터를 삭제하는 명령어, 기본키를 조건으로 사용해라
--DELETE FROM [테이블명] WHERE 조건
DELETE FROM DEPT2;

--[MERGE]
--MERGE INTO [대상테이블] USING [소스테이블] ON (조건(UPDATE))
--WHEN MATCHED THEN (UPDATE or DELETE)
--WHEN NOT MATCHED THEN INSERT

--예) T_EMP테이블에서 EMP테이블로 다음 정보를 저장하시오. 사원번회 777, 이름: SON 데이터를 삽입하시오.
MERGE
INTO T_EMP
USING DUAL
ON (T_EMP.EMPNO = 777)
WHEN MATCHED THEN
    UPDATE 
    SET T_EMP .ename = 'SHM'
WHEN NOT MATCHED THEN
    INSERT VALUES('777','SON','','','','','','');

--예) DEPT테이블에서 DEPT2테이블로 정보를 모두 저장하시오.
MERGE
INTO DEPT2 
USING DEPT 
ON (DEPT2.deptno = DEPT.deptno)
WHEN MATCHED THEN --> deptno가 같기 때문에 넘어온 조건이므로 dname과 loc만 수정함.
    UPDATE SET DEPT2.dname = dept.dname,
               DEPT2.LOC = DEPT.LOC
WHEN NOT MATCHED THEN
    INSERT VALUES (DEPT.deptno, DEPT.dname, DEPT.loc);
    
--[COMMIT, ROLLBACK]
DELETE FROM SALGADE2
WHERE GRADE = 5;

SAVEPOINT C1;

DELETE FROM SALGRADE2
WHERE GRADE = 4;

--[CREATE]
--CREATE TABLE [테이블명] (
--컬럼명1 컬럼타입 [제한조건],
--컬럼명2 컬럼타입 [제한조건],
--컬럼명3 컬럼타입 [제한조건],
--)
CREATE TABLE TEST (
TEST_ID CHAR(10),
TEST_DATA VARCHAR(10),
TEST_DATE DATE
);

--[서브쿼리를 활용한 CREATE] CREATE TABLE TEST [테이블명] AS(SUBQUERY);
CREATE TABLE TEST2
AS SELECT * FROM TEST WHERE 1=2;

--[DROP] 테이블 삭제할 때 사용! DELETE TABLE [테이블명];
DROP TABLE TEST;
DROP TABLE TEST2;

--[ALTER] 
--테이블 이름 변경: RENAME [이전테이블명] TO [테이블명]
RENAME ACCOUNT TO ACC;

--테이블 컬럼명 변경: ALTER TABLE [테이블명] RENAME COLUMN [변경 전 컬럼명] TO [변경 후 컬럼명]
ALTER TABLE ACC
RENAME COLUMN account_no TO acc_no;

--테이블 컬럼타입 변경: ALTER TABLE[테이블] MODIFY [컬럼명][타입];
ALTER TABLE ACC
MODIFY acc_no CHAR(4);

--테이블 컬럼 추가: ALTER TABLE [테이블 명] ADD ([컬럼명][타입])
ALTER TABLE ACC
ADD (NO NUMBER(4));

--테이블 컬럼 삭제: ALTER TABLE[테이블명] DROP COLUMN[컬럼명]
ALTER TABLE ACC DROP COLUMN NO;

--[제약조건]: NOT NULL, UNIQUE, CHECK, DEFAULT, PRIMARY KEY, FOREIGN KEY
--메모장 보고 수정 필요. NOT NULL
CREATE TABLE STUDENT_1 (
stu_no CHAR(9),
CONSTRAINT n_stu_no NOT NULL,
stu_name CHAR(20) NOT NULL);


CREATE TABLE STUDENT_2 (
stu_no CHAR(9),
CONSTRAINT n_stu_no NOT NULL,
stu_name CHAR(20) NOT NULL);

--CHECK
CREATE TABLE STUDENT_3 (
stu_no NUMBER(9),
stu_name CHAR(20)

CONSTRAINT c_stu_name NOT NULL,
stu_name CHAR(20) NOT NULL );

--PRIMARY KEY
CREATE TABLE STUDENT_5(
stu_no NUMBER(9)
);

--FOREIGN KEY
CREATE TABLE EMP_1
AS SELECT * FROM EMP;

CREATE TABLE DEPT_1
AS SELECT * FROM DEPT;

CREATE TABLE EMP_1(
empno CHAR(3),
ename CHAR(10),
deptno NUMBER(2,0),
CONSTRAINT FK_DEPTNO FOREIGN KEY(deptno) REFERENCES DEPT_1(deptno)
);
----------------------------
--문1) T_EMP 테이블에서 사원번호가 7902번 사원번호를 삭제하시오
DELETE FROM T_EMP WHERE emptno = 7902;

--문2) 평균급여보다 적게 받는 사원을 모두 삭제하시오.
DELETE FROM T_EMP WHERE sal < (SELECT AVG(sal)
                               FROM T_EMP);

--문3) T_EMP 테이블의 모든 정보를 삭제하시오.
DELETE FROM T_EMP;

--문4) S_EMP에 다음 정보를 입력하시오. 사원번호: 7902, 이름: PARK, 월급: 2000
--데이터가 존재하면 UPDATE하고 데이터가 존재하지 않으면 INSERT 하시오.
CREATE TABLE S_EMP
AS SELECT * FROM EMP WHERE empno = 7902;

MERGE
INTO S_EMP
USING DUAL
ON (S_EMP.empno = 7902)
WHEN MATCHED THEN
    UPDATE SET S_EMP.ename = 'PARK', S_EMP.sal = 2000
WHEN NOT MATCHED THEN
    INSERT (empno, ename, sal) VALUES (7902, 'PARK', 2000);
    
MERGE
INTO S_EMP
USING EMP
ON (S_EMP.empno = EMP.empno)
WHEN MATCHED THEN
    UPDATE SET S_EMP.ename = 'PARK', S_EMP.sal = 2000
WHEN NOT MATCHED THEN
    INSERT (empno, ename, sal) VALUES (7902, 'PARK', 2000)
    WHERE EMP.EMPNO = 7902;

--문5) STUDENT 테이블에서 컴퓨터정보 1,2학년이면 몸무게를 10KG씩 증가시키고, 컴퓨터정보
--     3학년 학생이면 몸무게 20KG을 증가시켜 T_STUDENT 테이블에 저장하시오.
CREATE TABLE T_STUDENT
AS SELECT * FROM STUDENT WHERE 1=2; --> 항상틀리기 때문에 type만 생김.

MERGE
INTO T_STUDENT A
USING (SELECT * FROM STUDENT WHERE stu_dept = '컴퓨터정보') B    
ON (A.stu_no = B.stu_grade)
WHEN MATCHED THEN
    UPDATE SET A.stu_weight = B.stu_weight + DECODE(B.stu_grade, 1, 10, 2, 10, 3, 20)
WHEN NOT MATCHED THEN
    INSERT (A.stu_no, A.stu_name, A.stu_dept, A.stu_grade,
            A.stu_class, A.stu_gender, A.stu_height, A.stu_weight)
    VALUES (B.stu_no, B.stu_name, B.stu_dept, B.stu_grade,
            B.stu_class, B.stu_gender, B.stu_height,B.stu_weight  + DECODE(stu_grade, 1, 10, 2, 10, 3, 20));

--문6)ACCOUNT 테이블을 생성하시오. account_no: 수자 4자리, account_date: 날짜, code: 가변문자 14자리
--withdrawer: 숫자 8자리, deposit: 숫자10자리, balance: 숫자12자리, branch_code: 문자8자리
CREATE TABLE ACCOUNT (
    account_no NUMBER(4),
    account_date DATE,
    code VARCHAR(14),
    withdrawer NUMBER(8),
    deposit NUMBER(10),
    balance NUMBER(12),
    branch_code CHAR(8)
);

--문7) NIKE테이블을 만드시오. 
CREATE TABLE NIKE (
    id CHAR(10) PRIMARY KEY,
    style CHAR(20) UNIQUE,
    color VARCHAR(20),
    owner VARCHAR(20),
    c_size CHAR(3) CONSTRAINT c_c_size CHECK(c_size IN('XS','S','M','L','XL','XXL')),
    gender CHAR(1) CONSTRAINT c_gender CHECK(gender IN('F','M')),
    count NUMBER CONSTRAINT check3 CHECK(count BETWEEN 1 AND 9999),
    m_date DATE DEFAULT SYSDATE
); 