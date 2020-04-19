--����� �̸��� ����
SELECT ename, sal FROM EMP;

--��ü ����� ������ ���̽ÿ�
SELECT * FROM EMP;

--��å�� ���̽ÿ�
SELECT DISTINCT job FROM EMP;

--��å�� �Ŵ����� ����� �̾ƺ���
SELECT ename, job FROM EMP WHERE job = 'MANAGER';

--�л����� �̸�, Ű�� �����Ը� ǥ���Ͻÿ�.
SELECT stu_name AS �̸�,
       stu_height + 10 AS Ű,
       stu_weight + 5 AS ������
FROM STUDENT;

--���Ѻ� �л��� Ű�� 177�̰� �����԰� 80�Դϴ�. �� ����Ͻÿ� ||����Ͽ� ���ڸ� ���� �� ����.
SELECT stu_name || '�л��� Ű��' || stu_height || '�̰� �����԰� ' || stu_weight || '�Դϴ�.'
FROM STUDENT
WHERE stu_name = '���Ѻ�';

--�����ȣ�� �������� �����϶�.
SELECT *
FROM EMP
ORDER BY empno ASC;

--�����ȣ�� �������� �����϶�.
SELECT *
FROM EMP
ORDER BY empno DESC;

--������ CLERK�� ����� �����ȣ�� ������������ �����϶�
SELECT ENAME, EMPNO
FROM EMP
WHERE job = 'CLERK'
ORDER BY 1;

SELECT EMPNO, ENAME
FROM EMP
WHERE job = 'CLERK'
ORDER BY 2;

-----------------------------
--��1) ���� �л����� �й�, �̸�, �а����� ����Ͻÿ�.
SELECT stu_no, stu_name, stu_dept FROM STUDENT WHERE stu_dept = '���';

--��2) ���л����� �а����� ����Ͻÿ�.
SELECT DISTINCT stu_dept FROM STUDENT WHERE stu_gender = 'F';

--��3) '���Ѻ�' �л��� ������ ��� ���̽ÿ�.
SELECT * FROM STUDENT WHERE stu_name = '���Ѻ�';

--��4) ������ �����ȣ�� 1�� �߰��� ���� ��ȸ�Ͻÿ�.
SELECT * FROM EMP;
SELECT ename , empno + 1 AS �����ȣ FROM EMP;

--��5) �����, �޿�, �޿� + ���ʽ�(�Ǽ��ɾ�), �޿��� 10%�� ������ ����Ͻÿ�.
SELECT ename AS �����, sal AS �޿�, sal + NVL(comm,0) AS �Ǽ��ɾ�, sal/10 AS ����
FROM EMP;

--��6) KING�� �����ȣ�� 7839�̸� ������ 5000�Դϴ�. ���� ���� ����Ͻÿ�.
SELECT ename || '�� �����ȣ��' ||
       empno || '�̸�, ������ ' ||
       sal || '�Դϴ�.' 
FROM EMP
WHERE ename = 'KING';
commit;