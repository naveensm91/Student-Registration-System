<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

function validate(){
	
	document.form.submit();
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Tuples</title>
<h3> <center> Please select the Table Name You wish to see the Data</center></h3>
</head>
<%-- Takes user input to display tables  --%> 
<body style="background-color:#669999;">

<form name="form" method="post" action="MainServlet">
<table border="0" align="center" cellspacing="0" cellpadding="0" width="100%">       
<tr>
          <td class="bodyText" valign="top"></td>
</tr>

     <tr><td><select name="tablename">
        <option value="1">Students</option>
        <option value="2">Courses</option>
        <option value="3">Course Credits</option>
        <option value="4">Classes</option>
        <option value="5">Enrollments</option>
        <option value="6">Grades</option>
        <option value="7">Prerequisites</option>
        <option value="8">Logs</option>
     </select></td></tr>
     
     <tr><td></td><td>
     <input type="button" value="Submit" onclick="validate()" />
     <input type="reset" value ="Reset" name = "clear"/>
     <input type="button" value="Cancel" onClick="window.location.href='Homepage.jsp'"></td></tr>
     
     <tr><td><input type="hidden" name="selectedPage" value="displaytuples" /></td></tr>
    </table>
</form>

<%-- Hidden variable value is : displaytuples --%> 
</body>
</html>
