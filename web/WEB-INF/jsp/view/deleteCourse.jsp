<%@ page session="false" import="java.util.ArrayList" %>
<%--Add request attributes as @elvariable - not necessary for processing but tells IDE type 
	Request attributes (e.g. crseList) defined as @elvariable for use in Expression Language 
	Request attributes also defined as object for use in Java --%>
<%--@elvariable id="crseList" type="java.util.ArrayList"--%>
<%--@elvariable id="delFailed" type="java.lang.Boolean"--%>
<%--@elvariable id="delCrseId" type="java.lang.Integer"--%>
<%--@elvariable id="delCrseDesc" type="java.lang.String"--%>
<!-- The EL above replaces the following Java -->
<%--
	ArrayList<ArrayList<String>> crseList = (ArrayList<ArrayList<String>>)request.getAttribute("crseList");
	Boolean delFailed = (Boolean)request.getAttribute("delFailed");
	Integer delCrseId = (Integer)request.getAttribute("delCrseId");
	String delCrseDesc = "";
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
						crseId = document.getElementById("crseUpdTable").rows[i + 1].cells.namedItem("tabCrseId").innerHTML;
						crseDesc = document.getElementById("crseUpdTable").rows[i + 1].cells.namedItem("tabCrseDesc").innerHTML;
						crseMiles = document.getElementById("crseUpdTable").rows[i + 1].cells.namedItem("tabCrseMiles").innerHTML;
						document.getElementById("crseId").value=crseId;
						document.getElementById("crseDesc").value=crseDesc;
						document.getElementById("crseMiles").value=crseMiles;
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
			<h3>DELETE A COURSE ${delCrseId}</h3>

			<!-- The EL above replaces the following Java -->
			<c:if test="${delFailed}">
				<c:forEach var="crse" begin="0" end="${fn:length(crseList)}">
					<fmt:parseNumber var = "i" type="number" value="${crseList[crse][0]}"/>
					<c:if test="${i == delCrseId}" >
						<c:set var="delCrseDesc" value="${crseList[crse][1]}"/>
					</c:if>
				</c:forEach> 
			<%-- if(delFailed) { 
				for(ArrayList<String> crse: crseList) { 
					if(Integer.parseInt(crse.get(0)) == delCrseId) {
						delCrseDesc = crse.get(1);					
					}
				}
			--%>
			The <c:out value="${delCrseDesc}" /> course cannot be deleted unless runs using it are deleted or updated first.<br/><br/>
			</c:if>
			<!-- The EL above replaces the following Java -->
			<%-- delCrseDesc --%>
			<%--} --%>			
			<br/><br/>
			<form method="post">
	    	<div id="entryPanel" class="entryPanel">
			<h4>DELETE SELECTED COURSE</h4> 
			<input type="hidden" name="crseId" id="crseId">
			Course: &nbsp; <input type="text" name="crseDesc" id="crseDesc" maxlength="50" size="40" required readonly>
			<br/><br/>
			Miles: &nbsp;&nbsp;&nbsp;&nbsp; <input type="number" name="crseMiles" id="crseMiles" min="0.01" max="500" step="0.01"  size="40" required readonly>
			<br/><br/>
			<input type="submit" value="Delete the Course"> 
			<br/><br/>
			</div>
			<h4>EXISTING COURSES</h4>
			<br/>			
			<TABLE id="crseUpdTable">
			<TR>
			<TH style="text-align: center;"></TH>
			<TH style="text-align: center;">ID</TH>
			<TH style="text-align: center;">COURSE</TH>
			<TH style="text-align: center;">MILEAGE</TH>
			</TR>
			<c:forEach var="row" begin="0" end="${fn:length(crseList)}"> 
			<!-- The EL above replaces the following Java -->
			<%-- for(int row = 0; row <crseList.size(); row++) {    --%>
			<TR>
			<TD style="text-align: center;"><input type="radio" name="check" id="check" onclick="setFields(this)"></TD>
			<TD style="text-align: center;" class="tabCrseId" id="tabCrseId"><c:out value="${crseList[row][0]}" /></TD>
			<TD style="text-align: left;" class="tabCrseDesc" id="tabCrseDesc"><c:out value="${crseList[row][1]}" /></TD>
			<TD style="text-align: center;" class="tabCrseMiles" id="tabCrseMiles"><c:out value="${crseList[row][2]}" /></TD>
			<!-- The 3 EL lines above replaces the following Java (1 example)-->
			<%--  crseList.get(row).get(0)  --%>
			</TR>
			</c:forEach>
			<!-- The EL above replaces the following Java -->
			<%--  }   --%>
			</TABLE>
			</form>
			
		</div>
    </body>
</html>