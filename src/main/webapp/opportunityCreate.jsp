<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String accountName = (String)request.getAttribute("accountName"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Telesales Demo (Google App Engine for Java)</title> 
	<link rel="stylesheet" type="text/css" href="/stylesheets/styles.css"/>
</head>
<body>
	<span class="nav"><a href="telesales?action=accountDisplay&accountId=<%= request.getParameter("accountId") %>">Back</a></span><p/> 
	<span class="title">Create a New Opportunity</span> 
 	<p/> 
 	<form method="post" action="telesales?action=opportunityCreateDo&accountId=<%= request.getParameter("accountId") %>">
 		<input type="hidden" name="accountId" value="{{accountId}}"> 
		<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC"> 
			<tr bgcolor="#407BA8"> 
				<td style="color: #ffffff; font-weight: bold;">Account</td> 
				<td bgcolor="#ffffff"><%= accountName %></td> 
			</tr> 
			<tr bgcolor="#407BA8"> 
				<td style="color: #ffffff; font-weight: bold;">Name</td> 
				<td bgcolor="#ffffff"><input type="input" name="name" style="width:250px"></td> 
			</tr> 
			<tr bgcolor="#407BA8"> 
				<td style="color: #ffffff; font-weight: bold;">Amount</td> 
				<td bgcolor="#ffffff"><input type="input" name="amount" value="125.25"></td> 
			</tr> 
			<tr bgcolor="#407BA8"> 
				<td style="color: #ffffff; font-weight: bold;">Stage</td> 
				<td bgcolor="#ffffff"> 
					<select name="stageName"> 
						<option>Prospecting</option> 
						<option>Qualifications</option> 
						<option>Value Proposition</option> 
					</select> 
				</td> 
			</tr> 
			<tr bgcolor="#407BA8"> 
				<td style="color: #ffffff; font-weight: bold;">Probability</td> 
				<td bgcolor="#ffffff"> 
					<select name="probability"> 
						<option value="10">10%</option> 
						<option value="25">25%</option> 
						<option value="50">50%</option> 
						<option value="75">75%</option> 
					</select> 
				</td> 
			</tr> 
			<tr bgcolor="#407BA8">
				<td style="color: #ffffff; font-weight: bold;">Close Date</td> 
				<td bgcolor="#ffffff"><input type="input" name="closeDate" value="1/1/2012"></td> 
			</tr> 
			<tr bgcolor="#407BA8"> 
				<td style="color: #ffffff; font-weight: bold;">Order</td> 
				<td bgcolor="#ffffff"><input type="input" name="orderNumber" value="7"></td> 
			</tr> 
			<tr> 
				<td colspan="2" bgcolor="#ffffff" align="center">
					<input type="submit" value="Submit">
				</td> 
			</tr> 
		</table> 
	</form> 
 	There is no form validation so please fill in all fields.
</body>
</html>