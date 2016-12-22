--------------------------------------------------------
--  DDL for Procedure SHOW_STUDENTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "NMAHESH2"."SHOW_STUDENTS" 
( SELECTION   IN    varchar2,
  TABLE_DATA   OUT   SYS_REFCURSOR)

AS 

BEGIN

      IF( SELECTION = '1') THEN
           OPEN  TABLE_DATA FOR
              SELECT * FROM STUDENTS;
      
      ELSIF( SELECTION = '2') THEN
          OPEN TABLE_DATA FOR
              SELECT * FROM COURSES;
      
      ELSIF( SELECTION = '3') THEN
          OPEN TABLE_DATA FOR
              SELECT * FROM COURSE_CREDIT;
      
      ELSIF( SELECTION = '4') THEN
          OPEN TABLE_DATA FOR
              SELECT * FROM CLASSES;
      
      ELSIF( SELECTION = '5') THEN
          OPEN TABLE_DATA FOR
              SELECT * FROM ENROLLMENTS;
      
	  ELSIF( SELECTION = '6') THEN
          OPEN TABLE_DATA FOR
              SELECT * FROM GRADES;
              
      ELSIF( SELECTION = '7') THEN
          OPEN TABLE_DATA FOR
              SELECT * FROM PREREQUISITES;
			  
	  ELSIF( SELECTION = '8') THEN 
          OPEN TABLE_DATA FOR
              SELECT * FROM LOGS
              order by TIME DESC;
      END IF;
      
END SHOW_STUDENTS;