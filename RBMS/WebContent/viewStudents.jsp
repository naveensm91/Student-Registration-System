<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Students Data</title>
<h2> Student's Information</h2>
</head>
<%-- To display the STUDENT TABLE DATA  --%> 

<body style="background-color:#669999;">

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<Students> itr;
List<Students> viewdata=(List<Students>)(request.getAttribute("studentInfo"));
%>
<table border=1>
<tr>
<th> B# </th>
<th> FIRSTNAME</th>
<th> LASTNAME</th>
<th> STATUS </th>
<th> GPA </th>
<th> EMAIL </th>
<th> BDATE </th>
<th> DEPTNAME </th>
</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%Students students =(Students)itr.next();%>
                      
                      	<td> <%=students.getbNumber()  %> </td>
                        
                        <td> <%=students.getfName() %> </td>
                       
                        <td> <%=students.getlName() %> </td>
                        
                        <td> <%=students.getStatus() %> </td>
                        
                        <td> <%=students.getGpa() %> </td>
                        
                        <td> <%=students.getEmail() %> </td>
                        
                        <td> <%=students.getBdate() %> </td>
                        
                          <td> <%=students.getDeptName()  %> </td>
                       </tr>
                           
                       <% } %></table>

<br>
   <input type=submit value=BACK >
   </form>                     

</body>
</html>