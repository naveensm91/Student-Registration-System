<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> List Prerequisites For a Course </title>
<h2> List Prerequisites For a Course </h2>
</head>


<body style="background-color:#669999;">
<%-- To display the Student Classes INFORMATION OF A Student  --%> 

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<Prerequisites> itr;
List viewdata=(List)(request.getAttribute("prereqInfo"));
%>
<table border=1>
<tr>
<th> DEPARTMENT CODE </th>
<th> COURSE# </th>
</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%Prerequisites prereqInfo = (Prerequisites)itr.next();%>
                      
                      	<td> <%= prereqInfo.getDeptCode() %> </td>
                      	
                      	<td> <%= prereqInfo.getCourseNumber() %> </td>
                      	
                       </tr>
                           
                       <% } %></table>

<br>
   <input type="button" value="BACK" onClick="window.location.href='listPrerequisitesForCourses.jsp'">
   </form>                     

</form>

</body>
</html>