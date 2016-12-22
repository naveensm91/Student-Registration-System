<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function validate()
{
		document.input.submit();
}
</script>
<%-- Home page of the project - Retail business management system --%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration System</title>
<h2><center> Student Registration System</center></h2>
</head>
<body style="background-color:#669999;">
<form action="${pageContext.request.contextPath}/ActionClass" method="post">
<table>

<tr><td><br /><br /></td></tr>
<tr><td><a href="displayTuples.jsp" target ="showframe"> Display Table Data</a></td></tr>
<tr><td><br /><br /></td></tr>

<tr><td><br /><br /></td></tr>
<tr><td><a href="listPrerequisitesForCourses.jsp" target ="showframe"> List Prerequisites For a Course </a></td></tr>
<tr><td><br /><br /></td></tr>

<tr><td><br /><br /></td></tr>
<tr><td><a href="enrollStudent.jsp" target ="showframe"> Enroll Student </a></td></tr>
<tr><td><br /><br /></td></tr>


<tr><td><br /><br /></td></tr>
<tr><td><a href="listStudentClasses.jsp" target ="showframe"> List Student Classes </a></td></tr>
<tr><td><br /><br /></td></tr>

<tr><td><br /><br /></td></tr>
<tr><td><a href="classDetails.jsp" target ="showframe"> Class Details </a></td></tr>
<tr><td><br /><br /></td></tr>

<tr><td><br /><br /></td></tr>
<tr><td><a href="deleteStudent.jsp" target ="showframe"> Delete Student </a></td></tr>
<tr><td><br /><br /></td></tr>

<tr><td><br /><br /></td></tr>
<tr><td><a href="dropStudFromClass.jsp" target ="showframe"> Drop Student From Class </a></td></tr>
<tr><td><br /><br /></td></tr>

</table>
</form>
</body>
</html>