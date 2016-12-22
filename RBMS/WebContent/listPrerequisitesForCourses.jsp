<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Prerequisites For a Course</title>
<h3><center> List Prerequisites For a Course </center></h3>
<script type="text/javascript">

<%-- Function validate() validates the user input, checks for null values and 
     makes sure that fields  --%> 

function validate()
{

var DeptCode      = form1.DeptCode.value;
var courseNumber  = form1.courseNumber.value

if (DeptCode.length==0 || DeptCode==null || DeptCode =="")
{
alert("PLease provide the Department Code");
form1.DeptCode.focus();
return false;
}

if (courseNumber.length==0 || courseNumber==null || courseNumber =="")
{
alert("PLease provide the Course#");
form1.courseNumber.focus();
return false;
}

}

</script>
</head>
<body style="background-color:#669999;">
<%-- Form where user inputs the values --%> 
<form name="form1" method="post" action="MainServlet">

<fieldset>
<legend>PLEASE ENTER THE COURSE DETAILS</legend>

<table>


<tr>
<td>Department Code </td> 
<td> <input type="text" name=DeptCode >  </td>   
</tr>

<tr>
<td> Course#  </td> 
<td> <input type="text" name=courseNumber >  </td>   
</tr>

<tr>
<td> <input type="submit" value="SUBMIT" onclick="return validate(this)"></td>
<td> <input type="reset" value="RESET"></td>
<td><input type="button" value="BACK" onClick="window.location.href='Homepage.jsp'"></td>
</tr>
<%-- Passing the hidden variable , value is : 'listPrerequisitesForCourses.jsp' --%> 
<tr><td><input type="hidden" name="selectedPage" value="listPrerequisitesForCourses" /></td></tr>
</table>
</fieldset>
</form>
</body>
</html>