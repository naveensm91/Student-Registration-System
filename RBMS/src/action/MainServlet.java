package action;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ClassDetails;
import bean.Classes;
import bean.CourseCredit;
import bean.Courses;
import bean.Enrollments;
import bean.Grades;
import bean.Logs;
import bean.Prerequisites;
import bean.Students;
import bean.StudentsClassesTaken;
import oracle.jdbc.OracleTypes;
import oracle.jdbc.pool.OracleDataSource;

/**
  * The Class MainServlet.
  */
 public class MainServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   
   /** The Constant serialVersionUID. */
   static final long serialVersionUID = 1L;
  
	/**
	 * Instantiates a new main servlet.
	 */
	public MainServlet() {
		super();/*declares ActionClass as the Superclass*/
	}   	
	
	/** The conn. */
	//Declaring connection as a global variable
	Connection conn = null;
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		  response.setContentType("text/html");
		  out.print("basic.html");	
	}  	
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Doing all the validations, data connection, data fetching and jsp forward in do post method
		
		//Defining Database credentials
		OracleDataSource ds = null;
		try {
			ds = new oracle.jdbc.pool.OracleDataSource();
			ds.setURL("jdbc:oracle:thin:@localhost:1521/xe");
			conn = ds.getConnection("system", "unleashing");
		}catch (SQLException e) {
			e.printStackTrace();
		}
	    	
		response.setContentType("text/html");

		//JSP will pass a hidden variable each time it is submitted.
		//Comparing the value of hidden variable and deciding the operation to perform
		String page = request.getParameter("selectedPage");
		System.out.println(" page value is "+page);
		
		
