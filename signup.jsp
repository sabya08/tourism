<%@include file="header2.jsp" %>

<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="mybean.*" %>
<%@page import="java.text.*" %>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="themes/1/js-image-slider.js" type="text/javascript"></script>
 <script type="text/javascript" src="JS/javascript.js"></script>

<link href="css/generic.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">


</script>
	<%
String error="";
try{
	
		error = session.getAttribute("error").toString();
		if (error == null){
			//session.setAttribute("cartItems","0");
			//cartItems = "0";
		}
	}
	catch(Exception e){
		//cartItems = "0";
	}
%>
	<br>
				<div id="container">
				<div id="wrapper">
				<div id="sliderFrame">


        <form action="SignUp" method="post" name="signupForm" onsubmit="return validateInfo()">

        <form action="SignUp" method="POST" name="signupForm" >

            <fieldset align="center">
                <legend>Register Form</legend>
                <div>
					<div class="small">First Name: </div>
                    <input type="text" name="fName" placeholder="First Name" required/>
                </div>
                <div>
					<div class="small">Last Name: </div>
                    <input type="text" name="lName" placeholder="Last Name " required/>
                </div>
                <div>
					<div class="small">Email: </div>
                    <input type="email" name="email" placeholder="Email" required/>
                </div>
                <div>
					<div class="small">Password: </div>
                    <input type="password" name="password" pattern=".{4,}"placeholder="Password" required/>
                </div>
                
                <div> 
                <input type="submit" name="button" value="Register" />
                <div id="slider">
					<a href="images/mainpage/image1.jpg" target="_blank">
					<img src="images/mainpage/images1.jpg" alt="Welcome to elexTore.com" />
					</a>
					<img src="images/mainpage/images2.jpg" alt="" />
					<img src="images/mainpage/images3.jpg" alt="" />
					</div>
            </fieldset>  

        </form>


		</div>
    </div>

    
				</td>
			
			</tr>
			
			</div>
	
	</div>
</body>
</html>
