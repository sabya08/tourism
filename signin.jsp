<%@include file="Header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="themes/1/js-image-slider.js" type="text/javascript"></script>
 
<link href="css/generic.css" rel="stylesheet" type="text/css" />
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
        <form action="SignIn" method="get" name="loginForm" >
            <fieldset align="center">
                <legend>Login Form</legend>
                <div>
					<div class="small">User: </div>
                    <input type="text" name="email" placeholder="Enter Email address" required/>
                </div>
                <div>
					<div class="small">Password: </div>
                    <input type="password" name="password" placeholder="Password" required/>
                </div>
                
                <input type="submit" value="Sign In">
                <h4 style="color:red"><%=error%></h4>
                <div id="slider">
					<a href="images/mainpage/imagel1.jpg" target="_blank">
					<img src="images/mainpage/imagel1.jpg" alt="Welcome to elexTore.com" />
					</a>
					<img src="images/mainpage/imagel2.jpg" alt="" />
					<img src="images/mainpage/imagel3.jpg" alt="" />
					</div>
            </fieldset>    
        </form>
    </div>
				
			
	</div>
</div>
</body>
</html>