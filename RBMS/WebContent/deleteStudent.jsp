<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page to Delete A Student</title>
<h3><center> Page to Delete A Student </center></h3>
<script type="text/javascript">

<%-- Function validate() validates the user input, checks for null values and 
     makes sure that fields  --%> 

function validate()
{

var bNumber   = form1.bNumber.value;

if (bNumber.length==0 || bNumber==null || bNumber =="")
{
alert("PLease provide the Student B#");
form1.bNumber.focus();
return false;
}
}

</script>
</head>
<body style="background-color:#669999;">
<%-- Form where user inputs the values --%> 
<form name="form1" method="post" action="MainServlet">

<fieldset>
<legend>PLEASE ENTER THE STUDENT DETAILS</legend>

<table>


<tr>
<td> Student B#  </td> 
<td> <input type="text" name=bNumber >  </td>   
</tr>

<tr>
<td> <input type="submit" value="SUBMIT" onclick="return validate(this)"></td>
<td> <input type="reset" value="RESET"></td>
<td><input type="button" value="BACK" onClick="window.location.href='Homepage.jsp'"></td>
</tr>
<%-- Passing the hidden variable , value is : 'deleteStudent' --%> 
<tr><td><input type="hidden" name="selectedPage" value="deleteStudent" /></td></tr>
</table>
</fieldset>
</form>
</body>
</html>