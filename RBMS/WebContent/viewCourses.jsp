<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Courses Data</title>
<h2> Courses's Information</h2>
</head>
<%-- To display the COURSES TABLE DATA  --%> 

<body style="background-color:#669999;">

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<Courses> itr;
List<Courses> viewdata=(List<Courses>)(request.getAttribute("coursesInfo"));
%>
<table border=1>
<tr>
<th> DEPT_CODE </th>
<th> COURSE# </th>
<th> TITLE </th>
</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%Courses courses = (Courses)itr.next();%>
                      
                      	<td> <%=courses.getDeptCode()  %> </td>
                        
                        <td> <%=courses.getCourseNumber() %> </td>
                       
                        <td> <%=courses.getTitle() %> </td>
                        
                       </tr>
                           
                       <% } %></table>

<br>
   <input type=submit value=BACK >
   </form>                     

</body>
</html>