<%@page import="java.util.Date" %>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.MongoException"%>
<%@page import="com.mongodb.WriteConcern"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.BasicDBList"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.ServerAddress"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="beans.*"%>
<%@page import="servlets.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.activation.*"%>

<html>
<TITLE>elexTore</TITLE>
<head>

<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="themes/1/js-image-slider.js" type="text/javascript"></script>
 <script type="text/javascript" src="javascript.js"></script>

<link href="css/generic.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.5-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.5-dist/css/bootstrap-theme.css">	
</head>


<body onload='init()'; background="images/mainpage/image2.jpg">
	<%
	int cartItems = 0;
	//HttpSession session=request.getSession();
	 List<Cart> list=null; 
	try{
	HttpSession s=request.getSession();
	list= (List<Cart>) session.getAttribute("list");
	String error=session.getAttribute("error").toString();
	
	cartItems=list.size();
	//cartItems = (Integer)s.getAttribute("cartCount");
		//if (cartItems == null){
		//	session.setAttribute("cartItems","0");
		//	cartItems = "0";
		//}
	}
	catch(Exception e){
		//cartItems = 0;
	}
	UserBean userBean=null;
	String userName="";
	String role="";
	try{
		userBean = (UserBean)session.getAttribute("userbean");

		if (userBean == null){
			userName = "Guest";
		}
		else{
			userName=userBean.getFirstName();
			role=userBean.getRole();
			
		}
	}
	catch(Exception e){
		//cartItems = 0;
	}


	%>

	<div id="container">
	
		<div class="header">
			<div class="headertop_desc">
			<div class="call">
				 <p><span>Need help?</span> call us <span class="number">1-22-3456789</span></span></p>
			</div>
			<div class="account_desc">
				<ul>
					
						<%if(userName.equals("Guest")){%>
						<li><a href="signup.jsp" class="acolor" style="color:#30A2DE" >Sign Up</a></li>
					<li><a href="signin.jsp" class="acolor" style="color:#30A2DE">Sign In</a></li>
					<%}%>

					<!-- <li><a href="/elextore/OrderPage.jsp" class="acolor" style="color:#30A2DE">Checkout</a></li> -->
					<%if(role.equals("storeManager")){
					%>
					<li><a href="storeManager.jsp" class="acolor" style="color:#30A2DE">Products</a></li>
				<%}%>
				<%if(role.equals("salesMan")){
					%>
					<li><a href="allOrders.jsp" class="acolor" style="color:#30A2DE">All Orders</a></li>
					<li><a href="addCoupon.jsp" class="acolor" style="color:#30A2DE">Add Coupon</a></li>
				<%}%>
				<%if(role.equals("customerSupport")){
					%>
					<li><a href="ticketview.jsp" class="acolor" style="color:#30A2DE">Tickets</a></li>
					
				<%}%>
					<li><a href="myOrders.jsp" class="acolor" style="color:#30A2DE">My Orders</a></li>
					<li><b><i><a style="color:#1F4255"  href="">Welcome <%= userName%></a></i></b></li>
					<%if(!(userName.equals("Guest"))){%>
					<li><a href="LogOutServlet" class="acolor" style="color:#30A2DE">Log Out</a></li>
					<%}%>
				</ul>
			</div>
			</div>
		<div class="header_top">
		<a href="index.jsp">
			<div class="logo">

			</div>
			</a>
			<div class="links">
			<ul></ul>
				
				<% if(cartItems==0) { %>
				
				<div class="cart" onclick="window.location ='cart.jsp';">
				
				<% } else { %>
				
				<div class="cart_full" onclick="window.location ='cart.jsp';">
				
				<% } %>
				
				</div>
				<p><%=cartItems%></p>
			
			</div>
		</div>
		</div>
		&nbsp

		<div class="navigatation">
			<ul>


			<div class="dropdown">
  			<button onclick="myFunction()" class="dropbtn">Shop by Categories</button>
  			<div id="myDropdown" class="dropdown-content">
		    <a href="Products.jsp?category=Appliances" class="products">APPLIANCES</a>
		    <a href="Products.jsp?category=TVHomeTheater" class="products">TV & HOME THEATER</a>
		    <a href="Products.jsp?category=ComputersTablets" class="products">COMPUTERS & TABLETS</a>
		    <a href="Products.jsp?category=CameraCamcorders" class="products">CAMERAS & CAMCORDERS</a>
		    <a href="Products.jsp?category=Audio" class="products">AUDIO</a>
  			</div>
	<script>
	function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
	}

// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
  	if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

function updateCartValue()
{
	var elem = document.getElementById("cartSize");
	elem.value = "My default value";
}

	</script>

</div>
				<li><a href="index.jsp">Home</a></li>
				

				<li><a href="aboutus.jsp">About Us</a></li>

				<li><a href="contactus.jsp">Contact Us</a></li>
				
</function>
</div>
				<div class="">
						<form name="autofillform" action="autocomplete">
                                                            <table border="0" cellpadding="5">
                                                                    <tbody>
                                                                      <tr>
                                                                        <td><strong>Search:</strong></td>
                                                                                    <td>
                                                                                        <input type="text"
                                                                                   size="40"
                                                                                   id="complete-field"
                                                                                               onkeyup="doCompletion()">
                                                                                    </td>
                                                                      </tr>
                                                                      <tr>
                                                                          <td id="auto-row" colspan="2">
                                                                            <table id="complete-table" class="popupBox" />
                                                                          </td>
                                                                      </tr>
                                                            </tbody>
                                                          </table>
                                                        </form>
						</div></div>

			</ul>




<div class="search" style="float:right">
			</div>
<div id="container">

		</div>

		<div>
		<div id="container">
		<TABLE BORDER="0" WIDTH="100%">
			<tr>
				<td ALIGN="LEFT" WIDTH="100%">
				
				<img src="images/mainpage/save25.jpg" style="width:410px; height:437px;"></img>
							
				</td>

				<td ALIGN="center" WIDTH="80%">
				<div id="sliderFrame">

				
					<div id="slider">
					<a href="images/mainpage/image1.jpg" target="_blank">
					<img src="images/mainpage/image1.jpg" alt="Welcome to elexTore.com" />
					</a>
					<img src="images/mainpage/image2.jpg" alt="" />
					<img src="images/mainpage/image3.jpg" alt="" />
					</div>


		</div>
		<br><br>
		</td>
		</tr>
		</TABLE>	
			
			
				</div>
				

</body>			
