/*Package Specification*/
create or replace package STUDENT_MANAGEMENT_SYSTEM as

PROCEDURE          "CL_COURSES_DETAILS" 
( CLASS_ID_IN   IN    CLASSES.CLASSID%TYPE,
  CUR_CLASSES_TAKEN   OUT   SYS_REFCURSOR);
  
PROCEDURE "DELETE_STUDENT"(student_B# in Students.B#%type);

PROCEDURE "P_STUD_ENROLL"(
    B_NO_IN     IN STUDENTS.B#%type,
    CLASS_ID_IN IN CLASSES.CLASSID%type,
    message OUT varchar2);
    
PROCEDURE          "SHOW_STUDENTS" 
( SELECTION   IN    varchar2,
  TABLE_DATA   OUT   SYS_REFCURSOR);
  
PROCEDURE "ST_CLASSES_TAKEN"(
    B_NO_IN IN STUDENTS.B#%TYPE,
    CUR_CLASSES_TAKEN OUT SYS_REFCURSOR);
    
PROCEDURE "VIEW_PREREQ"(
    d_code IN PREREQUISITES.DEPT_CODE%TYPE,
    c_no   IN PREREQUISITES.COURSE#%TYPE,
    c1 OUT SYS_REFCURSOR);

PROCEDURE "DROP_ST_FROM_CLASS"(student_B# in Students.B#%type,class_id in Classes.classid%type, message out varchar2);

end;
/