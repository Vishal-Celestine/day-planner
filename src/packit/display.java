
import java.sql.*;
 public class display{
	public static void main(String args[]){
		System.out.println("test");
		Connection conn=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
			System.out.println("connected........");
			String sql="select * from empl";
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next())
				System.out.println(rs.getInt(1)+" "+rs.getString(2));
			conn.close();
			
			
		}catch(Exception e){System.out.println(e);
	}
		
	}
}

