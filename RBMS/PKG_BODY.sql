/*Package Body*/
create or replace package body STUDENT_MANAGEMENT_SYSTEM as

--
PROCEDURE          "CL_COURSES_DETAILS" 
( CLASS_ID_IN   IN    CLASSES.CLASSID%TYPE,
  CUR_CLASSES_TAKEN   OUT   SYS_REFCURSOR)
AS 
V_CLASS_ID_COUNT NUMBER;
V_STUDENT_COUNT NUMBER;
INVALID_CLASS EXCEPTION;
NO_STUDENT EXCEPTION;
BEGIN

select count(*) into V_CLASS_ID_COUNT from CLASSES where classid = CLASS_ID_IN;

if( V_CLASS_ID_COUNT > 0) then
SELECT DISTINCT count(*) into V_STUDENT_COUNT
FROM courses co,
  classes cl,
  enrollments en,
  students st
WHERE cl.course# =co.course#
AND cl.dept_code = co.dept_code
AND en.B#        = st.B#
AND cl.classid = en.classid
AND en.classid = CLASS_ID_IN;
if( V_STUDENT_COUNT = 0) then 
raise NO_STUDENT;
end if;
open CUR_CLASSES_TAKEN for
SELECT DISTINCT en.classid,
  st.B#,
  st.firstname,
  cl.course#,
  cl.dept_code,
  co.title
FROM courses co,
  classes cl,
  enrollments en,
  students st
WHERE cl.course# =co.course#
AND cl.dept_code = co.dept_code
AND en.B#        = st.B#
AND cl.classid = en.classid
AND en.classid = CLASS_ID_IN;
else
raise INVALID_CLASS;
END IF;
EXCEPTION 
when INVALID_CLASS then
raise_application_error(-20016, 'Class ID invalid');
when NO_STUDENT then
raise_application_error(-20017, 'No student in Class');
END CL_COURSES_DETAILS;


