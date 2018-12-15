<%@ page session="false" import="java.util.ArrayList"  %>
<%
	ArrayList<ArrayList<String>> crseList = (ArrayList<ArrayList<String>>)request.getAttribute("crseList");
	CourseRecord cRec = (CourseRecord)request.getAttribute("cRec");
	Integer selCrse = Integer.parseInt((String)request.getAttribute("selCrse"));
	
	ArrayList<ArrayList<String>> crseRuns = (ArrayList<ArrayList<String>>)request.getAttribute("crseRuns");

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Running Stuff</title>
    </head>
    <body>
    	<%@ include file="sideMenu.jsp" %>
    	<div id="main" class="main">
        	<h2>Runs Database WEB APP </h2>
			<br/>
			<h3>THE COURSE DETAIL</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h4>VIEW THE DETAILS FROM A COURSE</h4>
			<br/>
			<h5>COURSE</h5>
			<select name="courses" onchange="this.form.submit()">
				<% for(ArrayList<String> crse: crseList) { %>
					<option value="<%= crse.get(0) %>" <% if(Integer.parseInt(crse.get(0)) == selCrse) {%> selected="selected" <% }; %>><%= crse.get(1) %></option>
					
				<% } %>
			</select>
			<br/><br/>
			<% if(crseRuns.size() > 0) { %>
			TOTAL RUNS:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= cRec.calcTotalRuns(selCrse) %> 
			<br/><br/>
			MILEAGE:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= cRec.getCourseMileage(selCrse) %> 
			<br/><br/>
			<br/><br/>
			BEST COURSE RECORD:
			<br/><br/>
			<%= cRec.calcCrseBestTime(selCrse).get(0) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= cRec.calcCrseBestTime(selCrse).get(1).substring(0,8) %>
			<br/><br/>
			<br/><br/>
			WORST COURSE RECORD:
			<br/><br/>
			<%= cRec.calcCrseWorstTime(selCrse).get(0) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= cRec.calcCrseWorstTime(selCrse).get(1).substring(0,8) %>
			<br/><br/>
			<br/><br/>
			AVERAGE RUN TIME:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= cRec.calcCrseAvgTime(selCrse).substring(0,8) %> 
			<br/><br/>
			<% } else { %>
			No run data for the selected Course: <%= cRec.getCourseDesc(selCrse) %>
			<% } %>
			
			</div>
			</form>	
			<br/><br/>
			<h4>COMPLETED RUNS: <% out.println(cRec.getCourseDesc(selCrse)); %></h4>
			<br/><br/>
			<TABLE id="crseCompRuns">
			<TR>
			<TH style="text-align: center;" class="date">DATE</TH>
			<TH style="text-align: center;" class="course">COURSE</TH>
			<TH style="text-align: center;" class="miles">MILEAGE</TH>
			<TH style="text-align: center;" class="time">TIME</TH>
			</TR>
			<% for(int row = 0; row < crseRuns.size(); row++) {    %>
			<TR>
			<TD style="text-align: center;"><%= crseRuns.get(row).get(0) %></TD>
			<TD style="text-align: left;"><%= crseRuns.get(row).get(1) %></TD>
			<TD style="text-align: center;"><%= crseRuns.get(row).get(2) %></TD>
			<TD style="text-align: center;"><%= crseRuns.get(row).get(3).substring(0,8) %></TD>
			</TR>
			<%  }   %>
		
			</TABLE>
			
			
		</div>
    </body>
</html>