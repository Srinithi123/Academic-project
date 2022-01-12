<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Doctor doctorDetails = new Doctor();
	int doctor_id = Integer.parseInt(request.getParameter ("doctor_id")), doctorCount = 6;
	HashMap Values =  doctorDetails.getDoctorDetails(doctor_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
        <div id="comments" style="width: 70%; float:left; margin-right:30px">
        <h2>Details of <% out.print(Values.get("doctor_name")); %></h2>
        <form action="appointment.jsp?doctor_id=<% out.print(Values.get("doctor_id")); %>" method="post">
        <div>
			<div style="float:left"><img src="doctorImages/<% out.print(Values.get("doctor_image")); %>" style="height:320px; width:300px;"></div>
			<div style="float:right; width:345px;">
				<table>
					<tr>
						<td>Name</td>
						<td><% out.print(Values.get("doctor_name")); %></td>
					</tr>
					<tr>
						<td>Fees</td>
						<td><% out.print(Values.get("doctor_fees")); %></td>
					</tr>
					<tr>
						<td>Qualification</td>
						<td><% out.print(Values.get("doctor_qualification")); %></td>
					</tr>
					<tr>
						<td>Specialization</td>
						<td><% out.print(Values.get("doctor_specialization")); %></td>
					</tr>
					<tr>
						<td>Email ID</td>
						<td><% out.print(Values.get("doctor_email")); %></td>
					</tr>
					<tr>
						<td>Contact No</td>
						<td><% out.print(Values.get("doctor_contact")); %></td>
					</tr>
					<tr>
						<td colspan="2">
						Address :
						<% out.print(Values.get("doctor_address")); %>
						</td>
					</tr>
				</table>
			</div>
			<% if(doctorCount != 0 ) { %>
			<div style="clear:both; float:right;">
				<input type="submit" value="Book Appointment">
			</div>
			<% } %>
        </div>
        <input type="hidden" name="doctor_id" value="<% out.print(Values.get("doctor_id")); %>">
        <input type="hidden" name="doctor_fees" value="<% out.print(Values.get("doctor_fees")); %>">
        <input type="hidden" name="act" value="save">
		</form>
		<div style="clear: both;">&nbsp;</div>

		</div>
        <div style="float: left">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
