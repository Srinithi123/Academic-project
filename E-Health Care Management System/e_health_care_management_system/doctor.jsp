<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Doctor doctorDetails = new Doctor();
	int doctor_id = Integer.parseInt(request.getParameter ("doctor_id"));
	HashMap Values =  doctorDetails.getDoctorDetails(doctor_id);	
%>
<script>
function validImage() {
	var val = $("#doctor_image").val();
	var id = $("#doctor_id").val();
	if(id == '' || val != '')
	{
		if(val == '') {
			alert('Choose the Doctor Image');
			return false;
		}
		if (!val.match(/(?:gif|jpg|png|bmp)$/)) {
			// inputted file path is not an image of one of the above types
			alert("inputted file path is not an image!");
			return false;
		}
	}
	return true;
}
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Doctor Form</h2>
		<form method="post" action="UploadDoctor" enctype="multipart/form-data" onsubmit="return validImage()">
          <div class="half_width">
            <label for="email">Doctor Name<span>*</span></label>
            <input type="text" name="doctor_name" id="doctor_name" value="<% out.print(Values.get("doctor_name")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">Doctor Fees<span>*</span></label>
            <input type="text" name="doctor_fees" id="doctor_fees" value="<% out.print(Values.get("doctor_fees")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">Doctor Fees<span>*</span></label>
            <input type="text" name="doctor_qualification" id="doctor_qualification" value="<% out.print(Values.get("doctor_qualification")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">Doctor Contact<span>*</span></label>
            <input type="text" name="doctor_contact" id="doctor_contact" value="<% out.print(Values.get("doctor_contact")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both">
            <label for="email">Image<span>*</span></label>
            <input type="file" name="doctor_image" id="doctor_image" style="width:300px">
          </div>
           <div style="clear:both">
            <label for="email">Doctor Specialization<span>*</span></label>
            <input type="text" name="doctor_specialization" id="doctor_specialization" value="<% out.print(Values.get("doctor_specialization")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both">
            <label for="email">Full Address<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="doctor_address" required><% out.print(Values.get("doctor_address")); %></textarea>
          </div>
          <% if(!Values.get("doctor_image").equals("")) { %>
          <div class="half_width">
			<img src="doctorImages/<% out.print(Values.get("doctor_image")); %>" style="height:100px; width:100px;">
          </div>
          <% } %>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Doctor">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("doctor_image")); %>" />
		  <input type="hidden" name="doctor_email" value="<% out.print(session.getAttribute("login_emp_id")); %>" />
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="type_id" value="0" />
		  <input type="hidden" id="doctor_id" name="doctor_id" value="<% out.print(Values.get("doctor_id")); %>"/>
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
