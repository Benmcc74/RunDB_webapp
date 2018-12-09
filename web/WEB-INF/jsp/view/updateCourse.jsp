<%@ page session="false" import="java.util.ArrayList" %>
<%
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
						crseId = document.getElementById("updCrseTable").rows[i + 1].cells.namedItem("tabCrseId").innerHTML;
						crseDesc = document.getElementById("updCrseTable").rows[i + 1].cells.namedItem("tabCrseDesc").innerHTML;
						crseMiles = document.getElementById("updCrseTable").rows[i + 1].cells.namedItem("tabCrseMiles").innerHTML;
						document.getElementById("crseId").value=crseId;
						document.getElementById("crseDesc").value=crseDesc;
						document.getElementById("crseMiles").value=crseMiles;
		        		document.getElementById("crseDesc").removeAttribute('readonly');
		        		document.getElementById("crseMiles").removeAttribute('readonly');
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
			<h3>UPDATE A COURSE</h3>
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h4>UPDATE SELECTED COURSE</h4> 
			<input type="hidden" name="crseId" id="crseId">
			Course: <input type="text" name="crseDesc" id="crseDesc" maxlength="50"  required readonly>
			Miles: <input type="number" name="crseMiles" id="crseMiles" min="0.01" max="500" step="0.01"  required readonly>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="Update the Course"> 
			<br/><br/>
			</div>
			<h4>EXISTING COURSES</h4>
			<br/>			
			<TABLE id="updCrseTable">
			<TR>
			<TH style="text-align: center;"></TH>
			<TH style="text-align: center;">ID</TH>
			<TH style="text-align: center;">COURSE</TH>
			<TH style="text-align: center;">MILEAGE</TH>
			</TR>
			<% for(int row = 0; row <crseList.size(); row++) {    %>
			<TR>
			<TD style="text-align: center;"><input type="radio" name="check" id="check" onclick="setFields(this)"></TD>
			<TD style="text-align: center;" class="tabCrseId" id="tabCrseId"><%= crseList.get(row).get(0) %></TD>
			<TD style="text-align: left;" class="tabCrseDesc" id="tabCrseDesc"><%= crseList.get(row).get(1) %></TD>
			<TD style="text-align: center;" class="tabCrseMiles" id="tabCrseMiles"><%= crseList.get(row).get(2) %></TD>
			</TR>
			<%  }   %>
		
			</TABLE>
			</form>
			
		</div>
    </body>
</html>