<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Class Details Information</title>
<h2> Class Details Information</h2>
</head>


<body style="background-color:#669999;">
<%-- To display the Student Classes INFORMATION OF A Student  --%> 

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<ClassDetails> itr;
List viewdata=(List)(request.getAttribute("classDetailsInfo"));
%>
<table border=1>
<tr>
<th> CLASS ID</th>
<th> STUDENT B# </th>
<th> COURSE# </th>
<th> DEPARTMENT CODE </th>
<th> FIRST NAME </th>
<th> TITLE </th>

</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%ClassDetails classDetailsInfo = (ClassDetails)itr.next();%>
                      
                      	<td> <%= classDetailsInfo.getClassId() %> </td>
                      	
                      	<td> <%= classDetailsInfo.getbNumber() %> </td>
                      	
                      	<td> <%= classDetailsInfo.getCourseNumber() %> </td>
                      	
                      	<td> <%= classDetailsInfo.getDeptCode() %> </td>
                      	
                      	<td> <%= classDetailsInfo.getfName() %> </td>
                      	
                      	<td> <%= classDetailsInfo.getTitle() %> </td>
                      	                      	
                       </tr>
                           
                       <% } %></table>

<br>
   <input type="button" value="BACK" onClick="window.location.href='classDetails.jsp'">
   </form>                     

</form>

</body>
</html>