<%@ page session="false" import="java.util.ArrayList"  %>
<%--@elvariable id="lifeRec" type="com.runDbWeb.business.LifetimeRecord"--%>
<%--@elvariable id="lifeRecs" type="java.util.ArrayList"--%>
<%--@elvariable id="lifeRuns" type="java.util.ArrayList"--%>
<!-- The EL above replaces the following Java -->
<%--
	LifetimeRecord lrec = (LifetimeRecord)request.getAttribute("lifeRec");
	ArrayList<ArrayList<String>> lifeRuns = (ArrayList<ArrayList<String>>)request.getAttribute("lifeRuns");
	ArrayList<ArrayList<String>> lifeRecs = (ArrayList<ArrayList<String>>)request.getAttribute("lifeRecs");
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Running Stuff</title>
    </head>
    <body>
    	<c:import url="sideMenu.jsp" />
		<!-- The EL above replaces the following Java -->
    	<%-- include file="sideMenu.jsp" --%>
   		<div id="main" class="main">
        	<h2>Runs Database WEB APP </h2>
			<br/>
			<h3>THE LIFETIME DETAIL</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h4>VIEW THE LIFETIME DATA</h4>
			TOTAL RUNS:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${lifeRec.getTotalRuns()}" />
			<!-- The EL above replaces the following Java -->
			<%-- lrec.getTotalRuns() --%>
			<br/><br/>
			TOTAL MILES:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${lifeRec.getTotalMiles()}" />
			<!-- The EL above replaces the following Java -->
			<%-- lrec.getTotalMiles() --%>
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
			<c:forEach var="rec" begin="0" end="${fn:length(lifeRecs)}"> 
			<!-- The EL above replaces the following Java -->
			<%-- for(int rec = 0; rec <lifeRecs.size(); rec++) {    --%>
			<TR>
			<TD style="text-align: center;"><c:out value="${lifeRecs[rec][0]}"/></TD>
			<TD style="text-align: left;"><c:out value="${lifeRecs[rec][7]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRecs[rec][8]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRecs[rec][5]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRecs[rec][1]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRecs[rec][2]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRecs[rec][3]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRecs[rec][4]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRecs[rec][6]}"/></TD>
			<!-- The EL above replaces the following Java -->
			<%-- lifeRecs.get(rec).get(0) --%>
			</TR>
			</c:forEach>
			<!-- The EL above replaces the following Java -->
			<%--  }   --%>
		
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
			<c:forEach var="row" begin="0" end="${fn:length(lifeRuns)-1}"> 
			<!-- The EL above replaces the following Java -->
			<%-- for(int row = 0; row <lifeRuns.size(); row++) {    --%>
			<TR>
			<TD style="text-align: center;"><c:out value="${lifeRuns[row][5]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRuns[row][0]}"/></TD>
			<TD style="text-align: left;"><c:out value="${lifeRuns[row][3]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRuns[row][1]}"/></TD>
			<TD style="text-align: center;"><c:out value="${lifeRuns[row][4]}"/></TD>
			<TD style="text-align: center;"><c:out value="${fn:substring(lifeRuns[row][2],0,8)}" /></TD>
			<!-- The EL above replaces the following Java -->
			<%-- lifeRuns.get(row).get(5) --%>
			</TR>
			</c:forEach>
			<!-- The EL above replaces the following Java -->
			<%--  }   --%>
		
		
			</TABLE>
		</div>
    </body>
</html>