<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Patient patientDetails = new Patient();
	int patient_id = Integer.parseInt(request.getParameter ("patient_id"));
	HashMap Values =  patientDetails.getPatientDetails(patient_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <% if(request.getParameter("msg") != null) { %>
	<div class="msg"><%=request.getParameter("msg") %></div>
	<% } %>
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Registration Form</h2>
		<h4>Personal Details</h4>
		<form method="post" action="model/patient.jsp">
          <div class="half_width">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="patient_name" id="patient_name" value="<% out.print(Values.get("patient_name")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">Mobile<span>*</span></label>
            <input type="text" name="patient_mobile" id="patient_mobile" value="<% out.print(Values.get("patient_mobile")); %>" size="22" style="width:300px;" required>
          </div>
          <div id="password_row">
			  <div class="half_width">
				<label for="email">Password<span>*</span></label>
				<input type="password" name="patient_password" id="patient_password" value="<% out.print(Values.get("patient_password")); %>" size="22" style="width:300px;" required>
			  </div>
			  <div class="half_width">
				<label for="email">Confirm Password<span>*</span></label>
				<input type="password" name="patient_confirm_password" id="patient_confirm_password" value="<% out.print(Values.get("patient_password")); %>" size="22" style="width:300px;" required>
			  </div>
		  </div>
          <div class="half_width">
            <label for="email">Email<span>*</span></label>
            <input type="text" name="patient_email" id="patient_email" value="<% out.print(Values.get("patient_email")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both"></div>
          <h4>Address Details</h4>
           <div class="half_width">
            <label for="email">Pincode<span>*</span></label>
            <input type="text" name="patient_pincode" id="patient_pincode" value="<% out.print(Values.get("patient_pincode")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">City<span>*</span></label>
            <input type="text" name="patient_city" id="patient_city" value="<% out.print(Values.get("patient_city")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="url">State</label>
            <select style="height: 40px; width:300px" name="patient_state" required>
				<% out.print(patientDetails.getStateOption((Integer) Values.get("patient_state"))); %>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Address<span>*</span></label>
            <textarea style="width:300px; height:100px;" name="patient_address" required><% out.print(Values.get("patient_address")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Patient">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("patient_image")); %>" />
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" id="patient_id" name="patient_id" value="<% out.print(Values.get("patient_id")); %>"/>
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
<% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
	<script>
		 jQuery('#password_row').hide();
	</script>
<% } %>
<%@ include file="includes/footer.jsp" %>
