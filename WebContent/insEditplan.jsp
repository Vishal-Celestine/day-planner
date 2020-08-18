<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
	<title> INSERTION</title>
</head>
<body>
<%
   
   	String id=request.getParameter("id");
	String planStart=request.getParameter("planStarttime");
	String planEnd=request.getParameter("planEndtime");
	String planDesc=request.getParameter("planDesc");
	String completed=request.getParameter("completed");
	
	planStart = planStart.replace('T', ' ');
	planEnd = planEnd.replace('T', ' ');
	
	java.util.Date strDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(planStart);
	
	out.println("startdate ==>"+ planStart);
	out.println("strDate ==>"+ strDate.toString());
	
	if (completed != null)
		completed = "Y";
	else
		completed = "N";
	
//   String name=request.getParameter("name");
   try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
		PreparedStatement psi;
		out.println("id" + id+"end");
		if(id == null)
		{	
			psi=conn.prepareStatement("insert into timetable(planStarttime,planEndtime,Remtext,Completed) values(?,?,?,?)");
			psi.setTimestamp(1,new java.sql.Timestamp((new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(planStart)).getTime()));
			psi.setTimestamp(2,new java.sql.Timestamp((new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(planEnd)).getTime()));
			psi.setString(3,planDesc);
			psi.setString(4,completed);
		}
		else
		{
			psi=conn.prepareStatement("update timetable set planStarttime= ?,planEndtime=?, Remtext=?, Completed=? where id=?");
			psi.setTimestamp(1,new java.sql.Timestamp((new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(planStart)).getTime()));
			psi.setTimestamp(2,new java.sql.Timestamp((new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(planEnd)).getTime()));
			psi.setString(3,planDesc);
			psi.setString(4,completed);
			psi.setInt(5,Integer.parseInt(id));
		}
		
	
		int i=psi.executeUpdate();
		if(i!=0)
			out.println("SUCCESS!!");
		else
			out.println("PROBLEMi!!");
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
   response.sendRedirect("planDisplay.jsp");
%>
</body>
</html>