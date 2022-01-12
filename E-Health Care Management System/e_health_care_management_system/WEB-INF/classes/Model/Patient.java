package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Patient extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Patient()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String savePatient(HashMap patientData)
	{
		String SQL = "INSERT INTO `patient` (`patient_name`, `patient_mobile`, `patient_email`, `patient_password`, `patient_address`, `patient_city`, `patient_state`, `patient_pincode`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) patientData.get("patient_name"));
			pstmt.setString(2,(String) patientData.get("patient_mobile"));
			pstmt.setString(3,(String) patientData.get("patient_email"));
			pstmt.setString(4,(String) patientData.get("patient_password"));
			pstmt.setString(5,(String) patientData.get("patient_address"));
			pstmt.setString(6,(String) patientData.get("patient_city"));
			pstmt.setString(7,(String) patientData.get("patient_state"));
			pstmt.setString(8,(String) patientData.get("patient_pincode"));
			
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
	//////////////////Function for getting Users Details//////////	
    public HashMap getPatientDetails(int patient_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
			String SQL = "SELECT * FROM `patient` WHERE patient_id = "+patient_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("patient_name",rs.getString("patient_name"));
				results.put("patient_mobile",rs.getString("patient_mobile"));
				results.put("patient_email",rs.getString("patient_email"));
				results.put("patient_password",rs.getString("patient_password"));
				results.put("patient_address",rs.getString("patient_address"));
				results.put("patient_city",rs.getString("patient_city"));
				results.put("patient_state",Integer.parseInt(rs.getString("patient_state")));
				results.put("patient_pincode",rs.getString("patient_pincode"));	
				results.put("patient_id",rs.getString("patient_id"));					
				count++;
            }
			if(count==0)
			{
				results.put("patient_name","");
				results.put("patient_mobile","");
				results.put("patient_email","");
				results.put("patient_password","");
				results.put("patient_address","");
				results.put("patient_city","");
				results.put("patient_state",0);	
				results.put("patient_pincode","");	
				results.put("patient_id","");				
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Patient ////
	public String updatePatient(HashMap patientData)
	{
		String SQL = "UPDATE `patient` SET `patient_name` = ?, `patient_mobile` = ?, `patient_email` = ?, `patient_password` = ?, `patient_address` = ?, `patient_city` = ?, `patient_state` = ?, `patient_pincode` = ? WHERE `patient_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) patientData.get("patient_name"));
			pstmt.setString(2,(String) patientData.get("patient_mobile"));
			pstmt.setString(3,(String) patientData.get("patient_email"));
			pstmt.setString(4,(String) patientData.get("patient_password"));
			pstmt.setString(5,(String) patientData.get("patient_address"));
			pstmt.setString(6,(String) patientData.get("patient_city"));
			pstmt.setString(7,(String) patientData.get("patient_state"));
			pstmt.setString(8,(String) patientData.get("patient_pincode"));
			pstmt.setString(9,(String) patientData.get("patient_id"));
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
    public ArrayList getAllPatient()
	{
		String SQL = "SELECT * FROM `patient`";
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("patient_name",rs.getString("patient_name"));
				results.put("patient_mobile",rs.getString("patient_mobile"));
				results.put("patient_email",rs.getString("patient_email"));
				results.put("patient_password",rs.getString("patient_password"));
				results.put("patient_address",rs.getString("patient_address"));
				results.put("patient_city",rs.getString("patient_city"));
				results.put("patient_state",Integer.parseInt(rs.getString("patient_state")));
				results.put("patient_pincode",rs.getString("patient_pincode"));	
				results.put("patient_id",rs.getString("patient_id"));			
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
	/////Function for Getting the List////////////
	public String getStateOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("state","state_id","state_name","state_id,state_name",selectedID,"1");
    }
    //////////////////Function for getting Login Details//////////	
    public HashMap getLoginDetails(String login_user,String login_password)
	{
        HashMap resultsArray = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM patient WHERE patient_email = '"+login_user+"' AND patient_password = '"+login_password+"'" ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				resultsArray.put("patient_id",rs.getString("patient_id"));
				resultsArray.put("patient_name",rs.getString("patient_name"));
				resultsArray.put("login_level",4);
				count++;
            }
			if(count==0)
			{
				resultsArray.put("patient_id","");
				resultsArray.put("patient_name","");
				resultsArray.put("login_level",0);
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return resultsArray;
    }	
    //////////////////Function for checking the existing username//////////	
    public int checkUsernameExits(String login_user, int type)
	{
        HashMap resultsArray = new HashMap();
        int exits=0;
		try
		{
			String SQL = "";
			if(type == 1) {
				SQL =  "SELECT * FROM patient WHERE patient_email = '"+login_user+"'" ;
			}
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				exits++;
            }
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return exits;
    }
    //////////////////Function for geting the Single Airport Details//////////	
    public boolean checkLogin(String login_user,String login_password)
	{
        int count=0;
		try
		{
            String SQL = "SELECT * FROM patient WHERE patient_email = '"+login_user+"' AND patient_password = '"+login_password+"'" ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())	count++;    
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
		if(count==0)
			return false;
        return true;
    }
}
