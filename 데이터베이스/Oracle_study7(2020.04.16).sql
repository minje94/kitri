--[제약조건 추가, 변경, 삭제] --> 하루종일 조느라.... 다 못적었다. 메모잡보고 수정해라.
--제약조건을 추가, 삭제 등 작업을 하려면 데이터가 없을 때 하는 것이 편하다!
CREATE TABLE ADIDAS
AS SELECT * FROM NIKE
WHERE 1=2;

--CHECK, UNIQUE, PKm FK (추가)
--ALTER TABLE[테이블명] ADD CONSTRANINT [제약조건이름] CHECK (조건문);
CREATE TABLE ADIDAS CHECK (COUNT BETWEEN 1 AND 9999);

--ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건이름] UNIQUE (컬럼명);
ALTER TABLE ADIDAS ADD CONSTRAINT pk_id PRIMARY KEY(id);

--ALTER TABLE[테이블명] ADD CONSTRANINT [제약조건이름] PRIMARY KEY ([컬럼명]);
ALTER TABLE ADIDAS ADD CONSTRAINT pk_id PRIMARY KEY(id);

--ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건이름] FOREIGN KEY [기준 테이블 컬럼명] REFERENCE [연결 테이블명]([컬럼명]);
--deptno가 기본키이어야한다.
ALTER TABLE DEPT_1
ADD CONSTRAINT PK_DEPT_1
PRIMARY KEY (deptno);

ALTER TABLE EMP_1
ADD CONSTRAINT FK_DEPT_1
FOREIGN KEY (deptno) REFERENCES DEPT_1(depeno);

--(not null은 변경) [ALTER] ALTER TABLE [테이블명] MODIFY [컬럼명] NOT NULL;
ALTER TABLE ADIDAS MODIFY ID NOT NULL;

--(삭제) ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건이름];
ALTER TABLE ADIDAS DROP CONSTRAINT U_ID;

--[VIEW]
--예) 사원이름, 사원이 근무하는 위치의 뷰를 만들어라.
CREATE VIEW v_ename_loc
AS SELECT ename, loc
   FROM EMP,DEPT    
   WHERE EMP.deptno = DEPT.deptno;

--뷰 확인하기.
SELECT * FROM V_ENAME_LOC;

--[INDEX]
-- CREATE INDEX [INDEX명] ON [테이블명] ([컬럼명]);
CREATE INDEX I_EMP ON EMP(ENAME);

--[SEQUENCE] 
CREATE SEQUENCE SEQ_VALUE
START WITH 1
INCREMENT BY 1
MAXVALUE 100;

--예) 
INSERT INTO EMP(EMPNO, ENAME)
VALUES (SEQ_VALUE.NEXTVAL, 'YEO');

DROP SEQUENCE SEQ_VALUE;

--[TOP-N]
--예) 수입이 가장 많은 상위 3명의 직원번호, 수입을 표시하시오.
SELECT *
FROM (SELECT EMPNO, NVL(SAL,0)
      FROM EMP
      ORDER BY 2 DESC)
WHERE ROWNUM <=3;


------------------------------------------

--문1) 외국인 학생 테이블(fore_student)작성시에 오류가 발생하였다. 외국인 학생 MAKE를 student 테이블에 추가합니다.
--     외국인 학생들의 클래스는 모두 A반으로 변경하고 추가된 MAKE를 fore_student에 저장하시오.

CREATE TABLE FORE_STUDENT 
AS  SELECT * FROM STUDENT WHERE stu_grade = 1;

INSERT INTO STUDENT(stu_no, stu_name, stu_grade) VALUES (1111, 'MAKE', 1);

MERGE
INTO FORE_STUDENT
USING STUDENT
ON (FORE_STUDENT.stu_no = STUDENT.stu_no)
WHEN MATCHED THEN
    UPDATE SET stu_class = 'A'
WHEN NOT MATCHED THEN
    INSERT (FORE_STUDENT.stu_no, FORE_STUDENT.stu_name, FORE_STUDENT.stu_grade) 
    VALUES (STUDENT.stu_no, STUDENT.stu_name, STUDENT.stu_grade)
    WHERE STUDENT.stu_grade = 1;
    
MERGE
INTO FORE_STUDENT f
USING (SELECT * FROM STUDENT WHERE stu_grade = 1) s
ON (f.stu_no = st.stu_no)
WHEN MATCHED THEN
    UPDATE SET stu_class = 'A'
WHEN NOT MATCHED THEN
    INSERT (f.stu_no, f.stu_name, f.stu_grade) 
    VALUES (s.stu_no, s.stu_name, s.stu_grade)
    WHERE s.stu_grade = 1;    
    
--문제2) adidas2 테이블을 만드시오.
CREATE TABLE ADIDAS2 (
    id CHAR(10) PRIMARY KEY,
    style VARCHAR(10) UNIQUE,
    color VARCHAR(20) NOT NULL,
    owner CHAR(10),
    c_size CHAR(3),
    CONSTRAINT adidas2_c_size CHECK(c_size IN ('XS','S','M','L','XL','XXL')),
    gender CHAR(1),
    CONSTRAINT adidas2_gender CHECK (gender IN ('F', 'M')),
    count NUMBER,
    n_date DATE DEFAULT SYSDATE
);

