<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Students Data</title>
<h2> Student's Information</h2>
</head>
<%-- To display the CREDITS TABLE DATA  --%> 

<body style="background-color:#669999;">

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<CourseCredit> itr;
List<CourseCredit> viewdata=(List<CourseCredit>)(request.getAttribute("creditsInfo"));
%>
<table border=1>
<tr>
<th> COURSE# </th>
<th> CREDITS </th>
</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%CourseCredit courseCredit =(CourseCredit)itr.next();%>
                      
                      	<td> <%= courseCredit.getCourseNumber() %> </td>
                        
                        <td> <%= courseCredit.getCredits()%> </td>
                       
                       </tr>
                           
                       <% } %></table>

<br>
   <input type=submit value=BACK >
   </form>                     

</body>
</html>