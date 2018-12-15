<%@ page session="false" import="java.util.ArrayList" %>
<%
	LifetimeRecord lrec = (LifetimeRecord)request.getAttribute("lifeRec");
	ArrayList<ArrayList<String>> lifeRuns = (ArrayList<ArrayList<String>>)request.getAttribute("lifeRuns");
	ArrayList<ArrayList<String>> crseList = (ArrayList<ArrayList<String>>)request.getAttribute("crseList");
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
			<h3>ADD A RUN</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h5>DATE</h5> 
			Day: <input type="number" name="day" min="1" max="31" step="1" maxlength="2" size="3" required>
			Month: <input type="number" name="month" min="1" max="12" step="1" maxlength="2" size="3" required>
			Year: <input type="number" name="year" min="2000" max="2050" step="1" maxlength="4" size="5" required>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="Add a Run"> 
			<br/><br/>
			<h5>COURSE</h5>
			<select name="course">
				<% for(ArrayList<String> crse: crseList) { %>
					<option value="<%= crse.get(0) %>" ><%= crse.get(1) %></option>
				<% } %>
			</select>
			<br/><br/>
			<h5>TIME</h5> 
			Hours:	<input type="number" name="hours" min="0" max="5" step="1" maxlength="1" size="2" required>
			Minutes: <input type="number" name="mins" min="0" max="59" step="1" maxlength="2" size="3" required>
			Seconds: <input type="number" name="secs" min="0" max="59" step="1" maxlength="2" size="3" required>
			</div>
			</form>
			<h4>COMPLETED RUNS</h4>
			<TABLE>
			<TR>
			<TH style="text-align: center;">DATE</TH>
			<TH style="text-align: center;">RUN ID</TH>
			<TH style="text-align: center;">COURSE</TH>
			<TH style="text-align: center;">COURSE ID</TH>
			<TH style="text-align: center;">MILEAGE</TH>
			<TH style="text-align: center;">TIME</TH>
			</TR>
			<% for(int row = 0; row <lifeRuns.size(); row++) {    %>
			<TR>
			<TD style="text-align: center;"><%= lifeRuns.get(row).get(0) %></TD>
			<TD style="text-align: center;"><%= lifeRuns.get(row).get(5) %></TD>
			<TD style="text-align: left;"><%= lifeRuns.get(row).get(3) %></TD>
			<TD style="text-align: center;"><%= lifeRuns.get(row).get(1) %></TD>
			<TD style="text-align: center;"><%= lifeRuns.get(row).get(4) %></TD>
			<TD style="text-align: center;"><%= lifeRuns.get(row).get(2).substring(0,8) %></TD>
			</TR>
			<%  }   %>
		
			</TABLE>
			
		</div>
    </body>
</html>