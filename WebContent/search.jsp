<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style> 
.fixed-bg {
    background-image: url("1.gif");
    background-attachment: fixed;
	min-height:100%;
    background-position: center fixed;
    background-repeat: no-repeat;
    background-size: cover;

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

</style>
<script>
function showmar(str)
{ var xmlhttp;    
if (str=="")
  {  document.getElementById("txtHint").innerHTML="";
  return;  }
if (window.XMLHttpRequest)
{// code for IE7+, Firefox, Chrome, Opera, Safari
xmlhttp=new XMLHttpRequest();  }
else
{// code for IE6, IE5
	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");   }
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState==4 && xmlhttp.status==200)
{document.getElementById("txtHint").innerHTML=xmlhttp.responseText;    }
}
xmlhttp.open("get","getdetails.jsp?q="+str,true);
xmlhttp.send();
}
  </script>
<title>Vanga Kalayana Panikalam.com</title>
</head>
<body>
<b><ul type="none">
<li><a href="Home.html">HOME</a></li>
<li><a href="Signup.html">SIGN UP</a></li>
<li><a href="Reachus.html">REACH US!</a></li>
<li><a href="#">ABOUT US!</a></li>
<li><a href="Reviews.html">REVIEWS</a></li>
</ul></b>
<div class="fixed-bg">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<script>
check()
{
	getElement.document.innertext
	
	}
</script>
<br>
<form action="" id="form"  >
<select name="religion" onchange="showmar(this.value)">
    <option value="HINDU">Hindu</option>
    <option value="MUSLIM">Muslim</option>
    <option value="CHRISTIAN">Christian</option>
    <option value="No">No Trust in Religion</option>
	<option value="Inter">Inter Religion</option>
  </select>
  
  
</form>


<div id="txtHint">information will be listed here..</div>


	 </div>

</body>
</html>