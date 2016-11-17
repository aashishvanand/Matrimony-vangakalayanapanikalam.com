<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	</style>
<title>Insert title here</title>
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
<br>
<br>


<%
Connection conn = null;
PreparedStatement ps1 = null;
ResultSet rs1 = null; 
String check;
String star=(String) session.getAttribute("c");
%>

<%
try
{

	String religion = request.getParameter("religion");
	String country = request.getParameter("country");
	String qualification = request.getParameter("qualification");
	
		
Class.forName("com.mysql.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/matrimony";

conn = DriverManager.getConnection(URL, "root", "password");
 if(session.getAttribute("a").equals("M"))
 {
				
	 out.println("<center>Your Female Matches From Our Database.</center>");
		if((!religion.equals("")) && (!country.equals("")) && (!qualification.equals("")) )
		 {
			
			out.println("<hr>");
  			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from female where religion = ? and country = ? and qualification = ? and boy_star= ? ");
			ps1.setString(1, religion);
			ps1.setString(2, country);
			ps1.setString(3, qualification);
			ps1.setString(4, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if((!religion.equals("")) && (!country.equals("")))
		 {
			
			out.println("<hr>");
 			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from female where religion = ? and country = ? and boy_star= ?");
			ps1.setString(1, religion);
			ps1.setString(2, country);
			ps1.setString(3, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if((!qualification.equals("")) && (!country.equals("")))
		 {
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from female where qualification = ? and country = ? and boy_star= ?");
			ps1.setString(1, qualification);
			ps1.setString(2, country);
			ps1.setString(3, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if((!religion.equals("")) && (!qualification.equals("")))
		 {
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from female where religion = ? and qualification = ? and boy_star= ?");
			ps1.setString(1, religion);
			ps1.setString(2, qualification);
			ps1.setString(3, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if(!religion.equals(""))
		 {
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from female where religion = ? and boy_star= ?");
			ps1.setString(1, religion);
			ps1.setString(2, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if(!qualification.equals(""))
		 {
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from female where qualification = ? and boy_star= ?");
			ps1.setString(1, qualification);
			ps1.setString(2, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if(!country.equals(""))
		 {
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from female where country = ? and boy_star= ?");
			ps1.setString(1, country);
			ps1.setString(2, star);
			rs1 = ps1.executeQuery();
		 }
		
		else
		{
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from female and boy_star= ?");
			ps1.setString(1, star);
			rs1 = ps1.executeQuery();
		}
		 
	 %>
	 
	 <div id= "f1">
	 <%
	 	out.println("<table>");
		out.println("<tr>");
		out.println("<th>Name</th>");
		out.println("<th>DOB</th>");
		out.println("<th>Religion</th>");
		out.println("<th>Country</th>");
		out.println("<th>Qualification</th>");
		out.println("<th>Phone</th>");
		out.println("<th>Mail</th>");
		out.println("<th>Star/Rasi</th>");
		out.println("</tr>");
	 while(rs1.next())
	 {
		 
		out.println("<tr>");
		out.println("<td>");
		out.println(rs1.getString(1) + " " + rs1.getString(2));
		out.println("</td>");
		out.println("<td>");
		out.println(rs1.getString(3) + ("-") + rs1.getString(4)+ ("-") + rs1.getString(5));
		out.println("</td>");
		out.println("<td>");
		out.println(rs1.getString(6));
		out.println("</td>");
		out.println("<td>");
		out.println(rs1.getString(7));
		out.println("</td>");
		out.println("<td>");
		out.println(rs1.getString(8));
		out.println("</td>");
		out.println("<td>");
		out.println(rs1.getString(9));
		out.println("</td>");
		out.println("<td>");
		out.println(rs1.getString(10));
		out.println("</td>");
		out.println("<td>");
		out.println(rs1.getString(11));
		out.println("</td>");
		
		out.println("</tr>");
		 	
	 }
	 out.println("</table>");
 }
	 %>
	 </div>
	 <%
	 if(session.getAttribute("a").equals("F"))
	 {
		 out.println("<center>Your Male Matches From Our Database.<center>");
		 if((!religion.equals("")) && (!country.equals("")) && (!qualification.equals("")) )
		 {
			
			out.println("<hr>");
  			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from male where religion = ? and country = ? and qualification = ? and girl_star= ? ");
			ps1.setString(1, religion);
			ps1.setString(2, country);
			ps1.setString(3, qualification);
			ps1.setString(4, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if((!religion.equals("")) && (!country.equals("")))
		 {
			
			out.println("<hr>");
 			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from male where religion = ? and country = ? and girl_star= ?");
			ps1.setString(1, religion);
			ps1.setString(2, country);
			ps1.setString(3, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if((!qualification.equals("")) && (!country.equals("")))
		 {
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email from male where qualification = ? and country = ? and girl_star= ?");
			ps1.setString(1, qualification);
			ps1.setString(2, country);
			ps1.setString(3, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if((!religion.equals("")) && (!qualification.equals("")))
		 {
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from male where religion = ? and qualification = ? and girl_star= ?");
			ps1.setString(1, religion);
			ps1.setString(2, qualification);
			ps1.setString(2, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if(!religion.equals(""))
		 
		{
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from male where religion = ? and girl_star= ?");
			ps1.setString(1, religion);
			ps1.setString(2, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if(!qualification.equals(""))
		 {
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from male where qualification = ? and girl_star= ?");
			ps1.setString(1, qualification);
			ps1.setString(2, star);
			rs1 = ps1.executeQuery();
		 }
		
		else if(!country.equals(""))
		 {
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from male where country = ? and girl_star= ?");
			ps1.setString(1, country);
			ps1.setString(2, star);
			rs1 = ps1.executeQuery();
		 }
		
		else
		{
			
			out.println("<hr>");
			ps1 = conn.prepareStatement("select firstname,lastname,day,month,year,religion,country,qualification,phone,email,star from male and girl_star= ?");
			ps1.setString(1, star);
			rs1 = ps1.executeQuery();
		}
		 %>
		 <div id= "f1">
		 <%
		 	out.println("<table>");
			out.println("<tr>");
			out.println("<th>Name</th>");
			out.println("<th>DOB</th>");
			out.println("<th>Religion</th>");
			out.println("<th>Country</th>");
			out.println("<th>Qualification</th>");
			out.println("<th>Phone</th>");
			out.println("<th>Mail</th>");
			out.println("<th>Star/Rasi</th>");
			out.println("</tr>");
		 while(rs1.next())
		 {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs1.getString(1) + " " + rs1.getString(2));
			out.println("</td>");
			out.println("<td>");
			out.println(rs1.getString(3) + ("-") + rs1.getString(4)+ ("-") + rs1.getString(5));
			out.println("</td>");
			out.println("<td>");
			out.println(rs1.getString(6));
			out.println("</td>");
			out.println("<td>");
			out.println(rs1.getString(7));
			out.println("</td>");
			out.println("<td>");
			out.println(rs1.getString(8));
			out.println("</td>");
			out.println("<td>");
			out.println(rs1.getString(9));
			out.println("</td>");
			out.println("<td>");
			out.println(rs1.getString(10));
			out.println("</td>");
			out.println("<td>");
			out.println(rs1.getString(11));
			out.println("</td>");
			out.println("</tr>");
			 	
		 }
		 out.println("</table>");
	 }
%>
 </div>
 <%
rs1.close();
ps1.close();
 }
catch(Exception e)
{
out.println(e);
}
%>
</div>
</body>
</html>