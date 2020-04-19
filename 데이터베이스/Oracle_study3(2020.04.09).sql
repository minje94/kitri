-----------------------------
--����1) �л����� Ű�� �������� ���� ���, '���'�̶�� ����ϰ�, Ű�� �����Ǵ� ���, 
--'�ʿ����'�̶�� �˻������ ����Ͻÿ�. ����׸��� �л��̸�, Ű, �˻�����Դϴ�.
SELECT stu_name, stu_height,
       NVL2(stu_height, '�ʿ����', '���') AS �˻����
FROM STUDENT;

SELECT stu_name, stu_height,
CASE WHEN stu_height IS NULL THEN '���'
           ELSE '�ʿ����' 
END AS �˻����
FROm STUDENT;

--����2) ������� ����̸�, ��������� �����Ͽ� �˻��Ͻÿ�. (��: King President)
SELECT INITCAP(ename || ' ' || job) AS ���_����
FROM EMP;

SELECT CONCAT(CONCAT(INITCAP(ename),' '), INITCAP(job)) AS ���_����
FROM EMP;

--����3) ������� �޿��� 2�� �λ��Ͽ� ����Ͻÿ�.(DECODE ���)
SELECT ename, DECODE(job, 'PRESIDENT', SAL*2
                           ,SAL) AS sal
FROM EMP
WHERE job = 'PRESIDENT';

SELECT ename, DECODE(mgr, NULL, SAL*2
                           ,SAL) AS sal
FROM EMP
WHERE job ='PRESIDENT';

--[�׷��Լ�]
--STDDEV(ǥ������), VARIANCE(�л�)
SELECT COUNT(*) FROM STUDENT;
SELECT COUNT(stu_no) FROM STUDENT;
SELECT COUNT(stu_height) FROM STUDENT;

SELECT SUM(sal) FROM EMP;
SELECT AVG(sal) FROM EMP;
SELECT MAX(sal) FROM EMP;
SELECT MIN(sal) FROM EMP;
SELECT STDDEV(sal) FROM EMP;
SELECT VARIANCE(sal) FROM EMP;

--����1) �Ŵ������� ��� ������ ���Ͻÿ�.
SELECT AVG(sal) FROM EMP WHERE job ='MANAGER';

--[GROUP BY]
--����2) �� ������ ��� ������ ���Ͻÿ�. 
SELECT job, ROUND(AVG(sal)) --> GROUP BY �� �׸��� SELECT �� �� �ִ�. 
FROM EMP
GROUP BY job;

--[HAVING]
--��3) �� ������ ��� ������ 3000�̻��� ������ ��� ������ ����Ͻÿ�.
SELECT job, ROUND(AVG(sal)) 
FROM EMP 
GROUP BY job 
HAVING AVG(sal) >= 3000;

--��4)
SELECT stu_dept, stu_grade, AVG(stu_height) 
FROM STUDENT 
GROUP BY stu_dept, stu_grade
ORDER BY stu_dept, stu_grade;

--[JOIN]
--ORACLE JOIN WHERE���� ���� ���� Ư¡�̴�.
SELECT EMP.ename, DEPT.loc
FROM EMP,DEPT
WHERE EMP.deptno = DEPT.deptno
AND EMP.job = 'PRESIDENT';

--NATURAL JOIN FROM ���� ���� ���� Ư¡�̴�.
SELECT ename, loc
FROM EMP NATURAL JOIN DEPT
WHERE job = 'PRESIDENT';

--JOIN ~ USING ~
SELECT ename, loc
FROM EMP JOIN DEPT USING(deptno)
WHERE job = 'PRESIDENT';

--JOIN ~ ON ~ --> deptno�� �ǹ��ϴ� �÷��� �ٸ� ��쿡 ���.
SELECT ename, loc
FROM EMP JOIN DEPT ON EMP.deptno = dept.deptno
WHERE job = 'PRESIDENT';

--INNER JOIN ~ ON ~
SELECT ename, loc
FROM EMP INNER JOIN DEPT ON EMP.deptno = dept.deptno
WHERE job = 'PRESIDENT';

--[NON-EQU]
--��5) �����ȣ, ����̸�, �޿�, �޿������ ǥ���Ͻÿ�.
SELECT empno, ename, sal, grade
FROM EMP,SALGRADE
WHERE EMP.sal BETWEEN SALGRADE.losal AND SALGRADE.hisal;

SELECT empno, ename, sal, grade
FROM EMP,SALGRADE
WHERE EMP.sal >= SALGRADE.losal AND EMP.sal <= SALGRADE.hisal;

--[SELF JOIN]
--��6) ����̸�, MGR��ȣ, ����� �̸��� ����Ͻÿ�.
SELECT my.ename, my.mgr, you.ename
FROM EMP my, EMP you
WHERE my.mgr = you.empno;

