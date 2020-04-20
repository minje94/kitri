--[DELETE}: ���̺� ���� �ִ� �����͸� �����ϴ� ��ɾ�, �⺻Ű�� �������� ����ض�
--DELETE FROM [���̺��] WHERE ����
DELETE FROM DEPT2;

--[MERGE]
--MERGE INTO [������̺�] USING [�ҽ����̺�] ON (����(UPDATE))
--WHEN MATCHED THEN (UPDATE or DELETE)
--WHEN NOT MATCHED THEN INSERT

--��) T_EMP���̺��� EMP���̺�� ���� ������ �����Ͻÿ�. �����ȸ 777, �̸�: SON �����͸� �����Ͻÿ�.
MERGE
INTO T_EMP
USING DUAL
ON (T_EMP.EMPNO = 777)
WHEN MATCHED THEN
    UPDATE 
    SET T_EMP .ename = 'SHM'
WHEN NOT MATCHED THEN
    INSERT VALUES('777','SON','','','','','','');

--��) DEPT���̺��� DEPT2���̺�� ������ ��� �����Ͻÿ�.
MERGE
INTO DEPT2 
USING DEPT 
ON (DEPT2.deptno = DEPT.deptno)
WHEN MATCHED THEN --> deptno�� ���� ������ �Ѿ�� �����̹Ƿ� dname�� loc�� ������.
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
--CREATE TABLE [���̺��] (
--�÷���1 �÷�Ÿ�� [��������],
--�÷���2 �÷�Ÿ�� [��������],
--�÷���3 �÷�Ÿ�� [��������],
--)
CREATE TABLE TEST (
TEST_ID CHAR(10),
TEST_DATA VARCHAR(10),
TEST_DATE DATE
);

--[���������� Ȱ���� CREATE] CREATE TABLE TEST [���̺��] AS(SUBQUERY);
CREATE TABLE TEST2
AS SELECT * FROM TEST WHERE 1=2;

--[DROP] ���̺� ������ �� ���! DELETE TABLE [���̺��];
DROP TABLE TEST;
DROP TABLE TEST2;

--[ALTER] 
--���̺� �̸� ����: RENAME [�������̺��] TO [���̺��]
RENAME ACCOUNT TO ACC;

--���̺� �÷��� ����: ALTER TABLE [���̺��] RENAME COLUMN [���� �� �÷���] TO [���� �� �÷���]
ALTER TABLE ACC
RENAME COLUMN account_no TO acc_no;

--���̺� �÷�Ÿ�� ����: ALTER TABLE[���̺�] MODIFY [�÷���][Ÿ��];
ALTER TABLE ACC
MODIFY acc_no CHAR(4);

--���̺� �÷� �߰�: ALTER TABLE [���̺� ��] ADD ([�÷���][Ÿ��])
ALTER TABLE ACC
ADD (NO NUMBER(4));

--���̺� �÷� ����: ALTER TABLE[���̺��] DROP COLUMN[�÷���]
ALTER TABLE ACC DROP COLUMN NO;

--[��������]: NOT NULL, UNIQUE, CHECK, DEFAULT, PRIMARY KEY, FOREIGN KEY
--�޸��� ���� ���� �ʿ�. NOT NULL
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
--��1) T_EMP ���̺��� �����ȣ�� 7902�� �����ȣ�� �����Ͻÿ�
DELETE FROM T_EMP WHERE emptno = 7902;

--��2) ��ձ޿����� ���� �޴� ����� ��� �����Ͻÿ�.
DELETE FROM T_EMP WHERE sal < (SELECT AVG(sal)
                               FROM T_EMP);

--��3) T_EMP ���̺��� ��� ������ �����Ͻÿ�.
DELETE FROM T_EMP;

--��4) S_EMP�� ���� ������ �Է��Ͻÿ�. �����ȣ: 7902, �̸�: PARK, ����: 2000
--�����Ͱ� �����ϸ� UPDATE�ϰ� �����Ͱ� �������� ������ INSERT �Ͻÿ�.
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

--��5) STUDENT ���̺��� ��ǻ������ 1,2�г��̸� �����Ը� 10KG�� ������Ű��, ��ǻ������
--     3�г� �л��̸� ������ 20KG�� �������� T_STUDENT ���̺� �����Ͻÿ�.
CREATE TABLE T_STUDENT
AS SELECT * FROM STUDENT WHERE 1=2; --> �׻�Ʋ���� ������ type�� ����.

MERGE
INTO T_STUDENT A
USING (SELECT * FROM STUDENT WHERE stu_dept = '��ǻ������') B    
ON (A.stu_no = B.stu_grade)
WHEN MATCHED THEN
    UPDATE SET A.stu_weight = B.stu_weight + DECODE(B.stu_grade, 1, 10, 2, 10, 3, 20)
WHEN NOT MATCHED THEN
    INSERT (A.stu_no, A.stu_name, A.stu_dept, A.stu_grade,
            A.stu_class, A.stu_gender, A.stu_height, A.stu_weight)
    VALUES (B.stu_no, B.stu_name, B.stu_dept, B.stu_grade,
            B.stu_class, B.stu_gender, B.stu_height,B.stu_weight  + DECODE(stu_grade, 1, 10, 2, 10, 3, 20));

--��6)ACCOUNT ���̺��� �����Ͻÿ�. account_no: ���� 4�ڸ�, account_date: ��¥, code: �������� 14�ڸ�
--withdrawer: ���� 8�ڸ�, deposit: ����10�ڸ�, balance: ����12�ڸ�, branch_code: ����8�ڸ�
CREATE TABLE ACCOUNT (
    account_no NUMBER(4),
    account_date DATE,
    code VARCHAR(14),
    withdrawer NUMBER(8),
    deposit NUMBER(10),
    balance NUMBER(12),
    branch_code CHAR(8)
);

--��7) NIKE���̺��� ����ÿ�. 
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