<%@page import="org.owasp.esapi.*"%>

<%
	User user = ESAPI.authenticator().getCurrentUser();
	Logger logger = Logger.getLogger("ESAPI Test Application", getClass().getName());
	if ( !user.isLoggedIn() ) {
%>
		<a href="controller">Login</a><br>
<%
	} else {
%>
		<b>Current User: <%=user.getAccountName() %></b><br>
		Last Successful Login: <%=user.getLastLoginTime() %><br>
		Last Failed Login: <%=user.getLastFailedLoginTime() %><br>
		Current Roles: <%=user.getRoles() %><br>
		Last Host Name: <%=user.getLastHostAddress() %><br>
		Current Cookie: <script>document.write(document.cookie)</script>
		<a href="controller?function=logout">Logout</a><br>
<%
	}
%>
<HR>
<%
	String message = (String)request.getAttribute("message");
	if ( message != null )  {
%>
<h3><%=message %></h3><HR>
<%
	}
%>