//		If the hidden variable value is display tuples, then CALL DISPLAY_TUPLES PROCEDURE 
		if(page.equals("displaytuples"))/*checks the page value for display tuples*/
		{
			String tname = request.getParameter("tablename");
			System.out.println("table name selected is : "+tname);
			
			//If the value from the drop down in front end is 1, then get data from Student Table
			if(tname.equalsIgnoreCase("1")){
				
				try {
					ResultSet rs;
					List<Students> studentsList = new ArrayList<Students>();
					CallableStatement cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.SHOW_STUDENTS(:1,:2); end;");
					cs.setString(1, tname);
					cs.registerOutParameter(2, OracleTypes.CURSOR);
					cs.execute();
			        rs = (ResultSet)cs.getObject(2);
			        
			        while(rs.next()){
			        	
			        	Students students = new Students();
			        	
			        	students.setbNumber(rs.getString("B#"));
			        	students.setfName(rs.getString("FIRSTNAME"));
			        	students.setlName(rs.getString("LASTNAME"));
			        	students.setStatus(rs.getString("STATUS"));
			        	students.setGpa(rs.getLong("GPA"));
			        	students.setEmail(rs.getString("EMAIL"));
			        	students.setBdate(rs.getDate("BDATE"));
			        	students.setDeptName(rs.getString("DEPTNAME"));
			        	
			        	studentsList.add(students);
			        }
			        request.setAttribute("studentInfo", studentsList);
			        request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
			        cs.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			else if(tname.equalsIgnoreCase("2")){
				try {
					
					
					//If the value from the drop down in front end is 2, then get Data from Courses Table
					ArrayList<Courses> coursesList = new ArrayList<Courses>();
					ResultSet rs;
					CallableStatement cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.SHOW_STUDENTS(:1,:2); end;");
					cs.setString(1, tname);
					cs.registerOutParameter(2, OracleTypes.CURSOR);
					cs.execute();
			        rs = (ResultSet)cs.getObject(2);
			        
			        while(rs.next()){
			        	Courses courses = new Courses();
			        	
			        	courses.setCourseNumber(rs.getLong("COURSE#"));
			        	courses.setDeptCode(rs.getString("DEPT_CODE"));
			        	courses.setTitle(rs.getString("TITLE"));
			        	coursesList.add(courses);
			        }
			        
			        request.setAttribute("coursesInfo", coursesList);
			        request.getRequestDispatcher("viewCourses.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			else if(tname.equalsIgnoreCase("3")){
				
				//If the value from the drop down in front end is 3, then get data from COURSES_CREDIT Table
				try {
					
					ArrayList<CourseCredit> creditsList = new ArrayList<CourseCredit>();
					ResultSet rs;
					CallableStatement cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.SHOW_STUDENTS(:1,:2); end;");
					cs.setString(1, tname);
					cs.registerOutParameter(2, OracleTypes.CURSOR);
					cs.execute();
			        rs = (ResultSet)cs.getObject(2);
			        
			        while(rs.next()){
			        
			        	CourseCredit credits = new CourseCredit();
			        	credits.setCourseNumber(rs.getLong("course#"));
			        	credits.setCredits(rs.getLong("CREDITS"));
			        	
			        	creditsList.add(credits);
			        }
			        request.setAttribute("creditsInfo", creditsList);
			        request.getRequestDispatcher("viewCredits.jsp").forward(request, response);
			        
				 }catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			else if(tname.equalsIgnoreCase("4")){
				
				//If the value from the drop down in front end is 4, then get data from Classes Table
				try {
					
					ArrayList<Classes> classesList = new ArrayList<Classes>();
					ResultSet rs;
					CallableStatement cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.SHOW_STUDENTS(:1,:2); end;");
					cs.setString(1, tname);
					cs.registerOutParameter(2, OracleTypes.CURSOR);
					cs.execute();
			        rs = (ResultSet)cs.getObject(2);
			        
			        while(rs.next()){
			        	
			        	Classes classes = new Classes();
			        	
			        	classes.setClassid(rs.getString("CLASSID"));
			        	classes.setDeptCode(rs.getString("DEPT_CODE"));
			        	classes.setCourseNumber(rs.getLong("COURSE#"));
			        	classes.setSectNumber(rs.getLong("SECT#"));
			        	classes.setYear(rs.getLong("YEAR"));
			        	classes.setSemester(rs.getString("SEMESTER"));
			        	classes.setLimit(rs.getLong("LIMIT"));
			        	classes.setClassSize(rs.getLong("CLASS_SIZE"));
			        	
			        	classesList.add(classes);
			        }
			        request.setAttribute("classesInfo", classesList);
			        request.getRequestDispatcher("viewClasses.jsp").forward(request, response);
			        
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			else if(tname.equalsIgnoreCase("5")){
				
				//If the value from the drop down in front end is 5, then get data from Enrollments Table
				try {
					
					ArrayList<Enrollments> enrollmentList = new ArrayList<Enrollments>();
					
					ResultSet rs;
					CallableStatement cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.SHOW_STUDENTS(:1,:2); end;");
					cs.setString(1, tname);
					cs.registerOutParameter(2, OracleTypes.CURSOR);
					cs.execute();
			        rs = (ResultSet)cs.getObject(2);
			        
			        while(rs.next()){
			        	
			        	Enrollments enrollments = new Enrollments(); 
			        	
			        	enrollments.setbNumber(rs.getString("B#"));
			        	enrollments.setClassId(rs.getString("CLASSID"));
			        	enrollments.setLetterGrade(rs.getString("LGRADE"));
			        	
			        	enrollmentList.add(enrollments);
			        	
			        }
					request.setAttribute("enrollmentsInfo", enrollmentList);
			        request.getRequestDispatcher("viewEnrollments.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			else if(tname.equalsIgnoreCase("6")){
				
				//If the value from the drop down in front end is 6, then get data from Grades Table
				
				try {
					
					ArrayList<Grades> gradesList = new ArrayList<Grades>();
					ResultSet rs;
					CallableStatement cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.SHOW_STUDENTS(:1,:2); end;");
					cs.setString(1, tname);
					cs.registerOutParameter(2, OracleTypes.CURSOR);
					cs.execute();
			        rs = (ResultSet)cs.getObject(2);
			        
			        while(rs.next()){
			        	
			        	Grades grades = new Grades();
			        	
			        	grades.setLetterGrade(rs.getString("LGRADE"));
			        	grades.setNumberGrade(rs.getInt("NGRADE"));
			        	
			        	gradesList.add(grades);
			        }
					request.setAttribute("gradesInfo", gradesList);
			        request.getRequestDispatcher("viewGrades.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
else if(tname.equalsIgnoreCase("7")){
				
				//If the value from the drop down in front end is 5, then get data from Prerequisites Table
				try {
					
					ArrayList<Prerequisites> prerequisitesList = new ArrayList<Prerequisites>();
					
					ResultSet rs;
					CallableStatement cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.SHOW_STUDENTS(:1,:2); end;");
					cs.setString(1, tname);
					cs.registerOutParameter(2, OracleTypes.CURSOR);
					cs.execute();
			        rs = (ResultSet)cs.getObject(2);
			        
			        while(rs.next()){
			        	
			        	Prerequisites prerequisites = new Prerequisites(); 
			        	
			        	prerequisites.setCourseNumber(rs.getLong("COURSE#"));
			        	prerequisites.setDeptCode(rs.getString("DEPT_CODE"));
			        	prerequisites.setPreqCourseNumber(rs.getString("PRE_COURSE#"));
			        	prerequisites.setPreqDeptCode(rs.getString("PRE_DEPT_CODE"));
			        
			        	prerequisitesList.add(prerequisites);
			        	
			        }
					request.setAttribute("prerequisitesInfo", prerequisitesList);
			        request.getRequestDispatcher("viewPrerequisites.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
else if(tname.equalsIgnoreCase("8")){
	
	//If the value from the drop down in front end is 5, then get data from Logs Table
	try {
		
		ArrayList<Logs> logsList = new ArrayList<Logs>();
		
		ResultSet rs;
		CallableStatement cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.SHOW_STUDENTS(:1,:2); end;");
		cs.setString(1, tname);
		cs.registerOutParameter(2, OracleTypes.CURSOR);
		cs.execute();
        rs = (ResultSet)cs.getObject(2);
        
        while(rs.next()){
        	
        	Logs logs = new Logs(); 
        	
        	logs.setKeyValue(rs.getString("KEY_VALUE"));
        	logs.setLogId(rs.getLong("LOGID"));
        	logs.setOperation(rs.getString("OPERATION"));
        	logs.setTableName(rs.getString("TABLE_NAME"));
        	logs.setTime(rs.getDate("TIME"));
        	logs.setWho(rs.getString("WHO"));
        	
        	logsList.add(logs);
        	
        }
		request.setAttribute("logsInfo", logsList);
        request.getRequestDispatcher("viewLogs.jsp").forward(request, response);
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
		}
else if(page.equalsIgnoreCase("listPrerequisitesForCourses")){
			
			//Getting the bNumber entered by the user through the request object
			String DeptCode = (String) request.getParameter("DeptCode");
			String courseNumber = (String) request.getParameter("courseNumber");
			
			Long courseNumberL = Long.parseLong(courseNumber);
			
			System.out.println("The DeptCode entered is : "+DeptCode);
			System.out.println("The courseNumber entered is : "+courseNumberL);
			List<Prerequisites> prereqList = new ArrayList<Prerequisites>();
			ResultSet rs1, rs2;
			CallableStatement cs;
			try {
				cs = conn.prepareCall("begin PREREQ(:1,:2,:3, :4); end;");
				
					//based on bNumber, getting the class info from the procedure ST_CLASSES_TAKEN
				cs.setString(1, DeptCode);
				cs.setLong(2, courseNumberL);
				cs.registerOutParameter(3, OracleTypes.CURSOR);
				cs.registerOutParameter(4, OracleTypes.CURSOR);
				cs.execute();
				
		        rs1 = (ResultSet)cs.getObject(3);
		        rs2 = (ResultSet)cs.getObject(4);
		        
		        while(rs1.next()){
		        	Prerequisites prereq = new Prerequisites();
		        	prereq.setCourseNumber(rs1.getLong("COURSE#"));
		        	prereq.setDeptCode(rs1.getString("DEPT_CODE"));
		        	
		        	prereqList.add(prereq);
		        }
		        if(rs2!=null){
		        while(rs2.next()){
		        	Prerequisites prereq = new Prerequisites();
		        	prereq.setCourseNumber(rs2.getLong("COURSE#"));
		        	prereq.setDeptCode(rs2.getString("DEPT_CODE"));
		        	
		        	prereqList.add(prereq);
		        }
		        }
		        request.setAttribute("prereqInfo", prereqList);
		        request.getRequestDispatcher("viewprereqInfo.jsp").forward(request, response);
		        
			  } catch (SQLException e) {
				  /*int errorCode = e.getErrorCode();
				  if (errorCode == 20007)
				  {
				  request.getRequestDispatcher("invalidBnumber.jsp").forward(request, response);
				  }
				  if (errorCode == 20008)
				  {
				  request.getRequestDispatcher("invalidClassId.jsp").forward(request, response);
				  }*/
				e.printStackTrace();
			}
		}	
		
		//Get the student info, if the hidden variable "selectedpage" value is : listStudentClasses
		else if(page.equalsIgnoreCase("listStudentClasses")){
			
			//Getting the bNumber entered by the user through the request object
			String bNumber = (String) request.getParameter("bNumber");
			System.out.println("The bNumber entered is : "+bNumber);
			
			List<StudentsClassesTaken> stClassesList = new ArrayList<StudentsClassesTaken>();
			ResultSet rs;
			CallableStatement cs;
			try {
				cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.ST_CLASSES_TAKEN(:1,:2); end;");
				
					//based on bNumber, getting the class info from the procedure ST_CLASSES_TAKEN
				cs.setString(1, bNumber);
				cs.registerOutParameter(2, OracleTypes.CURSOR);
				cs.execute();
				
		        rs = (ResultSet)cs.getObject(2);
		        
		        while(rs.next()){
		        	StudentsClassesTaken stClasses = new StudentsClassesTaken();
		        	stClasses.setbNumber(rs.getString("B#"));
		        	stClasses.setClassId(rs.getString("CLASSID"));
		        	stClasses.setLetterGrade(rs.getString("LGRADE"));
		        	stClasses.setNumberGrade(rs.getInt("NGRADE"));
		        	stClassesList.add(stClasses);
		        }
		        request.setAttribute("studentClassesInfo", stClassesList);
		        request.getRequestDispatcher("viewStudentClassesInfo.jsp").forward(request, response);
		        
			  } catch (SQLException e) {
				  int errorCode = e.getErrorCode();
				  if (errorCode == 20007)
				  {
				  request.getRequestDispatcher("invalidBnumber.jsp").forward(request, response);
				  }
				  if (errorCode == 20008)
				  {
				  request.getRequestDispatcher("invalidClassId.jsp").forward(request, response);
				  }
				e.printStackTrace();
			}
		}	
		
		//Add a new student to the enrollments table, if the hidden variable value is : enrollStudent
		else if(page.equalsIgnoreCase("enrollStudent")){
			
			String bNumber = (String) request.getParameter("bNumber");
			String classId = (String) request.getParameter("classId");
			
			CallableStatement cs;
			String rs;
			
			try {
				
				//Calling P_STUD_ENROLL procedure, which adds new enrollment to the enrollments table
				cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.P_STUD_ENROLL(:1,:2,:3); end;");
				
				cs.setString(1, bNumber);
				cs.setString(2, classId);
				cs.registerOutParameter(3, Types.VARCHAR);
				cs.execute();
				String message = cs.getString(3);
				if("OVERLOAD".equalsIgnoreCase(message))
				{
					request.getRequestDispatcher("addOverloadEnrollmentSuccess.jsp").forward(request, response);
				} else
				{
					request.getRequestDispatcher("addEnrollmentSuccess.jsp").forward(request, response);
				}
		        
			  } catch (SQLException e) {
				  int errorCode = e.getErrorCode();
				  if (errorCode == 20001)
				  {
					  request.getRequestDispatcher("invalidClassEnrollment.jsp").forward(request, response);
				  }
				  if (errorCode == 20002)
				  {
					  request.getRequestDispatcher("invalidStudentEnrollment.jsp").forward(request, response);
				  }
				  if (errorCode == 20003)
				  {
					  request.getRequestDispatcher("classExceededFailure.jsp").forward(request, response);
				  }
				  if (errorCode == 20004)
				  {
					  request.getRequestDispatcher("alreadyEnrolledFailure.jsp").forward(request, response);
				  }
				  if (errorCode == 20005)
				  {
					  request.getRequestDispatcher("moreThanFourCLassesFailure.jsp").forward(request, response);
				  }
				  if (errorCode == 20006)
				  {
					  request.getRequestDispatcher("RequiresPrerequisitesFailure.jsp").forward(request, response);
				  }
				e.printStackTrace();
			}
		}	
		
		else if(page.equalsIgnoreCase("classDetails")){
			
			//Getting the classId entered by the user through the request object
			String classId = (String) request.getParameter("classId");
			System.out.println("The classId entered is : "+classId);
			
			List<ClassDetails> classDetailsList = new ArrayList<ClassDetails>();
			ResultSet rs;
			CallableStatement cs;
			try {
				cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.CL_COURSES_DETAILS(:1,:2); end;");
				
					//based on bNumber, getting the class info from the procedure ST_CLASSES_TAKEN
				cs.setString(1, classId);
				cs.registerOutParameter(2, OracleTypes.CURSOR);
				cs.execute();
				
		        rs = (ResultSet)cs.getObject(2);
		        
		        while(rs.next()){
		        	ClassDetails classDetails = new ClassDetails();
		        	classDetails.setbNumber(rs.getString("B#"));
		        	classDetails.setClassId(rs.getString("CLASSID"));
		        	classDetails.setCourseNumber(rs.getLong("COURSE#"));
		        	classDetails.setDeptCode(rs.getString("DEPT_CODE"));
		        	classDetails.setfName(rs.getString("FIRSTNAME"));
		        	classDetails.setTitle(rs.getString("TITLE"));
		        	
		        	classDetailsList.add(classDetails);
		        }
		        request.setAttribute("classDetailsInfo", classDetailsList);
		        request.getRequestDispatcher("viewClassDetailsInfo.jsp").forward(request, response);
		        
			  } catch (SQLException e) {
				  int errorCode = e.getErrorCode();
				  if (errorCode == 20016)
				  {
					  request.getRequestDispatcher("invalidClassIdForClDtls.jsp").forward(request, response);
				 
				  }
				  if (errorCode == 20017)
				  {
					  request.getRequestDispatcher("invalidBnumber.jsp").forward(request, response);
				  }
				e.printStackTrace();
			}
		}else if(page.equalsIgnoreCase("deleteStudent")){
			
			//Getting the classId entered by the user through the request object
			String bNumber = (String) request.getParameter("bNumber");
			System.out.println("The classId entered is : "+bNumber);
			
			ResultSet rs;
			CallableStatement cs;
			try {
				cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.DELETE_STUDENT(:1); end;");
				
					//based on bNumber, getting the class info from the procedure ST_CLASSES_TAKEN
				cs.setString(1, bNumber);
				cs.execute();
				
		        
		        /*while(rs.next()){
		        	ClassDetails classDetails = new ClassDetails();
		        	classDetails.setbNumber(rs.getString("B#"));
		        	classDetails.setClassId(rs.getString("CLASSID"));
		        	classDetails.setCourseNumber(rs.getLong("COURSE#"));
		        	classDetails.setDeptCode(rs.getString("DEPT_CODE"));
		        	classDetails.setfName(rs.getString("FIRSTNAME"));
		        	classDetails.setTitle(rs.getString("TITLE"));
		        	
		        	classDetailsList.add(classDetails);
		        }*/
		        //request.setAttribute("deleteStudentInfo", bNumber);
		        request.getRequestDispatcher("viewdeleteStudentInfo.jsp").forward(request, response);
		        
			  } catch (SQLException e) {
				  int errorCode = e.getErrorCode();
				  if (errorCode == 20030)
				  {
					  request.getRequestDispatcher("invalidBnumberForDeletion.jsp").forward(request, response);
				  }
				e.printStackTrace();
			}
		}
else if(page.equalsIgnoreCase("dropStudFromClass")){
			
			//Getting the classId entered by the user through the request object
			String bNumber = (String) request.getParameter("bNumber");
			String classId = (String) request.getParameter("classId");
			System.out.println("The bNumber entered is : "+bNumber);
			System.out.println("The classId entered is : "+classId);
			
			ResultSet rs;
			CallableStatement cs;
			try {
				cs = conn.prepareCall("begin STUDENT_MANAGEMENT_SYSTEM.DROP_ST_FROM_CLASS(:1,:2, :3); end;");
				
					//based on bNumber, getting the class info from the procedure ST_CLASSES_TAKEN
				cs.setString(1, bNumber);
				cs.setString(2, classId);
				cs.registerOutParameter(3, Types.VARCHAR);
				cs.execute();
				
		        String message = cs.getString(3);
		        
		        if("lastCLass".equalsIgnoreCase(message))
		        {
		        	request.getRequestDispatcher("NoEnrollmentInfo.jsp").forward(request, response);
		        }else if("noStudents".equalsIgnoreCase(message))
		        {
		        	request.getRequestDispatcher("NoStudentsInClassInfo.jsp").forward(request, response);
		        }
		        else
		        {
		        /*while(rs.next()){
		        	ClassDetails classDetails = new ClassDetails();
		        	classDetails.setbNumber(rs.getString("B#"));
		        	classDetails.setClassId(rs.getString("CLASSID"));
		        	classDetails.setCourseNumber(rs.getLong("COURSE#"));
		        	classDetails.setDeptCode(rs.getString("DEPT_CODE"));
		        	classDetails.setfName(rs.getString("FIRSTNAME"));
		        	classDetails.setTitle(rs.getString("TITLE"));
		        	
		        	classDetailsList.add(classDetails);
		        }*/
		        //request.setAttribute("deleteStudentInfo", bNumber);
		        request.getRequestDispatcher("viewdropStudFromClassInfo.jsp").forward(request, response);
		        } 
			  } catch (SQLException e) {
				  int errorCode = e.getErrorCode();
				  if (errorCode == 20021)
				  {
					  request.getRequestDispatcher("invalidBnumberForDrop.jsp").forward(request, response);
				  }
				  if (errorCode == 20022)
				  {
					  request.getRequestDispatcher("invalidclIdForDropStFromCl.jsp").forward(request, response);
				  }
				  if (errorCode == 20023)
				  {
					  request.getRequestDispatcher("stNotEnrolledDropStFromCl.jsp").forward(request, response);
				  }
				  if (errorCode == 20024)
				  {
					  request.getRequestDispatcher("prerequisiteViolationDropStFromCl.jsp").forward(request, response);
				  }
				  
				e.printStackTrace();
			}
		}		
	}
 }