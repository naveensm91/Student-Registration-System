<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Grades Data</title>
<h2> Grades Information</h2>
</head>
<%-- To display the Grades TABLE DATA  --%> 

<body style="background-color:#669999;">

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<Grades> itr;
List<Grades> viewdata=(List<Grades>)(request.getAttribute("gradesInfo"));
%>
<table border=1>
<tr>
<th> COURSE# </th>
<th> CREDITS </th>
</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%Grades grades =(Grades)itr.next();%>
                      
                      	<td> <%= grades.getLetterGrade() %> </td>
                        
                        <td> <%= grades.getNumberGrade() %> </td>
                        
                       </tr>
                           
                       <% } %></table>

<br>
   <input type=submit value=BACK >
   </form>                     

</body>
</html>