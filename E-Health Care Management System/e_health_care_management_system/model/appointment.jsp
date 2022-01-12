<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Appointment appointmentObj = new Appointment();
	String patient_id = (String) session.getAttribute("login_id");
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		patient_id = (String) session.getAttribute("login_patient_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("appointment_id",request.getParameter("appointment_id"));
		results.put("appointment_patient_id",patient_id);
		results.put("appointment_doctor_id",request.getParameter("appointment_doctor_id"));
		results.put("appointment_date",request.getParameter("appointment_date"));
		results.put("appointment_time",request.getParameter("appointment_time"));
		results.put("appointment_description",request.getParameter("appointment_description"));

		if((request.getParameter("appointment_id")).equals(""))
		{
			String id = appointmentObj.saveAppointment(results);
			response.sendRedirect("../payment.jsp?doctor_id="+request.getParameter("appointment_doctor_id")+"&appointment_id="+id);
		}
		else
		{
			results.put("appointment_id",request.getParameter("appointment_id"));
			out.println(appointmentObj.updateAppointment(results));
			response.sendRedirect("../report-appointment.jsp?patient_id=0&msg=Food Category Updated Successfully");
		}
	}
%>
