<%@ page session="false" import="java.util.ArrayList"  %>
<%
	AnnualRecord arec = (AnnualRecord)request.getAttribute("annRec");
	ArrayList<ArrayList<String>> annRuns = (ArrayList<ArrayList<String>>)request.getAttribute("arecRuns");
	ArrayList<ArrayList<String>> annRecs = (ArrayList<ArrayList<String>>)request.getAttribute("arecRecs");
	String selYear = (String)request.getAttribute("selYear");
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
			<h3>THE ANNUAL DETAIL</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h4>VIEW THE DETAILS FROM A YEAR</h4>
			<br/>
			YEAR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="years" onchange="this.form.submit()">
				<% for(String year: arec.getYearList()) { %>
					<option value="<%= year %>" <% if(year.equals(selYear)) {%> selected="selected" <% }; %>><%= year %></option>
					
				<% } %>
			</select>
			<br/><br/>
			TOTAL RUNS:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= arec.getTotalRuns(selYear) %> 
			<br/><br/>
			TOTAL MILES:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= arec.getTotalMiles(selYear) %>
			<br/><br/>
			</div>
			</form>	
			<h4><% out.println(selYear); %> RECORDS</h4>
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
			<% for(int rec = 0; rec <annRecs.size(); rec++) {    %>
			<TR>
			<TD style="text-align: center;"><%= annRecs.get(rec).get(0) %></TD>
			<TD style="text-align: left;"><%= annRecs.get(rec).get(7) %></TD>
			<TD style="text-align: center;"><%= annRecs.get(rec).get(8) %></TD>
			<TD style="text-align: center;"><%= annRecs.get(rec).get(5) %></TD>
			<TD style="text-align: center;"><%= annRecs.get(rec).get(1) %></TD>
			<TD style="text-align: center;"><%= annRecs.get(rec).get(2) %></TD>
			<TD style="text-align: center;"><%= annRecs.get(rec).get(3) %></TD>
			<TD style="text-align: center;"><%= annRecs.get(rec).get(4) %></TD>
			<TD style="text-align: center;"><%= annRecs.get(rec).get(6) %></TD>
			</TR>
			<%  }   %>
		
			</TABLE>

			<br/><br/>
			<h4>COMPLETED RUNS IN <% out.println(selYear); %></h4>
			<br/><br/>
			<TABLE>
			<TR>
			<TH style="text-align: center;">DATE</TH>
			<TH style="text-align: center;">COURSE</TH>
			<TH style="text-align: center;">COURSE ID</TH>
			<TH style="text-align: center;">MILEAGE</TH>
			<TH style="text-align: center;">TIME</TH>
			</TR>
			<% for(int row = 0; row <annRuns.size(); row++) {    %>
			<TR>
			<TD style="text-align: center;"><%= annRuns.get(row).get(0) %></TD>
			<TD style="text-align: left;"><%= annRuns.get(row).get(3) %></TD>
			<TD style="text-align: center;"><%= annRuns.get(row).get(1) %></TD>
			<TD style="text-align: center;"><%= annRuns.get(row).get(4) %></TD>
			<TD style="text-align: center;"><%= annRuns.get(row).get(2).substring(0,8) %></TD>
			</TR>
			<%  }   %>
		
			</TABLE>
			
			
			</div>
		</div>
    </body>
</html>