set define off;
  CREATE OR REPLACE PROCEDURE "SYSTEM"."CL_COURSES_DETAILS" 
( CLASS_ID_IN   IN    CLASSES.CLASSID%TYPE,
  RESULT1 OUT VARCHAR2,
  CUR_CLASSES_TAKEN   OUT   SYS_REFCURSOR)
AS 
V_CLASS_ID_COUNT NUMBER;
BEGIN

select count(*) into V_CLASS_ID_COUNT from CLASSES where classid = CLASS_ID_IN;

if( V_CLASS_ID_COUNT > 0) then
RESULT1 := 'SUCCESS';
open CUR_CLASSES_TAKEN for
SELECT DISTINCT cl.classid,
  st.B#,
  st.firstname,
  co.course#,
  co.dept_code,
  co.title
FROM courses co,
  classes cl,
  enrollments en,
  students st
WHERE cl.course# =co.course#
AND cl.dept_code = co.dept_code
AND en.B#        = st.B#
AND en.classid = CLASS_ID_IN;
else
RESULT1 := 'FAILURE';
END IF;
END CL_COURSES_DETAILS;
