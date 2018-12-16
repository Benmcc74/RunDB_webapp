<%@ page session="false" import="java.util.ArrayList" %>
<%
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
			<h3>ADD A COURSE</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
				<h4>NEW COURSE DETAILS</h4> 
					Course: &nbsp; <input type="text" name="crseDesc" maxlength="100" size="40" required>
					<br/><br/>
					Miles: &nbsp;&nbsp;&nbsp;&nbsp; <input type="number" name="crseMiles" min="0.01" max="500" step="0.01" size="40" required>
					<br/><br/>
					<input type="submit" value="Add a Course"> 
				<br/><br/>
			</div>
			</form>
			<h4>EXISTING COURSES</h4>
			<br/>			
			<TABLE id="crseTable">
			<TR>
			<TH style="text-align: center;">ID</TH>
			<TH style="text-align: center;">DESCRIPTION</TH>
			<TH style="text-align: center;">MILEAGE</TH>
			</TR>
			<% for(int row = 0; row < crseList.size(); row++) {    %>
			<TR>
			<TD style="text-align: center;"><%= crseList.get(row).get(0) %></TD>
			<TD style="text-align: left;"><%= crseList.get(row).get(1) %></TD>
			<TD style="text-align: center;"><%= crseList.get(row).get(2) %></TD>
			</TR>
			<%  }   %>
		
			</TABLE>
			
		</div>
    </body>
</html>