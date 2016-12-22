<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Classes Information</title>
<h2> Student Classes Information</h2>
</head>


<body style="background-color:#669999;">
<%-- To display the Student Classes INFORMATION OF A Student  --%> 

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<StudentsClassesTaken> itr;
List viewdata=(List)(request.getAttribute("studentClassesInfo"));
%>
<table border=1>
<tr>
<th> STUDENT B# </th>
<th> CLASS ID</th>
<th> LETTER GRADE</th>
<th> NUMBER GRADE </th>
</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%StudentsClassesTaken stClassesInfo = (StudentsClassesTaken)itr.next();%>
                      
                      	<td> <%= stClassesInfo.getbNumber() %> </td>
                      	
                      	<td> <%= stClassesInfo.getClassId() %> </td>
                      	
                      	<td> <%= stClassesInfo.getLetterGrade() %> </td>
                      	
                      	<td> <%= stClassesInfo.getNumberGrade() %> </td>
                      	                      	
                       </tr>
                           
                       <% } %></table>

<br>
   <input type="button" value="BACK" onClick="window.location.href='listStudentClasses.jsp'">
   </form>                     

</form>

</body>
</html>