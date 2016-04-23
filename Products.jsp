 
<%@include file="Header.jsp"%>
<html>
<TITLE>elexTore</TITLE>
<head>

<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-3.3.5-dist/css">
<%
   String productName = "";
    String imageLocation = " ";
    int productPrice = 0;
  
          MongoClient mongo = new MongoClient("52.11.50.218", 27017);
                        
            DB db = mongo.getDB("Elextore");
            DBCollection collection = db.getCollection("products");
            BasicDBObject whereQuery = new BasicDBObject();

            String category=request.getParameter("category");
             whereQuery.put("category", category);
            DBCursor cursor = collection.find(whereQuery);
%>

<body>
      <br>
      <div class="container">
      
   <!--          <div class="col-lg-2">Filter by Brand Name:
            	<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a href="/dell" title="Dell" data-tracking-id="Top Brands_Dell">Alienware 15</a>
      				</span>   
    			</div>
    			<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a href="/lenovo" title="Dell" data-tracking-id="Top Brands_Dell">Latitude 14</a>
      				</span>   
    			</div>
    			<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a href="/hp" title="Dell" data-tracking-id="Top Brands_Dell">Dell Chrombook 11</a>
      				</span>   
    			</div>
				<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a href="/hp" title="Dell" data-tracking-id="Top Brands_Dell">Dell inspiron 13</a>
      				</span>   
    			</div>
				<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a href="/hp" title="Dell" data-tracking-id="Top Brands_Dell">Dell inspiron 14</a>
      				</span>   
    			</div>
				<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a href="/hp" title="Dell" data-tracking-id="Top Brands_Dell">Dell Precision M3800</a>
      				</span>   
    			</div>
				<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a href="/hp" title="Dell" data-tracking-id="Top Brands_Dell">Dell XPS 15 </a>
      				</span>   
    			</div>
				<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a href="/hp" title="Dell" data-tracking-id="Top Brands_Dell">Dell XPS 13 </a>
      				</span>   
    			</div>
			
			<div class="col-lg-2">Filter by Price:
            	<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a  href="/laptops/" title="$ 300 and Below" data-tracking-id="Price_$ 300 and Below">$ 300 and Below</a>
      				</span>   
    			</div>
    			<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a  href="/laptops/" title="$ 300 - $ 500" data-tracking-id="Price_$ 300 - $ 500">$ 300 - $ 500</a>
      				</span>   
    			</div>
    			<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a  href="/laptops/" title="$ 500 - $ 700" data-tracking-id="Price_$ 500 - $ 700">$ 500 - $ 700</a>
      				</span>   
    			</div>
				<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a  href="/laptops/" title="$ 700 - $ 900" data-tracking-id="Price_$ 700 - $ 900">$ 700 - $ 900</a>
      				</span>   
    			</div>
				<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a  href="/laptops/" title="$ 900 - $ 1100" data-tracking-id="Price_$900 - $ 1100">$ 900 - $ 1100</a>
      				</span>   
    			</div>
				<div class="input-group">
      				<span class="input-group-addon">
       				<input type="checkbox" aria-label="...">
        			<a  href="/laptops/" title="$ 1100 and Above" data-tracking-id="Price_$ 1100 and Above">$ 1100 and Above</a>
      				</span>   
    			</div>
				
			</div>
			</div> -->
			
             <div class="col-lg-10" style="border-left:2px solid grey">
             	 </p>

            <div class="itemgrid">
				      <h4><b>Featured Products of <%=category%> category</b></h4>
				
				      <div class="items" style="margin-left:20px">
              
				    <ul>		
          <%
     while(cursor.hasNext()) {

                BasicDBObject obj = (BasicDBObject) cursor.next();

           
                    Object orderId=(Object)obj.get("_id");
             //  System.out.println(obj.get("Manufacturer")+"----");
              // String str=(String)obj.get("category");
         //  if(str.equals(category))
          // {
 

%>          
		        <a href='productDetails.jsp?productId=<%=orderId.toString()%>'>
            <li style="height:400px">
                <img src='<%=obj.get("imageUrl")%>' onerror="this.src='images/default.jpg'" width="250" height="238">
                <h4><%=obj.get("name")%></h4>
                <p><h4><b>$<%=obj.get("price")%></b> <b><a href='cart.jsp?productId=<%=orderId.toString()%>'> Add To Cart </a></b></h4></p>
               
                
                </li>
            </a>
               
                
             
                <% }%>
				</ul>
				</div>
				</div>
				</div>

             </div>
            
    </div>
</div>
<body>
<%@include file="footer.jsp" %>
				 
	