create or replace PROCEDURE          "STUDENT_ENROLLMENT"
  ( B_NO_IN IN STUDENTS.B#%type,
  CLASS_ID_IN IN CLASSES.CLASSID%type)
  AS
  count1 NUMBER;
	count2 NUMBER;
	count3 NUMBER;
	count4 NUMBER;
	count5 NUMBER;
	v_class_size classes.class_size%type;
	v_class_limit classes.limit%type;
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
	
	SELECT count(*) INTO count4
	FROM ((SELECT a.classid FROM classes a,classes b 
	WHERE a.semester=b.semester and a.year=b.year and b.year=(SELECT year FROM classes 
	WHERE classid=CLASS_ID_IN and b.semester=(SELECT semester FROM classes
	WHERE classid=CLASS_ID_IN)))
    INTERSECT
    (SELECT classid FROM enrollments WHERE B#=B_NO_IN));
	IF (count4 = 3) THEN
		INSERT INTO enrollments values(B_NO_IN,CLASS_ID_IN,null);
   -- update classes set class_size=class_size+1 where classid=CLASS_ID_IN;
        SYS.DBMS_OUTPUT.PUT_LINE('You are overloaded');
	ELSIF (count4 > 3) THEN
	RAISE max_enrollment;
		dbms_output.put_lINe('The Student' || B_NO_IN || 'is already enrolled FOR four classes');
	END IF;

	SELECT count(*) INTO count5 FROM((SELECT a.pre_dept_code,a.pre_course# FROM prerequisites a,classes b
	WHERE b.dept_code=a.dept_code and b.course#=a.course# and b.classid=CLASS_ID_IN)
	MINUS
	(SELECT c.dept_code,c.course# FROM classes c,enrollments e WHERE e.B# = B_NO_IN and e.classid=c.classid and e.lgrade is not null));
	IF (count5 > 0)THEN 
	RAISE required_prerequisites;
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
raise_application_error(-20005, 'cannot enroll for more than 3 classes in an academic year');
when required_prerequisites then 
raise_application_error(-20006, 'requires prerequisites');
END STUDENT_ENROLLMENT;