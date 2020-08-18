<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="java.text.*"%>

		<!DOCTYPE html>
		<html>
		<script type="text/javascript">
    function delcall() {
        document.forms[0].action = "deletenext.jsp";
        document.forms[0].submit();
    }
	</script>
		<link rel = stylesheet type = "text/css" href="events.css">
	<head>
	<style>
html, body, h1, h2, h3, h4, h5, h6,table , button {
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
</style>
		

	</head>
		<body id="background">
	<div id="head">
		<font color="white">
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
		<table >
		<tr>
		<td>Select</td>
		<td>Start DateTime</td>
		<td>End DateTime</td>
		<td>Description</td>
		<td>Completed</td>
		
		</tr>
		<%
		try{
			ResultSet resultSet=null;
			Connection connection = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
			Statement statement = connection.createStatement();
			String sql ="SELECT * FROM timetable order by id";
			resultSet = statement.executeQuery(sql);
		%>
			<form name="frm" id="frm" action =planEdit.jsp method="post">			
	<%	while(resultSet.next()){
			DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyy HH:mm a");
		//	String strDate = dateFormat.format(date);
		%>

		<tr>
		<td>
		  <input type="checkbox" name="id" value="<%=resultSet.getString("ID") %>"><br>
		 </td>
		 
	  
		<td><%=dateFormat.format(resultSet.getTimestamp("planStarttime")) %></td>
		<td><%=dateFormat.format(resultSet.getTimestamp("planEndtime")) %></td>
		<td><%=resultSet.getString("remtext") %></td>
		<td><%=resultSet.getString("completed") %></td>

		</tr>
		
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		<Tr>
		
		<td colspan=5><input type="hidden" name="txtAction" value ="">&nbsp;
		</td>
		</Tr>
		<tr>
		<td colspan=5>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name ="Insert" value="Insert" onClick="frm.txtAction.value='Ins'; form.submit();";>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name ="Edit" value="Edit" onClick="form.txtAction.value='Edit';form.submit();";>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name ="Delete" value="Delete" onClick="delcall();";>
		
		</td>
		</table>
		</div>
		</form>
		</body>
		</html>		