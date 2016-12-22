<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CLASSES Data</title>
<h2> CLASSES Information</h2>
</head>
<%-- To display the CLASSES TABLE DATA  --%> 

<body style="background-color:#669999;">

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<Classes> itr;
List<Classes> viewdata=(List<Classes>)(request.getAttribute("classesInfo"));
%>
<table border=1>
<tr>
<th> CLASSID </th>
<th> DEPT_CODE </th>
<th> COURSE# </th>
<th> SECT# </th>
<th> YEAR </th>
<th> SEMESTER </th>
<th> LIMIT </th>
<th> CLASS_SIZE </th>
</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%Classes classes =(Classes)itr.next();%>
                      
                      	<td> <%=classes.getClassid()  %> </td>
                        
                        <td> <%=classes.getDeptCode() %> </td>
                       
                        <td> <%=classes.getCourseNumber() %> </td>
                        
                        <td> <%=classes.getSectNumber() %> </td>
                        
                        <td> <%=classes.getYear() %> </td>
                        
                        <td> <%=classes.getSemester() %> </td>
                        
                        <td> <%=classes.getLimit() %> </td>
                        
                          <td> <%=classes.getClassSize() %> </td>
                       </tr>
                           
                       <% } %></table>

<br>
   <input type=submit value=BACK >
   </form>                     

</body>
</html>