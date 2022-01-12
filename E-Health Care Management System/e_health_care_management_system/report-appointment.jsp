<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<script>
function gotform(obj) {
	if(obj.value != "") {
		window.location.href = obj.value;
	}
}
</script>
<%
	Appointment appointmentDetails = new Appointment();
	int patient_id = Integer.parseInt((String) session.getAttribute("login_id"));
	ArrayList allAppointments = appointmentDetails.getAllAppointment(patient_id);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>All Appointments</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>ID</th>
			  <th>Patient Name</th>
			  <th>Doctor Name</th>
			  <th>Date</th>
			  <th>Time</th>
			  <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allAppointments.size();i++) 
			{ 
				HashMap AppointmentDetails = new HashMap();
				AppointmentDetails = (HashMap)allAppointments.get(i);
			%>
				<tr>
				  <td><%=(i+1)%></td>
				  <td><% out.print(AppointmentDetails.get("patient_name")); %></td>
				  <td><% out.print(AppointmentDetails.get("doctor_name")); %></td>
				  <td><% out.print(AppointmentDetails.get("appointment_date")); %></td>
				  <td><% out.print(AppointmentDetails.get("appointment_time")); %></td>
				  <td><a href="appointment-details.jsp?appointment_id=<% out.print(AppointmentDetails.get("appointment_id")); %>"));">Details</a></td>
				</tr>
			<%
			}
			%>
			</tbody>
        </table>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
