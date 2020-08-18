<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.*"%>
		<%@page import="java.text.SimpleDateFormat"%>
		<!DOCTYPE html>
		<html>
		<link rel = stylesheet type = "text/css" href="events.css">
	<head>
		<style>
html, body, h1, h2, h3, h4, h5, h6, table {
  font-family:Ubuntu;color:White;
}
input[type=button], input[type=submit], input[type=reset] {
width:20%;
height=10%;

  background-color:white;
  border: red;
  font-style: Ubuntu;
  color: black;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
input[type=text],input[datetime-local] {
  border: 2px solid red;
  border-radius: 4px;
}
</style>

	</head>
		<body id="background">
	<div id="head">
		<font color="white" font-family="ubuntu">
		<title>DAY PLANNER</title>

		<h1><center>DAY PLANNER</center></h1>
		<h3><center>ALL ABOUT TIME MANAGEMENT</center></h3>
		</font>	
		</div>
	<div class="navbar">
         			<a href="mainpage.html" >HOME</a>
         			<a href="planDisplay.jsp"
				   class="active">EVENTS</a>
          			<a href="about2.html" >ABOUT US</a>
               		</div>
	
	<style>
		table {
		  
		  border-collapse: collapse;
		  width: 100%;
		  height:100%;
		  color:white;
		}

		td, th {
		  border: 1px solid #dddddd;
		  text-align: left;
		  padding: 8px;
		}

		tr:nth-child(even) {
		  background-color:rgba(33,44,53,0.8);;
		}
		tr:nth-child(odd){
			background-color: rgba(33,44,53,0.8);
		}
	</style>

	<div id="t">
	<div id="sched">
		<h2>YOUR SCHEDULE</h2>
	</div>
	<form action="insEditplan.jsp" method="post">
	<table >
	<%
    String id=request.getParameter("id");
	
/*	String[] idarr=request.getParameterValues("id");
	String id = null;

	String strValue = String.join(",", idarr);
*/	
	String strAct=request.getParameter("txtAction");
//	out.println("Action==>"+strAct);
	
	String strName = "";
//	2014-01-02T22:13
	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm");

//	String dates=formatter.format(mydate);
	String strStartTime = formatter.format(new java.util.Date());
	String[] arr = strStartTime.split(" ");
	strStartTime = String.join("T",arr);
	
	String strEndTime = formatter.format(new java.util.Date());
	arr = strEndTime.split(" ");
	strEndTime = String.join("T",arr);
	
	String strRemtext = "";
	String strCompleted = "";
	String strChecked = "";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
	
	if (strAct.equals("Edit") && id != null)
	{
   try{
		PreparedStatement psi=conn.prepareStatement("SELECT * FROM timetable where id= ?");
		psi.setInt(1, Integer.parseInt(id));
		//String sql ="SELECT * FROM timetable where id= ?";
		// Statement statement = conn.createStatement();
		ResultSet	resultSet = psi.executeQuery();
		
		while(resultSet.next()){
			strStartTime = resultSet.getString("planStarttime");
			strEndTime = resultSet.getString("planEndtime");
			strRemtext = resultSet.getString("remtext");
			strCompleted = resultSet.getString("completed");
			if (strCompleted != null && strCompleted.equals("Y"))
				strChecked = "Checked";
			
		//	out.println("b4 Starttime==> "+ strStartTime + "\n");
			arr = strStartTime.split(" ");
			strStartTime = String.join("T",arr);
		//	out.println("after Starttime==> "+ strStartTime + "\n");
			arr = strEndTime.split(" ");
			strEndTime = String.join("T",arr);
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
	
%>
		<tr><Td>
		ID</Td><Td><input type="number" name="id" value='<%=id%>' readonly ></Td></tr>
<%
}%>
		
		<tr><Td>
		Start time1</Td><Td><input type="datetime-local" id ="planStarttime" name="planStarttime" value="<%=strStartTime %>"
        ></Td></tr><tr><Td>
		End time</Td><Td><input type="datetime-local" id="planEndtime" name="planEndtime" value='<%=strEndTime %>' >
		</Td></tr><tr><Td>Description</Td><Td><input type="text" name="planDesc" value='<%=strRemtext %>' >
		</Td></tr><tr><Td>Completed</Td><Td><input type="checkbox" name="completed" value="Y" <%=strChecked%> >
		
		</Td></tr><tr><Td colspan=2 align="center"><input type="submit" value="Save" ></Td></tr>
		</table>
	</form>
	</div>
</body>
</html>