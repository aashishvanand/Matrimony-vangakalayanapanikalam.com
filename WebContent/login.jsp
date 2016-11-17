<%@ page language="java" 
contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" 
import="java.sql.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Vanga Kalayana Panikalam.com</title>
<style>
table, th, td {
    border: 1px solid white;
    border-collapse: collapse;
    margin:25px;
    text-align: center;
    }
.fixed-bg {
    background-image: url("1.gif");
    background-attachment: fixed;
	min-height:100%;
    background-position: center fixed;
    background-repeat: no-repeat;
    background-size: cover;
    height:640px
	}

center
{
color:white;
font-family:"Akbar Plain";
}	

ul li
{
float:left;
margin-left:110px;
margin-top:100px;
font-size:1.3em;
color:white;
}

ul li:hover
{
text-shadow:10px 10px 10px black;
font-size:2em;
}

a
{
text-decoration:none;
color:white;
font-family:"Akbar Plain";
}

label
{
color:white;
}

#f1 {
	width:auto;
	margin:25px;
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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<label>
<%
Connection conn = null;
PreparedStatement ps = null;
PreparedStatement ps1 = null;
ResultSet rs = null; 
ResultSet rs1 = null; 
String check;
String check1;
String check2;
%>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/matrimony";

conn = DriverManager.getConnection(URL, "root","password");
ps = conn.prepareStatement("select * from matdata where phone = ? and password=?");
String phone = request.getParameter("phone");
String password = request.getParameter("password");
ps.setString(1, phone);
ps.setString(2, password);
rs = ps.executeQuery();
if(rs.next())
{
%>	
<div id= "f1">
<h3><center>Your Info</center></h3> 
</div>
<hr width=96%>");
<div id= "f1">
<center>
	<%
 out.println("<table>");
	out.println("<tr>");
	out.println("<th>Name</th>");
	out.println("<th>Sex</th>");
	out.println("<th>DOB</th>");
	out.println("<th>Religion</th>");
	out.println("<th>Country</th>");
	out.println("<th>Qualification</th>");
	out.println("<th>Phone</th>");
	out.println("<th>Mail</th>");
	out.println("<th>Star/Rasi</th>");
	out.println("</tr>");
	out.println("<tr>");
	out.println("<td>");
 out.println(rs.getString(1) + " " + rs.getString(2));
 out.println("</td>");
 out.println("<td>");
 out.println(rs.getString(3));
 check=rs.getString(3);
 session.setAttribute("a", check);
 out.println("</td>");
 out.println("<td>");
 out.println(rs.getString(4) + ("-") + rs.getString(5)+ ("-") + rs.getString(6));
 out.println("</td>");
 out.println("<td>");
 out.println(rs.getString(7));
 check1=rs.getString(7);
 session.setAttribute("b", check1);
 out.println("</td>");
 out.println("<td>");
 out.println(rs.getString(8));
 out.println("</td>");
 out.println("<td>");
 out.println(rs.getString(9));
 out.println("</td>");
 out.println("<td>");
 out.println(rs.getString(10));
 out.println("</td>");
 out.println("<td>");
 out.println(rs.getString(11));
 out.println("</td>");
 out.println("<td>");
 out.println(rs.getString(13));
 check2=rs.getString(13);
 session.setAttribute("c", check2);
 out.println("</td>");
 out.println("</tr>");
  out.println("</table>");
}
  %>
  </center>
  </div>
<hr width=96%> 
<center>
<b>
<div id= "f1">
<form action="getdetails.jsp" id="form" method="get" id="form">
Filter By:<br>
<select name="religion">
    <option value="HINDU">Hindu</option>
    <option value="MUSLIM">Muslim</option>
    <option value="CHRISTIAN">Christian</option>
    <option value="No">No Trust in Religion</option>
	<option value="Inter">Inter Religion</option>
  </select>
  
  <input list="qualification" name="qualification">
  <datalist id="qualification">
    <option value="B.E">
    <option value="M.E">
    <option value="M.B.A">
    <option value="Viscomm">
    <option value="M.Comm">
	<option value="B.Comm">
	<option value="B.Ed">
  </datalist>
  
  <input list="country" name="country">
  <datalist id="country">
    <option value="India">
    <option value="United States of America">
    <option value="Sri Lanka">
    <option value="United Kingdom">
    <option value="Singapore">
  </datalist>
  
<input type="submit" value="Find Your Match" />
</form>
</div>
</b>
</center> 
 <%
rs.close();
ps.close();
conn.close(); 
}
catch(Exception e)
{
out.println(e);
} 
%>
</label>
</div>
</body>
</html>