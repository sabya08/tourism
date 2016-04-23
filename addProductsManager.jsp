<%@include file="header2.jsp" %>

<%
    HttpSession s=request.getSession();
    String username=userBean.getEmail();
    //String role=userBean.getRole();
    String selectedCategory = "";
    DB db = InitServlet.getInstance().getMongoDBObject();
    DBCollection collection1 = db.getCollection("Categories");
    BasicDBObject whereQuery1 = new BasicDBObject();
    DBCursor cursor1 = collection1.find();
 
    String productName = "";
    String retailerName = "";
    Double productPrice = 0.0;
    String productDescription = "";
    String productCategory = "";
    boolean onsale = false;
    boolean rebate = false;
    String buttonText = "Add Product";
    String productId = "";
    Boolean isUpdated=false;
    String manufacturer="";

    String updateProduct=request.getParameter("updateProduct");
    if(updateProduct!=null)
         {
     System.out.println("enterrrrr &&&&");
            if(updateProduct.equals("updateProduct"))
            {
              String pid= request.getParameter("productId");
              ObjectId objid =new ObjectId(pid);
              
                 // orderId= request.getParameter("orderId");
                String name= request.getParameter("name");
                String retailer= request.getParameter("retailer");  
                String price= request.getParameter("price");
                String categoryL=request.getParameter("categorylist");
                String description= request.getParameter("description");
                String rebate1= request.getParameter("rebate");
                String onsale1= request.getParameter("onsale"); 
                String manuf= request.getParameter("manufacturer"); 
             //   String quantity=request.getParameter("quantity");
                 // String isCancelled=request.getParameter("isCancelled");

                   // ObjectId objid =new ObjectId(orderId);
                    DBCollection products = db.getCollection("products");
                    BasicDBObject newDocument = new BasicDBObject();
                   //newDocument.append("$set", new BasicDBObject().append("isCancelled", isCancelled));
                    newDocument.append("$set", new BasicDBObject().append("name",name));
                    newDocument.append("$set", new BasicDBObject().append("category",categoryL));
                    newDocument.append("$set", new BasicDBObject().append("description",description));
                     newDocument.append("$set", new BasicDBObject().append("retailerName",price));
                     newDocument.append("$set", new BasicDBObject().append("manufacturer",manuf));
                    newDocument.append("$set", new BasicDBObject().append("price",price));
                   // newDocument.append("$set", new BasicDBObject().append("quantity",quantity));
                    BasicDBObject searchQuery = new BasicDBObject().append("_id", objid);

                    products.update(searchQuery, newDocument);
                    isUpdated=true;
                
                    DBCollection collection = db.getCollection("products");
        productId = request.getParameter("productId");
        ObjectId objProductId =new ObjectId(productId);
        BasicDBObject whereQuery = new BasicDBObject();
        whereQuery.put("_id", objProductId);
        DBCursor cursor = collection.find(whereQuery);
        while(cursor.hasNext()) {
                BasicDBObject obj = (BasicDBObject) cursor.next();
                productName = (String)obj.get("name");
                retailerName = (String)obj.get("retailerName");
                productCategory = (String)obj.get("category");
                productDescription = (String)obj.get("description");
                manufacturer=(String)obj.get("manufacturer");
                Double d = new Double(obj.get("price").toString());
                productPrice = d;
                onsale = (Boolean)obj.get("isOnSale");
                //rebate = (Boolean)obj.get("rebate");
            }
                    }
            }

    if(request.getParameter("op") != null && request.getParameter("op").equals("update"))
    {
        buttonText = "Update Product";
        DBCollection collection = db.getCollection("products");
        productId = request.getParameter("productId");
        ObjectId objProductId =new ObjectId(productId);
        BasicDBObject whereQuery = new BasicDBObject();
        whereQuery.put("_id", objProductId);
        DBCursor cursor = collection.find(whereQuery);
        while(cursor.hasNext()) {
                BasicDBObject obj = (BasicDBObject) cursor.next();
                productName = (String)obj.get("name");
                retailerName = (String)obj.get("retailerName");
                productCategory = (String)obj.get("category");
                 manufacturer=(String)obj.get("manufacturer");
                productDescription = (String)obj.get("description");
                Double d = new Double(obj.get("price").toString());
                productPrice = d;
                onsale = (Boolean)obj.get("isOnSale");
                //rebate = (Boolean)obj.get("rebate");
                System.out.println("Categoryyyyyy "+productName+productCategory);
            }
    }


