<%@page import="tourism.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>

<%@include file="header2.jsp"%>

<%! 
HashMapProducts hmp;
public void setProducts(){
     HashMap<Integer,Product> hmap ;
     MongoClient mongo=new MongoClient("localhost", 27017);  
                 DB db = mongo.getDB("Elextore");
                
            // for adding storeManager user signup
            Map<String, Object> commandArguments = new BasicDBObject();
            DBCollection products = db.getCollection("products");


            BasicDBObject whereQuery = new BasicDBObject();
            //whereQuery.put("Name", "XBox One");
            DBCursor cursor = products.find();
            int flag1=0;
            while(cursor.hasNext()) {
                flag1=1;      
                cursor.next();          
                }
                    System.out.println("ahdas%%%% "+flag1);
                if(flag1==0)
                {

                 hmp=new HashMapProducts();
                    hmp.setHashMapProduct();
                    hmap=hmp.getHashMapProduct();
                    Iterator<Integer> productIterator=hmap.keySet().iterator(); 

                    while(productIterator.hasNext())
                    {
                    System.out.println("ahdas%%%% "+flag1);
                        Integer id=productIterator.next();
                        Product p=hmap.get(id);  
                        //commandArguments.put("Id", p.Id);
                        commandArguments.put("name", p.getName());
                        commandArguments.put("retailerName", "Elextore");
                        commandArguments.put("manufacturer", p.getManufacturer());
                        commandArguments.put("category", p.getCategory());
                        commandArguments.put("price", String.valueOf(p.getPrice()));  
                         commandArguments.put("description", p.getDescription());
                        commandArguments.put("imageUrl", p.getImageUrl());  
                        commandArguments.put("isActive", p.getIsActive()); 
                        commandArguments.put("isOnSale", p.getIsOnSale());
                        BasicDBObject doc = new BasicDBObject(commandArguments);
                    products.insert(doc);
                    }

                              
                    
                }

}
%>



<%! 



public void setAdmins()
{
        MongoClient mongo=new MongoClient("localhost", 27017);  
                 DB db = mongo.getDB("Elextore");
                
            // for adding storeManager user signup
            Map<String, Object> commandArguments = new BasicDBObject();
            DBCollection users = db.getCollection("users");


            BasicDBObject whereQuery = new BasicDBObject();
            whereQuery.put("email", "storemanager@elextore.com");
            DBCursor cursor = users.find(whereQuery);
            int flag1=0;
            while(cursor.hasNext()) {
                flag1=1;      
                cursor.next();          
                }

                if(flag1==0)
                {
                    commandArguments.put("email", "storemanager@elextore.com");
                    commandArguments.put("fName", "storeadmin");
                    commandArguments.put("lName", "admin");
                    commandArguments.put("password", "sa123");
                    commandArguments.put("role", "storeManager");           
                    BasicDBObject doc = new BasicDBObject(commandArguments);
                    users.insert(doc);
                }
            


            Map<String, Object> commandArguments1 = new BasicDBObject();
            BasicDBObject whereQuery1 = new BasicDBObject();
            whereQuery1.put("email", "salesman@elextore.com");
            DBCursor cursor1 = users.find(whereQuery1);
            int flag2=0;
            while(cursor1.hasNext()) {
                flag2=1;    
                cursor1.next();             
                }

                if(flag2==0)
                {
                    commandArguments1.put("email", "salesman@elextore.com");
                    commandArguments1.put("fName", "salesadmin");
                     commandArguments1.put("lName", "admin");
                    commandArguments1.put("password", "sa123");
                    commandArguments1.put("role", "salesMan");      
                    BasicDBObject doc1 = new BasicDBObject(commandArguments1);
                    users.insert(doc1);
                }


                Map<String, Object> commandArguments2 = new BasicDBObject();
            BasicDBObject whereQuery2 = new BasicDBObject();
            whereQuery2.put("email", "customersupport@elextore.com");
            DBCursor cursor2 = users.find(whereQuery2);
            int flag3=0;
            while(cursor2.hasNext()) {
                flag3=1;    
                cursor2.next();             
                }

                if(flag3==0)
                {
                    commandArguments2.put("email", "customersupport@elextore.com");
                    commandArguments2.put("fName", "Customer Support");
                    commandArguments2.put("lName", "Support admin");
                    commandArguments2.put("password", "sa123");
                    commandArguments2.put("role", "customerSupport");      
                    BasicDBObject doc2 = new BasicDBObject(commandArguments2);
                    users.insert(doc2);
                }
}
%>

<%
setAdmins();
setProducts();

                  %>


			<%
			MongoClient mongo=new MongoClient("localhost", 27017);
            DB db = mongo.getDB("Elextore");
            Map<String, Object> commandArguments = new BasicDBObject();
            DBCollection reviews = db.getCollection("reviews");
			//DBObject sort = new BasicDBObject("$sort",new BasicDBObject("reviewRating", -1));
			//DBObject match = new BasicDBObject("$match", new BasicDBObject("reviewRating", 5));
			DBCursor cursor = reviews.find();
			cursor.sort(new BasicDBObject("rating", -1));
			ArrayList<String> productList = new ArrayList<String>();
			%>
			<div class="categories">
            			<div class="itemgrid">
            				<h2>Trending Products</h2>
            				<div class="items" style="margin-left:20px">
                            				<ul>
			<%
			int i = 0;
			while(cursor.hasNext() && i<4)
			{
				BasicDBObject obj1 = (BasicDBObject) cursor.next();
				String productName = (String)obj1.get("productName");

				if(productList.contains(productName))
					continue;
				productList.add(productName);
				String productId = obj1.get("productId").toString();
				ObjectId objectId = new ObjectId(productId);
				String rating = (String)obj1.get("rating");
				DBCollection products = db.getCollection("products");
				BasicDBObject whereQuery = new BasicDBObject();
				whereQuery.put("_id",objectId);
				DBObject productObj = products.findOne(whereQuery);
				String imageURl = "";
				String price = "";
				if(productObj != null)
				{
					imageURl = (String)productObj.get("imageUrl");
					price = (String)productObj.get("price");
				}
				i++;
				%>
				<a href='productDetails.jsp?productId=<%=productId%>'>
				<li>
                    <img src="<%=imageURl%>" alt="No Image found for this product" width="250" height="238">
                    <h4><%=productName%></h4>
                    <p><b>$<%=price%><a href="cart.jsp?productId=<%=productId%>"> Add To Cart </a></b></p>
                </li>
                <%
			}
			%>
                </ul>

				</div>
				</div>

				</td>


			</tr>

			</TABLE>
			<%@include file="footer.jsp"%>				
			</div>
	</div>
</body>
</html>