--[OUTER JOIN]
--FULL OUTER JOIN
SELECT ename, dname, loc
FROM EMP FULL OUTER JOIN DEPT ON EMP.deptno = dept.deptno;

--LEFT OUTER JOIN ���� ���̺��� ���� ���!
SELECT ename, dname, loc
FROM EMP LEFT OUTER JOIN DEPT ON EMP.deptno = dept.deptno;

SELECT ename, dname, loc
FROM EMP,DEPT
WHERE EMP.deptno = dept.deptno(+);  --(+)�� �ݴ����!!

--RIGHT OUTER JOIN ������ ���̺��� ���� ���!
SELECT ename, dname, loc
FROM EMP RIGHT OUTER JOIN DEPT ON EMP.deptno = dept.deptno;

SELECT ename, dname, loc
FROM EMP,DEPT
WHERE EMP.deptno(+) = dept.deptno; --(+)�� �ݴ����!!


---------------------------------
--��1) ������ ��� �޿�(sal+comm)�� ����Ͻÿ�.
SELECT job, ROUND(AVG(sal + NVL(comm,0))) AS ��ձ޿�
FROM EMP
GROUP BY job;

--��2) �� �а��� �л� ��, ��ս���, ������, ��ո����Ը� ����Ͻÿ�.
SELECT stu_dept, COUNT(*), AVG(stu_height) AS ��ս���,
       SUM(stu_height) AS ������,
       AVG(stu_weight) AS ��ո�����
FROM STUDENT
GROUP BY stu_dept;

--��3) ������ ������� �ο����� ����Ͻÿ�. ��, �����ο��� 4���̻��� ������ ����Ͻÿ�.
SELECT job, COUNT(*)
FROM EMP
GROUP BY job
HAVING count(*) >= 4;

--��4) ������ 3000�̻��� ������� ������ ���� ���Ͻÿ�.
SELECT SUM(sal)
FROM EMP
WHERE sal >=3000;

--��5) ������� 5�� �̻��� �μ��� �μ���ȣ, ������� ����Ͻÿ�.
SELECT deptno, COUNT(*)
FROM EMP
GROUP BY deptno
HAVING count(*) >= 5;

--��6) ���� �л��� �� �г⺰ ��ս����� 155�̻��� �г�� ��ս����� ���̽ÿ�.
SELECT stu_grade, AVG(stu_height)
FROM STUDENT
WHERE stu_dept = '���'
GROUP BY stu_grade
HAVING AVG(stu_height) >= 155;

--��7) �ִ� ������ 175�̻��� �а��� �а��� �ִ������ ���̽ÿ�.
SELECT stu_dept, MAX(stu_height)
FROM STUDENT
GROUP BY stu_dept
HAVING MAX(stu_height) >= 175;

--��8) �а��� ��ս��� �� ���� ���� ��� ������ ���̽ÿ�.
SELECT MAX(AVG(stu_height))
FROM STUDENT
GROUP BY stu_dept;

--��9) ������, �μ��� ����� �޿����� ���� ������ �˻��Ͻÿ�.
SELECT job, deptno, SUM(sal)
FROM EMP
GROUP BY job, deptno
ORDER BY SUM(sal) DESC;

SELECT job, deptno, SUM(sal)
FROM EMP
GROUP BY job, deptno
ORDER BY 3 DESC;

--��10) �μ���, ������ ������� �޿�(sal + comm) ������ ���� ������ �˻��Ͻÿ�.
SELECT job,deptno, STDDEV(sal + NVL(comm,0)) AS �޿����� --->������ ���Ҷ� STDDEV�� ����Ѵ�.
FROM EMP
GROUP BY job, deptno
HAVING COUNT(*) NOT IN (0,1)
ORDER BY 3 DESC;

--��11) �μ���ȣ�� 20�� ����� �߿��� ������ ��� ����, ������ ���̽ÿ�.
--��, ��� ������ 1000�� ������ ���� �����Ͻÿ�.
SELECT job, AVG(sal + NVL(comm, 0))
FROM EMP
WHERE deptno = 20
GROUP BY job
HAVING AVG(sal + NVL(comm, 0)) > 1000;

--��12) �л����� ����ִ� �����ȣ, ������ Ȯ���Ͻÿ�. �й�, �̸�, �����ȣ, ������ ����Ͻÿ�.
SELECT s.stu_no, s.stu_name, e.sub_no, e.enr_grade 
FROM STUDENT s, ENROL e
WHERE s.stu_no = e.stu_no;

--natural join�� ���� ���� �ʾƵ� �ȴ�.
SELECT stu_no, stu_name, sub_no, enr_grade
FROM STUDENT NATURAL JOIN ENROL;

SELECT stu_no, stu_name, sub_no, enr_grade
FROM STUDENT JOIN ENROL USING (stu_no);

