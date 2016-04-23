<%@include file="Header.jsp" %>
<html>
<head>
</head>

<%
 MongoClient mongo = new MongoClient("52.11.50.218", 27017);

			String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email_id = request.getParameter("email_id");
            String query = request.getParameter("query"); 

            DB db = mongo.getDB("Elextore");
            Map<String, Object> commandArguments = new BasicDBObject();
            DBCollection ticket = db.getCollection("ticket");


    		commandArguments.put("firstname", firstname);
            commandArguments.put("lastname", lastname);
            commandArguments.put("email_id", email_id);
            commandArguments.put("query", "query");
        
            
            BasicDBObject doc = new BasicDBObject(commandArguments);
            ticket.insert(doc);
%>
<body>
<div id="container">
<H1 ALIGN="CENTER">Ticket submitted successfully!!</H1>
</div>
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br>
<br>
<br>
<br>
<%@include file="footer.jsp" %>