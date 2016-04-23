<%@include file="header2.jsp" %>


<%

    HttpSession s=request.getSession();
     if(userBean==null)
        {
            request.getRequestDispatcher("/signin.jsp").forward(request, response);
        }
      // else
      //  {
      String username=userBean.getEmail();
    //String role=userBean.getRole();
    String selectedCategory = "";
    DB db = InitServlet.getInstance().getMongoDBObject();
  String productId = request.getParameter("productId");
  ObjectId objProductId = new ObjectId(productId);

    DBCollection collection1 = db.getCollection("products");
    BasicDBObject whereQuery = new BasicDBObject();
  whereQuery.put("_id", objProductId);
  DBObject product = collection1.findOne(whereQuery);

    String productName = (String)product.get("name");
    String retailerName = (String)product.get("retailerName");
    String productPrice = (String)product.get("price");
    String productDescription = (String)product.get("description");
    String productManufacturer = (String)product.get("manufacturer");
    String productCategory = (String)product.get("category");
    boolean onsale = (Boolean)product.get("isOnSale");
    String imageURL = (String)product.get("imageUrl");
 // }
    

%>
<body>
 <div id="body">		
	<section id="content">
<div class="well">
	<h3>Product Details</h3>
   <div class="row">
           <div class="col-lg-3">
		   <img src = "<%=imageURL%>" width = "250" height = "200" alt = "No Image for Product">
		</div>
		   
            <div class="col-lg-5" style="border-left:2px solid grey">


           <div class="panel panel-primary">
   					<div class="panel-heading">
    			<h3 class="panel-title"><%=productName%>></h3>
  				</div>
  				<div class="panel-body">
    				<ul class="list-group">
  <li class="list-group-item">Manufacturer : <%=productManufacturer%></li>
  <li class="list-group-item">Category : <%=productCategory%></li>
  <li class="list-group-item">Retailer : <%=retailerName%></li>
</ul>
  				</div>
  
			</div>
            </div>

            <div class="col-lg-4">
                <h3>Price: $<%=productPrice%></h3><br>
            	<button type="button" class="btn btn-success"><a href="cart.jsp?productId=<%=productId%>">Add to Cart</a></button>
            </div>
			<br>
			
			<button type="button" class="btn btn-success"><a href="ViewReviews.jsp?productId=<%=productId%>&productName=<%=productName%>">View Reviews</a></button>
			      
            </div>
           
		   
		   
		   
   </div>
   <div class="row"></div></br>
   <div class="row">
   		<div class="col-lg-6">
   				<div class="panel panel-primary">
   					<div class="panel-heading">
    			<h3 class="panel-title">Description</h3>
  				</div>
  				<div class="panel-body">
    				<textarea type="text" class="form-control" placeholder="Description" required><%=productDescription%></textarea>
  				</div>
  
			</div>
   		</div>

<div class="col-lg-6">
   				<div class="panel panel-primary">
   					<div class="panel-heading">
    			<h3 class="panel-title">Review</h3>
  				</div>
  				<div class="panel-body">
    				<form class="navbar-form navbar-left" role="search" action="servlets/SubmitReview">
    				<input type="hidden" name="productName" value="<%=productName%>"/>
                    <input type='hidden' name ='productId' value = "<%=productId%>"/>
  					<div class="form-group">
  						<p>
                              Rating:
                              <span class="starRating">
                                <input id="rating5" type="radio" name="rating" value="5">
                                <label for="rating5">5</label>
                                <input id="rating4" type="radio" name="rating" value="4">
                                <label for="rating4">4</label>
                                <input id="rating3" type="radio" name="rating" value="3" checked>
                                <label for="rating3">3</label>
                                <input id="rating2" type="radio" name="rating" value="2">
                                <label for="rating2">2</label>
                                <input id="rating1" type="radio" name="rating" value="1">
                                <label for="rating1">1</label>
                              </span>
                            </p>
                          </body>
  Review text
    					<textarea type="text" name="reviewText" class="form-control" placeholder="Review" required></textarea>
  						</div></br>
  						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
  				</div>
  
			</div>
   		</div>

   </div>



</div>
	   
	
	    </section>
        
   		</div>

</body>
<%@include file="footer.jsp" %>