<%@ page session="false" import="java.util.ArrayList" %>
<%--Add request attributes as @elvariable - not necessary for processing but tells IDE type 
	Request attributes (e.g. crseList) defined as @elvariable for use in Expression Language 
	Request attributes also defined as object for use in Java --%>
<%--@elvariable id="lrec" type="com.runDbWeb.business.LifetimeRecord"--%>
<%--@elvariable id="lifeRuns" type="java.util.ArrayList"--%>
<%--@elvariable id="crseList" type="java.util.ArrayList"--%>
<!-- The EL above replaces the following Java -->
<%--
	LifetimeRecord lrec = (LifetimeRecord)request.getAttribute("lifeRec");
	ArrayList<ArrayList<String>> lifeRuns = (ArrayList<ArrayList<String>>)request.getAttribute("lifeRuns");
	ArrayList<ArrayList<String>> crseList = (ArrayList<ArrayList<String>>)request.getAttribute("crseList");
--%>
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
						runDate = document.getElementById("updateTable").rows[i + 1].cells.namedItem("tabDate").innerHTML;
						runTime = document.getElementById("updateTable").rows[i + 1].cells.namedItem("tabTime").innerHTML;
						runCrse = document.getElementById("updateTable").rows[i + 1].cells.namedItem("tabCourseId").innerHTML;
						runId = document.getElementById("updateTable").rows[i + 1].cells.namedItem("tabRunId").innerHTML;
						document.getElementById("year").value=runDate.substring(0,4);
		   		     	document.getElementById("month").value=runDate.substring(5,7);
		        		document.getElementById("day").value=runDate.substring(8,10);
		        		document.getElementById("hours").value=runTime.substring(1,2);
		        		document.getElementById("mins").value=runTime.substring(3,5);
		        		document.getElementById("secs").value=runTime.substring(6,8);
		        		document.getElementById("course").value=runCrse;
		        		document.getElementById("runId").value=runId;
		        		document.getElementById("year").removeAttribute('readonly');
		        		document.getElementById("month").removeAttribute('readonly');
		        		document.getElementById("day").removeAttribute('readonly');
		        		document.getElementById("hours").removeAttribute('readonly');
		        		document.getElementById("mins").removeAttribute('readonly');
		        		document.getElementById("secs").removeAttribute('readonly');
		        		document.getElementById("course").removeAttribute('readonly');
		        		break;
				} 
			}
		}
		
		</script>
    </head>
    <body>
    	<c:import url="sideMenu.jsp" />
		<!-- The EL above replaces the following Java -->
    	<%-- include file="sideMenu.jsp" --%>
    	<div id="main" class="main">
        	<h2>Runs Database WEB APP </h2>
			<br/>
			<h3>UPDATE A RUN</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
	    	<h4>UPDATE AN EXISTING RUN</h4>
			<h5>DATE</h5> 
			Day: <input type="number" name="day" id="day" min="1" max="31" step="1" maxlength="2" size="3" required readonly>
			Month: <input type="number" name="month" id="month" min="1" max="12" step="1" maxlength="2" size="3" required readonly>
			Year: <input type="number" name="year" id = "year" min="2000" max="2050" step="1" maxlength="4" size="5" required readonly>
			<br/><br/>
			<h5>COURSE</h5>
			<select name="course" id ="course" required>
				<c:forEach var="crse" begin="0" end="${fn:length(crseList)}">
				<!-- The EL above replaces the following Java -->
				<%-- for(ArrayList<String> crse: crseList) { --%>
					<fmt:parseNumber var = "i" type="number" value="${crseList[crse][0]}"/>
					<option value="<c:out value="${i}"/>"> <c:out value="${crseList[crse][1]}"/></option>
					<!-- The EL above replaces the following Java -->
					<%-- crse.get(0) --%><%-- crse.get(1) --%>
				</c:forEach>
				<!-- The EL above replaces the following Java -->
				<%-- } --%>
			</select>
			<br/><br/>
			<h5>TIME</h5> 
			Hours:	<input type="number" name="hours" id="hours" min="0" max="5" step="1" maxlength="1" size="2" required readonly>
			Minutes: <input type="number" name="mins" id="mins" min="0" max="59" step="1" maxlength="2" size="3" required readonly>
			Seconds: <input type="number" name="secs" id="secs" min="0" max="59" step="1" maxlength="2" size="3" required readonly>
			<br/><br/>
			<br/><br/>
			<input type="hidden" name="runId" id="runId">
			<input type="submit" value="Update the Run details"> 
			<br/><br/>
			</div>
			<h4>COMPLETED RUNS</h4>
			<br/>			
			<TABLE id="updateTable">
			<TR>
			<TH style="text-align: center;" class="check"></TH>
			<TH style="text-align: center;" class="rid">RUN ID</TH>
			<TH style="text-align: center;" class="date">DATE</TH>
			<TH style="text-align: center;" class="course">COURSE</TH>
			<TH style="text-align: center;" class="cid">COURSE ID</TH>
			<TH style="text-align: center;" class="miles">MILEAGE</TH>
			<TH style="text-align: center;" class="time">TIME</TH>
			</TR>
			<c:forEach var="row" begin="0" end="${fn:length(lifeRuns)}"> 
			<!-- The EL above replaces the following Java -->
			<%-- for(int row = 0; row <lifeRuns.size(); row++) {    --%>
			<TR>
			<TD style="text-align: center;"><input type="radio" name="check" id="check" onclick="setFields(this)"></TD>
			<TD style="text-align: center;" class="tabRunId" id="tabRunId"><c:out value="${lifeRuns[row][5]}" /></TD>
			<TD style="text-align: center;" class="tabDate" id="tabDate"><c:out value="${lifeRuns[row][0]}" /></TD>
			<TD style="text-align: left;" class="tabCourse" id="tabCourse"><c:out value="${lifeRuns[row][3]}" /></TD>
			<TD style="text-align: center;" class="tabCourseId" id="tabCourseId"><c:out value="${lifeRuns[row][1]}" /></TD>
			<TD style="text-align: center;" class="tabMiles" id="tabMiles"><c:out value="${lifeRuns[row][4]}" /></TD>
			<TD style="text-align: center;" class="tabTime" id="tabTime"><c:out value="${fn:substring(lifeRuns[row][2],0,8)}" /></TD>
			<!-- The 6 EL lines above replaces the following Java (1 example)-->
			<%-- lifeRuns.get(row).get(5) --%>
			</TR>
			</c:forEach>
			<!-- The EL above replaces the following Java -->
			<%--  }   --%>
		
			</TABLE>
			</form>
			
		</div>
    </body>
</html>