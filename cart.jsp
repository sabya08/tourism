<%@include file="header2.jsp" %>

<%
        MongoClient mongo = new MongoClient("52.11.50.218", 27017);
        String from=request.getParameter("from");
        
        String productId="";
        int total=0;
        
        HttpSession s=request.getSession();
       // String username=(String)s.getAttribute("userName");
       // String role=(String)s.getAttribute("role");
        System.out.println("user"+userName);
        if(userName==null)
        {
            response.sendRedirect("signin.jsp");
        }
        try{
         list= (List<Cart>) s.getAttribute("list");
         total=(Integer)s.getAttribute("total");
     }catch(Exception e)
     {
     total=0;
 }
       
        if(list==null){
                list =new ArrayList();
            }

        String deleteCartItem=request.getParameter("deleteCartItem");
        String updateCartItem=request.getParameter("updateCartItem");

        if(from==null){
            if(deleteCartItem==null){
                productId=   request.getParameter("productId");

            }     
        }
        if(deleteCartItem!=null)
         {
            if(deleteCartItem.equals("deleteCartItem"))
            {
                    System.out.println("DELEELE");
                    String cartId= request.getParameter("cartId");                          
        
                        for(int i=0;i<list.size();i++)
                        {
                            Cart c=list.get(i);
                            if(c.getId().equals(cartId))
                            {
                                list.remove(i);
                                total=total-(c.getPrice()*c.getQuantity());
                                s.setAttribute("total",total);
                            }
                        }

            }
        }
         if(updateCartItem!=null)
         {
            if(updateCartItem.equals("updateCartItem"))
            {
                    System.out.println("Update");
                    String cartId= request.getParameter("cartId");                          
                    String newQuantity= request.getParameter("newQuantity");  
                    
                    total=0;
                        for(int i=0;i<list.size();i++)
                        {
                            Cart c=list.get(i);                        
                            
                            if(c.getId().equals(cartId))
                            {
                                int q=Integer.parseInt(newQuantity);
                                c.setQuantity(q);
                                total=total+(c.getPrice()*q);
                               
                            }else{
                                total=total+c.getPrice()*c.getQuantity();
                            }
                             s.setAttribute("total",total);
                        }

            }
        }

            DB db = mongo.getDB("Elextore");
            DBCollection collection = db.getCollection("products");
            BasicDBObject whereQuery = new BasicDBObject();
             
            DBCursor cursor = collection.find();
         while(cursor.hasNext()) 
            {
                 BasicDBObject obj = (BasicDBObject) cursor.next();

           
                    Object productIdm=(Object)obj.get("_id");

                    String id=productIdm.toString();
                    String name=(String)obj.get("name");
                    String priceStr=obj.get("price").toString();
                    double priced=Double.parseDouble(priceStr);
                    int price=(int)priced;
                    String imageUrl=(String)obj.get("imageUrl");
                    //System.out.println("^^^^^****"+id+name+price+productId);
                    if(from==null){
                    System.out.println("^^^^^****"+id+name+price+productId);
                if(id.equals(productId))
                {   
                      Cart c= new Cart();
                      c.setId(productId);
                      c.setName(name);
                      c.setPrice(price);
                      c.setImageUrl(imageUrl);
                      c.setQuantity(1);
                      total=total+(c.getPrice()*c.getQuantity());
                      list.add(c);
                    System.out.println("SIZEEEE^^^^^**** "+list.size());
                     s.setAttribute("list",list); 
                     s.setAttribute("total",total);              
                }
                }
            }
            total=(Integer)s.getAttribute("total");
                  s.setAttribute("cartCount",list.size());
                  %>

<body>
<div class="well">
    <div class="row">
            
            <h3 >Cart Items</p>

            <div class="row">
                <div class="col-lg-12">
                     <table class="table table-striped">
                        <tr>
                        <th>Name</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Action</th>

                        </tr>
        <%
            for(Cart cart : list){
                %>
                        <tr>
                            <td><%=cart.getName()%></td>
                            <td><img src=' <%=cart.getImageUrl()%>' alt="No Image found for this product" width="250" height="238"></td>
                            <td>
                            <form action="cart.jsp" method="GET">
                                <div class="form-group">
                                <!-- <label for="sel1">Select list:</label> -->
                                <input type='hidden' name = 'cartId' value = '<%=cart.getId()%>'>
                                <input type='hidden' name = 'updateCartItem' value = 'updateCartItem'>
                                <select class="form-control" id="myselect" name="newQuantity" onchange="this.form.submit()">
                                  <% if(cart.getQuantity()==1) {%> <option value="1" selected>1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option> <%}%>
                                  <% if(cart.getQuantity()==2) {%><option value="1" selected>1</option> 
                                                            <option value="2" selected>2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option> <%}%>
                                  <% if(cart.getQuantity()==3) {%> <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3" selected>3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option> <%}%>
                                  <% if(cart.getQuantity()==4) {%> <option value="1">1</option>
                                                        <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4" selected>4</option>
                                                    <option value="5">5</option> <%}%>
                                  <% if(cart.getQuantity()==5) {%> <option value="1">1</option>
                                                <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5" selected>5</option> <%}%>
                                   
                                </select>
                                </div>
                            </form>
                            </td>
                            <td>$<%=cart.getPrice()%></td>
                            <td>
                            <form class = 'submit-button' method = 'get' action = 'cart.jsp'>
                                <input type='hidden' name = 'cartId' value = '<%=cart.getId()%>'>
                                <input type='submit' class="btn btn-danger" name="deleteCartItem" value = 'deleteCartItem'>
                            </form>
                            </td>
                        </tr>
                        <%  }
          %>
                         
                    </table>

                </div>
               
            </div>

            <div class="row">
                <div class="col-lg-8"> </div>
                <div class="col-lg-4"> 
                    <h2>Total : $ <%=total%></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8"> </div>
                <div class="col-lg-4"> 
                    <form class = 'submit-button' method = 'get' action = 'PlaceOrder.jsp'>
            <input type='submit' class="btn btn-success" name = 'submit' value = 'Check Out'>
            </form>
               <!--  <button type="button" class="btn btn-success"><a href="OrderPage.jsp"></a>Checkout</button> -->
                </div>
            </div>
    </div>
</div>
<body>
<%@include file="footer.jsp" %>