ALTER TABLE ADIDAS2 MODIFY owner NOT NULL;
ALTER TABLE ADIDAS2 DROP CONSTRAINT adidas2_c_size;
ALTER TABLE ADIDAS ADD CONSTRAINTS adidas2_count CHECK (count BETWEEN 0 AND 1000); 

CREATE TABLE ADIDAS2 (
    id CHAR(10) CONSTRAINT PK_ADIDAS2 PRIMARY KEY, --> PRIMARY KEY는 pk
    style VARCHAR(10) CONSTRAINT U_STYLE UNIQUE, --> UNIQUE는 U
    color VARCHAR(20) NOT NULL,
    owner CHAR(10),
    c_size CHAR(3) CONSTRAINT CK_c_size CHECK(c_size IN ('XS','S','M','L','XL','XXL')), --> CHECK는 CK
    gender CHAR(1) CONSTRAINT CK_GENDER CHECK(gender IN ('F', 'M')),
    count NUMBER,
    n_date DATE DEFAULT SYSDATE
);

ALTER TABLE ADIDAS2 MODIFY owner CONSTRAINT NN_owner NOT NULL; --> NOT NULL은 NN
ALTER TABLE ADIDAS2 DROP CONSTRAINT CK_c_size;
ALTER TABLE ADIDAS ADD CONSTRAINTS CK_count CHECK (count BETWEEN 0 AND 1000); 

--문제3) EMP 테이블로부터 10, 20번 부서의 사원들로 이루어진 뷰를 만드시오.
CREATE VIEW V_EMP_1020 
AS SELECT *
   FROM EMP
   WHERE deptno IN (10,20);

--문제4) 사원번호, 사원이름, 부서이름, 상급자이름을 구성되는 뷰를 만드시오.
CREATE VIEW V_EMP_SMALL
AS SELECT e1.empno, e1.ename, d.dname, e2.ename 
   FROM EMP e1, EMP e2, DEPT d
   WHERE e1.mgr = e2.empno
   AND e1.deptno = dept.deptno;
   
CREATE OR REPLACE VIEW V_EMP_MGR(empno, ename, dname, mgr_name)
AS SELECT e1.empno, e1.ename, dept.dname, e2.ename
   FROM EMP e1, EMP e2, DEPT
   WHERE e1.mgr = e2.empno 
   AND e1.deptno = dept.deptno;
   
--문제5) 학과별 평균 몸무게와 평균 키를 가지는 뷰를 만드시오.
CREATE OR REPLACE VIEW V_DEPT_AVG (stu_dept, avg_stu_weight, avg_stu_height)
AS SELECT stu_dept, ROUND(AVG(stu_weight)),ROUND(AVG(stu_height))
   FROM STUDENT
   GROUP BY stu_dept;

--문제6) 학생이름, 키, 몸무게, BMI지수를 가지는 뷰를 만드시오/
CREATE OR REPLACE VIEW V_STUDENT (stu_name, stu_height, stu_weight, BMI)
AS SELECT stu_name, stu_height, stu_weight, ROUND(stu_weight / POWER(stu_height,2) * 10000)
   FROM STUDENT;

--문제7) 사원번호, 이름, 급여, 커미션, 전체수입(급여 + 커미션)을 가지는 뷰를 만드시오.
CREATE OR REPLACE VIEW V_EMP(empno, ename, comm, sumSal)
AS SELECT empno, ename, NVL(comm, 0), (sal+NVL(comm,0))
   FROM EMP;

--문제8) 초깃값 100, 증감값 -1, 최소값 0 CYCLE이 가능한 시쿼스를 만드시오.
CREATE SEQUENCE SEQ_INIT
INCREMENT BY -1
START WITH 100
MINVALUE 0
MAXVALUE 100
CYCLE;

CREATE SEQUENCE SEQ_VALUE
START WITH 1
INCREMENT BY 1
MAXVALUE 100;

--문제7) BMI크기가 상위 5명인 이름, 학번, BMI지수를 출력하시오.
SELECT *
FROM (SELECT stu_name, stu_no, NVL(ROUND(stu_weight*10000 / POWER(stu_height,2)),0) AS BMI
      FROM STUDENT
      ORDER BY 3 DESC)
WHERE ROWNUM <=5;

SELECT stu_name, bmi
FROM (SELECT stu_name, BMI
      FROM V_STUDENT
      WHERE bmi IS NOT NULL
      ORDER BY 2 DESC)BMI_ORDER
WHERE ROWNUM <=5;

--문제8) 부서별 평균 급여가 작은 부서 2개의 부서명, 평균 급여를 출력하시오.
SELECT *
FROM (SELECT dname, ROUND(AVG(sal))
      FROM DEPT JOIN EMP USING (deptno) 
      GROUP BY dname
      ORDER BY 2)
WHERE ROWNUM <=2;

SELECT DEPT.dname, DEPT_AVG.avg_sal
FROM (SELECT deptno,ROUND(AVG(sal)) avg_sal
      FROM EMP 
      GROUP BY deptno
      ORDER BY 2) DEPT_AVG, DEPT
WHERE DEPT_AVG.deptno = DEPT.deptno 
AND ROWNUM <=2;

