<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enrollments Data</title>
<h2> Enrollments Information</h2>
</head>
<%-- To display the Enrollments TABLE DATA  --%> 

<body style="background-color:#669999;">

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<Enrollments> itr;
List<Enrollments> viewdata=(List<Enrollments>)(request.getAttribute("enrollmentsInfo"));
%>
<table border=1>
<tr>
<th> COURSE# </th>
<th> CREDITS </th>
</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%Enrollments enrollments =(Enrollments)itr.next();%>
                      
                      	<td> <%= enrollments.getbNumber() %> </td>
                        
                        <td> <%= enrollments.getClassId() %> </td>
                        
                        <td> <%= enrollments.getLetterGrade() %> </td>
                        
                       </tr>
                           
                       <% } %></table>

<br>
   <input type=submit value=BACK >
   </form>                     

</body>
</html>