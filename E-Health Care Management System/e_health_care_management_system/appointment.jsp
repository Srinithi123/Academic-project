<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
  if(session.getAttribute("login_level") == null) { 
    response.sendRedirect("patient-login.jsp?msg=Login to book your appointment !!!");
  }
  Doctor doctorDetails = new Doctor();
	int doctor_id = Integer.parseInt(request.getParameter ("doctor_id")), doctorCount = 6;
  HashMap Values =  doctorDetails.getDoctorDetails(doctor_id);	
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
		      <div id="empl_id">
            <label for="email">Appointment Date<span>*</span></label>
            <input type="text" name="appointment_date" id="appointment_date" size="22" style="width:400px;" required>
          </div>
          <div id="empl_id">
            <label for="email">Appointment Time<span>*</span></label>
            <input type="text" name="appointment_time" id="appointment_time" size="22" style="width:400px;" required>
          </div>
          <div>
            <label for="email">Full Disease Decription<span>*</span></label>
			      <textarea style="width:400px; height:100px;" name="appointment_description" required></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Book Appointment">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
      <input type="hidden" name="appointment_id">
      <input type="hidden" name="appointment_doctor_id" value="<% out.print(Values.get("doctor_id")); %>"/>
      <input type="hidden" name="appointment_doctor_id" value="<% out.print(Values.get("doctor_fees")); %>"/>

        </form>
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
