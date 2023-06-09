CREATE TABLE JOB_HISTORY
   (	EMPLOYEE_ID NUMBER(6,0) CONSTRAINT JHIST_EMPLOYEE_NN NOT NULL ENABLE,
	START_DATE DATE CONSTRAINT JHIST_START_DATE_NN NOT NULL ENABLE,
	END_DATE DATE CONSTRAINT JHIST_END_DATE_NN NOT NULL ENABLE,
	JOB_ID VARCHAR2(10) CONSTRAINT JHIST_JOB_NN NOT NULL ENABLE,
	DEPARTMENT_ID NUMBER(4,0),
	 CONSTRAINT JHIST_DATE_INTERVAL CHECK (end_date > start_date) ENABLE,
	 CONSTRAINT JHIST_JOB_FK FOREIGN KEY (JOB_ID)
	  REFERENCES JOBS (JOB_ID) ENABLE,
	 CONSTRAINT JHIST_EMP_FK FOREIGN KEY (EMPLOYEE_ID)
	  REFERENCES EMPLOYEES (EMPLOYEE_ID) ENABLE,
	 CONSTRAINT JHIST_DEPT_FK FOREIGN KEY (DEPARTMENT_ID)
	  REFERENCES DEPARTMENTS (DEPARTMENT_ID) ENABLE
   ) ;
  CREATE UNIQUE INDEX JHIST_EMP_ID_ST_DATE_PK ON JOB_HISTORY (EMPLOYEE_ID, START_DATE)
  ;
ALTER TABLE JOB_HISTORY ADD CONSTRAINT JHIST_EMP_ID_ST_DATE_PK PRIMARY KEY (EMPLOYEE_ID, START_DATE)
  USING INDEX JHIST_EMP_ID_ST_DATE_PK  ENABLE;
CREATE UNIQUE INDEX JHIST_EMP_ID_ST_DATE_PK ON JOB_HISTORY (EMPLOYEE_ID, START_DATE)
  ;
CREATE INDEX JHIST_JOB_IX ON JOB_HISTORY (JOB_ID)
  ;
CREATE INDEX JHIST_EMPLOYEE_IX ON JOB_HISTORY (EMPLOYEE_ID)
  ;
CREATE INDEX JHIST_DEPARTMENT_IX ON JOB_HISTORY (DEPARTMENT_ID)
  ;

