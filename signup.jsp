<%@include file="Header.jsp" %>
<%@include file="footer.jsp" %>

<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="tourism.*" %>
<%@page import="java.text.*" %>
<%--<link rel="stylesheet" type="text/css" href="css/style.css">--%>
<link rel="stylesheet" type="text/css" href="style.css">

 <script type="text/javascript" src="JS/javascript.js"></script>

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
        <%--<div id="container">--%>

        <form action="/tourism/SignUp" method="post" name="signupForm" onsubmit="return validateInfo()">

        <form action="/tourism/SignUp" method="POST" name="signupForm" >

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
                

                <input type="submit" name="button" value="Register" />

            </fieldset>

        </form>
    
        </td>
			
    </tr>
			
    </div>
	
	</div>
</body>
</html>
