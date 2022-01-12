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
	ArrayList allAppointments = appointmentDetails.getAllAppointment(0);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>My Appointments</h2>
		<div style="width: 70%; float:left; margin-right:30px" id="login-home">
		<ul>
			<% for(int i=0;i<allAppointments.size();i++) 
			{ 
				HashMap AppointmentDetails = new HashMap();
				AppointmentDetails = (HashMap)allAppointments.get(i);
			%>
			<li><a href="appointment-details.jsp?appointment_id=<% out.print(AppointmentDetails.get("appointment_id")); %>"><% out.print(AppointmentDetails.get("appointment_date")); %> with <% out.print(AppointmentDetails.get("doctor_name")); %></a></li>
			<%
			}
			%>
		</ul>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
