<%@ page language="java" 
contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" 
import="java.sql.*"
import="org.apache.commons.fileupload.*"
import="java.util.*"
import="java.io.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title> Vanga Kalayana Panikalam.com</title>
<style> 
.fixed-bg {
    background-image: url("1.gif");
    background-attachment: fixed;
	height:624px;	
    background-position: center fixed;
    background-repeat: no-repeat;
    background-size:cover;
	}
	
	.hometext {
    position:absolute;
	left:50px;
	top:200px;
    width:60%;
	height:auto;
	color:white;
	font-size:3.5em;
	text-shadow:10px 10px 10px black;
	font-family:"I Love What You Do!!..";
    
}
ul li
{
float:left;
margin-left:110px;
margin-top:100px;
font-size:1.3em;
color:white;
}

a
{
text-decoration:none;
color:white;
font-family:"Akbar Plain";
}

ul li:hover
{
text-shadow:10px 10px 10px black;
font-size:2em;
}
.center 
{
margin:auto;
	position:absolute;
left:500px;
top:250px;
    width:22%;
	border:3px black ridge;
	box-shadow:10px 10px 10px white;
	font-family:"Akbar Plain";
	color:white;
	text-shadow:10px 10px 10px orange;
	height:auto;
	background:#000000;
	opacity:0.7;
    }
</style>
</head>
<body>
<div class="fixed-bg">

<b><ul type="none">
<li><a href="Home.html">HOME</a></li>
<li><a href="Signup.html">SIGN UP</a></li>
<li><a href="Reachus.html">REACH US!</a></li>
<li><a href="Aboutus.html">ABOUT US!</a></li>
<li><a href="Reviews.html">REVIEWS</a></li>
</ul></b>
<div class="center">

<%
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null; 
%>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/matrimony";

conn = DriverManager.getConnection(URL, "root", "password");

ps = conn.prepareStatement("insert into matdata values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
String firstname = request.getParameter("firstname");
out.println("WELCOME " + firstname);
String lastname = request.getParameter("lastname");
out.println("  " + lastname);
String sex = request.getParameter("sex");
String date = request.getParameter("date");
String month = request.getParameter("month");
String year = request.getParameter("year");
String religion = request.getParameter("religion");
String country = request.getParameter("country"); 
String qualification = request.getParameter("qualification");
String star = request.getParameter("star");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String password = request.getParameter("password");
ps.setString(1, firstname);
ps.setString(2, lastname);
ps.setString(3, sex);
ps.setString(4, date);
ps.setString(5, month);
ps.setString(6, year);
ps.setString(7, religion);
ps.setString(8, country);
ps.setString(9, qualification);
ps.setString(10, phone);
ps.setString(11, email);
ps.setString(12, password);
ps.setString(13, star);
ps.executeUpdate();
out.println("<center><h3>Your Details Added to our Database</h3></center>");
ps.close();
conn.close(); 
}
catch(Exception e)
{
out.println(e);
} 
%>
</div>
</div>
</body>
</html>