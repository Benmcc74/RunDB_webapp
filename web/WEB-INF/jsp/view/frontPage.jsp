<%@ page session="false" %>
<%
	String envir = (String)request.getAttribute("env");
%>
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
        	<h2>Runs Database WEB APP</h2>
        	<div id="welcome" class="welcome">
        	The Web Application version of the Run Database
        	<br/><br/><br/>
        	Version: <c:choose>
        				<c:when test="${fn:contains(env,'_TEST')}">
        					TEST 
        				</c:when>
        				<c:otherwise>
        					PRODUCTION
        				</c:otherwise>
        			</c:choose> 
			<!-- The EL above replaces the following Java -->
        	<%-- if(envir.contains("_TEST")) { --%><%-- } else { --%><%-- } --%> 
        	</div>
		</div>
    </body>
</html>
