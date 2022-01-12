<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Doctor doctorDetails = new Doctor();
	ArrayList allDoctor;
	allDoctor = doctorDetails.getAllDoctor(0);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Doctor Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Image</th>
              <th>Contact</th>
              <th>Email</th>
              <th>Qualification</th>
              <th>Fees</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% 
			if(allDoctor.size()!=0) 
			{
				for(int i=0;i<allDoctor.size();i++) 
				{ 
					HashMap DoctorDetails = new HashMap();
					DoctorDetails = (HashMap)allDoctor.get(i);
				%>
					<tr>
					  <td style="text-align:center;"><% out.print(DoctorDetails.get("doctor_id")); %></td>
					  <td>
						<a href="doctor-details.jsp?doctor_id=<% out.print(DoctorDetails.get("doctor_id")); %>">
							<img src="doctorImages/<% out.print(DoctorDetails.get("doctor_image")); %>" style="height:80px; width:80px;">
						</a>
					  </td>
					  <td><% out.print(DoctorDetails.get("doctor_name")); %></td>
					  <td><% out.print(DoctorDetails.get("doctor_contact")); %></td>
					  <td><% out.print(DoctorDetails.get("doctor_qualification")); %></td>
					  <td><% out.print(DoctorDetails.get("doctor_fees")); %></td>
					  <td> <a href="doctor.jsp?doctor_id=<% out.print(DoctorDetails.get("doctor_id")); %>">Edit</a> </td>
					</tr>
				<%
				}
			}
			else {
			%>
				<tr>
					<td colspan="7">No doctors found !!!</td>
				</tr>
			<%}%>
			</tbody>
        </table>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
