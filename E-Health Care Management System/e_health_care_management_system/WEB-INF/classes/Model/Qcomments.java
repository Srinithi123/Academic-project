package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Qcomments extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Qcomments()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveQcomments(HashMap ticketData)
	{
		String SQL = "INSERT INTO `qcomments` (`qcomment_appointment_id`, `qcomment_name`, `qcomment_email`, `qcomment_description`) VALUES (?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) ticketData.get("qcomment_appointment_id"));
			pstmt.setString(2,(String) ticketData.get("qcomment_name"));
			pstmt.setString(3,(String) ticketData.get("qcomment_email"));
			pstmt.setString(4,(String) ticketData.get("qcomment_description"));
			
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	
	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllQcomments(String appointment_id)
	{
		String SQL = "SELECT * FROM `qcomments` WHERE qcomment_appointment_id = "+appointment_id+" ORDER BY qcomment_id ASC";
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("qcomment_description",rs.getString("qcomment_description"));
				results.put("qcomment_name",rs.getString("qcomment_name"));
				results.put("qcomment_email",rs.getString("qcomment_email"));
				count++;
                resultArray.add(results);
            }
         }
		catch(Exception e)
		{
            System.out.println("Error is: "+ e);
        }
        return resultArray;
    }
}
