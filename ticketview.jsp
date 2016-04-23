<%@include file="Header.jsp" %>

<%
MongoClient mongo = new MongoClient("52.11.50.218", 27017);     
        HttpSession s=request.getSession();
       
        Boolean isCancelled=false;         

        DB db = mongo.getDB("Elextore");
       
           
           
            DBCollection collection = db.getCollection("ticket");
            BasicDBObject whereQuery = new BasicDBObject();
            //whereQuery.put("userId", userBean.getId());
            //BasicDBObject whereQuery1 = new BasicDBObject();
            //whereQuery.put("password", pwd);
            DBCursor cursor = collection.find();
            
           // DBCollection collection1 = db.getCollection("orderItems");
            


                  %>
<body style="z-index=-1">
<div class="well">
    <div class="row">
             
            <div class="row">
                <div class="col-lg-10"><h3 >Tickets List</p> </div>
                <div class="col-lg-2"> 
                
                </div>
            </div>
            

            <div class="row">
                <div class="col-lg-12">
                     <table class="table table-striped">
                        <tr>
                        <th>First name</th>
                    <th>Last name</th>
                    <th>Email</th>
                    <th>Query</th>
                   
                        </tr>
                          <%
  while(cursor.hasNext())
  	{
                    BasicDBObject obj = (BasicDBObject) cursor.next();
                    Object orderId=(Object)obj.get("_id");
                   // BasicDBList itemsList = (BasicDBList) obj.get("items");
                  //  System.out.println("orderrrr"+orderId.toString());
              %>
               
<tr>
	<td><%=obj.get("firstname")%><td>
	<td><%=obj.get("lastname")%><td>
	<td><%=obj.get("email_id")%><td>
	<td><%=obj.get("query")%><td>
</tr>
               

              <%  
                
     }
           
%>



                                    
                 
                    </table>

                </div>
               
            </div>

            
            
    </div>
</div>
<body>
<%@include file="footer.jsp" %>