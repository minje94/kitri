--[�������� �߰�, ����, ����] --> �Ϸ����� ������.... �� ��������. �޸��⺸�� �����ض�.
--���������� �߰�, ���� �� �۾��� �Ϸ��� �����Ͱ� ���� �� �ϴ� ���� ���ϴ�!
CREATE TABLE ADIDAS
AS SELECT * FROM NIKE
WHERE 1=2;

--CHECK, UNIQUE, PKm FK (�߰�)
--ALTER TABLE[���̺��] ADD CONSTRANINT [���������̸�] CHECK (���ǹ�);
CREATE TABLE ADIDAS CHECK (COUNT BETWEEN 1 AND 9999);

--ALTER TABLE [���̺��] ADD CONSTRAINT [���������̸�] UNIQUE (�÷���);
ALTER TABLE ADIDAS ADD CONSTRAINT pk_id PRIMARY KEY(id);

--ALTER TABLE[���̺��] ADD CONSTRANINT [���������̸�] PRIMARY KEY ([�÷���]);
ALTER TABLE ADIDAS ADD CONSTRAINT pk_id PRIMARY KEY(id);

--ALTER TABLE [���̺��] ADD CONSTRAINT [���������̸�] FOREIGN KEY [���� ���̺� �÷���] REFERENCE [���� ���̺��]([�÷���]);
--deptno�� �⺻Ű�̾���Ѵ�.
ALTER TABLE DEPT_1
ADD CONSTRAINT PK_DEPT_1
PRIMARY KEY (deptno);

ALTER TABLE EMP_1
ADD CONSTRAINT FK_DEPT_1
FOREIGN KEY (deptno) REFERENCES DEPT_1(depeno);

--(not null�� ����) [ALTER] ALTER TABLE [���̺��] MODIFY [�÷���] NOT NULL;
ALTER TABLE ADIDAS MODIFY ID NOT NULL;

--(����) ALTER TABLE [���̺��] DROP CONSTRAINT [���������̸�];
ALTER TABLE ADIDAS DROP CONSTRAINT U_ID;

--[VIEW]
--��) ����̸�, ����� �ٹ��ϴ� ��ġ�� �並 ������.
CREATE VIEW v_ename_loc
AS SELECT ename, loc
   FROM EMP,DEPT    
   WHERE EMP.deptno = DEPT.deptno;

--�� Ȯ���ϱ�.
SELECT * FROM V_ENAME_LOC;

--[INDEX]
-- CREATE INDEX [INDEX��] ON [���̺��] ([�÷���]);
CREATE INDEX I_EMP ON EMP(ENAME);

--[SEQUENCE] 
CREATE SEQUENCE SEQ_VALUE
START WITH 1
INCREMENT BY 1
MAXVALUE 100;

--��) 
INSERT INTO EMP(EMPNO, ENAME)
VALUES (SEQ_VALUE.NEXTVAL, 'YEO');

DROP SEQUENCE SEQ_VALUE;

--[TOP-N]
--��) ������ ���� ���� ���� 3���� ������ȣ, ������ ǥ���Ͻÿ�.
SELECT *
FROM (SELECT EMPNO, NVL(SAL,0)
      FROM EMP
      ORDER BY 2 DESC)
WHERE ROWNUM <=3;


------------------------------------------

--��1) �ܱ��� �л� ���̺�(fore_student)�ۼ��ÿ� ������ �߻��Ͽ���. �ܱ��� �л� MAKE�� student ���̺� �߰��մϴ�.
--     �ܱ��� �л����� Ŭ������ ��� A������ �����ϰ� �߰��� MAKE�� fore_student�� �����Ͻÿ�.

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
    
--����2) adidas2 ���̺��� ����ÿ�.
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
    id CHAR(10) CONSTRAINT PK_ADIDAS2 PRIMARY KEY, --> PRIMARY KEY�� pk
    style VARCHAR(10) CONSTRAINT U_STYLE UNIQUE, --> UNIQUE�� U
    color VARCHAR(20) NOT NULL,
    owner CHAR(10),
    c_size CHAR(3) CONSTRAINT CK_c_size CHECK(c_size IN ('XS','S','M','L','XL','XXL')), --> CHECK�� CK
    gender CHAR(1) CONSTRAINT CK_GENDER CHECK(gender IN ('F', 'M')),
    count NUMBER,
    n_date DATE DEFAULT SYSDATE
);

ALTER TABLE ADIDAS2 MODIFY owner CONSTRAINT NN_owner NOT NULL; --> NOT NULL�� NN
ALTER TABLE ADIDAS2 DROP CONSTRAINT CK_c_size;
ALTER TABLE ADIDAS ADD CONSTRAINTS CK_count CHECK (count BETWEEN 0 AND 1000); 

--����3) EMP ���̺�κ��� 10, 20�� �μ��� ������ �̷���� �並 ����ÿ�.
CREATE VIEW V_EMP_1020 
AS SELECT *
   FROM EMP
   WHERE deptno IN (10,20);

--����4) �����ȣ, ����̸�, �μ��̸�, ������̸��� �����Ǵ� �並 ����ÿ�.
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
   
--����5) �а��� ��� �����Կ� ��� Ű�� ������ �並 ����ÿ�.
CREATE OR REPLACE VIEW V_DEPT_AVG (stu_dept, avg_stu_weight, avg_stu_height)
AS SELECT stu_dept, ROUND(AVG(stu_weight)),ROUND(AVG(stu_height))
   FROM STUDENT
   GROUP BY stu_dept;

--����6) �л��̸�, Ű, ������, BMI������ ������ �並 ����ÿ�/
CREATE OR REPLACE VIEW V_STUDENT (stu_name, stu_height, stu_weight, BMI)
AS SELECT stu_name, stu_height, stu_weight, ROUND(stu_weight / POWER(stu_height,2) * 10000)
   FROM STUDENT;

--����7) �����ȣ, �̸�, �޿�, Ŀ�̼�, ��ü����(�޿� + Ŀ�̼�)�� ������ �並 ����ÿ�.
CREATE OR REPLACE VIEW V_EMP(empno, ename, comm, sumSal)
AS SELECT empno, ename, NVL(comm, 0), (sal+NVL(comm,0))
   FROM EMP;

--����8) �ʱ갪 100, ������ -1, �ּҰ� 0 CYCLE�� ������ �������� ����ÿ�.
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

--����7) BMIũ�Ⱑ ���� 5���� �̸�, �й�, BMI������ ����Ͻÿ�.
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

--����8) �μ��� ��� �޿��� ���� �μ� 2���� �μ���, ��� �޿��� ����Ͻÿ�.
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

