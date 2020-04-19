--2020.04.08 ���� 2����
--��1) ���� �̸鼭, ������ �л��� ��� ������ Ȯ���Ͻÿ�.
SELECT *
FROM STUDENT
WHERE stu_dept = '���' AND stu_gender = 'M';

--��2) ���� �̰ų� ������ �л��� ��� ������ Ȯ���Ͻÿ�.
SELECT *
FROM STUDENT
WHERE stu_dept = '���' OR stu_gender = 'M';

--��3) �����̸鼭, Ű�� 170�̻��� ����� ��� ������ Ȯ���Ͻÿ�.
SELECT *
FROM STUDENT
WHERE stu_height > 170 AND stu_gender = 'M';

--��4)'����'�̰ų� '�����'�� �л��� ����Ͻÿ�.
SELECT *
FROM STUDENT
WHERE stu_dept = '���' OR stu_dept = '��������';

SELECT *
FROM STUDENT
WHERE stu_dept IN('���', '��������');

--��5) Ű�� 160�̻� 180������ �л��� ��� ������ ����Ͻÿ�.
SELECT *
FROM STUDENT
WHERE stu_height >= 160
AND stu_height <= 180;

SELECT *
FROM STUDENT
WHERE stu_height BETWEEN 160 AND 180; --> �̻�, ���Ϸ� ��Ÿ��!!!

--[LIKE]
--��6) ����̸��� A�� ���۵Ǵ� ��� ������ ���̽ÿ�.
SELECT *
FROM EMP
WHERE ename LIKE 'A%';

--��7) ����̸��� s�� ������ ��� ������ ���̽ÿ�.
SELECT *
FROM EMP
WHERE ename LIKE '%S';

--��8) ����̸��� �ι�°�� A�� ��� ������ ���̽ÿ�.
SELECT *
FROM EMP
WHERE ename LIKE '_A%'; --->'_'�� ��ġ ǥ��

--[IS NULL] [IS NOT NULL]
--��9)Ű�� NULL�� �л��� �̸��� Ű�� ����Ͻÿ�.
SELECT stu_name, stu_height
FROM STUDENT
WHERE stu_height IS NULL;

--[�����Լ�] ABS MOD, SIGN, CEIL, FLOOR, ROUND, TRUNC
SELECT ABS(-10) --> ABS�� ���밪 ǥ�� 
FRom DUAL; --> dual�� ���� ���̺�

SELECT MOD(10,3) --> MOD�� �������� ����
FROM DUAL;

SELECT SIGN(-10) --> ����̸� 1, �����̸� -1 ���
FROM DUAL;

SELECT CEIL(20.5) --> �ø�
FROM DUAL;

SELECT FLOOR(20.5) --> ����
FROM DUAL;

SELECT ROUND(19.487654,1) --> �ݿø� ����, �ڸ���
FROM DUAL;

SELECT ROUND(sal,-3) AS sal
FROM EMP;

--[�����Լ�] LOWER, UPPER, INITCAP, CONCAT, SUBSTR, LENGTH, LTRIM, RTRIM, TRIM, LPAD, TRANSLATE
SELECT LOWER('APPLE')
FROM DUAL;

SELECT LOWER(ename) AS LOWER_NAME --> �ҹ��ڷ� ����
FROM EMP;

SELECT INITCAP(ename) -->ù���� �빮��, ���� �ҹ���
FROM EMP;

SELECT ename || job
FROM EMP;

