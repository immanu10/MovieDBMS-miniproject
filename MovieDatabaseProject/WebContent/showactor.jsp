<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";

String userid = "myproject";
String password = "oracle123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
<style>
* {
  box-sizing: border-box;
}

/* Style the body */
body {
  font-family: Arial, Helvetica, sans-serif;
	margin: 0;
	padding: 0;
	background: url(Backimg.jpg);
	background-size: cover;
	color:white;
	text-align:center;

}
.tb
{
  float:left;
  margin-left:495px;
}
</style>

<h1>Actor Details!!</h1>

<table class="tb" border="1">
	<tr>
	<td>Actor Id</td>
	<td>Actor Fname</td>
	<td>Actor Lname</td>
	<td>Actor Gender</td>
	
	
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from actor";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("act_id") %></td>
<td><%=resultSet.getString("act_fname") %></td>
<td><%=resultSet.getString("act_lname") %></td>
<td><%=resultSet.getString("act_gender") %></td>


</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>