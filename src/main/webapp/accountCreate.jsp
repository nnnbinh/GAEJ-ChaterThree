<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Telesales Demo (Google App Engine for Java)</title></head>
	<link rel="stylesheet" type="text/css" href="/stylesheets/styles.css"/>
<body>
	<span class="nav"><a href="index.html">Back</a></span><p/> 
 	<span class="title">Create a New Account</span> 
 	<p/> 
 	<form method="get" action="telesales"> 
 	<input type="hidden" name="action" value="accountCreateDo"/> 
 	<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC"> 
	 	<tr bgcolor="#407BA8"> 
		 	<td style="color: #ffffff; font-weight: bold;">Name</td> 
		 	<td bgcolor="#ffffff"><input type="input" name="name"></td> 
	 	</tr> 
		 <tr bgcolor="#407BA8"> 
			 <td style="color: #ffffff; font-weight: bold;">City</td> 
			 <td bgcolor="#ffffff"><input type="input" 
			name="billingCity"></td> 
		 </tr> 
		 <tr bgcolor="#407BA8"> 
			 <td style="color: #ffffff; font-weight: 
			bold;">State</td> 
			 <td bgcolor="#ffffff"><input type="input" 
			name="billingState"></td> 
		 </tr> 
		 <tr bgcolor="#407BA8"> 
			 <td style="color: #ffffff; font-weight: 
			bold;">Phone</td> 
			 <td bgcolor="#ffffff"><input type="input" 
			name="phone"></td> 
		 </tr> 
		 <tr bgcolor="#407BA8"> 
		 	<td style="color: #ffffff; font-weight: 
			bold;">Website</td>
			<td bgcolor="#ffffff"><input type="input" 
			name="website"></td> 
	 	</tr> 
	 	<tr> 
	 		<td colspan="2" bgcolor="#ffffff" align="center"><input 
			type="submit" value="Submit"></td> 
	 	</tr> 
 	</table> 
 </form>
	
</body>
</html>