<%@ page session="false" import="java.util.ArrayList"  %>
<%--Add request attributes as @elvariable - not necessary for processing but tells IDE type 
	Request attributes (e.g. crseList) defined as @elvariable for use in Expression Language 
	Request attributes also defined as object for use in Java --%>
<%--@elvariable id="annRec" type="com.runDbWeb.business.AnnualRecord"--%>
<%--@elvariable id="selYear" type="java.lang.String"--%>
<%--@elvariable id="arecRecs" type="java.util.ArrayList"--%>
<%--@elvariable id="arecRuns" type="java.util.ArrayList"--%>
<%--@elvariable id="yearList" type="java.util.ArrayList"--%>
<!-- The EL above replaces the following Java -->
<%--
	AnnualRecord arec = (AnnualRecord)request.getAttribute("annRec");
	ArrayList<ArrayList<String>> annRuns = (ArrayList<ArrayList<String>>)request.getAttribute("arecRuns");
	ArrayList<ArrayList<String>> annRecs = (ArrayList<ArrayList<String>>)request.getAttribute("arecRecs");
	String selYear = (String)request.getAttribute("selYear");
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
			<h3>THE ANNUAL DETAIL</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h4>VIEW THE DETAILS FROM A YEAR</h4>
			<br/>
			YEAR:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="years" onchange="this.form.submit()">
				<c:forEach var="year" begin="0" end="${fn:length(yearList)-1}">
				<!-- The EL above replaces the following Java -->
				<%-- for(String year: arec.getYearList()) { --%>
					<option value="<c:out value="${yearList[year]}"/>" <c:if test="${yearList[year] == selYear}"> selected="selected" </c:if>><c:out value="${yearList[year]}"/></option>
					<!-- The EL above replaces the following Java -->
					<%-- year --%><%-- if(year.equals(selYear)) {--%><%-- }; --%>><%-- year --%>
				</c:forEach>
				<!-- The EL above replaces the following Java -->
				<%-- } --%>
			</select>
			<br/><br/>
			<br/><br/>
			TOTAL RUNS:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${annRec.getTotalRuns(selYear)}"/> 
			<!-- The EL above replaces the following Java -->
			<%-- arec.getTotalRuns(selYear) --%> 
			<br/><br/>
			TOTAL MILES:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${annRec.getTotalMiles(selYear)}"/>
			<!-- The EL above replaces the following Java -->
			<%-- arec.getTotalMiles(selYear) --%>
			<br/><br/>
			</div>
			</form>	
			<br/>
			<h4><c:out value="${selYear}"/> RECORDS</h4>
			<!-- The EL above replaces the following Java -->
			<%-- out.println(selYear); --%>
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
			<c:forEach var="rec" begin="0" end="${fn:length(arecRecs)}"> 
			<!-- The EL above replaces the following Java -->
			<%-- for(int rec = 0; rec <annRecs.size(); rec++) {    --%>
			<TR>
			<TD style="text-align: center;"><c:out value="${arecRecs[rec][0]}"/></TD>
			<TD style="text-align: left;"><c:out value="${arecRecs[rec][7]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRecs[rec][8]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRecs[rec][5]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRecs[rec][1]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRecs[rec][2]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRecs[rec][3]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRecs[rec][4]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRecs[rec][6]}"/></TD>
			<!-- The EL above replaces the following Java -->
			<%-- annRecs.get(rec).get(0) --%>
			</TR>
			</c:forEach>
			<!-- The EL above replaces the following Java -->
			<%--  }   --%>
		
			</TABLE>

			<br/>
			<h4>COMPLETED RUNS IN <c:out value="${selYear}"/></h4>
			<!-- The EL above replaces the following Java -->
			<%-- out.println(selYear); --%>
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
			<c:forEach var="row" begin="0" end="${fn:length(arecRuns)-1}"> 
			<!-- The EL above replaces the following Java -->
			<%-- for(int row = 0; row <annRuns.size(); row++) {    --%>
			<TR>
			<TD style="text-align: center;"><c:out value="${arecRuns[row][0]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRuns[row][1]}"/></TD>
			<TD style="text-align: left;"><c:out value="${arecRuns[row][4]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRuns[row][2]}"/></TD>
			<TD style="text-align: center;"><c:out value="${arecRuns[row][5]}"/></TD>
			<TD style="text-align: center;"><c:out value="${fn:substring(arecRuns[row][3],0,8)}" /></TD>
			<!-- The EL above replaces the following Java -->
			<%-- annRuns.get(row).get(0) --%>
			</TR>
			</c:forEach>
			<!-- The EL above replaces the following Java -->
			<%--  }   --%>
		
			</TABLE>
			
			
			</div>
		</div>
    </body>
</html>