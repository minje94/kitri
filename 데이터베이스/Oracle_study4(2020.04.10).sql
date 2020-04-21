--SUBQUERY
--[Single Row] 서브쿼리 결과가 1개
--예1) 평균 신장보다 큰 학생의 이름, 키, 학과를 출력하시오.
SELECT stu_name, stu_height, stu_dept
FROM STUDENT
WHERE stu_height > (SELECT ROUND(AVG(stu_height))
                    FROM STUDENT);

SELECT stu_name, stu_height, stu_dept
FROM (SELECT stu_name, stu_height, stu_dept
      FROM STUDENT
      WHERE stu_height > (SELECT ROUND(AVG(stu_height))
                          FROM STUDENT));
                    
--[Multi Row] 서브쿼리 결과가 2개 이상
--예2) 각 부서별 최소 급여를 받는 사원의 이름과 급여를 보여리.
SELECT ename, sal
FROM EMP
WHERE (deptno, sal) IN (SELECT deptno, min(sal)
                        FROM EMP
                        GROUP BY deptno);


------------------------------

--문1) 김인중씨보다 큰 학생들의 이름, 학과, 키를 출력하시오.
SELECT stu_name, stu_dept, stu_height
FROM STUDENT
WHERE stu_height > (SELECT stu_height
                    FROM STUDENT
                    WHERE stu_name = '김인중');
                    
--문2) 평균 급여보다 높은 사원의 이름, 급여를 보이시오.
SELECT ename, sal
FROM EMP
WHERE sal > (SELECT AVG(sal)
             FROM EMP);

--문3) '기계'학과와 같은 반(stu_class)인 다른 학과 학생들의 학번, 이름, 학과를 출력하시오.
SELECT stu_no, stu_name, stu_dept
FROM STUDENT
WHERE stu_class = (SELECT DISTINCT stu_class --> stu_class가 여러개라면 IN을 사용하면 된다.
                   FROM STUDENT
                   WHERE stu_dept = '기계')
AND stu_dept != '기계';   

--문4) 학과별 평균 신장 중 가장 높은 평균 신장, 학과이름을 출력하시오.
SELECT AVG(stu_height), stu_dept 
FROM STUDENT
GROUP BY stu_dept
HAVING AVG(stu_height) = (SELECT MAX(AVG(stu_height))
                          FROM STUDENT
                          GROUP BY stu_dept);

--문5) 부서 평균 급여가 전체 직원 평균 급여보다 많은 부서의 부서명, 부서평균급여를 출력하시오.
SELECT dname, ROUND(AVG(sal))
FROM EMP NATURAL JOIN DEPT
GROUP BY dname
HAVING AVG(sal) > (SELECT AVG(sal)
                   FROM EMP) ;

--문6) SCOTT사원보다 많은 급여를 받는 사원 정보를 모두 출력하시오.
SELECT * 
FROM EMP
WHERE sal > (SELECT sal
             FROM EMP
             WHERE ename = 'SCOTT');
              
SELECT * 
FROM EMP e1, EMP e2
WHERE e2.ename = 'SCOTT' 
AND e1.sal > e2.sal;

--문7) 기계과 학생들 중 학년별 평균 신장이 160이상인 학년과 평균 신장을 출력하시오. 
-- 중간에 놓침 수정필요...
SELECT stu_grade, AVG(stu_height)
FROM STUDENT
WHERE stu_dept = '기계'
GROUP BY stu_grade
HAVING AVG(stu_height) >= 160;

--문8) CHICAGO에 근무하지 않은 모든 사원의 정보를 출력하시오.
-- 중간에 놓침 수정필요...
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


--문9) 20번 부서의 최대급여보다 최대급여가 많은 부서의 부서번호, 부서이름, 최대급여를 검색하시오.
SELECT DEPT.deptno, DEPT.dname, MAX(sal)
FROM DEPT, SALGRADE, EMP
WHERE EMP.deptno = DEPT.deptno
GROUP BY EMP.deptno
HAVING MAX(sal) > (SELECT MAX(sal)
                   FROM EMP
                   WHERE deptno = 20);

SELECT EMP.deptno, DEPT.dname, MAX(EMP.sal) --답
FROM DEPT JOIN EMP ON DEPT.deptno = EMP.deptno
GROUP BY EMP.deptno, DEPT.dname
HAVING MAX(EMP.sal) >= ( SELECT MAX(sal)
                         FROM EMP
                         WHERE deptno = 20);
                         
--문10) SLESMAN의 커미션 평균을 출력하시오.
SELECT AVG(NVL(COMM,0))
FROM EMP
WHERE job = 'SALESMAN';

SELECT AVG(com)
FROM (SELECT NVL(comm,0) AS com -->com이라고 이름을 붙인값을 select에 사용하여 해결 
      FROM EMP
      WHERE job = 'SALESMAN');

--문11) 각 부서별 최소 급여를 받는 사원의 이름과 급여를 구하라. (IN, ANY, SOME)
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
                             
--문12) 20번 부서 사원의 사원직무와 같은 사원직무인 다른 부서의 사원정보를 모두 검색하시오. (IN, ANY, SOME)                         
SELECT *
FROM EMP
WHERE JOB IN ( SELECT DISTINCT JOB
               FROM EMP
               WHERE DEPTNO = 20)
AND deptno != 20;                     