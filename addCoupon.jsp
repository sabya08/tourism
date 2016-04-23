<%@include file="header2.jsp" %>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="themes/1/js-image-slider.js" type="text/javascript"></script>
 
<link href="css/generic.css" rel="stylesheet" type="text/css" />
<%
String success="";
try{
	
		success = request.getParameter("success").toString();
		if (success == null){
			//session.setAttribute("cartItems","0");
			//cartItems = "0";
		}
	}
	catch(Exception e){
		//cartItems = "0";
	}
%>
<br>

				</td>
		<td>
				<div id="container">
				<div id="wrapper">
				<div id="sliderFrame">
        <form action="AddCoupon" method="get" name="loginForm" >
            <fieldset align="center">
                <legend>Add Coupon</legend>
                <div>
					<div class="small">Coupon Code : </div>
                    <input type="text" name="couponCode" style="text-transform:uppercase" placeholder="Enter Coupon Code"/>
                </div>
                <div>
					<div class="small">Discount : </div>
                    <input type="number" name="discount" placeholder="Discount"/>
                </div>
                
                <input type="submit" value="Submit">
                <h4 style="color:blue"><%=success%></h4>
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
				</td>
				
			</tr>
			</table>
			
	</div>
<% 
session.setAttribute("success","");
%>
</body>
</html>