SELECT STUDENT.stu_no, stu_name, sub_no, enr_grade
FROM STUDENT JOIN ENROL ON STUDENT.stu_no = ENROL.stu_no;

SELECT STUDENT.stu_no, stu_name, sub_no, enr_grade
FROM STUDENT INNER JOIN ENROL ON STUDENT.stu_no = ENROL.stu_no ;

--��13) ����̸�, MGR��ȣ, ����̸�, ������, ������ ����� ����Ͻÿ�.
SELECT DISTINCT my.ename, my.mgr, you.ename, you.sal, sg.grade
FROM EMP my, EMP you, SALGRADE sg
WHERE my.mgr = you.empno
AND you.sal >= sg.losal 
AND you.sal <= sg.hisal;

SELECT DISTINCT my.ename, my.mgr, you.ename, you.sal, sg.grade
FROM EMP you JOIN EMP my ON my.mgr = you.empno
             JOIN SALGRADE sg ON you.sal >= sg.losal AND you.sal <= sg.hisal;

--��14) �����ȣ, ����̸�, ����ȣ, ����̸��� ��� ����ϴ� ������ �ۼ��Ͻÿ�. 
--��, ����Ե� �����Ͽ� ����� ��.
SELECT my.empno, my.ename, you.empno, you.ename
FROM EMP my LEFT OUTER JOIN EMP you 
ON my.mgr = you.empno;

SELECT my.empno, my.ename, you.empno, you.ename
FROM EMP my, EMP you
WHERE my.mgr = you.empno(+);  --> ����Ŭ���� ����ϴ� LEFT OUTER JOIN ���

--��15) �����ȣ, ����̸�, ��å, �������̸�, �ٹ���ġ�� ����Ͻÿ�.
--��, ���õ� ��� ������ �������� ����� ��.
SELECT e1.empno, e1.ename, e1.job, e2.ename, DEPT.loc
FROM EMP e1 FULL OUTER JOIN EMP e2 ON e1.mgr = e2.empno 
                       JOIN DEPT ON e1.deptno = DEPT.deptno;

--��16) ��� JAMES�� �����ȣ, �̸�, �޿�, �޿����, �μ���� ���� ����̸�, ���μ��� ����Ͻÿ�.
SELECT DISTINCT e1.empno, e1.ename, e1.sal, s.grade, d1.dname, e2.ename, d2.dname
FROM EMP e1, EMP e2, SALGRADE s, DEPT d1, DEPT d2
WHERE e1.sal BETWEEN s.losal AND s.hisal 
AND e1.deptno = d1.deptno
AND e1.mgr = e2.empno
AND d2.deptno = e2.deptno
AND e1.ename = 'JAMES';

SELECT DISTINCT e1.empno, e1.ename, e1.sal, s.grade, d1.dname, e2.ename, d2.dname
FROM EMP e1 JOIN EMP e2 ON e1.mgr = e2.empno
            JOIN DEPT d1 ON e1.deptno = d1.deptno
            JOIN DEPT d2 ON e2.deptno = d2.deptno,
            SALGRADE s
WHERE e1.sal BETWEEN s.losal AND s.hisal 
AND e1.ename = 'JAMES';

--��17) �� �μ��� �̸��� ���� ���� ������ ũ�⸦ ����Ͻÿ�. (JOIN ~ ON ~ )
SELECT dname, MAX(SAL)
FROM DEPT JOIN EMP ON DEPT.deptno = EMP.deptno
GROUP BY DEPT.dname;

--��18) NEW YORK�̳� DALLAS ������ �ٹ��ϴ� ������� �����ȣ, �̸��� �����ȣ ������ �˻��Ͻÿ�.
SELECT empno, ename
FROM EMP JOIN DEPT ON EMP.deptno = DEPT.deptno
WHERE loc = 'NEW YORK' OR loc = 'DALLAS'
ORDER BY 1;

SELECT EMP.empno, EMP.ename
FROM EMP, DEPT
WHERE EMP.deptno = DEPT.deptno
AND (DEPT.loc = 'NEW YORK' OR DEPT.loc = 'DALLAS') --> ��ȣ�� �ļ� �����Ѵ�.
ORDER BY 1;

SELECT empno, ename
FROM EMP JOIN DEPT ON EMP.deptno = DEPT.deptno
WHERE loc IN ('NEW YORK', 'DALLAS') ---> ���߿� �̹���� ��õ!!
ORDER BY 1;

--��19) �μ��̸��� ACCOUNTING�̰ų�, �����̸��� CHICAGO�� ����� �����ȣ�� ����̸��� �˻��Ͻÿ�.
SELECT EMP.empno, EMP.ename, DEPT.dname, DEPT.loc
FROM EMP JOIN DEPT ON EMP.deptno = DEPT.deptno
WHERE dname = 'ACCOUNTING' 
OR loc = 'CHICAGO';

