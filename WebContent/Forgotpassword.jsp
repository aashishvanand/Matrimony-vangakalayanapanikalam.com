<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    import="java.io.*"
    import="java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vanga Kalayana Panikalam.com</title>
<style> 
.fixed-bg {
    background-image: url("1.gif");
    background-attachment: fixed;
	min-height:100%;
    background-position: center fixed;
    background-repeat: no-repeat;
    background-size: cover;
    height:624px;

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
#log{
  height:20px;
	width:60px;
	background-color:#FF5722;
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
<div class="center">
<%
Connection conn = null;
PreparedStatement ps = null;
PreparedStatement ps1 = null;
ResultSet rs = null; 
ResultSet rs1 = null; 
String password;
try
{
Class.forName("com.mysql.jdbc.Driver");
String URL = "jdbc:mysql://localhost:3306/matrimony";
conn = DriverManager.getConnection(URL, "root", "password");
ps = conn.prepareStatement("select password from matdata where phone = ?");
String phone = request.getParameter("phone");
ps.setString(1, phone);
rs = ps.executeQuery();
if(rs.next())
{
	
	password=rs.getString(1);
	URL u = new URL("http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?username=bhuvangates&password=reccseit&sendername=bhuvan");
	URLConnection uc = u.openConnection();
	uc.setDoOutput(true);
	uc.setRequestProperty("Content-Type","application/x-www-form-urlencoded");

	String query = "&mobileno=91" + phone + "&message=Your password is " + password;
	PrintWriter pw = new PrintWriter(uc.getOutputStream());
	pw.println(query);
	pw.close();

		BufferedReader in = new BufferedReader(
	new InputStreamReader(uc.getInputStream()));
	String res = in.readLine();
	out.println(res);
	in.close();
	

}
rs.close();
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