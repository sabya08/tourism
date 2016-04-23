<%@include file="header2.jsp" %>



<%
        HttpSession s=request.getSession();
        String username=userBean.getEmail();
        //String role=userBean.getRole();
        String selectedCategory = "";
        DB db = InitServlet.getInstance().getMongoDBObject();
        String deleteProduct=request.getParameter("deleteProduct");
        String categoryDD = request.getParameter("categoryDD");
        DBCollection collection = db.getCollection("products");
        BasicDBObject whereQuery = new BasicDBObject();
         if(deleteProduct!=null)
         {
            if(deleteProduct.equals("deleteProduct"))
            {
                String productId= request.getParameter("productId");
                ObjectId objid =new ObjectId(productId);
                whereQuery.put("_id", objid);              
                collection.remove(whereQuery);
                response.sendRedirect("productsInfo.jsp");
            }
          }
              
           
            DBCursor cursor = collection.find(whereQuery);

            DBCollection collection1 = db.getCollection("Categories");
            BasicDBObject whereQuery1 = new BasicDBObject();
            DBCursor cursor1 = collection1.find();


%>
<body>
<div class="well">
    <div class="row">
            
            <div class="row">
                <div class="col-lg-10"><h3 >Products List</p> </div>
                <div class="col-lg-2"> 
                <form class ='submit-button' method='get' action='addProductsManager.jsp'>
                    <button type="submit" class="btn btn-success">Add Product</button>
                </form>
                    <!--<form class = 'submi' method = 'get' action = 'storeManager.jsp'>
                    <select id="categoriesDropDown" name="categoryDD" onchange="this.form.submit()">
                        <%
                            while(cursor1.hasNext())
                            {
                                BasicDBObject obj1 = (BasicDBObject) cursor1.next();
                               //Integer id=productIterator.next();

                               String category=(String)obj1.get("Category");
                               if(category == categoryDD){%>
                                    <option value="<%=category%>" selected="selected"><%=category%></option>
                               <%}
                               else{%>
                                    <option value="<%=category%>"><%=category%></option>

                            <%}
                            }%>

                    </select>
                    </form>-->

                </div>
            </div>
            

            <div class="row">
                <div class="col-lg-12">
                     <table class="table table-striped">
                        <tr>
                        <th>Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Retailer</th>
                    <th>Action</th>
                    <th>Action</th>
                        </tr>
 <%

                 while(cursor.hasNext()) {

                   BasicDBObject obj = (BasicDBObject) cursor.next();
                   //if((categoryDD != null && categoryDD == "All") || (categoryDD != null && categoryDD == (String)obj.get("category") ))
                   //{
                   boolean isActive = (Boolean)obj.get("isActive");
                   if(isActive){
                   // int productId=(int)obj.get("_id");
                    Object productId=(Object)obj.get("_id");
                    String name= (String)obj.get("name");
                    String retailerName= (String)obj.get("retailerName");
                    Double price=new Double(obj.get("price").toString());

                    String imgUrl=(String)obj.get("imageUrl");
                   // BasicDBList itemsList = (BasicDBList) obj.get("items");

              %>
                        <tr>
                            <td><%=name%></td>
                            <td><img src='<%=imgUrl%>' alt="No Image found for this product" width="250" height="238"></td>                         
                            <td><%=price%></td>
                            
                            <td><%=retailerName%></td>
                            <td>
                                <form class = 'submit-button' method = 'get' action = 'addProductsManager.jsp?productId=<%=productId%>'>
                                <input type="hidden" name="op" value="update"/>
                                <input type='hidden' name ='productId' value = <%=productId%> >
                                <button type="submit" class="btn btn-success">Update</button>
                                </form>
                            </td>
                            <td>
                                <form class = 'submit-button' method = 'get' action = 'servlets/AddProductsServlet'>
                                <input type="hidden" name="op" value="delete"/>
                                <input type='hidden' name = 'productId' value = <%=productId%>>
                                <button type="submit" class="btn btn-danger">Remove</button>
                                </form>
                            </td>

                        </tr>
                        
                        <%//}
                        }
                        }%>
                    </table>

                </div>
               
            </div>

            
            
    </div>
</div>
<body>
<%@include file="footer.jsp" %>