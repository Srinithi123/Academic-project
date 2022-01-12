<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
	    <div style="width: 70%; float:left; margin-right:30px" id="login-home">
		  <h2>Welcome to E-Health Care Management System Dashboard</h2>
		  
		  <!-- Dashboard For Employee Section -->
		  <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("4")) { %>		
		  <ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="login-home.jsp">Dasboard</a></li>
			<li><a href="list-doctor.jsp?type_id=0">All Doctors</a></li>
			<li><a href="appointment-list.jsp">My Appointments</a></li>
			<li><a href="patient.jsp?patient_id=<%=session.getAttribute("patient_id")%>">My Account</a></li>
			<li><a href="model/patient.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		 <!-- Dashboard For Super Admin Section -->
		 <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
		  <ul>
			<li><a href="doctor.jsp?doctor_id=0">Add New Doctor</a></li>
			<li><a href="patient.jsp?patient_id=0">Add New Patient</a></li>
			<li><a href="report-doctor.jsp?type=2">All Doctors</a></li>
			<li><a href="report-patient.jsp?type=3">All Patients</a></li>
			<li><a href="report-appointment.jsp">All Appointments</a></li>
			<li><a href="change-password.jsp">Change Password</a></li>
			<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		<% if(session.getAttribute("login_level") != null && !session.getAttribute("login_level").equals("1") && !session.getAttribute("login_level").equals("4")) { 
			Warning warningDetails = new Warning();
			String employee_id = session.getAttribute("login_emp_id").toString();
			ArrayList allWarnings = warningDetails.getAllWarning(employee_id);
		%>
		<h2 style="color: #FF0000; font-weight: bold;">Your Warnings</h2>
		<table>
			<tbody>
			  <% for(int i=0;i<allWarnings.size();i++) 
			  { 
				  HashMap WarningDetails = new HashMap();
				  WarningDetails = (HashMap)allWarnings.get(i);
			  %>
				  <tr>
					<td style="color: #FF0000;"><% out.print(i+1); %></td>
					<td><% out.print(WarningDetails.get("warning_description")); %></td>
				  </tr>
			  <%
			  }
			  %>
			  </tbody>
		  </table>
		  <% } %>
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
