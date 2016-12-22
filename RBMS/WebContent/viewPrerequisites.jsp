<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Prerequisites Data</title>
<h2> Prerequisites Information</h2>
</head>
<%-- To display the Prerequisites TABLE DATA  --%> 

<body style="background-color:#669999;">

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<Prerequisites> itr;
List<Prerequisites> viewdata=(List<Prerequisites>)(request.getAttribute("prerequisitesInfo"));
%>
<table border=1>
<tr>
<th> DEPT_CODE </th>
<th> COURSE# </th>
<th> PRE_DEPT_CODE </th>
<th> PRE_COURSE# </th>
</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%Prerequisites prerequisites =(Prerequisites)itr.next();%>
                      
                      	<td> <%=prerequisites.getDeptCode()  %> </td>
                        
                        <td> <%=prerequisites.getCourseNumber() %> </td>
                       
                        <td> <%=prerequisites.getPreqDeptCode() %> </td>
                        
                        <td> <%=prerequisites.getPreqCourseNumber() %> </td>
                        
                       </tr>
                           
                       <% } %></table>

<br>
   <input type=submit value=BACK >
   </form>                     

</body>
</html>