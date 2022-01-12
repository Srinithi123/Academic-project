package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Appointment extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Appointment()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveAppointment(HashMap appointmentData)
	{
		String SQL = "INSERT INTO `appointment` (`appointment_date`, `appointment_patient_id`, `appointment_description`,`appointment_doctor_id`, `appointment_time`) VALUES (?, ?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1,(String) appointmentData.get("appointment_date"));
			pstmt.setString(2,(String) appointmentData.get("appointment_patient_id"));
			pstmt.setString(3,(String) appointmentData.get("appointment_description"));
			pstmt.setString(4,(String) appointmentData.get("appointment_doctor_id"));
			pstmt.setString(5,(String) appointmentData.get("appointment_time"));
			
			record = pstmt.executeUpdate();

			//// Get the Order ID ////
			rs = pstmt.getGeneratedKeys();
			if(rs.next())
			{
				error = Integer.toString(rs.getInt(1));
			}
			
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
    public HashMap getAppointmentDetails(int appointment_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `appointment`, `doctor`, `patient` WHERE patient_id = appointment_patient_id AND appointment_doctor_id = doctor_id AND appointment_id = "+appointment_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("appointment_id",rs.getString("appointment_id"));
				results.put("appointment_date",rs.getString("appointment_date"));
				results.put("appointment_time",rs.getString("appointment_time"));
				results.put("appointment_description",rs.getString("appointment_description"));
				results.put("doctor_name",rs.getString("doctor_name"));
				results.put("doctor_fees",rs.getString("doctor_fees"));
				results.put("doctor_qualification",rs.getString("doctor_qualification"));
				results.put("doctor_address",rs.getString("doctor_address"));
				results.put("doctor_fees",rs.getString("doctor_fees"));
				results.put("doctor_id",rs.getString("doctor_id"));
				results.put("doctor_image",rs.getString("doctor_image"));
				results.put("doctor_specialization",rs.getString("doctor_specialization"));
				results.put("patient_name",rs.getString("patient_name"));
				results.put("patient_mobile",rs.getString("patient_mobile"));
				results.put("patient_email",rs.getString("patient_email"));
				results.put("patient_password",rs.getString("patient_password"));
				results.put("patient_address",rs.getString("patient_address"));
				results.put("patient_city",rs.getString("patient_city"));
				results.put("patient_state",Integer.parseInt(rs.getString("patient_state")));
				results.put("patient_pincode",rs.getString("patient_pincode"));	
				count++;
            }
			if(count==0)
			{
				results.put("appointment_id","");
				results.put("appointment_date","");
				results.put("appointment_description","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Appointment ////
	public String updateAppointment(HashMap appointmentData)
	{
		String SQL = "UPDATE `appointment` SET `appointment_date` = ?, `appointment_description` = ?, `appointment_doctor_id` = ?, `appointment_time` = ? WHERE `appointment_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);

			pstmt.setString(1,(String) appointmentData.get("appointment_date"));
			pstmt.setString(2,(String) appointmentData.get("appointment_patient_id"));
			pstmt.setString(3,(String) appointmentData.get("appointment_description"));
			pstmt.setString(4,(String) appointmentData.get("appointment_doctor_id"));
			pstmt.setString(5,(String) appointmentData.get("appointment_time"));
			pstmt.setString(6,(String) appointmentData.get("appointment_id"));
			
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
    public ArrayList getAllAppointment(int patient_id)
	{
		String SQL = "SELECT * FROM `appointment`, `doctor`, `patient` WHERE patient_id = appointment_patient_id AND doctor_id = appointment_doctor_id";
		if(patient_id !=0 ) {
			SQL = "SELECT * FROM `appointment`, `doctor`, `patient` WHERE patient_id = appointment_patient_id AND doctor_id = appointment_doctor_id AND patient_id = "+patient_id;
		}
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{			
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("appointment_id",rs.getString("appointment_id"));
				results.put("appointment_date",rs.getString("appointment_date"));
				results.put("appointment_time",rs.getString("appointment_time"));
				results.put("doctor_name",rs.getString("doctor_name"));
				results.put("patient_name",rs.getString("patient_name"));
				results.put("appointment_description",rs.getString("appointment_description"));
				
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
