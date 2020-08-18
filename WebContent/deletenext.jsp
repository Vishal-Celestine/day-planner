<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title> INSERTION</title>
</head>
<body>
<%
String[] id=request.getParameterValues("id");

if (id != null)
{
String strValue = String.join(",", id);
out.println(strValue+" ");
   try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
		PreparedStatement ps=conn.prepareStatement("delete from timetable where id in ("+strValue+")");
	//	ps.setString(1,strValue);
		int i=ps.executeUpdate();
		if(i!=0)
			out.println("deleted!!");
		else
			out.println("PROBLEM!!");
	}
	catch(Exception e)
	{
		out.println(e);
	}
}
   response.sendRedirect("planDisplay.jsp");
%>
</body>
</html>