%>
    <body>
        <%
        String success = request.getParameter("success");
        if(success != null && success != "")
            out.println(success);
         %>
         <%if(isUpdated){
         %>
         <h4 style="color:blue">Products updated successfully !</h4>
     <%}%>
     <%if(buttonText.equals("Update Product")){%>
             <form class ='submit-button' method='get' action='addProductsManager.jsp'>
            <%}else{%>
             <form class ='submit-button' method='get' action='servlets/AddProductsServlet'>
            <%}%>
        <form class ='submit-button' method='get' action='addProductsManager.jsp'>
            <div class="row">
                <div class="col-lg-8">
                     <table class="table table-striped">
                        <tr>
                            <th>Product Name :</th>
                            <td><input type="text" name="name" placeholder="Enter Product Name" value="<%=productName%>" required/></td>
                            <td><input type="hidden" name="productId" value="<%=productId%>"/></td>
                        </tr>
                        <tr>
                            <th>Retailer Name :</th>
                            <td><input type="text" name="retailer" placeholder="Enter Retailer Name" value="<%=retailerName%> "required/></td>
                        </tr>
                        <tr>
                            <th>Manufacturer :</th>
                            <td><input type="text" name="manufacturer" placeholder="Enter Manufacturer Name" value="<%=manufacturer%>"/></td>
                        </tr>
                        <tr>
                            <th>Product Category :</th>
                            <td>
                                <select id="categoriesDropDown" name="categorylist" required>
                                    <% if(productCategory.equals("Appliances")) {%> <option value="Appliances" selected>Appliances</option>
                                                    <option value="CameraCamcorders">CameraCamcorders</option>
                                                    <option value="ComputersTablets">ComputersTablets</option>
                                                    <option value="TVHomeTheater">TVHomeTheater</option>
                                                    <option value="Audio">Audio</option> <%}%>
                                  <% if(productCategory.equals("CameraCamcorders")) {%><option value="Appliances">Appliances</option>
                                                    <option value="CameraCamcorders" selected>CameraCamcorders</option>
                                                    <option value="ComputersTablets">ComputersTablets</option>
                                                    <option value="TVHomeTheater">TVHomeTheater</option>
                                                    <option value="Audio">Audio</option> <%}%>
                                  <% if(productCategory.equals("ComputersTablets")) {%> <option value="Appliances">Appliances</option>
                                                    <option value="CameraCamcorders">CameraCamcorders</option>
                                                    <option value="ComputersTablets" selected>ComputersTablets</option>
                                                    <option value="TVHomeTheater">TVHomeTheater</option>
                                                    <option value="Audio">Audio</option> <%}%>
                                  <% if(productCategory.equals("TVHomeTheater")) {%> <option value="Appliances">Appliances</option>
                                                    <option value="CameraCamcorders">CameraCamcorders</option>
                                                    <option value="ComputersTablets">ComputersTablets</option>
                                                    <option value="TVHomeTheater" selected>TVHomeTheater</option>
                                                    <option value="Audio">Audio</option> <%}%>
                                  <% if(productCategory.equals("Audio")) {%> <option value="Appliances">Appliances</option>
                                                    <option value="CameraCamcorders">CameraCamcorders</option>
                                                    <option value="ComputersTablets">ComputersTablets</option>
                                                    <option value="TVHomeTheater">TVHomeTheater</option>
                                                    <option value="Audio" selected>Audio</option> <%}%>
                                <% if(productCategory.equals("")) {%>     <option value="Appliances">Appliances</option>
                                                    <option value="CameraCamcorders">CameraCamcorders</option>
                                                    <option value="ComputersTablets">ComputersTablets</option>
                                                    <option value="TVHomeTheater">TVHomeTheater</option>
                                                    <option value="Audio">Audio</option> 
                                                    <%}%>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Product Price :</th>
                            <td><input type="number" name="price" placeholder="Enter Product Price" value="<%=productPrice%>" required/></td>
                        </tr>
                        <tr>
                            <th>Product Description :</th>
                            <td><input type="text" name="description" placeholder="Enter Product Description" value="<%=productDescription%>" required/></td>
                        </tr>
                        <tr>
                            <th>Product Rebate :</th>

                            <td><input type="text" name="rebate" value="<%=rebate%>"></td>
                        </tr>
                        <tr>
                            <th>Product On Sale :</th>
                            <td><input type="text" name="onsale" value="<%=onsale%>"></td>
                        </tr>
                     </table>
                </div>
            </div>
            <!-- <button type="submit" class="btn btn-success" name="addUpdateButton" value="<%=buttonText%>"><%=buttonText%></button> -->
            <input type="hidden"  name="productId" value="<%=productId%>">
            <%if(buttonText.equals("Update Product")){%>
            <button type="submit" class="btn btn-success" name="updateProduct" value="<%=buttonText%>"><%=buttonText%> </button>
            <%}else{%>
            <button type="submit" class="btn btn-success" name="addUpdateButton" value="<%=buttonText%>"><%=buttonText%> </button>
            <%}%>
        </form>
    </body>
<%@include file="footer.jsp" %>