--
PROCEDURE "DELETE_STUDENT"(student_B# in Students.B#%type)
AS
STUDENT_COUNT NUMBER;
INVALID_BNO EXCEPTION;

BEGIN
SELECT COUNT(*) INTO STUDENT_COUNT FROM students WHERE Students.B# = student_B#;
IF(STUDENT_COUNT = 0) THEN
raise INVALID_BNO;
END IF;

DELETE from students where B# = student_B#;

EXCEPTION
	WHEN INVALID_BNO THEN
    	raise_application_error(-20030, 'Invalid B Number');
END DELETE_STUDENT;


--
PROCEDURE "P_STUD_ENROLL"(
    B_NO_IN     IN STUDENTS.B#%type,
    CLASS_ID_IN IN CLASSES.CLASSID%type,
    message OUT varchar2)
AS
  count1 NUMBER;
	count2 NUMBER;
	count3 NUMBER;
	count5 NUMBER;
   v_count number;
   v_p_count number;
   V_PREREQ_COUNT NUMBER;
   
	v_class_size classes.class_size%type;
	v_class_limit classes.limit%type;
  V_SEM CLASSES.SEMESTER%TYPE;
  V_YEAR CLASSES.YEAR%TYPE;
  
  V_PCOURSE# PREREQUISITES.COURSE#%TYPE;
  V_PDEPT_CODE PREREQUISITES.DEPT_CODE%TYPE;
  V_DEPT_CD CLASSES.DEPT_CODE%TYPE;
  V_COURSENO CLASSES.COURSE#%TYPE;
  V_CLASSID CLASSES.CLASSID%TYPE;
  
	invalid_class EXCEPTION;
	invalid_student EXCEPTION;
	exceeded_class_limit EXCEPTION;
	already_enrolled EXCEPTION;
	max_enrollment EXCEPTION;
	required_prerequisites EXCEPTION;
  
 
BEGIN
SELECT count(*) INTO count1 FROM CLASSES WHERE classid= CLASS_ID_IN;
	IF (count1 = 0) THEN
		RAISE invalid_class;
	END IF;
	
	SELECT count(*) INTO count2 FROM STUDENTS WHERE B# = B_NO_IN;
	IF (count2 = 0)THEN
		RAISE invalid_student;
	END IF;
	
	SELECT class_size,limit INTO v_class_size, v_class_limit FROM classes WHERE classid=CLASS_ID_IN;
    IF(v_class_size = v_class_limit) THEN
		RAISE exceeded_class_limit;
    END IF;

	SELECT count(*) INTO count3 FROM students s,enrollments e WHERE e.B#=s.B# and s.B#=B_NO_IN and e.classid=CLASS_ID_IN;
	IF (count3 > 0) THEN
	RAISE already_enrolled;
	END IF;
  
  SELECT c.semester,
    c.YEAR
  INTO V_SEM,
    V_YEAR
  FROM classes c
  WHERE c.classid = CLASS_ID_IN;
  
  SELECT COUNT(*) into v_count
  FROM classes c,
    enrollments e
  WHERE e.classid =c.classid
  AND e.B#        = B_NO_IN
  AND c.year      = V_YEAR
  AND c.semester  = V_SEM;
  IF (v_count = 3) THEN
  message:= 'OVERLOAD';
		--INSERT INTO enrollments values(B_NO_IN,CLASS_ID_IN,null);
   -- update classes set class_size=class_size+1 where classid=CLASS_ID_IN;
        SYS.DBMS_OUTPUT.PUT_LINE('You are overloaded');
	ELSIF (v_count > 3) THEN
	RAISE max_enrollment;
		dbms_output.put_lINe('The Student' || B_NO_IN || 'is already enrolled FOR four classes');
	END IF;
  
select dept_code, course# into V_DEPT_CD, V_COURSENO from classes where classid = CLASS_ID_IN;
select count(*) into v_p_count from prerequisites where dept_code= V_DEPT_CD and course#= V_COURSENO;
if(v_p_count > 0 ) then
For rec1 in (select pre_course#, pre_dept_code into V_PCOURSE#, V_PDEPT_CODE from prerequisites where dept_code= V_DEPT_CD and course#= V_COURSENO)
LOOP
FOR rec in
(select classid from classes where dept_code = rec1.pre_dept_code and course# = rec1.pre_course#)
LOOP
select count(*) into V_PREREQ_COUNT from enrollments where B#= B_NO_IN and classid= rec.classid and lgrade IN ('A','A-','B','B+','B-','C','C+');
	IF (V_PREREQ_COUNT = 0)THEN 
	RAISE required_prerequisites;
	END IF;
END LOOP;
END LOOP;
END IF;

		INSERT INTO enrollments values(B_NO_IN,CLASS_ID_IN,null);
    --update classes set class_size=class_size+1 where classid=CLASS_ID_IN;
EXCEPTION
when invalid_class then 
raise_application_error(-20001, 'Class not valid');
when invalid_student then 
raise_application_error(-20002, 'student not valid');
when exceeded_class_limit then 
raise_application_error(-20003, 'class size exceeded');
when already_enrolled then 
raise_application_error(-20004, 'student already enrolled in class');
when max_enrollment then 
raise_application_error(-20005, 'cannot enroll for more than 4 classes in an academic year');
when required_prerequisites then 
raise_application_error(-20006, 'requires prerequisites');
END P_STUD_ENROLL;


--
PROCEDURE          "SHOW_STUDENTS" 
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



--
PROCEDURE "ST_CLASSES_TAKEN"(
    B_NO_IN IN STUDENTS.B#%TYPE,
    CUR_CLASSES_TAKEN OUT SYS_REFCURSOR)
AS
  V_B_NO_COUNT    NUMBER;
  V_STUDENT_COUNT NUMBER;
  V_CLASSES_COUNT NUMBER;
  INVALID_BNO     EXCEPTION;
  INVALID_CLASS   EXCEPTION;
BEGIN
  SELECT COUNT(*) INTO V_STUDENT_COUNT FROM students WHERE B# = B_NO_IN;
  IF(V_STUDENT_COUNT = 0) THEN
    raise INVALID_BNO;
  END IF;
    
  SELECT COUNT(*)
  INTO V_B_NO_COUNT
  FROM enrollments
  WHERE B#         = B_NO_IN;
    
      IF( V_B_NO_COUNT > 0) THEN
          OPEN CUR_CLASSES_TAKEN FOR SELECT temp.*,
          g.ngrade FROM
          (SELECT DISTINCT en.B#,
          cl.classid,
          en.lgrade
          FROM classes cl,
          students st,
          enrollments en
          WHERE en.B#                                   = B_NO_IN
          AND en.classid                                = cl.classid
          )temp LEFT OUTER JOIN grades g ON temp.lgrade = g.lgrade;
      
          ELSIF (V_B_NO_COUNT                             = 0) THEN
          raise INVALID_CLASS;
    END IF;

  EXCEPTION
  WHEN INVALID_BNO THEN
    raise_application_error(-20007, 'Invalid B Number');
  WHEN INVALID_CLASS THEN
    raise_application_error(-20008, 'Invalid Class Number');
  END ST_CLASSES_TAKEN;
  
  
  
--
procedure "DROP_ST_FROM_CLASS"(student_B# in Students.B#%type,class_id in Classes.classid%type, message out varchar2) is
   dept classes.dept_code%type;
   crsno classes.course#%type;
   v_dept_code classes.dept_code%type;
   v_course# classes.course#%type;
   

   cursor c1 is
   select * from Enrollments for update;
   c1_rec Enrollments%rowtype;
   cursor c2 is 
   select B# from Students where 
   Students.B# = student_B#;
   c2_rec Students.B#%type;
   cursor c3 is
   select classid from Classes where
   Classes.classid=class_id;
   c3_rec Classes.classid%type;
   cursor c4 is 
   select B# from Enrollments where 
    B# = student_B# and classid=class_id;
   c4_rec Enrollments.B#%type;	
   cursor c5 is
   select p.PRE_COURSE# from prerequisites p where p.Course# = crsno and p.dept_code = dept;
   c5_rec Prerequisites.PRE_COURSE#%type;
   cursor c6 is 
   select classid from Enrollments where
   B#= student_B#;
   c6_rec ENROLLMENTS.CLASSID%type;
   cursor c7 is
   select B# from Enrollments where 
   classid=class_id;
   c7_rec Enrollments.B#%type;
   
   invalid_B# exception;
   invalid_class_id exception;
   student_not_enrolled_in_course exception;
   student_drop_violation exception;
   
   begin
   --open c1;
   open c2;
   open c3;
   open c4;
   open c5;
   open c6;
   open c7;
  
   --fetch c1 into c1_rec;
   fetch c2 into c2_rec;
   fetch c3 into c3_rec;
   fetch c4 into c4_rec;
    fetch c5 into c5_rec;
   fetch c6 into c6_rec;
   fetch c7 into c7_rec;
   if(c2%notfound) then 
   raise invalid_B#;
   end if;
   if(c3%notfound) then 
   raise invalid_class_id;
   end if;
   if(c4%notfound) then 
   raise student_not_enrolled_in_course;
   end if;
   if(c5%found) then 
   raise student_drop_violation;
   end if;
   if(c6%rowcount=1)then
   message:='lastClass';
   end if;
   if(c7%rowcount<1) then
   message:='noStudents';
   end if;
   for c1_rec in c1 loop
       if (c1_rec.B#=student_B# and c1_rec.classid=class_id) then
           delete from Enrollments
           where current of c1;
       end if;
   end loop;
   
   --close c1;
   close c2;
   close c3;
   close c4;
   close c5;
   close c6;
   close c7;
exception
   when invalid_B# then
   raise_application_error(-20021,'The B# is invalid.'); 
  /* dbms_output.put_line('The B# is invalid.');*/
   when invalid_class_id then 
   raise_application_error(-20022,'The classid is invalid.'); 
   /*dbms_output.put_line('The classid is invalid');*/
   when student_not_enrolled_in_course then 
   raise_application_error(-20023,'The student is not enrolled in the class.'); 
   /*dbms_output.put_line('The student is not enrolled in the class');*/
   when student_drop_violation then
   raise_application_error(-20024,'The drop is not permitted as another class uses it as a prerequisite.'); 
   /*dbms_output.put_line('The drop is not permitted as another class uses it as a prerequisite');*/
   
end DROP_ST_FROM_CLASS;

PROCEDURE "VIEW_PREREQ"(
    d_code IN PREREQUISITES.DEPT_CODE%TYPE,
    c_no   IN PREREQUISITES.COURSE#%TYPE,
    c1 OUT SYS_REFCURSOR) 
    IS
BEGIN
  OPEN c1 FOR SELECT dept_code, COURSE# FROM PREREQUISITES start with DEPT_CODE = d_code AND COURSE# = c_no connect by prior pre_dept_code=DEPT_CODE AND prior PRE_COURSE# = COURSE#;
END VIEW_PREREQ;
end;
/
