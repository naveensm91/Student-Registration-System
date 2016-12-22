<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logs Data</title>
<h2> Logs Information</h2>
</head>
<%-- To display the CLASSES TABLE DATA  --%> 

<body style="background-color:#669999;">

<form name=form1 action=displayTuples.jsp>
<%@ page language="java" import="bean.*" %>

<%@page import="java.util.Iterator"%>

<%@page import="java.util.List"%>

<%
Iterator<Logs> itr;
List<Logs> viewdata=(List<Logs>)(request.getAttribute("logsInfo"));
%>
<table border=1>
<tr>
<th> LOGID </th>
<th> WHO </th>
<th> TIME </th>
<th> TABLE_NAME </th>
<th> OPERATION </th>
<th> KEY_VALUE </th>

</tr>
<% for(itr = viewdata.iterator(); itr.hasNext();)  { %>
                        <tr> <%Logs logs =(Logs)itr.next();%>
                      
                      	<td> <%= logs.getLogId() %> </td>
                        
                        <td> <%= logs.getWho() %> </td>
                       
                        <td> <%= logs.getTime() %> </td>
                        
                        <td> <%= logs.getTableName() %> </td>
                        
                        <td> <%= logs.getOperation() %> </td>
                        
                        <td> <%= logs.getKeyValue() %> </td>
                        
                       </tr>
                           
                       <% } %></table>

<br>
   <input type=submit value=BACK >
   </form>                     

</body>
</html>