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
		<script>
			function setFields(theRadio) {
				var radios = document.getElementsByName("check");
				var radiosLength = radios.length;
				for (var i = 0; i < radiosLength; i++) {
					if(radios[i].checked) {
						runDate = document.getElementById("deleteTable").rows[i + 1].cells.namedItem("tabDate").innerHTML;
						runTime = document.getElementById("deleteTable").rows[i + 1].cells.namedItem("tabTime").innerHTML;
						runCrse = document.getElementById("deleteTable").rows[i + 1].cells.namedItem("tabCourseId").innerHTML;
						runId = document.getElementById("deleteTable").rows[i + 1].cells.namedItem("tabRunId").innerHTML;
						document.getElementById("year").value=runDate.substring(0,4);
		   		     	document.getElementById("month").value=runDate.substring(5,7);
		        		document.getElementById("day").value=runDate.substring(8,10);
		        		document.getElementById("hours").value=runTime.substring(1,2);
		        		document.getElementById("mins").value=runTime.substring(3,5);
		        		document.getElementById("secs").value=runTime.substring(6,8);
		        		document.getElementById("course").value=runCrse;
		        		document.getElementById("runId").value=runId;
		        		break;
				} 
			}
		}
		
		</script>
    </head>
    <body>
    	<%@ include file="sideMenu.jsp" %>
    	<div id="main" class="main">
        	<h2>Runs Database WEB APP </h2>
			<br/>
			<h3>DELETE A RUN</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h5>DATE</h5> 
			Day: <input type="number" name="day" id="day" min="1" max="31" step="1" maxlength="2" size="3" required readonly>
			Month: <input type="number" name="month" id="month" min="1" max="12" step="1" maxlength="2" size="3" required readonly>
			Year: <input type="number" name="year" id = "year" min="2000" max="2050" step="1" maxlength="4" size="5" required readonly>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="Delete the selected Run"> 
			<input type="hidden" name="runId" id="runId">
			<br/><br/>
			<h5>COURSE</h5>
			<select name="course" id ="course" required>
				<% for(ArrayList<String> crse: crseList) { %>
					<option value="<%= crse.get(0) %>" ><%= crse.get(1) %></option>
				<% } %>
			</select>
			<br/><br/>
			<h5>TIME</h5> 
			Hours:	<input type="number" name="hours" id="hours" min="0" max="5" step="1" maxlength="1" size="2" required readonly>
			Minutes: <input type="number" name="mins" id="mins" min="0" max="59" step="1" maxlength="2" size="3" required readonly>
			Seconds: <input type="number" name="secs" id="secs" min="0" max="59" step="1" maxlength="2" size="3" required readonly>
			</div>
			<h4>COMPLETED RUNS</h4>
			<br/>			
			<TABLE id="deleteTable">
			<TR>
			<TH style="text-align: center;"></TH>
			<TH style="text-align: center;">DATE</TH>
			<TH style="text-align: center;">RUN ID</TH>
			<TH style="text-align: center;">COURSE</TH>
			<TH style="text-align: center;">COURSE ID</TH>
			<TH style="text-align: center;">MILEAGE</TH>
			<TH style="text-align: center;">TIME</TH>
			</TR>
			<% for(int row = 0; row <lifeRuns.size(); row++) {    %>
			<TR>
			<TD style="text-align: center;"><input type="radio" name="check" id="check" onclick="setFields(this)"></TD>
			<TD style="text-align: center;" class="tabDate" id="tabDate"><%= lifeRuns.get(row).get(0) %></TD>
			<TD style="text-align: center;" class="tabRunId" id="tabRunId"><%= lifeRuns.get(row).get(5) %></TD>
			<TD style="text-align: left;" class="tabCourse"><%= lifeRuns.get(row).get(3) %></TD>
			<TD style="text-align: center;" class="tabCourseId" id="tabCourseId"><%= lifeRuns.get(row).get(1) %></TD>
			<TD style="text-align: center;" class="tabMiles"><%= lifeRuns.get(row).get(4) %></TD>
			<TD style="text-align: center;" class="tabTime" id="tabTime"><%= lifeRuns.get(row).get(2).substring(0,8) %></TD>
			</TR>
			<%  }   %>
		
			</TABLE>
			</form>
			
		</div>
    </body>
</html>