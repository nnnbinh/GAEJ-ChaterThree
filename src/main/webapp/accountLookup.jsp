<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%> 
<%@ page import="geaj.chapterthree.entity.*"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>

<% 
 List<Entity> accounts = (List<Entity>)request.getAttribute("accounts"); 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Google App Engine Servlet Example with Bigtable</title> 
 	<link rel="stylesheet" type="text/css" href="/stylesheets/styles.css"/>
</head>
<body>
	<span class="title">Google App Engine Servlet Example with Bigtable</span> 
 	<p/> 
 	<p>Before creating a new Opportunity, ensure that the Account does not already exist. You can also <a href="telesales?action=accountCreate"/>create a new account</a>.</p> 
 	<p/> 
	 <form method="post" action="telesales"> 
		 <input type="hidden" name="action" value="accountLookup"/> 
		 <span class="heading">Search by Account Name:</span> 
		 <p/> 
		 <input type="text" 
		 		name="accountName" 
		 		value="<% if(request.getParameter("accountName") != null) { 
							out.println(request.getParameter("accountName")); } %>" style="width: 300px"/> 
		 &nbsp 
		 <input type="submit" value="Search"/> 
		 &nbsp 
	 </form> 
 	<p/> 
 	<% if (accounts.size() > 0) { %> 
 		<span class="heading"><%= accounts.size() %> accounts matching your search criteria:</span> 
 		<p/>
	 	<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC" width="50%"> 
	 	<tr bgcolor="#407BA8"> 
			<td style="color: #ffffff; font-weight: bold;">Name</td> 
			<td style="color: #ffffff; font-weight: bold;">City</td> 
			<td style="color: #ffffff; font-weight: bold;">State</td> 
	 		<td style="color: #ffffff; font-weight: bold;">Phone</td> 
	 	</tr> 
	 	<% for (int i = 0;i<accounts.size();i++) { %> 
	 		<% Entity a = (Entity)accounts.get(i); %> 
		 	<tr style="background:#ffffff" onMouseOver="this.style.background='#eeeeee';" onMouseOut="this.style.background='#ffffff';"> 
				<td><a href="telesales?action=accountDisplay&accountId=<%= a.getKey().getId() %>"><%= a.getProperty("name") %></a></td> 
				<td><%= a.getProperty("city") %></td> 
				<td><%= a.getProperty("state") %></td> 
				<td><%= a.getProperty("phone") %></td> 
			</tr> 
		<% } %> 
		</table> 
	<% } else { %> 
		<span class="heading">No matching accounts found.</span> 
	<% } %> 
	<p/>
</body>
</html>