SELECT CONCAT(CONCAT(ename, '''s job category is'), job) "job" --> ���� ��ġ��
FROM EMP;

SELECT SUBSTR('ABCDEFG',3,4)
FROM DUAL;

SELECT DISTINCT SUBSTR(stu_name,0,1) AS FAMILY_NAME --> (����, ������,���� ���°����)
FROM STUDENT;

SELECT LENGTH('ABCDEFG') --> ���� ���
FROM DUAL;

--[��¥�Լ�] SYSDATE, SYSTIMESTAMP
SELECT SYSDATE FROM DUAL; 

SELECT SYSDATE+(10/24) FROM DUAL; -->10�ð� �߰�

SELECT SYSTIMESTAMP FROM DUAL;

SELECT ADD_MONTHS(SYSDATE,3) FROM DUAL; --> 3�� ��

SELECT NEXT_DAY(SYSDATE, 'ȭ') FROM DUAL; --> ���� ȭ����

SELECT LAST_DAY(SYSDATE) FROM DUAL; --> �̹��� ��������

SELECT LAST_DAY(ADD_MONTHS(SYSDATE,3)) FROM DUAL; --> 3�� �� ��������

SELECT ROUND(SYSDATE+10,'MON') FROM DUAL;

--[��ȯ�Լ�] TO_NUMBER, TO_CHAR, TO_DATE
SELECT TO_NUMBER('123456789') FROM DUAL;

SELECT TO_CHAR(SYSDATE) FROM DUAL;

SELECT TO_CHAR(123456789,'99999999') FROM DUAL;

SELECT TO_CHAR(123456.78,'999999.99') + 1 FROM DUAL; 
-->���������� ��ȯ�Ǿ��� ������ ����� �Ǹ� �ȵ����� developer�� �˾ƻ� ������.

SELECT TO_DATE('20/04/08', 'YY/MM/DD') FROM DUAL;

SELECT TO_DATE('20/04/08', 'YY/MM/DD') FROM DUAL;

--[null �Լ�] NVL([���̸�], 0) NVL2([���̸�],[null�� �ƴѰ��, [null�� ���)
SELECT ename, comm, NVL(comm,0) FROm EMP; -->null�� �ƴϸ� ���� ���, null�̸� 0���

SELECT ename, NVL2(COMM, SAL+COMM,SAL) AS ��������, sal FROM EMP;

--NULLIF('A','A') -> ���� ������ null, �ٸ��� ���� ���� ���´�. 
SELECT NULLIF('A','A') FROM DUAL;

SELECT NULLIF('A','B') FROM DUAL;

--COALESCE(1,2,3,,,,,n)ó������ Ȯ���ؼ� null���� �ȳ����� ù��° ��� ���.
SELECT COALESCE(null,null,null,null,10,200,300) FROM DUAL;

--DECODE�� CASE�� �Լ��� ���� ��. CASE�� SELECT������ ����� �� �ִ�.
SELECT empno,ename, sal,
    CASE job WHEN 'SALESMAN' THEN SAL * 1.1
             WHEN 'CLERK' THEN SAL * 1.3
             WHEN 'MANAGER' THEN SAL * 1.5
             ELSE SAL
    END AS �޿��λ��
FROM EMP;

DECODE
SELECT empno, ename, sal,
    DECODE(job, 'SALESMAN', sal * 1.1,
                'CLERK', sal * 1.3,
                'MANAGER', sal * 1.5,
                            sal) AS �޿��λ��
FROM EMP;

-------------------------
--��1) �μ���ȣ�� 10���� ����� �����ȣ, ����̸�, ������ ����Ͻÿ�.
SELECT empno, ename, sal
FROM EMP
WHERE deptno = 10;

--��2) �����ȣ�� 7369 ���� ū ����� �̸�, �Ի���, �μ���ȣ�� ����Ͻÿ�. 
--�� �Ի����� ���� ������ ����Ͻÿ�.
SELECT ename, hiredate, deptno
FROM EMP
WHERE empno > 7369
ORDER BY 2;

--��3) ������ 3000�̻��̰� JOB�� ANALYST�� ����� �̸�, ����, Ŀ�̼��� ����Ͻÿ�.
SELECT ename, sal, comm
FROM EMP
WHERE sal >= 3000 AND job = 'ANALYST';

--��4) �����ȣ�� 7300���� ũ�� 7400���� ���� ����� �̸�, �Ի���, �μ���ȣ�� ����Ͻÿ�.
SELECT ename, hiredate, deptno
FROM EMP
WHERE empno > 7300 AND empno <7400;

SELECT ename, hiredate, deptno
FROM EMP
WHERE empno BETWEEN 7301 AND 7399;

--��5) DEPTNO�� 10�̰ų� 20�� ����� ��� ������ �����ȣ������ �����Ͽ� ǥ���Ͻÿ�.
SELECT * FROM EMP WHERE deptno IN (10,20); --> IN�̳� SOME�̳� ANY�� ����
SELECT * FROM EMP WHERE deptno = SOME (10,20);
SELECT * FROM EMP WHERE deptno = ANY (10,20);

--��6) ����߿� CLERK, SALESMAN, MANAGER�� ����̸�, ����, �����ȣ�� ����Ͻÿ�.
SELECT ename, sal, empno
FROM EMP
WHERE JOB IN ('CLERK', 'SALESMAN', 'MANAGER'); 

--��7) �л��� �߿� 2013���� �����ϴ� �й��� ���� ��� �л��� ������ ����Ͻÿ�.
SELECT *
FROM STUDENT
WHERE stu_no LIKE '2013%';

--��8) �л��� �߿� ���� '��'�̰� Ű�� 170���� ū �л��� �̸�, ��, �й��� ����Ͻÿ�.
--     ��, �й��� ������������ �����Ͻÿ�.
SELECT stu_name, stu_dept, stu_no
FROM STUDENT
WHERE stu_name LIKE '��%' AND stu_height >= 170
ORDER BY stu_no DESC; 

--��9) �̸��� W�� �����ϰ� D�� ������ ����� �����, ��å, �μ���ȣ�� ����Ͻÿ�.
SELECT ename, job, deptno
FROM EMP
WHERE ename LIKE 'W%D';

--��10) �μ���ȣ�� 10�̸鼭 ������ CLERK�� �ƴ� ����� �̸�, ��å, �μ���ȣ�� ����Ͻÿ�.
SELECT ename, job, deptno
FROM EMP
WHERE deptno = 10 AND job != 'CLERK';

--��11) 1981�� 2���� �Ի��� ����� �����ȣ, �̸�, �μ���ȣ�� �˻��Ͻÿ�.
SELECT empno, ename, deptno
FROM EMP
WHERE hiredate Like '81/02%';

SELECT empno, ename, deptno
FROM EMP
WHERE hiredate BETWEEN '81/02/01' AND '81/02/28';

--[NOT]
--��12) comm�� ���� �ʴ� ������� �����ȣ, ����̸�, �޿��� �޿� ������������ ����Ͻÿ�.
SELECT empno, ename, sal
FROM EMP
WHERE comm IS NULL OR comm = 0
ORDER BY sal;

--[ORDER BY]
--��13) �μ���ȣ�� ������������ �����ϰ� �μ���ȣ�� ���� ��쿡�� �޿��� ������������ �����Ͻÿ�.
SELECT ename, sal, deptno
FROM EMP
ORDER BY deptno , sal;

--��14) ������� �̸�, ������� �̸� ù���ڸ� �빮�ڷ� ����ϰ� �̸��� ������������ �˻��Ͻÿ�.
SELECT ename, INITCAP(ename)
FROM EMP
ORDER By ename;

--��15) ����̸��� 10�ڸ��� ����ϰ�, �ڿ� '-'�� ä�������ÿ�.
SELECT RPAD(ename,10,'-')
FROM EMP;

--��16) ����̸�, ��������� �ҹ��ڷ� �˻��Ͻÿ�.
SELECT LOWER(ename), LOWER(job)
FROM EMP;

--��17) �����ȣ, �Ի���, �ٹ����ڸ� �˻��Ͽ� ����Ͻÿ�.
SELECT empno, hiredate, FLOOR(SYSDATE - HIREDATE)AS �ٹ�����  FROM EMP; 

--��18) �����ȣ, �Ի���, �Ի� 10��° ��¥�� �Ż��Ͽ� ����Ͻÿ�.
SELECT empno, hiredate, (hiredate + (365*10))AS �Ի�10���� FROM EMP;

--��19) �Ի����� 81/04/02���� �ʰ� 92/12/09���� ���� ����� �̸�, ����, �μ���ȣ�� ����Ͻÿ�.
SELECT ename, sal, deptno
FROM EMP
WHERE TO_DATE(hiredate, 'yy/mm/dd') > TO_DATE('81/02/20', 'yy/mm/dd')
AND TO_DATE(hiredate, 'yy/mm/dd') < TO_DATE('92/12/09','yy/mm/dd');

--��20) ��� ����� Ŀ�̼��� 200�� �߰��Ͽ� ����Ͻÿ�. ����̸�, Ŀ�̼��� ���̽ÿ�.
SELECT ename, NVL(comm,0) + 200 AS comm FROM EMP;

SELECT ename, NVL2(comm,comm+200, 200) AS comm FROM EMP;

--��21) MGR(�����)�� ���� ��� ��������� ǥ���Ͽ� ��ü ��� ������ ����Ͻÿ�.
SELECT empno, ename, job, NVL(TO_CHAR(MGR), '�����')AS MGR, hiredate,sal,comm,deptno
FROM EMP;

SELECT empno, ename, job, NVL2(TO_CHAR(MGR), TO_CHAR(MGR), '�����')AS MGR, hiredate,sal,comm,deptno
FROM EMP;

--��22) �л� �̸�, �����Ը� ����Ͻÿ�. ��, �����԰� 90�� �ƴϸ�, NULL�� ����Ͻÿ�.
SELECT stu_name, NVL(TO_CHAR(NULLIF(stu_weight, 90)),'90kg')AS stu_weight FROM STUDENT;

--��23) �л��� �߿� ���� �л��� ��ϱ� 1000����, �������� �л� ��ϱ� 500����, 
--��ǻ������ �л� ��ϱ� 300�����̶�� �մϴ�. �й�, �̸�, ����, ��ϱ��� ����Ͻÿ�. ��, 2013�й��� ����Ͻÿ�.
SELECT stu_no, stu_name, stu_dept,
DECODE (stu_dept, '���', '1000����',
                  '��������', '500����',
                  '��ǻ������', '300����',
                  '����') AS ��ϱ�
FROM STUDENT
WHERE stu_no LIKE '2013%';

SELECT stu_no, stu_name, stu_dept,
CASE stu_dept WHEN '���' THEN '1000����'
              WHEN '��������' THEN '500����'
              WHEN '��ǻ������' THEN '300����'
              ELSE '����'
END AS ��ϱ�
FROM STUDENT
WHERE stu_no LIKE '2013%';




