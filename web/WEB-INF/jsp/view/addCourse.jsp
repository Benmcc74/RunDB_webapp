<%@ page session="false" import="java.util.ArrayList" %>
<<<<<<< HEAD

=======
<%--Add request attributes as @elvariable - not necessary for processing but tells IDE type 
	Request attributes (e.g. crseList) defined as @elvariable for use in Expression Language 
	Request attributes also defined as object for use in Java --%>
<%--@elvariable id="crseList" type="java.util.ArrayList"--%>
<!-- The EL above replaces the following Java -->
<%--
>>>>>>> develop
	ArrayList<ArrayList<String>> crseList = (ArrayList<ArrayList<String>>)request.getAttribute("crseList");
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
			<c:forEach var="row" begin="0" end="${fn:length(crseList)}"> 
			<!-- The EL above replaces the following Java -->
			<%-- for(int row = 0; row <crseList.size(); row++) { --%>
			<TR>
			<TD style="text-align: center;"><c:out value="${crseList[row][0]}" /></TD>
			<TD style="text-align: left;"><c:out value="${crseList[row][1]}" /></TD>
			<TD style="text-align: center;"><c:out value="${crseList[row][2]}" /></TD>
			<!-- The 3 EL lines above replaces the following Java (1 example)-->
			<%--  crseList.get(row).get(0)  --%>
			</TR>
			</c:forEach>
			<!-- The EL above replaces the following Java -->
			<%-- } --%>		
			</TABLE>
			
		</div>
    </body>
</html>