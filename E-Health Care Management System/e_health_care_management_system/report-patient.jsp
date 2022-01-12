<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Patient patientDetails = new Patient();
	ArrayList allPatient = patientDetails.getAllPatient();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Patient Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Patient Code</th>
              <th>Name</th>
              <th>Email</th>
              <th>Mobile</th>
              <th>City</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allPatient.size();i++) 
			{ 
				HashMap PatientDetails = new HashMap();
				PatientDetails = (HashMap)allPatient.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(PatientDetails.get("patient_id")); %></td>
				  <td><% out.print(PatientDetails.get("patient_name")); %></td>
				  <td><% out.print(PatientDetails.get("patient_email")); %></td>
				  <td><% out.print(PatientDetails.get("patient_mobile")); %></td>
				  <td><% out.print(PatientDetails.get("patient_city")); %></td>
				  <td>
				  <a href="patient.jsp?patient_id=<% out.print(PatientDetails.get("patient_id")); %>">Edit</a>
				  </td>
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
