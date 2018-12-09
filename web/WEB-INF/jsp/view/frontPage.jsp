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
   		<%@ include file="sideMenu.jsp" %>
    	<div id="main" class="main">
        	<h2>Runs Database WEB APP</h2>
        	<div id="welcome" class="welcome">
        	The Web Application version of the Run Database
        	<br/><br/><br/>
        	Version: <% if(envir.contains("_TEST")) { %> TEST <% } else { %> PRODUCTION <% } %> 
        	</div>
		</div>
    </body>
</html>
