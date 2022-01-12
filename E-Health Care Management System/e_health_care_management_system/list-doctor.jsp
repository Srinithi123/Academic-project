<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Doctor doctorDetails = new Doctor();
	int typeID = Integer.parseInt(request.getParameter("type_id"));
	ArrayList allDoctor = doctorDetails.getAllDoctor(typeID);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
		<h2>Doctors</h2>          
          <ul class="nospace listing">
          <% for(int i=0;i<allDoctor.size();i++) 
			{ 
				HashMap DoctorDetails = new HashMap();
				DoctorDetails = (HashMap)allDoctor.get(i);
			%>
				<li class="doctor-listing" style="width:151px">
					<div class="imgl borderedbox">
					<a href="doctor-details.jsp?doctor_id=<% out.print(DoctorDetails.get("doctor_id")); %>">
						<img src="doctorImages/<% out.print(DoctorDetails.get("doctor_image")); %>" style="height:130px; width:130px;">
					</a>
					</div>
					<div class="doctor-price">
						<b><% out.print(DoctorDetails.get("doctor_name")); %></b> <br>
						Fees : &#8377; <% out.print(DoctorDetails.get("doctor_fees")); %>
					</div>
				</li>
			<%
			}
			%>
          </ul>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
