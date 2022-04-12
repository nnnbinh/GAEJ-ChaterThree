<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.List"%> 
<%@ page import="java.text.SimpleDateFormat"%> 
<%@ page import="geaj.chapterthree.entity.*"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>


<% 
 Entity account = (Entity)request.getAttribute("account"); 
 List<Entity> opportunities = (List<Entity>)request.getAttribute("opportunities"); 
 SimpleDateFormat sdf = new SimpleDateFormat("M/d/yyyy"); 
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Telesales Demo (Google App Engine for Java)</title> 
 	<link rel="stylesheet" type="text/css" href="/stylesheets/styles.css"/>
</head>
<body>
	<span class="nav"><a href="/index.html">Search</a></span><p/> 
	<span class="title">Account Display</span> 
	<p/> 
	
	<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC"> 
		<tr bgcolor="#407BA8"> 
			<td style="color: #ffffff; font-weight: bold;">Name</td> 
			<td bgcolor="#ffffff"><%= account.getProperty("name") %></td> 
		</tr> 
		<tr bgcolor="#407BA8"> 
			<td style="color: #ffffff; font-weight: bold;">City</td> 
			<td bgcolor="#ffffff"><%= account.getProperty("city") %></td> 
		</tr> 
		<tr bgcolor="#407BA8"> 
			<td style="color: #ffffff; font-weight: bold;">State</td> 
			<td bgcolor="#ffffff"><%= account.getProperty("state") %></td> 
		</tr> 
		<tr bgcolor="#407BA8"> 
			<td style="color: #ffffff; font-weight: bold;">Phone</td> 
			<td bgcolor="#ffffff"><%= account.getProperty("phone") %></td> 
		</tr> 
		<tr bgcolor="#407BA8"> 
			<td style="color: #ffffff; font-weight: bold;">Website</td> 
			<td bgcolor="#ffffff"><%= account.getProperty("website") %></td> 
		</tr> 
	</table> 
	
	<br><a href="telesales?action=opportunityCreate&accountId=<%= account.getKey().getId() %>">Create a new Opportunity</a><p/> 
	
	<% if (opportunities.size() > 0) { %> 
		<p/><span class="heading">Opportunities for <%= account.getProperty("name") %></span><br><p/> 
		 
		<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC"> 
			<tr bgcolor="#407BA8">
				<td style="color: #ffffff; font-weight: bold;">Name</td> 
				<td style="color: #ffffff; font-weight: bold;">Amount</td> 
				<td style="color: #ffffff; font-weight: bold;">Stage</td> 
				<td style="color: #ffffff; font-weight: bold;">Probability</td> 
				<td style="color: #ffffff; font-weight: bold;">Close Date</td> 
				<td style="color: #ffffff; font-weight: bold;">Order</td> 
			</tr> 
		<% for (int i = 0;i<opportunities.size();i++) { %> 
			<% Entity o = (Entity)opportunities.get(i); %> 
			<tr style="background:#ffffff" onMouseOver="this.style.background='#eeeeee';" onMouseOut="this.style.background='#ffffff';"> 
				<td nowrap><%= o.getProperty("name") %></td> 
				<td>$<%= o.getProperty("amount") %></td> 
				<td><%= o.getProperty("stageName") %></td> 
				<td><%= o.getProperty("probability") %>%</td> 
				<td><%= sdf.format(o.getProperty("closeDate")) %></td> 
				<td><%= o.getProperty("orderNumber") %></td> 
			</tr> 
		<% } %> 
		</table> 
	<% } else { %> 
		<p/><span class="heading">No Opportunities found for <%= account.getProperty("name") %></span> 
	<% } %>
</body>
</html>