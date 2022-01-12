<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Appointment appointmentDetails = new Appointment();
	int appointment_id = Integer.parseInt(request.getParameter ("appointment_id")), appointmentCount = 6;
	HashMap Values =  appointmentDetails.getAppointmentDetails(appointment_id);	
%>

<script>
  jQuery(function() {
    jQuery( "#appointment_date" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-1:+1",
       dateFormat: 'd MM,yy'
    });
  });
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Book Appointment with Dr. <% out.print(Values.get("doctor_name")); %></h2>
      <div>
          <table>
            <tr>
              <td rowspan="5" style="width:30%;"><div style="float:left"><img src="doctorImages/<% out.print(Values.get("doctor_image")); %>" style="height:120px; width:150px;"></div></td>
            </tr>
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
          </table>
        </div>
        <div style="clear: both;"> </div>
        <h2>Your Appointment Details</h2>
        <form action="model/appointment.jsp" method="post">
		      <table>
            <tr>
              <td>Patient Name</td>
              <td><% out.print(Values.get("patient_name")); %></td>
            </tr>
            <tr>
              <td>Patient Email</td>
              <td><% out.print(Values.get("patient_email")); %></td>
            </tr>
            <tr>
              <td>Patient Contact</td>
              <td><% out.print(Values.get("patient_mobile")); %></td>
            </tr>
            <tr>
              <td>Fees Paid</td>
              <td><% out.print(Values.get("doctor_fees")); %></td>
            </tr>
            <tr>
              <td>Appointment Date</td>
              <td><% out.print(Values.get("appointment_date")); %></td>
            </tr>
            <tr>
              <td>Appointment Time</td>
              <td><% out.print(Values.get("appointment_time")); %></td>
            </tr>
          </table>
          <div style="text-align: center;"><input type="button" value="Print" onClick="window.print()"></div>
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
