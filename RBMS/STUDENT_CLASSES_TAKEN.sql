set define off;
  CREATE OR REPLACE PROCEDURE "SYSTEM"."ST_CLASSES_TAKEN" 
( B_NO   IN    STUDENTS.B#%TYPE,
  RESULT1 OUT VARCHAR2,
  CUR_CLASSES_TAKEN   OUT   SYS_REFCURSOR)
AS 
V_B_NO_COUNT NUMBER;
BEGIN

select count(*) into V_B_NO_COUNT from enrollments where B# = B_NO;

if( V_B_NO_COUNT > 0) then
RESULT1 := 'SUCCESS';
open CUR_CLASSES_TAKEN for
SELECT temp.*,
  g.ngrade
FROM
  (SELECT DISTINCT en.B#,
    cl.classid,
    en.lgrade
  FROM classes cl,
    students st,
    enrollments en
  WHERE en.B#    = B_NO
  AND en.classid = cl.classid
  )temp
LEFT OUTER JOIN grades g
ON temp.lgrade = g.lgrade;
ELSE
RESULT1 := 'FAILURE';

END IF;
END ST_CLASSES_TAKEN;