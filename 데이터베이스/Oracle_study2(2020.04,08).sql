--2020.04.08 교육 2일차
--예1) 기계과 이면서, 남자인 학생의 모든 정보를 확인하시오.
SELECT *
FROM STUDENT
WHERE stu_dept = '기계' AND stu_gender = 'M';

--예2) 기계과 이거나 남자인 학생의 모든 정보를 확인하시오.
SELECT *
FROM STUDENT
WHERE stu_dept = '기계' OR stu_gender = 'M';

--예3) 남자이면서, 키가 170이상인 사람의 모든 정보를 확인하시오.
SELECT *
FROM STUDENT
WHERE stu_height > 170 AND stu_gender = 'M';

--예4)'기계과'이거나 '전기과'인 학생을 출력하시오.
SELECT *
FROM STUDENT
WHERE stu_dept = '기계' OR stu_dept = '전기전자';

SELECT *
FROM STUDENT
WHERE stu_dept IN('기계', '전기전자');

--예5) 키가 160이상 180이하인 학생의 모든 정보를 출력하시오.
SELECT *
FROM STUDENT
WHERE stu_height >= 160
AND stu_height <= 180;

SELECT *
FROM STUDENT
WHERE stu_height BETWEEN 160 AND 180; --> 이상, 이하로 나타냄!!!

--[LIKE]
--예6) 사원이름이 A로 시작되는 사원 정보를 보이시오.
SELECT *
FROM EMP
WHERE ename LIKE 'A%';

--예7) 사원이름이 s로 끝나는 사원 정보를 보이시오.
SELECT *
FROM EMP
WHERE ename LIKE '%S';

--예8) 사원이름의 두번째가 A인 사원 정보를 보이시오.
SELECT *
FROM EMP
WHERE ename LIKE '_A%'; --->'_'로 위치 표시

--[IS NULL] [IS NOT NULL]
--예9)키가 NULL인 학생의 이름과 키를 출력하시오.
SELECT stu_name, stu_height
FROM STUDENT
WHERE stu_height IS NULL;

--[숫자함수] ABS MOD, SIGN, CEIL, FLOOR, ROUND, TRUNC
SELECT ABS(-10) --> ABS는 절대값 표현 
FRom DUAL; --> dual은 덤프 테이블

SELECT MOD(10,3) --> MOD는 나머지값 리턴
FROM DUAL;

SELECT SIGN(-10) --> 양수이면 1, 음수이면 -1 출력
FROM DUAL;

SELECT CEIL(20.5) --> 올림
FROM DUAL;

SELECT FLOOR(20.5) --> 내림
FROM DUAL;

SELECT ROUND(19.487654,1) --> 반올림 숫자, 자릿수
FROM DUAL;

SELECT ROUND(sal,-3) AS sal
FROM EMP;

--[문자함수] LOWER, UPPER, INITCAP, CONCAT, SUBSTR, LENGTH, LTRIM, RTRIM, TRIM, LPAD, TRANSLATE
SELECT LOWER('APPLE')
FROM DUAL;

SELECT LOWER(ename) AS LOWER_NAME --> 소문자로 변경
FROM EMP;

SELECT INITCAP(ename) -->첫문자 대문자, 이후 소문자
FROM EMP;

SELECT ename || job
FROM EMP;

