<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Patient patient = new Patient();
	String emp_id = "0";
	if(request.getParameter("act").equals("login_status"))
	{
		if(session.getAttribute("patient_id") == null) {
			session.setAttribute("from_shipping",1);
			session.setAttribute("total_amount",request.getParameter("total_amount"));
			response.sendRedirect("../patient-login.jsp?msg=Login to continue !!!.");
		} else {
			session.setAttribute("total_amount",request.getParameter("total_amount"));
			response.sendRedirect("../checkout.jsp");
		}
	}
	
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		
		results.put("patient_name",request.getParameter("patient_name"));
		results.put("patient_mobile",request.getParameter("patient_mobile"));
		results.put("patient_email",request.getParameter("patient_email"));
		results.put("patient_password",request.getParameter("patient_password"));
		results.put("patient_address",request.getParameter("patient_address"));
		results.put("patient_city",request.getParameter("patient_city"));
		results.put("patient_state",request.getParameter("patient_state"));
		results.put("patient_pincode",request.getParameter("patient_pincode"));	
		results.put("patient_id",request.getParameter("patient_id"));			
		
						
		if((request.getParameter("patient_id")).equals(""))
		{
			out.println(patient.savePatient(results));
			response.sendRedirect("../report-patient.jsp?msg=Patient Saved Successfully");
		}
		else
		{
			results.put("patient_id",request.getParameter("patient_id"));
			out.println(patient.updatePatient(results));
			
			if(request.getParameter("patient_id").equals(session.getAttribute("patient_id")))
			{
				response.sendRedirect("../patient.jsp?patient_id="+session.getAttribute("patient_id")+"&msg=Account Updated Successfully");
			}
			else
			{
				response.sendRedirect("../report-patient.jsp?msg=Patient Updated Successfully");
			}
		}			
	}
	if((request.getParameter("act")).equals("chk_login"))
	{
		if(patient.checkLogin(request.getParameter("login_user"),request.getParameter("login_password")))
		{
			HashMap Values =  patient.getLoginDetails(request.getParameter("login_user"),request.getParameter("login_password"));
			
			session.setAttribute("patient_id",Values.get("patient_id"));
			session.setAttribute("login_id",Values.get("patient_id"));
			session.setAttribute("patient_name",Values.get("patient_name"));
			session.setAttribute("login_level","4");
			session.setAttribute("login_name",Values.get("patient_name"));
			if(session.getAttribute("from_shipping") == null) {
				response.sendRedirect("../login-home.jsp?msg=You are login successfully.");
				
			} else {
				session.setAttribute("from_shipping",null);
				response.sendRedirect("../checkout.jsp");
			}
		}
		else
		{
			response.sendRedirect("../patient-login.jsp?msg=Invalid User/Password. Please try again.........");			
		}
	}
	if((request.getParameter("act")).equals("logout"))
	{
		session.setAttribute("login_id",null);
		session.setAttribute("login_level",null);
		session.setAttribute("patient_id",null);
		session.setAttribute("patient_name",null);
		response.sendRedirect("../patient-login.jsp?msg=You are logout successfully......");			
	}
%>
