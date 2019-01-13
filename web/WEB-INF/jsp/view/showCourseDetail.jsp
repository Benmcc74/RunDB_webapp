<%@ page session="false" import="java.util.ArrayList"  %>
<%--Add request attributes as @elvariable - not necessary for processing but tells IDE type 
	Request attributes (e.g. crseList) defined as @elvariable for use in Expression Language 
	Request attributes also defined as object for use in Java --%>
<%--@elvariable id="cRec" type="com.runDbWeb.business.CourseRecord"--%>
<%--@elvariable id="selCrse" type="java.lang.Integer"--%>
<%--@elvariable id="crseList" type="java.util.ArrayList"--%>
<%--@elvariable id="crseRuns" type="java.util.ArrayList"--%>
<!-- The EL above replaces the following Java -->
<%--
	ArrayList<ArrayList<String>> crseList = (ArrayList<ArrayList<String>>)request.getAttribute("crseList");
	CourseRecord cRec = (CourseRecord)request.getAttribute("cRec");
	Integer selCrse = Integer.parseInt((String)request.getAttribute("selCrse"));
	
	ArrayList<ArrayList<String>> crseRuns = (ArrayList<ArrayList<String>>)request.getAttribute("crseRuns");

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
			<h3>THE COURSE DETAIL</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h4>VIEW THE DETAILS FROM A COURSE</h4>
			<h5>COURSE</h5>
			<select name="courses" onchange="this.form.submit()">
				<c:forEach var="crse" begin="0" end="${fn:length(crseList)}">
				<!-- The EL above replaces the following Java -->
				<%-- for(ArrayList<String> crse: crseList) { --%>
					<fmt:parseNumber var = "i" type="number" value="${crseList[crse][0]}"/>
					<option value="<c:out value="${crseList[crse][0]}" />" <c:if test="${i == selCrse}" > selected="selected" </c:if>><c:out value="${crseList[crse][1]}" /></option>
					<!-- The EL above replaces the following Java -->
					<%-- <%= crse.get(0) %> --%><%-- if(Integer.parseInt(crse.get(0)) == selCrse) { --%>
				</c:forEach>
				<!-- The EL above replaces the following Java -->
				<%-- } --%>
			</select>
			<br/><br/>
			<c:if test="${fn:length(crseRuns) > 0}">
			<!-- The EL above replaces the following Java -->
			<%-- if(crseRuns.size() > 0) { --%>
			TOTAL RUNS:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cRec.calcTotalRuns(selCrse)}"/>
			<!-- The EL above replaces the following Java -->
			<%-- cRec.calcTotalRuns(selCrse) --%> 
			<br/><br/>
			MILEAGE:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cRec.getCourseMileage(selCrse)}"/> 
			<!-- The EL above replaces the following Java -->
			<%-- cRec.getCourseMileage(selCrse) --%>
			<br/><br/>
			<br/><br/>
			BEST COURSE RECORD:
			<br/><br/>
			<c:out value="${cRec.calcCrseBestTime(selCrse)[0]}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${fn:substring(cRec.calcCrseBestTime(selCrse)[1],0,8)}" />
			<!-- The EL above replaces the following Java -->
			<%-- cRec.calcCrseBestTime(selCrse).get(0) --%>
			<%-- cRec.calcCrseBestTime(selCrse).get(1).substring(0,8) --%>
			<br/><br/>
			<br/><br/>
			<br/><br/>
			AVERAGE RUN TIME:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${fn:substring(cRec.calcCrseAvgTime(selCrse),0,8)}" /> 
			<!-- The EL above replaces the following Java -->
			<%-- cRec.calcCrseAvgTime(selCrse).substring(0,8) --%>
			<br/><br/>
			<br/><br/>
			<br/><br/>
			WORST COURSE RECORD:
			<br/><br/>
			<c:out value="${cRec.calcCrseWorstTime(selCrse)[0]}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${fn:substring(cRec.calcCrseWorstTime(selCrse)[1],0,8)}" />
			<!-- The EL above replaces the following Java -->
			<%-- cRec.calcCrseWorstTime(selCrse).get(0) --%>
			<%-- cRec.calcCrseWorstTime(selCrse).get(1).substring(0,8) --%>
			<br/><br/>
			</c:if>
			<c:if test="${fn:length(crseList) == 0}">
			<!-- The EL above replaces the following Java -->
			<%-- } else { --%>
			<br/><br/>
			No run data for the selected Course: <c:out value="${cRec.getCourseDesc(selCrse)}"/>
			<!-- The EL above replaces the following Java -->
			<%-- cRec.getCourseDesc(selCrse) --%>
			<br/><br/>
			</c:if>
			<!-- The EL above replaces the following Java -->
			<%-- } --%>
			
			</div>
			</form>	
			<br/>
			<h4>COMPLETED RUNS: <c:out value="${cRec.getCourseDesc(selCrse)}"/></h4>
			<!-- The EL above replaces the following Java -->
			<%-- out.println(cRec.getCourseDesc(selCrse)); --%>
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
			<c:forEach var="row" begin="0" end="${fn:length(crseRuns)-1}"> 
			<!-- The EL above replaces the following Java -->
			<%-- for(int row = 0; row < crseRuns.size(); row++) {    --%>
			<TR>
			<TD style="text-align: center;"><c:out value="${crseRuns[row][0]}" /></TD>
			<TD style="text-align: center;"><c:out value="${crseRuns[row][1]}" /></TD>
			<TD style="text-align: left;"><c:out value="${crseRuns[row][2]}" /></TD>
			<TD style="text-align: center;"><c:out value="${selCrse}" /></TD>
			<TD style="text-align: center;"><c:out value="${crseRuns[row][3]}" /></TD>
			<TD style="text-align: center;"><c:out value="${fn:substring(crseRuns[row][4],0,8)}" /></TD>
			<!-- The EL above replaces the following Java -->
			<%-- crseRuns.get(row).get(3) --%>
			</TR>
			</c:forEach>
			<!-- The EL above replaces the following Java -->
			<%--  }   --%>
		
			</TABLE>
			
			
		</div>
    </body>
</html>