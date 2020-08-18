<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title> INSERTION</title>
</head>
<body>
<%
   String id=request.getParameter("id");
   String name=request.getParameter("name");
   try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
		PreparedStatement ps=conn.prepareStatement("insert into empl values(?,?)");
		ps.setString(1,id);
		ps.setString(2,name);
		int i=ps.executeUpdate();
		if(i!=0)
			out.println("INSERTED!!");
		else
			out.println("PROBLEM!!");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>