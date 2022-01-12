package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Doctor extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Doctor()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveDoctor(HashMap doctorData)
	{
		String SQL = "INSERT INTO `doctor` (`doctor_name`, `doctor_fees`, `doctor_qualification`, `doctor_contact`, `doctor_image`, `doctor_address`,`doctor_specialization`, `doctor_email`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) doctorData.get("doctor_name"));
			pstmt.setString(2,(String) doctorData.get("doctor_fees"));
			pstmt.setString(3,(String) doctorData.get("doctor_qualification"));
			pstmt.setString(4,(String) doctorData.get("doctor_contact"));
			pstmt.setString(5,(String) doctorData.get("doctor_image"));
			pstmt.setString(6,(String) doctorData.get("doctor_address"));
			pstmt.setString(7,(String) doctorData.get("doctor_specialization"));
			pstmt.setString(8,(String) doctorData.get("doctor_email"));
			
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
    public HashMap getDoctorDetails(int doctor_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
			String SQL = "SELECT * FROM `doctor` WHERE doctor_id = "+doctor_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("doctor_name",rs.getString("doctor_name"));
				results.put("doctor_fees",rs.getString("doctor_fees"));
				results.put("doctor_qualification",rs.getString("doctor_qualification"));
				results.put("doctor_address",rs.getString("doctor_address"));
				results.put("doctor_fees",rs.getString("doctor_fees"));
				results.put("doctor_contact",rs.getString("doctor_contact"));
				results.put("doctor_email",rs.getString("doctor_email"));
				results.put("doctor_id",rs.getString("doctor_id"));
				results.put("doctor_image",rs.getString("doctor_image"));
				results.put("doctor_specialization",rs.getString("doctor_specialization"));
				
				count++;
            }
			if(count==0)
			{
				results.put("doctor_name","");
				results.put("doctor_fees",0);
				results.put("doctor_qualification",0);
				results.put("doctor_address","");
				results.put("doctor_fees","");
				results.put("doctor_image","");
				results.put("doctor_id","");	
				results.put("doctor_specialization","");					
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Doctor ////
	public String updateDoctor(HashMap doctorData)
	{
		String SQL = "UPDATE `doctor` SET `doctor_name` = ?, `doctor_fees` = ?, `doctor_qualification` = ?, `doctor_contact` = ?, `doctor_image` = ?, `doctor_address` = ?, `doctor_specialization` = ? WHERE `doctor_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) doctorData.get("doctor_name"));
			pstmt.setString(2,(String) doctorData.get("doctor_fees"));
			pstmt.setString(3,(String) doctorData.get("doctor_qualification"));
			pstmt.setString(4,(String) doctorData.get("doctor_contact"));
			pstmt.setString(5,(String) doctorData.get("doctor_image"));
			pstmt.setString(6,(String) doctorData.get("doctor_address"));
			pstmt.setString(7,(String) doctorData.get("doctor_specialization"));
			pstmt.setString(8,(String) doctorData.get("doctor_id"));
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
    public ArrayList getAllDoctor(int typeID)
	{
		int count=0;
		String SQL = "SELECT * FROM `doctor`";
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("doctor_name",rs.getString("doctor_name"));
				results.put("doctor_fees",rs.getString("doctor_fees"));
				results.put("doctor_qualification",rs.getString("doctor_qualification"));
				results.put("doctor_address",rs.getString("doctor_address"));
				results.put("doctor_contact",rs.getString("doctor_contact"));
				results.put("doctor_email",rs.getString("doctor_email"));
				results.put("doctor_id",rs.getString("doctor_id"));
				results.put("doctor_image",rs.getString("doctor_image"));
				results.put("doctor_specialization",rs.getString("doctor_specialization"));
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
    ////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllVendorDoctor(String vendor_id)
	{
		int count=0;
		String SQL = "";
		SQL = "SELECT * FROM `doctor`";
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("doctor_name",rs.getString("doctor_name"));
				results.put("doctor_fees",rs.getString("doctor_fees"));
				results.put("doctor_qualification",rs.getString("doctor_qualification"));
				results.put("doctor_address",rs.getString("doctor_address"));
				results.put("doctor_contact",rs.getString("doctor_contact"));
				results.put("doctor_id",rs.getString("doctor_id"));
				results.put("doctor_image",rs.getString("doctor_image"));
				results.put("doctor_company",rs.getString("company_name"));
				results.put("doctor_type",rs.getString("type_name"));
				results.put("doctor_specialization",rs.getString("doctor_specialization"));
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
	public String getCompanyOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("company","company_id","company_name","company_id,company_name",selectedID,"1");
    }
    /////Function for Getting the List////////////
	public String getTypeOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("type","type_id","type_name","type_id,type_name",selectedID,"1");
    }
}
