<%@include file="Header.jsp"%>

<%
 MongoClient mongo = new MongoClient("52.11.50.218", 27017);
        String address = request.getParameter("address");
           String cardno = request.getParameter("cardNum");
            String validity = request.getParameter("validity");
            String ccv = request.getParameter("ccv");

          HttpSession s=request.getSession();
                            
           list= (List<Cart>) s.getAttribute("list");
            String total=s.getAttribute("total").toString();
           // Map<String, Object> products = new BasicDBObject();
            List<String> cartList = new ArrayList<String>();
            
           
            for(Cart cart : list){
          cartList.add(cart.getId());
        
           }

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
       //get current date time with Date()
      Date date = new Date();
       //System.out.println(dateFormat.format(date));

            DB db = mongo.getDB("Elextore");
            // If the collection does not exists, MongoDB will create it for you
           

            Map<String, Object> commandArguments = new BasicDBObject();
            DBCollection myOrders = db.getCollection("orders");
            
            commandArguments.put("userId", userBean.getId());
            commandArguments.put("userEmail",userBean.getEmail());
            commandArguments.put("total", total);
            //String[] roles = { "readWrite" };
            commandArguments.put("items", cartList);
            commandArguments.put("status", "Progress");
            commandArguments.put("isCancelled", "false");
            commandArguments.put("address", address);
            commandArguments.put("cardNumber", cardno);
            commandArguments.put("validity", validity);
            commandArguments.put("ccv", ccv);
           commandArguments.put("date", dateFormat.format(date));
            
            //commandArguments.put("product", product);
            BasicDBObject doc = new BasicDBObject(commandArguments);
           myOrders.insert(doc);
            Object id = (Object)doc.get( "_id" );
           
            // insert product items
            
            DBCollection orderProducts = db.getCollection("orderItems");
            
                
           for(Cart cart : list){
               // cartList.add(cart.getId());
                 Map<String, Object> commandArguments1 = new BasicDBObject();
                  commandArguments1.put("orderId", id.toString());
                 commandArguments1.put("productId", cart.getId().toString());
                commandArguments1.put("productName", cart.getName());
                  commandArguments1.put("price", cart.getPrice());
                   commandArguments1.put("quantity", cart.getQuantity());
                  commandArguments1.put("imageUrl", cart.getImageUrl());  
                  commandArguments1.put("status", "Progress"); 
                   commandArguments1.put("isCancelled", "false"); 
                   BasicDBObject doc1 = new BasicDBObject(commandArguments1);
                  orderProducts.insert(doc1);
           }
            String USER_NAME = "elextorecsp595@gmail.com";  // GMail user name (just the part before "@gmail.com")
            String PASSWORD = "nikhil1234"; // GMail password
            String RECIPIENT = userBean.getEmail();
            String[] to = { RECIPIENT };
			String body = "Welcome to JavaMail!";
			String subject = "Order placed Successfully";
			Properties properties = System.getProperties();
			String host = "smtp.gmail.com";
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.user", USER_NAME);
            properties.put("mail.smtp.password", PASSWORD);
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.auth", "true");

			Session session1 = Session.getDefaultInstance(properties);
			MimeMessage message = new MimeMessage(session1);
			try{

                     message.setFrom(new InternetAddress(USER_NAME));

                     message.setFrom(new InternetAddress(USER_NAME));
                     InternetAddress[] toAddress = new InternetAddress[to.length];

					 for( int i = 0; i < to.length; i++ ) {
                                     toAddress[i] = new InternetAddress(to[i]);
                                 }

                     for( int i = 0; i < toAddress.length; i++) {
                                     message.addRecipient(Message.RecipientType.TO, toAddress[i]);
                                 }

                     // Set Subject: header field
                     message.setSubject(subject);

                     // Now set the actual message
                     message.setText("Thanks for placing your order. Your order is under processing. We will notify when it is shipped!!");

                     // Send message
                     Transport transport = session1.getTransport("smtp");
                     transport.connect(host, USER_NAME, PASSWORD);
                     transport.sendMessage(message, message.getAllRecipients());
                     transport.close();
                     System.out.println("Sent message successfully....");
                  }catch (MessagingException mex) {
                     mex.printStackTrace();
                  }

            list.clear();
            total="";
            s.setAttribute("list",list);
            s.setAttribute("total",total);
           
            date.setTime(date.getTime() + 15 * 1000 * 60 * 60 * 24);
                  %>
<body>
<H1 ALIGN="CENTER">Order Placed successfully</H1>
<H3 ALIGN="CENTER">Your Order Id = <%=id.toString()%></H1>
</BODY>
<%@include file="footer.jsp" %>