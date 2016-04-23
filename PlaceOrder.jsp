<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@include file="header2.jsp"%>
<HTML>
<HEAD>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script>
$(function() {
    $( "#datepicker" ).datepicker();
});
</script>
<script type="text/javascript">

</script>
<%
 MongoClient mongo = new MongoClient("52.11.50.218", 27017);
Boolean isCouponExist=false;
int discount=0;
double total1=0;
int total=0;
String error="";
String isCouponApplied="false";
          

			DB db = mongo.getDB("Elextore");
			if(userBean==null)
			{
		request.getRequestDispatcher("/signin.jsp").forward(request, response);
	}
			DBCollection collection = db.getCollection("couponCodes");

            String couponCode=request.getParameter("couponCode");
//System.out.println("enterre@@@@@@@"+couponCode );
            System.out.println("first");
       try{
 HttpSession s=request.getSession();                        
            //total=(Integer)s.getAttribute("total");
            String tot=s.getAttribute("total").toString();
             total1=Double.parseDouble(tot);


System.out.println("asfasfasf@@@@@@@"+total+" "+total1 +" "+tot);
         if(couponCode!=null)
         {
         System.out.println("enter"+isCouponApplied);
			isCouponApplied=(String)s.getAttribute("isCouponApplied");
			System.out.println("######3 "+ isCouponApplied);
			if(isCouponApplied==null)
			{
				isCouponApplied="false";
			}
			
			if(isCouponApplied.equals("true"))
			{
				System.out.println("enterfffff");
				error="Coupon already applied !";
			}
			else
			{
System.out.println("enterfffff");
			
            //if(couponCode.equals("couponCode"))
           // {
            	System.out.println("enterre@@@@@@@");
			BasicDBObject whereQuery = new BasicDBObject();
			whereQuery.put("couponCode", couponCode);
			//BasicDBObject whereQuery1 = new BasicDBObject();
			DBCursor cursor = collection.find(whereQuery);
			while(cursor.hasNext()) {
				isCouponExist=true; 
				BasicDBObject obj = (BasicDBObject) cursor.next();	
				 String discount1= obj.get("discount").toString();
				 discount=Integer.parseInt(discount1);
				 System.out.println("enterre@@@@@@@" + discount+" "+ total1);
				}

				if(isCouponExist)
				{
					 total1=total1-((total1*discount)/100);
					 System.out.println("Final$$$$$" + total1);
					 s.setAttribute("isCouponApplied","true");
					s.setAttribute("total",total1);
				}
				else
				{
					error="Coupon doesnt exists";
				}
           // }
           }
           
        }
    }catch(Exception e)
    {}
        %>
    
</HEAD>
<BODY>
<H1 ALIGN="CENTER">Add your personal details for this order</H1>
<form action="PlaceOrder.jsp" method="get">
	<h3>Total Price =<%=total1%> </h3>
	<INPUT TYPE="TEXT" NAME="couponCode">
	<input type="submit" class="btn btn-success" value="Apply Code">
	<h4 style="color:red"><%=error%></h4>
</form>

<FORM NAME="userForm" ACTION="submitOrder.jsp"  METHOD="POST">
  <HR>
  <TABLE id="order_form">
  <%
  if(userName.equals("Guest") || userBean==null){
  %>

	<TR><TD>First Name:</TD><TD> <INPUT TYPE="TEXT" NAME="firstName" required></TD></TR>
	<TR><TD>Last Name:</TD><TD> <INPUT TYPE="TEXT" NAME="lastName"required></TD></TR>
	<TR><TD>Email Id:</TD><TD> <INPUT TYPE="email" NAME="email" required></TD></TR>
	<TR><TD>Shipping Address:</TD><TD><TEXTAREA TYPE="TEXT" NAME="address" ROWS='3' COLS='40' required></TEXTAREA></TD></TR>
	<%}
	else{
	
	%>
	
	<TR><TD>First Name:</TD><TD> <INPUT TYPE="TEXT" NAME="firstName" value=<%=userBean.getFirstName()%> ></TD></TR>
	<TR><TD>Last Name:</TD><TD> <INPUT TYPE="TEXT" NAME="lastName" value=<%=userBean.getLastName()%> ></TD></TR>
	<TR><TD>Email Id:</TD><TD> <INPUT TYPE="TEXT" NAME="email" value=<%=userBean.getEmail() %> ></TD></TR>
	
	<TR><TD>Shipping Address:</TD><TD><TEXTAREA  TYPE="TEXT"NAME="address" ROWS='3' COLS='40' ></TEXTAREA></TD></TR>
	<%}%>
	
  <TR><TD>Credit Card Number:</TD><TD><INPUT TYPE="text" pattern="[0-9]{16}" NAME="cardNum" required></TD></TR>
<TR><TD>Date: </TD><TD><INPUT TYPE="Date" NAME="date" required></TD><TD>
  
  <TR><TD>CCV:</TD><TD><INPUT TYPE="TEXT" NAME="ccv" pattern="[0-9]{3}" required></TD></TR>
  <TR></TR><TR></TR><TR></TR><TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
  <TD></TD><TD><INPUT align='right' class="btn btn-success" name="button" TYPE="SUBMIT" VALUE="Submit Order">
  
  </TD></TABLE>
</FORM>

</BODY>
<%@include file="footer.jsp" %>