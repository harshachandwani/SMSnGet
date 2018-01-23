package smsnget;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DatabaseHandler {
	Connection con;
	public DatabaseHandler() {
		// TODO Auto-generated constructor stub
		con = null;
	}
	
	//Gets Database connection
	public void getConnection()
	{		
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "ozeki";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "";
		try
		{
			Class.forName(driver);
			con = DriverManager.getConnection(url+dbName,userName,password);
		}
		catch (Exception e) {
		    e.printStackTrace();
		}
	}
	
	//Gets bus information
	public String busexecute(String src, String dst)
	{	
		String result = "";
			
		try
		{
			
			//query for getting buses between bus stops
			Statement stmt = con.createStatement();
			String query = "select src.Bus_No, src.Time from (bus as src, bus as dst) where";
			query += " src.Bus_No = dst.Bus_No";
			query += " and src.Stop_Name = \'" + src + "\' and dst.Stop_Name = \'" + dst + "\'";
			query += " and src.Stop_No < dst.Stop_No";
			
			ResultSet buses = stmt.executeQuery(query);
			
			while(buses.next())
			{
				
				//query for getting bus arrival time
	            query = "select addtime(min(Time), \'" + buses.getObject(2) + "\') from time";
	            query += " where bus_no = \'" + buses.getObject(1) + "\'";
	            query += " and time > curtime()";
	           
	            Statement stmt1 = con.createStatement();
	            ResultSet time = stmt1.executeQuery(query);
	            time.next();
	            
	            //If no bus today, next bus is first bus tomorrow
	            if(time.getObject(1) == null)
	            {
	            	query = "select addtime(min(Time), \'" + buses.getObject(2) + "\') from time";
	            	query += " where bus_no = \'" + buses.getObject(1) + "\'";
		           
		            stmt1 = con.createStatement();
		            time = stmt1.executeQuery(query);
		            time.next();
	            }
	            
	            result += buses.getObject(1) + " " + time.getObject(1) + "\\0x0A";
	            
			}
			con.close();
		}
		catch(Exception e)
		{
			result += "Database error";
		}
		
		//Result is empty
		if(result.compareTo("") == 0)
			result = "No buses";
		return result;
	}
	
	//Gets place address
	public String collexecute(String name)
	{
		String result = "";
		//query for getting address
		try
		{
			Statement stmt = con.createStatement();
			String query = "select address from place where name = \'" + name + "\'";
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
				result += rs.getObject(1);
			con.close();
		}
		catch(Exception e)
		{
			result += "Database error";
		}
		//Result is empty
		if(result.compareTo("") == 0)
			result = "No such place found";
	
		return result;
	}
}
