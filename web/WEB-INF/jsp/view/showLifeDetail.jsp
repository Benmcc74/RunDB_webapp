<%@ page session="false" import="java.util.ArrayList"  %>
<%
	LifetimeRecord lrec = (LifetimeRecord)request.getAttribute("lifeRec");
	ArrayList<ArrayList<String>> lifeRuns = (ArrayList<ArrayList<String>>)request.getAttribute("lifeRuns");
	ArrayList<ArrayList<String>> lifeRecs = (ArrayList<ArrayList<String>>)request.getAttribute("lifeRecs");
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
			<h3>THE LIFETIME DETAIL</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h4>VIEW THE LIFETIME DATA</h4>
			<br/><br/>
			TOTAL RUNS:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= lrec.getTotalRuns() %>
			<br/><br/>
			TOTAL MILES:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= lrec.getTotalMiles() %>
			<br/><br/>
			</div>
			<h4>LIFETIME RECORDS</h4>
			<br/>
			<TABLE>
			<TR>
			<TH style="text-align: center;">ID</TH>
			<TH style="text-align: center;">Course</TH>
			<TH style="text-align: center;">Miles</TH>
			<TH style="text-align: center;">Total</TH>
			<TH style="text-align: center;">Best Time</TH>
			<TH style="text-align: center;">Best Time Date</TH>
			<TH style="text-align: center;">Worst Time</TH>
			<TH style="text-align: center;">Worst Time Date</TH>
			<TH style="text-align: center;">Average Time</TH>
			</TR>
			<% for(int rec = 0; rec <lifeRecs.size(); rec++) {    %>
			<TR>
			<TD style="text-align: center;"><%= lifeRecs.get(rec).get(0) %></TD>
			<TD style="text-align: left;"><%= lifeRecs.get(rec).get(7) %></TD>
			<TD style="text-align: center;"><%= lifeRecs.get(rec).get(8) %></TD>
			<TD style="text-align: center;"><%= lifeRecs.get(rec).get(5) %></TD>
			<TD style="text-align: center;"><%= lifeRecs.get(rec).get(1) %></TD>
			<TD style="text-align: center;"><%= lifeRecs.get(rec).get(2) %></TD>
			<TD style="text-align: center;"><%= lifeRecs.get(rec).get(3) %></TD>
			<TD style="text-align: center;"><%= lifeRecs.get(rec).get(4) %></TD>
			<TD style="text-align: center;"><%= lifeRecs.get(rec).get(6) %></TD>
			</TR>
			<%  }   %>
		
			</TABLE>

			<br/><br/>
			<h3>COMPLETED RUNS</h3>
			<br/><br/>
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