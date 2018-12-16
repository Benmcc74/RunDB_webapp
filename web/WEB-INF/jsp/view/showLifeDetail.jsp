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
			TOTAL RUNS:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= lrec.getTotalRuns() %>
			<br/><br/>
			TOTAL MILES:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= lrec.getTotalMiles() %>
			<br/><br/>
			</div>
			<br/>
			<h4>LIFETIME RECORDS</h4>
			<br/>
			<TABLE id="compRecs">
			<TR>
			<TH style="text-align: center;" class="rid">ID</TH>
			<TH style="text-align: center;" class="course">Course</TH>
			<TH style="text-align: center;" class="miles">Miles</TH>
			<TH style="text-align: center;" class="total">Total</TH>
			<TH style="text-align: center;" class="time">Best Time</TH>
			<TH style="text-align: center;" class="date">Best Time Date</TH>
			<TH style="text-align: center;" class="time">Worst Time</TH>
			<TH style="text-align: center;" class="date">Worst Time Date</TH>
			<TH style="text-align: center;" class="time">Average Time</TH>
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

			<br/>
			<h4>COMPLETED RUNS</h4>
			<br/>
			<TABLE id="compRuns">
			<TR>
			<TH style="text-align: center;" class="rid">RUN ID</TH>
			<TH style="text-align: center;" class="date">DATE</TH>
			<TH style="text-align: center;" class="course">COURSE</TH>
			<TH style="text-align: center;" class="cid">COURSE ID</TH>
			<TH style="text-align: center;" class="miles">MILEAGE</TH>
			<TH style="text-align: center;" class="time">TIME</TH>
			</TR>
			<% for(int row = 0; row <lifeRuns.size(); row++) {    %>
			<TR>
			<TD style="text-align: center;"><%= lifeRuns.get(row).get(5) %></TD>
			<TD style="text-align: center;"><%= lifeRuns.get(row).get(0) %></TD>
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