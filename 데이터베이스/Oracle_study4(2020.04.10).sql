--SUBQUERY
--[Single Row] �������� ����� 1��
--��1) ��� ���庸�� ū �л��� �̸�, Ű, �а��� ����Ͻÿ�.
SELECT stu_name, stu_height, stu_dept
FROM STUDENT
WHERE stu_height > (SELECT ROUND(AVG(stu_height))
                    FROM STUDENT);

SELECT stu_name, stu_height, stu_dept
FROM (SELECT stu_name, stu_height, stu_dept
      FROM STUDENT
      WHERE stu_height > (SELECT ROUND(AVG(stu_height))
                          FROM STUDENT));
                    
--[Multi Row] �������� ����� 2�� �̻�
--��2) �� �μ��� �ּ� �޿��� �޴� ����� �̸��� �޿��� ������.
SELECT ename, sal
FROM EMP
WHERE (deptno, sal) IN (SELECT deptno, min(sal)
                        FROM EMP
                        GROUP BY deptno);


------------------------------

--��1) �����߾����� ū �л����� �̸�, �а�, Ű�� ����Ͻÿ�.
SELECT stu_name, stu_dept, stu_height
FROM STUDENT
WHERE stu_height > (SELECT stu_height
                    FROM STUDENT
                    WHERE stu_name = '������');
                    
--��2) ��� �޿����� ���� ����� �̸�, �޿��� ���̽ÿ�.
SELECT ename, sal
FROM EMP
WHERE sal > (SELECT AVG(sal)
             FROM EMP);

--��3) '���'�а��� ���� ��(stu_class)�� �ٸ� �а� �л����� �й�, �̸�, �а��� ����Ͻÿ�.
SELECT stu_no, stu_name, stu_dept
FROM STUDENT
WHERE stu_class = (SELECT DISTINCT stu_class --> stu_class�� ��������� IN�� ����ϸ� �ȴ�.
                   FROM STUDENT
                   WHERE stu_dept = '���')
AND stu_dept != '���';   

--��4) �а��� ��� ���� �� ���� ���� ��� ����, �а��̸��� ����Ͻÿ�.
SELECT AVG(stu_height), stu_dept 
FROM STUDENT
GROUP BY stu_dept
HAVING AVG(stu_height) = (SELECT MAX(AVG(stu_height))
                          FROM STUDENT
                          GROUP BY stu_dept);

--��5) �μ� ��� �޿��� ��ü ���� ��� �޿����� ���� �μ��� �μ���, �μ���ձ޿��� ����Ͻÿ�.
SELECT dname, ROUND(AVG(sal))
FROM EMP NATURAL JOIN DEPT
GROUP BY dname
HAVING AVG(sal) > (SELECT AVG(sal)
                   FROM EMP) ;

--��6) SCOTT������� ���� �޿��� �޴� ��� ������ ��� ����Ͻÿ�.
SELECT * 
FROM EMP
WHERE sal > (SELECT sal
             FROM EMP
             WHERE ename = 'SCOTT');
              
SELECT * 
FROM EMP e1, EMP e2
WHERE e2.ename = 'SCOTT' 
AND e1.sal > e2.sal;

--��7) ���� �л��� �� �г⺰ ��� ������ 160�̻��� �г�� ��� ������ ����Ͻÿ�. 
-- �߰��� ��ħ �����ʿ�...
SELECT stu_grade, AVG(stu_height)
FROM STUDENT
WHERE stu_dept = '���'
GROUP BY stu_grade
HAVING AVG(stu_height) >= 160;

--��8) CHICAGO�� �ٹ����� ���� ��� ����� ������ ����Ͻÿ�.
-- �߰��� ��ħ �����ʿ�...
SELECT *
FROM EMP , DEPT
WHERE DEPT.deptno = EMP.deptno AND DEPT.LOC != 'CHICAGO';

SELECT *
FROM EMP JOIN DEPT USING (deptno)
WHERE DEPT.LOC != 'CHICAGO';

SELECT *
FROM EMP
WHERE deptno != (SELECT deptno
                 FROM DEPT
                 WHERE LOC = 'CHICAGO');


--��9) 20�� �μ��� �ִ�޿����� �ִ�޿��� ���� �μ��� �μ���ȣ, �μ��̸�, �ִ�޿��� �˻��Ͻÿ�.
SELECT DEPT.deptno, DEPT.dname, MAX(sal)
FROM DEPT, SALGRADE, EMP
WHERE EMP.deptno = DEPT.deptno
GROUP BY EMP.deptno
HAVING MAX(sal) > (SELECT MAX(sal)
                   FROM EMP
                   WHERE deptno = 20);

SELECT EMP.deptno, DEPT.dname, MAX(EMP.sal) --��
FROM DEPT JOIN EMP ON DEPT.deptno = EMP.deptno
GROUP BY EMP.deptno, DEPT.dname
HAVING MAX(EMP.sal) >= ( SELECT MAX(sal)
                         FROM EMP
                         WHERE deptno = 20);
                         
--��10) SLESMAN�� Ŀ�̼� ����� ����Ͻÿ�.
SELECT AVG(NVL(COMM,0))
FROM EMP
WHERE job = 'SALESMAN';

SELECT AVG(com)
FROM (SELECT NVL(comm,0) AS com -->com�̶�� �̸��� ���ΰ��� select�� ����Ͽ� �ذ� 
      FROM EMP
      WHERE job = 'SALESMAN');

--��11) �� �μ��� �ּ� �޿��� �޴� ����� �̸��� �޿��� ���϶�. (IN, ANY, SOME)
SELECT ename, sal
FROM EMP
WHERE (deptno, sal) IN ( SELECT deptno, MIN(sal)
                         FROM EMP
                         GROUP BY deptno);

SELECT ename, sal
FROM EMP
WHERE (deptno, sal) = ANY ( SELECT deptno, MIN(sal)
                            FROM EMP
                            GROUP BY deptno);
                            
SELECT ename, sal
FROM EMP
WHERE (deptno, sal) = SOME ( SELECT deptno, MIN(sal)
                             FROM EMP
                             GROUP BY deptno);     
                             
--��12) 20�� �μ� ����� ��������� ���� ��������� �ٸ� �μ��� ��������� ��� �˻��Ͻÿ�. (IN, ANY, SOME)                         
SELECT *
FROM EMP
WHERE JOB IN ( SELECT DISTINCT JOB
               FROM EMP
               WHERE DEPTNO = 20)
AND deptno != 20;                     