SELECT CONCAT(CONCAT(ename, '''s job category is'), job) "job" --> 글자 합치기
FROM EMP;

SELECT SUBSTR('ABCDEFG',3,4)
FROM DUAL;

SELECT DISTINCT SUBSTR(stu_name,0,1) AS FAMILY_NAME --> (문자, 시작점,부터 몇번째까지)
FROM STUDENT;

SELECT LENGTH('ABCDEFG') --> 길이 출력
FROM DUAL;

--[날짜함수] SYSDATE, SYSTIMESTAMP
SELECT SYSDATE FROM DUAL; 

SELECT SYSDATE+(10/24) FROM DUAL; -->10시간 추가

SELECT SYSTIMESTAMP FROM DUAL;

SELECT ADD_MONTHS(SYSDATE,3) FROM DUAL; --> 3달 후

SELECT NEXT_DAY(SYSDATE, '화') FROM DUAL; --> 다음 화요일

SELECT LAST_DAY(SYSDATE) FROM DUAL; --> 이번달 마지막날

SELECT LAST_DAY(ADD_MONTHS(SYSDATE,3)) FROM DUAL; --> 3달 후 마지막날

SELECT ROUND(SYSDATE+10,'MON') FROM DUAL;

--[변환함수] TO_NUMBER, TO_CHAR, TO_DATE
SELECT TO_NUMBER('123456789') FROM DUAL;

SELECT TO_CHAR(SYSDATE) FROM DUAL;

SELECT TO_CHAR(123456789,'99999999') FROM DUAL;

SELECT TO_CHAR(123456.78,'999999.99') + 1 FROM DUAL; 
-->문자형으로 변환되었기 때문에 출려고 되면 안되지만 developer가 알아사 연산함.

SELECT TO_DATE('20/04/08', 'YY/MM/DD') FROM DUAL;

SELECT TO_DATE('20/04/08', 'YY/MM/DD') FROM DUAL;

--[null 함수] NVL([열이름], 0) NVL2([열이름],[null이 아닌경우, [null인 경우)
SELECT ename, comm, NVL(comm,0) FROm EMP; -->null이 아니면 숫자 출력, null이면 0출력

SELECT ename, NVL2(COMM, SAL+COMM,SAL) AS 실제봉급, sal FROM EMP;

--NULLIF('A','A') -> 둘이 같으면 null, 다르면 앞의 값이 나온다. 
SELECT NULLIF('A','A') FROM DUAL;

SELECT NULLIF('A','B') FROM DUAL;

--COALESCE(1,2,3,,,,,n)처음부터 확인해서 null값이 안나오는 첫번째 경우 출력.
SELECT COALESCE(null,null,null,null,10,200,300) FROM DUAL;

--DECODE는 CASE를 함수로 만든 것. CASE는 SELECT문에만 사용할 수 있다.
SELECT empno,ename, sal,
    CASE job WHEN 'SALESMAN' THEN SAL * 1.1
             WHEN 'CLERK' THEN SAL * 1.3
             WHEN 'MANAGER' THEN SAL * 1.5
             ELSE SAL
    END AS 급여인상분
FROM EMP;

DECODE
SELECT empno, ename, sal,
    DECODE(job, 'SALESMAN', sal * 1.1,
                'CLERK', sal * 1.3,
                'MANAGER', sal * 1.5,
                            sal) AS 급여인상분
FROM EMP;

-------------------------
--문1) 부서번호가 10번인 사원의 사원번호, 사원이름, 월급을 출력하시오.
SELECT empno, ename, sal
FROM EMP
WHERE deptno = 10;

--문2) 사원번호가 7369 보다 큰 사원의 이름, 입사일, 부서번호를 출력하시오. 
--단 입사일이 빠른 순으로 출력하시오.
SELECT ename, hiredate, deptno
FROM EMP
WHERE empno > 7369
ORDER BY 2;

--문3) 월급이 3000이상이고 JOB이 ANALYST인 사원의 이름, 월급, 커미션을 출력하시오.
SELECT ename, sal, comm
FROM EMP
WHERE sal >= 3000 AND job = 'ANALYST';

--문4) 사원번호가 7300보다 크고 7400보다 작은 사원의 이름, 입사일, 부서번호를 출력하시오.
SELECT ename, hiredate, deptno
FROM EMP
WHERE empno > 7300 AND empno <7400;

SELECT ename, hiredate, deptno
FROM EMP
WHERE empno BETWEEN 7301 AND 7399;

--문5) DEPTNO가 10이거나 20인 사원의 모든 정보를 사원번호순으로 정렬하여 표시하시오.
SELECT * FROM EMP WHERE deptno IN (10,20); --> IN이나 SOME이나 ANY나 같다
SELECT * FROM EMP WHERE deptno = SOME (10,20);
SELECT * FROM EMP WHERE deptno = ANY (10,20);

--문6) 사원중에 CLERK, SALESMAN, MANAGER인 사원이름, 월급, 사원번호를 출력하시오.
SELECT ename, sal, empno
FROM EMP
WHERE JOB IN ('CLERK', 'SALESMAN', 'MANAGER'); 

--문7) 학생들 중에 2013으로 시작하는 학번을 가진 모든 학생의 정보를 출력하시오.
SELECT *
FROM STUDENT
WHERE stu_no LIKE '2013%';

--문8) 학생들 중에 성이 '옥'이고 키가 170보다 큰 학생의 이름, 과, 학번을 출력하시오.
--     단, 학번은 내림차순으로 정렬하시오.
SELECT stu_name, stu_dept, stu_no
FROM STUDENT
WHERE stu_name LIKE '옥%' AND stu_height >= 170
ORDER BY stu_no DESC; 

--문9) 이름이 W로 시작하고 D로 끝나는 사람의 사원명, 직책, 부서번호를 출력하시오.
SELECT ename, job, deptno
FROM EMP
WHERE ename LIKE 'W%D';

--문10) 부서번호가 10이면서 직급이 CLERK가 아닌 사원의 이름, 직책, 부서번호를 출력하시오.
SELECT ename, job, deptno
FROM EMP
WHERE deptno = 10 AND job != 'CLERK';

--문11) 1981년 2월에 입사한 사원의 사원번호, 이름, 부서번호를 검색하시오.
SELECT empno, ename, deptno
FROM EMP
WHERE hiredate Like '81/02%';

SELECT empno, ename, deptno
FROM EMP
WHERE hiredate BETWEEN '81/02/01' AND '81/02/28';

--[NOT]
--문12) comm을 받지 않는 사원들의 사원번호, 사원이름, 급여를 급여 오름차순으로 출력하시오.
SELECT empno, ename, sal
FROM EMP
WHERE comm IS NULL OR comm = 0
ORDER BY sal;

--[ORDER BY]
--문13) 부서번호를 오름차순으로 정렬하고 부서번호가 같은 경우에는 급여를 오름차순으로 정렬하시오.
SELECT ename, sal, deptno
FROM EMP
ORDER BY deptno , sal;

--문14) 사원들의 이름, 사원들의 이름 첫글자를 대문자로 출력하고 이름의 오름차순으로 검색하시오.
SELECT ename, INITCAP(ename)
FROM EMP
ORDER By ename;

--문15) 사원이름을 10자리로 출력하고, 뒤에 '-'를 채워넣으시오.
SELECT RPAD(ename,10,'-')
FROM EMP;

--문16) 사원이름, 사원직무를 소문자로 검색하시오.
SELECT LOWER(ename), LOWER(job)
FROM EMP;

--문17) 사원번호, 입사일, 근무일자를 검색하여 출력하시오.
SELECT empno, hiredate, FLOOR(SYSDATE - HIREDATE)AS 근무일자  FROM EMP; 

--문18) 사원번호, 입사일, 입사 10년째 날짜를 거색하여 출력하시오.
SELECT empno, hiredate, (hiredate + (365*10))AS 입사10년후 FROM EMP;

--문19) 입사일이 81/04/02보다 늦고 92/12/09보다 빠른 사원의 이름, 월급, 부서번호를 출력하시오.
SELECT ename, sal, deptno
FROM EMP
WHERE TO_DATE(hiredate, 'yy/mm/dd') > TO_DATE('81/02/20', 'yy/mm/dd')
AND TO_DATE(hiredate, 'yy/mm/dd') < TO_DATE('92/12/09','yy/mm/dd');

--문20) 모든 사원의 커미션을 200씩 추가하여 출력하시오. 사원이름, 커미션을 보이시오.
SELECT ename, NVL(comm,0) + 200 AS comm FROM EMP;

SELECT ename, NVL2(comm,comm+200, 200) AS comm FROM EMP;

--문21) MGR(상급자)이 없는 경우 사장님으로 표시하여 전체 사원 정보를 출력하시오.
SELECT empno, ename, job, NVL(TO_CHAR(MGR), '사장님')AS MGR, hiredate,sal,comm,deptno
FROM EMP;

SELECT empno, ename, job, NVL2(TO_CHAR(MGR), TO_CHAR(MGR), '사장님')AS MGR, hiredate,sal,comm,deptno
FROM EMP;

--문22) 학생 이름, 몸무게를 출력하시오. 단, 몸무게가 90이 아니면, NULL로 출력하시오.
SELECT stu_name, NVL(TO_CHAR(NULLIF(stu_weight, 90)),'90kg')AS stu_weight FROM STUDENT;

--문23) 학생들 중에 기계과 학생의 등록금 1000만원, 전기전자 학생 등록금 500만원, 
--컴퓨터정보 학생 등록금 300만원이라고 합니다. 학번, 이름, 전공, 등록금을 출력하시오. 단, 2013학번만 출력하시오.
SELECT stu_no, stu_name, stu_dept,
DECODE (stu_dept, '기계', '1000만원',
                  '전기전자', '500만원',
                  '컴퓨터정보', '300만원',
                  '없음') AS 등록금
FROM STUDENT
WHERE stu_no LIKE '2013%';

SELECT stu_no, stu_name, stu_dept,
CASE stu_dept WHEN '기계' THEN '1000만원'
              WHEN '전기전자' THEN '500만원'
              WHEN '컴퓨터정보' THEN '300만원'
              ELSE '없음'
END AS 등록금
FROM STUDENT
WHERE stu_no LIKE '2013%';




