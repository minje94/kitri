--사원의 이름과 연봉
SELECT ename, sal FROM EMP;

--전체 사원의 정보를 보이시오
SELECT * FROM EMP;

--직책을 보이시오
SELECT DISTINCT job FROM EMP;

--직책이 매니저인 사원만 뽑아봐라
SELECT ename, job FROM EMP WHERE job = 'MANAGER';

--학생들의 이름, 키와 몸무게를 표시하시오.
SELECT stu_name AS 이름,
       stu_height + 10 AS 키,
       stu_weight + 5 AS 몸무게
FROM STUDENT;

--옥한빛 학생은 키가 177이고 몸무게가 80입니다. 로 출력하시오 ||사용하여 문자를 붙일 수 있음.
SELECT stu_name || '학생은 키가' || stu_height || '이고 몸무게가 ' || stu_weight || '입니다.'
FROM STUDENT
WHERE stu_name = '옥한빛';

--사원번호로 오름차순 정렬하라.
SELECT *
FROM EMP
ORDER BY empno ASC;

--사원번호로 내림차순 정렬하라.
SELECT *
FROM EMP
ORDER BY empno DESC;

--직업이 CLERK인 사람의 사원본호를 오름차순으로 정렬하라
SELECT ENAME, EMPNO
FROM EMP
WHERE job = 'CLERK'
ORDER BY 1;

SELECT EMPNO, ENAME
FROM EMP
WHERE job = 'CLERK'
ORDER BY 2;

-----------------------------
--문1) 기계과 학생들의 학번, 이름, 학과명을 출력하시오.
SELECT stu_no, stu_name, stu_dept FROM STUDENT WHERE stu_dept = '기계';

--문2) 여학생들의 학과명을 출력하시오.
SELECT DISTINCT stu_dept FROM STUDENT WHERE stu_gender = 'F';

--문3) '옥한빛' 학생의 정보를 모두 보이시오.
SELECT * FROM STUDENT WHERE stu_name = '옥한빛';

--문4) 사원명과 사원번호에 1씩 추가한 값을 조회하시오.
SELECT * FROM EMP;
SELECT ename , empno + 1 AS 사원번호 FROM EMP;

--문5) 사원명, 급여, 급여 + 보너스(실수령액), 급여의 10%인 세금을 출력하시오.
SELECT ename AS 사원명, sal AS 급여, sal + NVL(comm,0) AS 실수령액, sal/10 AS 세금
FROM EMP;

--문6) KING의 사원번호는 7839이며 월급은 5000입니다. 위와 같이 출력하시오.
SELECT ename || '의 사원번호는' ||
       empno || '이며, 월급은 ' ||
       sal || '입니다.' 
FROM EMP
WHERE ename = 'KING';
commit;