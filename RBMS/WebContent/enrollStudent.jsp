<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ENROLL STUDENT</title>
<h3><center> ENROLL STUDENT </center></h3>
<script type="text/javascript">

<%-- Function validate() validates the user input, checks for null values and 
     makes sure that fields  --%> 

function validate()
{

var bNumber   = form1.bNumber.value;
var classId = form1.classId.value;

if (bNumber.length==0 || bNumber==null || bNumber =="")
{
alert("B_NUMBER  IS EMPTY");
form1.bNumber.focus();
return false;
}

if (classId.length==0 || classId==null || classId =="")
{
alert("class field IS EMPTY");
form1.classId.focus();
return false;
}
}

</script>
</head>
<body style="background-color:#669999;">
<%-- Form where user inputs the values --%> 
<form name="form1" method="post" action="MainServlet">

<fieldset>
<legend>PLEASE ENTER THE ENROLLMENT DETAILS</legend>

<table>


<tr>
<td> Student B#  </td> 
<td> <input type="text" name=bNumber >  </td>   
</tr>

<tr>
<td> Class ID  </td> 
<td> <input type="text" name="classId" >  </td>   
</tr>
<tr>
<td> <input type="submit" value="SUBMIT" onclick="return validate(this)"></td>
<td> <input type="reset" value="RESET"></td>
<td><input type="button" value="BACK" onClick="window.location.href='Homepage.jsp'"></td>
</tr>
<%-- Passing the hidden variable , value is : 'enrollStudent' --%> 
<tr><td><input type="hidden" name="selectedPage" value="enrollStudent" /></td></tr>
</table>
</fieldset>
</form>
</body>
</html>