<%@ page session="false" %>
<head>
	<style>
    	<%@ include file="css/runWebApp.css" %>
	</style>
</head>
<body>
	<div id="mySidenav" class="sidenav">
		<TABLE style="width:100%" id="menuTable">
			<TR><TD><a href="<c:url value="/runs"> <c:param name="action" value="front" /> </c:url>">Home</a></TD></TR>
			<TR><TD id="sideBuff" class="sideBuff"></TD></TR>
			<TR><TD><a href="<c:url value="/runs"> <c:param name="action" value="addRun" /> </c:url>">Add a Run</a></TD></TR>
			<TR><TD><a href="<c:url value="/runs"> <c:param name="action" value="updateRun" /> </c:url>">Update a Run</a></TD></TR>
			<TR><TD><a href="<c:url value="/runs"> <c:param name="action" value="deleteRun" /> </c:url>">Delete a Run</a></TD></TR>
			<TR><TD id="sideBuff" class="sideBuff"></TD></TR>
			<TR><TD><a href="<c:url value="/runs"> <c:param name="action" value="addCourse" /> </c:url>">Add a Course</a></TD></TR>
			<TR><TD><a href="<c:url value="/runs"> <c:param name="action" value="updateCourse" /> </c:url>">Update a Course</a></TD></TR>
			<TR><TD><a href="<c:url value="/runs"> <c:param name="action" value="deleteCourse" /> </c:url>">Delete a Course</a></TD></TR>
			<TR><TD id="sideBuff" class="sideBuff"></TD></TR>
			<TR><TD><a href="<c:url value="/runs"> <c:param name="action" value="annualDetail" /> </c:url>">Annual Records</a></TD></TR>
			<TR><TD><a href="<c:url value="/runs"> <c:param name="action" value="lifeDetail" /> </c:url>">Lifetime Records</a></TD></TR>
		</TABLE>
	</div>
</body>