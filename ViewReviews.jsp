<%@include file="Header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-3.3.5-dist/css">

<% { %>
	<%
	MongoClient  mongoClient = new MongoClient("52.11.50.218", 27017);

			
			String searchField = "productName";
			//UserBean userBean = (UserBean)session.getAttribute("userbean");
			String productId = (String) request.getParameter("productId");
			String productName = (String) request.getParameter("productName");
		
			//Get the product selected
			
			// if database doesn't exists, MongoDB will create it for you
			DB db = mongoClient.getDB("Elextore");
			
			DBCollection productDB = db.getCollection("reviews");
			
			// Find and display 
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put(searchField, productName);

			DBCursor cursor = productDB.find(searchQuery);
			
			
						
			out.println("<html>");
			out.println("<TITLE>elexTore</TITLE>");
			out.println("<body>");
			out.println("<h1> Reviews For:"+ productName+ "</h1>");
			
		
			out.println("<br><br><hr>");
			
			if(cursor.count() == 0){
				out.println("There are no reviews for this product.");
			}else{
			
				out.println("<table>");
			
				String review="";
				String rating="";

			
				
				while (cursor.hasNext()) {
					//out.println(cursor.next());
					BasicDBObject obj = (BasicDBObject) cursor.next();				
					
					out.println("<tr>");
					out.println("<td> Product Name: </td>");
					productName = obj.getString("productName");
					out.println("<td>" +productName+ "</td>");
					out.println("</tr>");
	
					
					out.println("<tr>");
					out.println("<td> Review Rating: </td>");
					rating = obj.getString("rating").toString();
					out.println("<td>" +rating+ "</td>");
					out.println("</tr>");
					
					out.println("<tr>");
					out.println("<td> Review: </td>");
					review = obj.getString("review");
					out.println("<td>" +review+ "</td>");
					out.println("</tr>");

				}
			}	
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			
		
	%>


<%}%>
<%@include file="footer.jsp" %>