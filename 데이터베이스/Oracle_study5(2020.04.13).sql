--SET �Լ� UNION(������), UNIONALL(������, �ߺ�����), INTERSECT(������), MINUS (������)
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

--CREATE TABLE [���̺��] AS (SUBQUERY)
--��1) 
CREATE TABLE EMP2 AS (SELECT * FROM EMP);

CREATE TABLE SALGRADE2 AS (SELECT * FROM SALGRADE);

CREATE TABLE DEPT2 AS (SELECT * FROM DEPT);

INSERT INTO EMP2 VALUES (1111, 'MINJE', 'CLERK', 7839, SYSDATE, 1500,200,10);

--[UPDATE] 
--UPDATE [���̺��] SET [�� �Ҵ�]  WHERE[����]
--��2) ���� sal�� 30000���� �����Ͻÿ�.
UPDATE T_EMP
SET SAL = 30000
WHERE ENAME = 'SON';



--------------------------------
--��1) �������ڰ��� �л���� ��ǻ���������� �л����� ��ü������ ��Ÿ���ÿ�.
SELECT *
FROM STUDENT
WHERE stu_dept = '��������'
UNION 
SELECT *
FROM STUDENT
WHERE stu_dept = '��ǻ������';

--��2) ��ü �л� �������� 1�г� �л� ������ �����ϰ� ��ü������ ����Ͻÿ�.
SELECT *
FROM STUDENT
MINUS
SELECT *
FROM STUDENT
WHERE stu_grade = 1;

--��3) ��ü �л��������� �����̸鼭 1�г���� ������ ����Ͻÿ�.
SELECT *
FROM STUDENT
WHERE stu_dept = '���'
INTERSECT
SELECT *
FROM STUDENT
WHERE stu_grade = '1';

--��4) SALESMAN������, ���ʽ��� ���� �ʴ� ����� ������ ��� ����Ͻÿ�.
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

--��5) ��ǻ���������� �ּ� ����� �� �а� �ּҽ����� ���� �л��� ���Ͽ�,
--     ��ǻ�������� �ּҽ��庸�� ū �а��� �а���, �ּҽ����� ����Ͻÿ�.
SELECT stu_dept, MIN(stu_height)
FROM STUDENT
GROUP BY stu_dept
HAVING MIN(stu_height) > (SELECT MIN(stu_height)
                          FROM STUDENT 
                          GROUP BY stu_dept
                          HAVING stu_dept = '��ǻ������');
                          
--��6) �й�, �а���, Ű, �л��� �Ҽӵ� ���� ���Ű�� ����Ͻÿ�.
SELECT stu_no, stu_dept, stu_height, �а����Ű
FROM STUDENT NATURAL JOIN (SELECT stu_dept, ROUND(AVG(stu_height))AS �а����Ű
                           FROM STUDENT
                           GROUP BY stu_dept);

SELECT STUDENT.stu_no, STUDENT.stu_dept, STUDENT.stu_height, DEPT_AVG_HEIGHT.�а����Ű
FROM STUDENT, (SELECT stu_dept, ROUND(AVG(stu_height))AS �а����Ű
               FROM STUDENT
               GROUP BY stu_dept) DEPT_AVG_HEIGHT
WHERE STUDENT.stu_dept = DEPT_AVG_HEIGHT.stu_dept;
               
--��7) ��ǻ�� ���а� �ý��� �м����� ������ ���ÿ� �����ϴ� �й�, �̸��� �й������� �˻��Ͻÿ�.
SELECT stu_no, stu_name
FROM ENROL JOIN STUDENT USING (stu_no)  --(101) 20131001��20131025
           JOIN SUBJECT USING (sub_no)
WHERE sub_name = '��ǻ�Ͱ���'
INTERSECT 
SELECT stu_no, stu_name
FROM ENROL JOIN STUDENT USING (stu_no)  --(104) 20131001��20131025
           JOIN SUBJECT USING (sub_no)
WHERE sub_name = '�ý��ۺм�����';

--��8) T_EMP ���̺��� �����, 'SMITH'�� ������ ��� ����� ������ �Է��Ͻÿ�.
CREATE TABLE T_EMP AS (SELECT * FROM EMP WHERE ename != 'SMITH');
CREATE TABLE T_EMP AS (SELECT * FROM EMP WHERE 1=0);
INSERT INTO T_EMP SELECT * FROM EMP WHERE ename != 'SMITH';

--��9)T_EMP ���̺� �Ʒ� ������ �Է��Ͻÿ�. �̸�: SON, ����: 20000, ���ʽ�: 20%, �����ȣ 777 
INSERT INTO T_EMP(ename, sal, comm, empno)  
VALUES ('SON', 20000, (20000*0.2),777);

--��10) T_EMP ���̺� �����ȣ 9999, ����̸� KITRI�� �Է��Ͻÿ�.
INSERT INTO T_EMP(empno, ename) 
VALUES (9999, 'KITRI');

--��11) �����ȣ 7323, ����̸� MICHAEL, �μ���ȣ 30, ������ �����ȣ 7499�� ������ �������� ���ο� ����� �Ի��Ͽ���.
INSERT INTO T_EMP(empno, ename, sal, deptno)
VALUES (7323, 'MICHAEL', (SELECT sal
                          FROM T_EMP
                          WHERE empno = 7499),  30); 

--��12) SON�� ���ʽ��� 10%�λ��Ͻÿ�. �׸���, �Ի����� ���÷� �����Ͻÿ�.
UPDATE T_EMP
SET comm = comm + (comm*0.1), hiredate = SYSDATE
WHERE ename = 'SON';

--��13) SON���� ���� ������ �޴� ����� ������ 10% �λ��Ͻÿ�.
UPDATE T_EMP
SET sal = sal + (sal*0.1)
WHERE sal < (SELECT sal
             FROM T_EMP
             WHERE ename = 'SON');

--��14) COMM�� NULL���� ��� ����� COMM�� 0���� �����Ͻÿ�.
UPDATE T_EMP
SET comm = 0
WHERE comm IS NULL;

--��15) ���� ����� 3�� ������ ������ 15%�λ��Ͽ� �����Ͻÿ�.
--��16) DALLAS���� ���ϴ� �������� COMM�� 100�� �߰��Ͻÿ�.
--��17) SCOTT�� ����ڸ� BLAKE�� �����Ͻÿ�.
