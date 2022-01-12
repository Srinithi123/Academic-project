<%@ include file="includes/header.jsp" %>
<%@ include file="includes/slider.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Doctor doctorDetails = new Doctor();
  ArrayList allDoctor = doctorDetails.getAllDoctor(0);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
        <!-- Middle Column -->
        <div style="width:98%"> 
          <!-- ################################################################################################ -->
          <h2>About E-Health Care Management System</h2>
          Efarming Portal software has the capacity to help plan, organize, and manage resource pools and develop resource estimates. Depending on the sophistication of the software, it can manage estimation and planning, scheduling, cost control and budget management, resource allocation, collaboration software, communication, decision-making, quality management and documentation or administration systems. Today, numerous PC & browser based project management software solutions exist and they are finding their way into almost every type of business.

The origins of project management software are rooted in the 1950s when Dupont Chemical collaborated with mainframe computer maker Remington Rand (Univac) to devise the Critical Path Method of network scheduling (CPM). This method was tested in 1958 with the construction of a major new chemical plant. In parallel, the US Navy working together with Lockheed Aerospace devised the automated Project Evaluation Review Technique (PERT) for the Polaris Missile program that ran on the IBM mainframe. Mainframe and Mini computers dominated the project management software arena until the early 1980s when PC computers began to proliferate across business and government circles alike.

Project planning software can be expected to provide information to various people or stakeholders, and can be used to measure and justify the level of effort required to complete the project(s). Typical requirements might include:
          <!-- ################################################################################################ --> 
        </div><br><br>
        <div style="width:98%"> 
          <!-- ################################################################################################ -->
          <h2>Top Latest Doctors Lists</h2>          
          <ul class="nospace listing">
          <% for(int i=0;i<allDoctor.size();i++) 
			{ 
				HashMap DoctorDetails = new HashMap();
        DoctorDetails = (HashMap)allDoctor.get(i);
        if (i==6) break;
			%>
				<li class="doctor-listing">
					<div class="myimage">
					<a href="doctor-details.jsp?doctor_id=<% out.print(DoctorDetails.get("doctor_id")); %>">
						<img src="doctorImages/<% out.print(DoctorDetails.get("doctor_image")); %>" style="height:110px; width:110px;">
					</a>
					</div>
					<div class="doctor-price">
						<b style="text-decoration:underline"><% out.print(DoctorDetails.get("doctor_name")); %></b> <br>
						&#8377; <% out.print(DoctorDetails.get("doctor_fees")); %>
					</div>
				</li>
			<%
			}
			%>
      </ul>
      </div>
      
        <!-- / Middle Column --> 
      </div>
      
      <!-- ################################################################################################ --> 
      <!-- ################################################################################################ -->
      
      <!-- ################################################################################################ --> 
      <!-- / main body -->
      <div class="clear"></div>
    </main>
  </div>
</div>

<%@ include file="includes/footer.jsp" %>
